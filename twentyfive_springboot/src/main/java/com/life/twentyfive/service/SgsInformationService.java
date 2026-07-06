package com.life.twentyfive.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.SgsInformation;

public interface SgsInformationService extends IService<SgsInformation> {

    // 添加三国杀角色信息
    boolean insertSgsInformation(SgsInformation sgsInformation, Long userId);

    // 查询该角色是否添加角色信息
    boolean existsSgsInformationByUserId(Long userId);
}
