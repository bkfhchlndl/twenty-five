package com.life.twentyfive.exception;

import lombok.Getter;

/**
 * 自定义业务异常
 */
@Getter
public class BusinessException extends RuntimeException {

    /**
     * 业务状态码
     */
    private final Integer code;

    /**
     * 默认业务校验失败：422
     */
    public BusinessException(String message) {
        super(message);
        this.code = 422;
    }

    public BusinessException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}