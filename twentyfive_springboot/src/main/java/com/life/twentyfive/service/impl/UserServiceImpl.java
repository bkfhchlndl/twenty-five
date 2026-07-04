package com.life.twentyfive.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.life.twentyfive.entity.User;
import com.life.twentyfive.entity.dto.LoginDTO;
import com.life.twentyfive.entity.dto.RegisterDTO;
import com.life.twentyfive.entity.dto.ResetPasswordDTO;
import com.life.twentyfive.exception.BusinessException;
import com.life.twentyfive.mapper.UserMapper;
import com.life.twentyfive.service.UserService;
import com.life.twentyfive.util.JwtUtil;
import com.life.twentyfive.util.PasswordUtil;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private JavaMailSender javaMailSender;

    // 注册验证码 key 前缀
    private static final String EMAIL_CODE_PREFIX = "email:code:";

    // 注册验证码发送冷却 key 前缀
    private static final String EMAIL_CODE_COOLDOWN_PREFIX = "email:code:cooldown:";

    // 注册验证码每日发送次数 key 前缀
    private static final String EMAIL_CODE_DAILY_PREFIX = "email:code:daily:";

    // 注册验证码错误次数 key 前缀
    private static final String EMAIL_CODE_ERROR_PREFIX = "email:code:error:";

    // 验证码有效期：5 分钟
    private static final long CODE_EXPIRE_MINUTES = 5;

    // 同邮箱发送冷却：60 秒
    private static final long CODE_COOLDOWN_SECONDS = 60;

    // 同邮箱每日最多发送次数
    private static final long CODE_DAILY_LIMIT = 10;

    // 验证码最多错误次数
    private static final long CODE_MAX_ERROR_COUNT = 5;

    // Redis 中的 Token 的 key 前缀
    private static final String TOKEN_PREFIX = "login:token:";

    // Redis 中的 Token 的有效期
    private static final long TOKEN_EXPIRE_DAYS = 7;

    // 重置密码验证码 key 前缀
    private static final String RESET_EMAIL_CODE_PREFIX = "reset:email:code:";

    // 重置密码验证码发送冷却 key 前缀
    private static final String RESET_EMAIL_CODE_COOLDOWN_PREFIX = "reset:email:code:cooldown:";

    // 重置密码验证码每日发送次数 key 前缀
    private static final String RESET_EMAIL_CODE_DAILY_PREFIX = "reset:email:code:daily:";

    // 重置密码验证码错误次数 key 前缀
    private static final String RESET_EMAIL_CODE_ERROR_PREFIX = "reset:email:code:error:";

    // 从配置中读取发件人邮箱，也可以直接写死
    @Value("${spring.mail.username}")
    private String mailFrom;

    // 用于生成随机数
    private static final SecureRandom SECURE_RANDOM = new SecureRandom();

    // 用户注册 - 发送验证码
    @Override
    public void sendCode(String email) {
        // 基础格式校验
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new BusinessException(400, "邮箱格式不正确");
        }
        // 检查是否处于 60 秒冷却期
        String cooldownKey = EMAIL_CODE_COOLDOWN_PREFIX + email;
        Boolean hasCooldown = stringRedisTemplate.hasKey(cooldownKey);
        if (Boolean.TRUE.equals(hasCooldown)) {
            throw new BusinessException(422, "验证码发送太频繁，请稍后再试");
        }
        // 检查今日发送次数是否超过上限
        String dailyKey = EMAIL_CODE_DAILY_PREFIX + email;
        String dailyCountStr = stringRedisTemplate.opsForValue().get(dailyKey);
        int dailyCount = dailyCountStr == null ? 0 : Integer.parseInt(dailyCountStr);
        if (dailyCount >= CODE_DAILY_LIMIT) {
            throw new BusinessException(422, "今日验证码发送次数已达上限");
        }
        // 生成验证码
        String code = String.format("%06d", SECURE_RANDOM.nextInt(1000000));
        // 存入 Redis
        String redisKey = EMAIL_CODE_PREFIX + email;
        stringRedisTemplate.opsForValue().set(redisKey, code, CODE_EXPIRE_MINUTES, TimeUnit.MINUTES);
        // 发送邮件
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(mailFrom);
        message.setTo(email);
        message.setSubject("注册验证码");
        message.setText("您的注册验证码是：" + code + "，5分钟内有效，请勿泄露给他人。");
        javaMailSender.send(message);
        // 邮件发送成功后，设置 60 秒冷却
        Boolean locked = stringRedisTemplate.opsForValue()
                .setIfAbsent(cooldownKey, "1", CODE_COOLDOWN_SECONDS, TimeUnit.SECONDS);
        if (Boolean.FALSE.equals(locked)) {
            throw new BusinessException(422, "验证码发送太频繁，请稍后再试");
        }
        // 邮件发送成功后，累计今日发送次数
        Long count = stringRedisTemplate.opsForValue().increment(dailyKey);
        if (count != null && count == 1) {
            stringRedisTemplate.expire(dailyKey, 1, TimeUnit.DAYS);
        }
    }

    // 用户注册
    @Override
    public void register(RegisterDTO registerDTO) {
        // 判断两次密码是否一致
        if(!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())){
            throw new BusinessException(422, "两次密码不一致");
        }
        // 判断验证码是否正确
        String redisKey = EMAIL_CODE_PREFIX + registerDTO.getEmail();
        String codeInRedis = stringRedisTemplate.opsForValue().get(redisKey);
        if (!StringUtils.hasText(codeInRedis)) {
            throw new BusinessException(422, "验证码已过期，请重新获取");
        }
        // 验证码错误次数
        String errorKey = EMAIL_CODE_ERROR_PREFIX + registerDTO.getEmail();
        if (!codeInRedis.equals(registerDTO.getCode())) {
            Long errorCount = stringRedisTemplate.opsForValue().increment(errorKey);
            if (errorCount != null && errorCount == 1) {
                stringRedisTemplate.expire(errorKey, CODE_EXPIRE_MINUTES, TimeUnit.MINUTES);
            }
            if (errorCount != null && errorCount >= CODE_MAX_ERROR_COUNT) {
                stringRedisTemplate.delete(redisKey);
                stringRedisTemplate.delete(errorKey);
                throw new BusinessException(422, "验证码错误次数过多，请重新获取");
            }
            throw new BusinessException(422, "验证码错误");
        }
        // 验证码正确，清除错误次数
        stringRedisTemplate.delete(errorKey);
        // 查询邮箱是否已存在
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getEmail, registerDTO.getEmail());
        if (this.count(wrapper) > 0) {
            throw new BusinessException(409, "邮箱已存在");
        }
        // 保存用户信息
        User user = new User();
        user.setEmail(registerDTO.getEmail());
        String encrypt = PasswordUtil.encrypt(registerDTO.getPassword());
        user.setPassword(encrypt);
        this.save(user);
        // 验证码正确，删除 Redis 中的验证码
        stringRedisTemplate.delete(redisKey);
    }

    // 用户登录
    @Override
    public String login(LoginDTO loginDTO) {
        // 验证邮箱和密码
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getEmail, loginDTO.getEmail());
        User user = this.getOne(wrapper);
        if(user == null || !PasswordUtil.matches(loginDTO.getPassword(), user.getPassword())){
            throw new BusinessException(422, "邮箱或密码错误");
        }
        // 生成 Token
        String token = JwtUtil.generateToken(user.getId());
        // 保存 Token 到 Redis
        stringRedisTemplate.opsForValue().set(TOKEN_PREFIX + token, user.getId().toString(), TOKEN_EXPIRE_DAYS, TimeUnit.DAYS);
        return token;
    }

    // 用户登出
    @Override
    public void logout() {
        // 从当前请求中取出请求头里的 Token
        String token = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest()
                .getHeader("Authorization");

        if (token != null && !token.trim().isEmpty()) {
            // 删除 Redis 中的令牌，立即失效
            stringRedisTemplate.delete(TOKEN_PREFIX + token);
        }
    }

    // 重置密码 - 发送验证码
    @Override
    public void resetPasswordSendCode(String email) {
        // 邮箱格式校验
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new BusinessException(400, "邮箱格式不正确");
        }
        // 校验邮箱是否已注册（忘记密码专属校验）
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getEmail, email);
        if (this.count(lambdaQueryWrapper) == 0) {
            throw new BusinessException(422, "邮箱未注册");
        }
        // 验证码发送冷却
        String cooldownKey = RESET_EMAIL_CODE_COOLDOWN_PREFIX + email;
        Boolean hasCooldown = stringRedisTemplate.hasKey(cooldownKey);
        if (Boolean.TRUE.equals(hasCooldown)) {
            throw new BusinessException(422, "验证码发送太频繁，请稍后再试");
        }
        // 检查今日发送次数是否超过上限
        String dailyKey = RESET_EMAIL_CODE_DAILY_PREFIX + email;
        String dailyCountStr = stringRedisTemplate.opsForValue().get(dailyKey);
        int dailyCount = dailyCountStr == null ? 0 : Integer.parseInt(dailyCountStr);
        if (dailyCount >= CODE_DAILY_LIMIT) {
            throw new BusinessException(422, "今日验证码发送次数已达上限");
        }
        // 生成验证码
        String code = String.format("%06d", SECURE_RANDOM.nextInt(1000000));
        // 存入 Redis
        stringRedisTemplate.opsForValue().set(RESET_EMAIL_CODE_PREFIX + email, code, CODE_EXPIRE_MINUTES, TimeUnit.MINUTES);
        // 邮件发送
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(mailFrom);       // 发件人
        message.setTo(email);            // 收件人
        message.setSubject("重置验证码"); // 邮件标题
        message.setText("您的重置验证码是：" + code + "，5分钟内有效，请勿泄露给他人。"); // 邮件正文
        javaMailSender.send(message);
        // 验证码发送冷却
        Boolean locked = stringRedisTemplate.opsForValue()
                .setIfAbsent(cooldownKey, "1", CODE_COOLDOWN_SECONDS, TimeUnit.SECONDS);
        if (Boolean.FALSE.equals(locked)) {
            throw new BusinessException(422, "验证码发送太频繁，请稍后再试");
        }
        // 邮件发送成功后，累计今日发送次数
        Long count = stringRedisTemplate.opsForValue().increment(dailyKey);
        if (count != null && count == 1) {
            stringRedisTemplate.expire(dailyKey, 1, TimeUnit.DAYS);
        }
    }

    // 重置密码
    @Override
    public void resetPassword(ResetPasswordDTO resetPasswordDTO) {
        // 校验两次密码是否一致
        if (!resetPasswordDTO.getPassword().equals(resetPasswordDTO.getConfirmPassword())) {
            throw new BusinessException(422, "两次输入的密码不一致");
        }
        // 验证码校验
        String code = RESET_EMAIL_CODE_PREFIX + resetPasswordDTO.getEmail();
        String codeInRedis = stringRedisTemplate.opsForValue().get(code);
        if (!StringUtils.hasText(codeInRedis)) {
            throw new BusinessException(422, "验证码已过期，请重新获取");
        }
        // 验证码错误次数
        String errorKey = RESET_EMAIL_CODE_ERROR_PREFIX + resetPasswordDTO.getEmail();
        if (!StringUtils.hasText(codeInRedis)) {
            throw new BusinessException(422, "验证码已过期，请重新获取");
        }
        if (!codeInRedis.equals(resetPasswordDTO.getCode())) {
            Long errorCount = stringRedisTemplate.opsForValue().increment(errorKey);
            if (errorCount != null && errorCount == 1) {
                stringRedisTemplate.expire(errorKey, CODE_EXPIRE_MINUTES, TimeUnit.MINUTES);
            }
            if (errorCount != null && errorCount >= CODE_MAX_ERROR_COUNT) {
                stringRedisTemplate.delete(code);
                stringRedisTemplate.delete(errorKey);
                throw new BusinessException(422, "验证码错误次数过多，请重新获取");
            }
            throw new BusinessException(422, "验证码错误");
        }
        // 验证码正确，清除错误次数
        stringRedisTemplate.delete(errorKey);
        // 查询用户，更新密码
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getEmail, resetPasswordDTO.getEmail());
        User user = this.getOne(lambdaQueryWrapper);
        if(user == null){
            throw new BusinessException(422, "用户不存在");
        }
        user.setPassword(PasswordUtil.encrypt(resetPasswordDTO.getPassword()));
        this.updateById(user);
        // 验证码校验通过，立即删除
        stringRedisTemplate.delete(code);
    }
}
