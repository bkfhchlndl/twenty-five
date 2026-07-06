package com.life.twentyfive.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.life.twentyfive.entity.SgsInformation;
import com.life.twentyfive.exception.BusinessException;
import com.life.twentyfive.mapper.SgsInformationMapper;
import com.life.twentyfive.service.SgsInformationService;
import org.springframework.stereotype.Service;

@Service
public class SgsInformationServiceImpl extends ServiceImpl<SgsInformationMapper, SgsInformation> implements SgsInformationService {

    // 添加三国杀角色信息
    @Override
    public boolean insertSgsInformation(SgsInformation sgsInformation, Long userId) {
        LambdaQueryWrapper<SgsInformation> checkWrapper = new LambdaQueryWrapper<>();
        checkWrapper.eq(SgsInformation::getUserId, userId);
        SgsInformation existByUser = this.getOne(checkWrapper);
        if (existByUser != null) {
            throw new BusinessException(403, "您已添加过角色信息");
        }
        sgsInformation.setUserId(userId);
        if ("".equals(sgsInformation.getVipLevel())) {
            sgsInformation.setVipLevel(null);
        }
        if ("".equals(sgsInformation.getOfficialRank())) {
            sgsInformation.setOfficialRank(null);
        }
        return save(sgsInformation);
    }

    // 查询该用户是否已添加角色信息（存在返回 true，不存在返回 false，不抛异常）
    @Override
    public boolean existsSgsInformationByUserId(Long userId) {
        LambdaQueryWrapper<SgsInformation> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(SgsInformation::getUserId, userId);
        SgsInformation one = this.getOne(lambdaQueryWrapper);
        return one != null;
    }
}
