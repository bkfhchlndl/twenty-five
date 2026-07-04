package com.life.twentyfive.common;

import lombok.Data;

/**
 * 全局统一响应结果
 */
@Data
public class Result<T> {

    /**
     * 业务状态码
     * 200 成功
     * 400 参数错误
     * 401 未登录 / token 无效
     * 403 无权限
     * 409 数据冲突
     * 422 业务校验失败
     * 500 系统异常
     */
    private Integer code;

    /**
     * 响应提示信息
     */
    private String msg;

    /**
     * 响应数据
     */
    private T data;

    private Result() {
    }

    public static <T> Result<T> success() {
        Result<T> result = new Result<>();
        result.setCode(200);
        result.setMsg("操作成功");
        return result;
    }

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>();
        result.setCode(200);
        result.setMsg("操作成功");
        result.setData(data);
        return result;
    }

    public static <T> Result<T> error(Integer code, String msg) {
        Result<T> result = new Result<>();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    /**
     * 兼容旧写法：默认作为系统异常处理
     */
    public static <T> Result<T> error(String msg) {
        return error(500, msg);
    }

    public static <T> Result<T> badRequest(String msg) {
        return error(400, msg);
    }

    public static <T> Result<T> unauthorized(String msg) {
        return error(401, msg);
    }

    public static <T> Result<T> forbidden(String msg) {
        return error(403, msg);
    }

    public static <T> Result<T> conflict(String msg) {
        return error(409, msg);
    }

    public static <T> Result<T> unprocessable(String msg) {
        return error(422, msg);
    }

    public static <T> Result<T> serverError(String msg) {
        return error(500, msg);
    }
}