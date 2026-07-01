package com.life.twentyfive.common;

/**
 * 当前登录用户上下文
 * 基于 ThreadLocal 存储，同一请求线程内共享
 */
public class UserContext {

    private static final ThreadLocal<Long> CURRENT_USER = new ThreadLocal<>();

    /**
     * 设置当前登录用户ID
     */
    public static void setUserId(Long userId) {
        CURRENT_USER.set(userId);
    }

    /**
     * 获取当前登录用户ID
     */
    public static Long getUserId() {
        return CURRENT_USER.get();
    }

    /**
     * 清理用户信息（请求结束必须调用，防止内存泄漏）
     */
    public static void clear() {
        CURRENT_USER.remove();
    }
}