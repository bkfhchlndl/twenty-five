package com.life.twentyfive.entity.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class ResetPasswordDTO {

    // 邮箱
    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;

    // 验证码
    @NotBlank(message = "验证码不能为空")
    private String code;

    // 密码
    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度需在6-20位之间")
    private String password;

    // 确认密码
    @NotBlank(message = "确认密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度需在6-20位之间")
    private String confirmPassword;
}