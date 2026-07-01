package com.life.twentyfive.interceptor;

import com.life.twentyfive.common.UserContext;
import com.life.twentyfive.exception.BusinessException;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * 登录状态校验拦截器
 * 校验请求头中的 Token 是否合法有效
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private static final String TOKEN_PREFIX = "login:token:";

    /**
     * 进入 Controller 方法之前执行
     * return true = 放行，return false = 拦截请求
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1. 放行跨域预检请求（OPTIONS 请求不携带 Token，直接放行）
        if ("OPTIONS".equals(request.getMethod())) {
            return true;
        }

        // 2. 从请求头中获取 Token（前后端约定请求头 key 为 Authorization）
        String token = request.getHeader("Authorization");
        if (token == null || token.trim().isEmpty()) {
            throw new BusinessException("请先登录");
        }

        // 3. 去 Redis 校验 Token 是否存在且未过期
        String redisKey = TOKEN_PREFIX + token;
        String userIdStr = stringRedisTemplate.opsForValue().get(redisKey);
        if (userIdStr == null) {
            throw new BusinessException("登录已过期，请重新登录");
        }

        // 4. Token 有效，将用户ID存入上下文，供业务层使用
        UserContext.setUserId(Long.valueOf(userIdStr));

        // 5. 放行请求，进入 Controller
        return true;
    }

    /**
     * 请求处理完成后执行，清理 ThreadLocal，避免内存泄漏
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        UserContext.clear();
    }
}