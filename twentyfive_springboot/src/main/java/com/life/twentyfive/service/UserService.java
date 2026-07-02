package com.life.twentyfive.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.User;
import com.life.twentyfive.entity.dto.LoginDTO;
import com.life.twentyfive.entity.dto.RegisterDTO;
import com.life.twentyfive.entity.dto.ResetPasswordDTO;

public interface UserService extends IService<User> {

    // 用户注册 - 发送验证码
    void sendCode(String email);

    // 用户注册
    void register(RegisterDTO registerDTO);

    // 用户登录
    String login(LoginDTO loginDTO);

    // 用户登出
    void logout();

    // 重置密码 - 发送验证码
    void resetPasswordSendCode(String email);

    // 重置密码
    void resetPassword(ResetPasswordDTO resetPasswordDTO);
}
