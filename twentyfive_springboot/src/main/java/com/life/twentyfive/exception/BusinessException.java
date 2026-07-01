package com.life.twentyfive.exception;

import lombok.Getter;

/**
 * 自定义业务异常
 * 用于业务校验失败时抛出，会被全局异常处理器统一捕获
 */
@Getter
public class BusinessException extends RuntimeException {

    /**
     * 错误提示信息
     */
    private final String message;

    public BusinessException(String message) {
        super(message);
        this.message = message;
    }
}