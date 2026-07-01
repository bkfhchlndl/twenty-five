package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("user")
public class User extends BaseEntity{

    // 邮箱
    private String email;

    // 密码
    private String password;

    // 头像地址
    private String avatar;

    // 昵称
    private String nickname;

    // 个性签名
    private String signature;

    // 性别
    private String gender;

    // 手机号
    private String phone;

    // 上下级
    private Integer parentId;
}