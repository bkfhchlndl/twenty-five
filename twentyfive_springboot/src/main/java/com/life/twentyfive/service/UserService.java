package com.life.twentyfive.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.User;
import com.life.twentyfive.entity.dto.LoginDTO;
import com.life.twentyfive.entity.dto.RegisterDTO;

public interface UserService extends IService<User> {

    // 用户注册
    Void register(RegisterDTO registerDTO);

    // 用户登录
    String login(LoginDTO loginDTO);

    // 发送验证码
    void sendCode(String email);

    // 用户登出
    void logout();
}
