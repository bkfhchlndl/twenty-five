package com.life.twentyfive.controller;

import com.life.twentyfive.common.Result;
import com.life.twentyfive.common.UserContext;
import com.life.twentyfive.entity.SgsInformation;
import com.life.twentyfive.service.SgsInformationService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/information")
public class SgsInformationController {

    @Resource
    private SgsInformationService sgsInformationService;

    // 添加三国杀角色信息
    @PostMapping("/insertSgsInformation")
    public Result insertSgsInformation(@RequestBody SgsInformation sgsInformation) {
        Long userId = UserContext.getUserId();
        boolean b = sgsInformationService.insertSgsInformation(sgsInformation, userId);
        return Result.success(b);
    }

    // 查询该角色是否添加角色信息
    @GetMapping("/existsSgsInformationByUserId")
    public Result existsSgsInformationByUserId() {
        Long userId = UserContext.getUserId();
        boolean b = sgsInformationService.existsSgsInformationByUserId(userId);
        return Result.success(b);
    }
}
