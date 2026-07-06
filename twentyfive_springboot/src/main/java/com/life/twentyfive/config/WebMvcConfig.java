package com.life.twentyfive.config;

import com.life.twentyfive.interceptor.LoginInterceptor;
import jakarta.annotation.Resource;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Resource
    private LoginInterceptor loginInterceptor;

    @Resource
    private UploadProperties uploadProperties;

    /**
     * 注册登录拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/user/sendCode",   // 用户注册 - 发送验证码
                        "/user/register",   // 用户注册
                        "/user/login",  // 用户登录
                        "/user/resetPasswordSendCode",  // 重置密码 - 获取验证码
                        "/user/resetPassword",   // 重置密码
                        "/uploadImage",
                        "/upload/**"
                );
    }

    /**
     * 全局跨域配置
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                // 允许所有来源域名，生产环境建议替换为具体的前端域名
                .allowedOriginPatterns("*")
                // 允许的请求方法
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                // 允许所有请求头
                .allowedHeaders("*")
                // 允许携带 Cookie/凭证
                .allowCredentials(true)
                // 预检请求有效期，3600秒内无需重复发送OPTIONS
                .maxAge(3600);
    }

    /**
     * 静态资源映射：把 /upload/** 的请求，映射到本地磁盘的上传目录
     * 比如访问 http://localhost:8080/upload/card/xxx.png
     * 就会去 D:/life/upload/card/xxx.png 找文件
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(uploadProperties.getAccessPrefix() + "**")
                .addResourceLocations("file:" + uploadProperties.getBasePath());
    }
}