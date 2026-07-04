package com.life.twentyfive.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "upload")
public class UploadProperties {

    /** 本地存储根路径 */
    private String basePath;

    /** 访问URL前缀 */
    private String accessPrefix;
}