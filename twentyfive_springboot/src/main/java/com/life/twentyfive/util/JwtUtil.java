package com.life.twentyfive.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

/**
 * JWT 令牌工具类
 */
public class JwtUtil {

    // 密钥：至少32位字符，生产环境建议放到配置文件中，不要硬编码
    private static final String SECRET_KEY = "your-project-secret-key-256bits-long-enough";
    // Token 有效期：7天（单位毫秒）
    private static final long EXPIRE_MILLIS = 7 * 24 * 60 * 60 * 1000L;

    // 生成签名密钥
    private static final SecretKey SIGN_KEY = Keys.hmacShaKeyFor(SECRET_KEY.getBytes(StandardCharsets.UTF_8));

    /**
     * 生成 Token
     * @param userId 用户ID
     * @return JWT 令牌字符串
     */
    public static String generateToken(Long userId) {
        return Jwts.builder()
                .setSubject(String.valueOf(userId))    // 载荷：存放用户ID
                .setIssuedAt(new Date())               // 签发时间
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE_MILLIS)) // 过期时间
                .signWith(SIGN_KEY, SignatureAlgorithm.HS256) // 签名算法
                .compact();
    }

    /**
     * 从 Token 中解析出用户ID
     * @param token JWT 令牌
     * @return 用户ID
     */
    public static Long getUserId(String token) {
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(SIGN_KEY)
                .build()
                .parseClaimsJws(token)
                .getBody();
        return Long.valueOf(claims.getSubject());
    }

    /**
     * 校验 Token 是否有效（未过期、未篡改）
     * @param token JWT 令牌
     * @return true-有效 false-无效
     */
    public static boolean validateToken(String token) {
        try {
            Jwts.parserBuilder()
                    .setSigningKey(SIGN_KEY)
                    .build()
                    .parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            // 过期、篡改、格式错误均视为无效
            return false;
        }
    }
}