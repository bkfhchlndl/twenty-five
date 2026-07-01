package com.life.twentyfive.exception;

import com.life.twentyfive.common.Result;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 * 统一捕获所有异常，封装成标准 Result 格式返回
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 捕获自定义业务异常（验证码错误、邮箱已存在等业务校验失败）
     */
    @ExceptionHandler(BusinessException.class)
    public Result<Void> handleBusinessException(BusinessException e) {
        return Result.error(e.getMessage());
    }

    /**
     * 捕获参数校验异常（@Valid 注解触发的字段校验失败）
     */
    @ExceptionHandler(BindException.class)
    public Result<Void> handleBindException(BindException e) {
        String message = e.getBindingResult().getFieldError() != null
                ? e.getBindingResult().getFieldError().getDefaultMessage()
                : "参数校验失败";
        return Result.error(400, message);
    }

    /**
     * 兜底捕获所有未知系统异常，不暴露内部错误细节
     */
    @ExceptionHandler(Exception.class)
    public Result<Void> handleException(Exception e) {
        e.printStackTrace(); // 控制台打印堆栈，方便排查问题
        return Result.error(500, "系统异常，请稍后重试");
    }
}