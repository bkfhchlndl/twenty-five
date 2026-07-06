package com.life.twentyfive.controller;

import com.life.twentyfive.common.Result;
import com.life.twentyfive.util.FileUploadUtil;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class ImageController {

    @Resource
    private FileUploadUtil fileUploadUtil;

    // 单独的卡片图片上传接口
    @PostMapping("/uploadImage")
    public Result uploadImage(@RequestParam("file") MultipartFile file) {
        String imagePath = fileUploadUtil.uploadImage(file, "card");
        return Result.success(imagePath);
    }
}
