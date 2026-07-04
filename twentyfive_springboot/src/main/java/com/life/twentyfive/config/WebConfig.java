package com.life.twentyfive.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private UploadProperties uploadProperties;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 把本地磁盘路径映射成可访问的URL
        registry.addResourceHandler(uploadProperties.getAccessPrefix() + "**")
                .addResourceLocations("file:" + uploadProperties.getBasePath());
    }
}