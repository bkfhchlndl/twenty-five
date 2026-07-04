package com.life.twentyfive.util;

import com.life.twentyfive.config.UploadProperties;
import com.life.twentyfive.exception.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 通用文件上传工具类
 * 支持图片上传，自动分类存储、重名防覆盖、类型校验
 */
@Component
public class FileUploadUtil {

    @Autowired
    private UploadProperties uploadProperties;

    /**
     * 通用图片上传方法
     * @param file 前端上传的文件
     * @param bizDir 业务子目录，比如 "avatar"（头像）、"card"（卡片图标）
     * @return 可直接存入数据库的访问相对路径
     */
    public String uploadImage(MultipartFile file, String bizDir) {
        // 基础非空校验
        if (file.isEmpty()) {
            throw new BusinessException("上传文件不能为空");
        }

        // 文件类型校验（只允许图片）
        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new BusinessException("只支持上传图片格式文件");
        }

        // 生成唯一文件名（时间戳 + 短UUID），防止重名覆盖
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = System.currentTimeMillis() + "_" + UUID.randomUUID().toString().substring(0, 8) + suffix;

        // 拼接完整存储路径，按业务目录分类
        String fullSaveDir = uploadProperties.getBasePath() + bizDir + "/";
        File destFile = new File(fullSaveDir + fileName);

        // 目录不存在则自动创建
        if (!destFile.getParentFile().exists()) {
            destFile.getParentFile().mkdirs();
        }

        try {
            // 保存文件到本地磁盘
            file.transferTo(destFile);
        } catch (IOException e) {
            throw new BusinessException("文件保存失败，请重试");
        }

        // 返回可访问的相对路径，直接存数据库即可
        return uploadProperties.getAccessPrefix() + bizDir + "/" + fileName;
    }

    /**
     * 删除本地图片文件
     * @param accessPath 数据库存的相对路径，比如 /upload/card/xxx.png
     */
    public void deleteImage(String accessPath) {
        // 路径为空直接跳过
        if (StringUtils.isEmpty(accessPath)) {
            return;
        }
        // 把访问相对路径，转换成本地磁盘的绝对路径
        String relativePath = accessPath.replace(uploadProperties.getAccessPrefix(), "");
        File file = new File(uploadProperties.getBasePath() + relativePath);

        // 文件存在才执行删除
        if (file.exists()) {
            file.delete();
        }
    }
}