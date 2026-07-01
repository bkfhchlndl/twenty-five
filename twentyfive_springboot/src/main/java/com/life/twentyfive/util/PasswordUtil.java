package com.life.twentyfive.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 密码加密工具类
 * 基于 BCrypt 单向加密，自带随机盐，相同密码每次加密结果不同，不可逆
 */
public class PasswordUtil {

    /**
     * BCrypt 加密器，线程安全，全局单例即可
     * 默认强度为 10，数值越高越安全但加密速度越慢，企业项目默认 10 足够
     */
    private static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder();

    /**
     * 密码加密
     * @param rawPassword 明文密码
     * @return 加密后的密文（固定60位长度）
     */
    public static String encrypt(String rawPassword) {
        return ENCODER.encode(rawPassword);
    }

    /**
     * 密码校验
     * @param rawPassword 用户输入的明文密码
     * @param encodedPassword 数据库中存储的加密密文
     * @return true=匹配成功，false=匹配失败
     */
    public static boolean matches(String rawPassword, String encodedPassword) {
        return ENCODER.matches(rawPassword, encodedPassword);
    }
}