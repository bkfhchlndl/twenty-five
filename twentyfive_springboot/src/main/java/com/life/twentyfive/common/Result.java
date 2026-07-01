package com.life.twentyfive.common;

import lombok.Data;

/**
 * 全局统一响应结果封装
 * 所有接口统一返回此格式，前后端约定标准
 */
@Data
public class Result<T> {

    /**
     * 响应状态码
     * 200-成功  400-参数错误  401-未登录/鉴权失败  500-业务/系统错误
     */
    private Integer code;

    /**
     * 响应提示信息
     */
    private String msg;

    /**
     * 响应业务数据
     */
    private T data;

    /**
     * 私有构造方法，禁止外部直接 new 对象，强制通过静态方法创建
     */
    private Result() {}

    /**
     * 成功响应（无返回数据，比如新增、删除、修改操作）
     */
    public static <T> Result<T> success() {
        Result<T> result = new Result<>();
        result.setCode(200);
        result.setMsg("操作成功");
        return result;
    }

    /**
     * 成功响应（带业务数据返回，比如查询、登录返回token）
     */
    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>();
        result.setCode(200);
        result.setMsg("操作成功");
        result.setData(data);
        return result;
    }

    /**
     * 失败响应（默认 500 状态码，用于业务校验失败）
     */
    public static <T> Result<T> error(String msg) {
        Result<T> result = new Result<>();
        result.setCode(500);
        result.setMsg(msg);
        return result;
    }

    /**
     * 失败响应（自定义状态码，比如参数错误传400）
     */
    public static <T> Result<T> error(Integer code, String msg) {
        Result<T> result = new Result<>();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }
}