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

import java.util.concurrent.TimeUnit;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private JavaMailSender javaMailSender;

    // Redis 中验证码的 key 前缀
    private static final String EMAIL_CODE_PREFIX = "email:code:";

    // Redis 中的 Token 的 key 前缀
    private static final String TOKEN_PREFIX = "login:token:";

    // Redis 中的 Token 的有效期
    private static final long TOKEN_EXPIRE_DAYS = 7;

    // 重置密码验证码 key 前缀
    private static final String RESET_EMAIL_CODE_PREFIX = "reset:email:code:";

    // 从配置中读取发件人邮箱，也可以直接写死
    @Value("${spring.mail.username}")
    private String mailFrom;

    // 用户注册 - 发送验证码
    @Override
    public void sendCode(String email) {
        // 基础格式校验
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new BusinessException("邮箱格式不正确");
        }
        // 生成验证码
        String code = String.valueOf(Math.random()).substring(2, 8);
        // 存入 Redis
        String redisKey = EMAIL_CODE_PREFIX + email;
        stringRedisTemplate.opsForValue().set(redisKey, code, 5, TimeUnit.MINUTES);
        // 发送邮件
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(mailFrom);       // 发件人
        message.setTo(email);            // 收件人
        message.setSubject("注册验证码"); // 邮件标题
        message.setText("您的注册验证码是：" + code + "，5分钟内有效，请勿泄露给他人。"); // 邮件正文
        javaMailSender.send(message);
    }

    // 用户注册
    @Override
    public void register(RegisterDTO registerDTO) {
        // 判断两次密码是否一致
        if(!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())){
            throw new BusinessException("两次密码不一致");
        }
        // 判断验证码是否正确
        String redisKey = EMAIL_CODE_PREFIX + registerDTO.getEmail();
        String codeInRedis = stringRedisTemplate.opsForValue().get(redisKey);
        if (!StringUtils.hasText(codeInRedis)) {
            throw new BusinessException("验证码已过期，请重新获取");
        }
        if (!codeInRedis.equals(registerDTO.getCode())) {
            throw new BusinessException("验证码错误");
        }
        // 验证码正确，删除 Redis 中的验证码
        stringRedisTemplate.delete(redisKey);
        // 查询邮箱是否已存在
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getEmail, registerDTO.getEmail());
        if (this.count(wrapper) > 0) {
            throw new BusinessException("邮箱已存在");
        }
        // 保存用户信息
        User user = new User();
        user.setEmail(registerDTO.getEmail());
        String encrypt = PasswordUtil.encrypt(registerDTO.getPassword());
        user.setPassword(encrypt);
        this.save(user);
    }

    // 用户登录
    @Override
    public String login(LoginDTO loginDTO) {
        // 验证邮箱和密码
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getEmail, loginDTO.getEmail());
        User user = this.getOne(wrapper);
        if(user == null || !PasswordUtil.matches(loginDTO.getPassword(), user.getPassword())){
            throw new BusinessException("邮箱或密码错误");
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
        // 邮箱格式校验（复用注册的正则，保持统一）
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new BusinessException("邮箱格式不正确");
        }
        // 校验邮箱是否已注册（忘记密码专属校验）
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getEmail, email);
        if (this.count(lambdaQueryWrapper) == 0) {
            throw new BusinessException("邮箱未注册");
        }
        // 生成验证码
        String code = String.valueOf(Math.random()).substring(2, 8);
        // 存入 Redis
        stringRedisTemplate.opsForValue().set(RESET_EMAIL_CODE_PREFIX + email, code, 5, TimeUnit.MINUTES);
        // 邮件发送
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(mailFrom);
        message.setTo(email);
        message.setFrom(mailFrom);       // 发件人
        message.setTo(email);            // 收件人
        message.setSubject("重置验证码"); // 邮件标题
        message.setText("您的重置验证码是：" + code + "，5分钟内有效，请勿泄露给他人。"); // 邮件正文
        javaMailSender.send(message);
    }

    // 重置密码
    @Override
    public void resetPassword(ResetPasswordDTO resetPasswordDTO) {
        // 校验两次密码是否一致
        if (!resetPasswordDTO.getPassword().equals(resetPasswordDTO.getConfirmPassword())) {
            throw new BusinessException("两次输入的密码不一致");
        }
        // 验证码校验
        String code = RESET_EMAIL_CODE_PREFIX + resetPasswordDTO.getEmail();
        String codeInRedis = stringRedisTemplate.opsForValue().get(code);
        if (!StringUtils.hasText(codeInRedis)) {
            throw new BusinessException("验证码已过期，请重新获取");
        }
        if (!codeInRedis.equals(resetPasswordDTO.getCode())) {
            throw new BusinessException("验证码错误");
        }
        // 验证码校验通过，立即删除，保证一次性使用
        stringRedisTemplate.delete(code);
        // 查询用户，更新密码
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getEmail, resetPasswordDTO.getEmail());
        User user = this.getOne(lambdaQueryWrapper);
        if(user == null){
            throw new BusinessException("用户不存在");
        }
        user.setPassword(PasswordUtil.encrypt(resetPasswordDTO.getPassword()));
        this.updateById(user);
    }
}