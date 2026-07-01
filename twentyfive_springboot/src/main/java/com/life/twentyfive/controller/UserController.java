package com.life.twentyfive.controller;

import com.life.twentyfive.common.Result;
import com.life.twentyfive.common.UserContext;
import com.life.twentyfive.entity.User;
import com.life.twentyfive.entity.dto.LoginDTO;
import com.life.twentyfive.entity.dto.RegisterDTO;
import com.life.twentyfive.service.UserService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    // 用户注册
    @PostMapping("/register")
    public Result<Void> register(@RequestBody @Valid RegisterDTO registerDTO) {
        userService.register(registerDTO);
        return Result.success();
    }

    // 用户登录
    @PostMapping("/login")
    public Result<String> login(@RequestBody @Valid LoginDTO loginDTO) {
        String login = userService.login(loginDTO);
        return Result.success(login);
    }

    // 获取当前登录用户信息
    @GetMapping("/info")
    public Result<User> getUserInfo() {
        Long userId = UserContext.getUserId();
        User user = userService.getById(userId);
        user.setPassword(null); // 敏感信息脱敏
        return Result.success(user);
    }

    // 发送验证码
    @GetMapping("/sendCode")
    public Result<Void> sendCode(@RequestParam String email) {
        userService.sendCode(email);
        return Result.success();
    }

    // 用户登出
    @PostMapping("/logout")
    public Result<Void> logout() {
        userService.logout();
        return Result.success();
    }
}