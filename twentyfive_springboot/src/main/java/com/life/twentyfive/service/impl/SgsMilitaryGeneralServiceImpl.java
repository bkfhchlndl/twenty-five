package com.life.twentyfive.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import com.life.twentyfive.entity.SgsBag;
import com.life.twentyfive.entity.SgsCamp;
import com.life.twentyfive.entity.SgsMilitaryGeneral;
import com.life.twentyfive.entity.SgsQuality;
import com.life.twentyfive.entity.dto.SgsGeneralQueryDTO;
import com.life.twentyfive.entity.vo.SgsVO;
import com.life.twentyfive.mapper.SgsMilitaryGeneralMapper;
import com.life.twentyfive.service.SgsMilitaryGeneralService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;


@Service
public class SgsMilitaryGeneralServiceImpl extends ServiceImpl<SgsMilitaryGeneralMapper, SgsMilitaryGeneral> implements SgsMilitaryGeneralService {

    // 查询全部武将信息
    @Override
    public Page<SgsVO> selectSgsMilitaryGeneralList(Page<SgsVO> page,
                                                    Long userId,
                                                    SgsGeneralQueryDTO sgsGeneralQueryDTO) {
        // 创建联表专用包装器
        MPJLambdaWrapper<SgsMilitaryGeneral> mpjLambdaWrapper = new MPJLambdaWrapper<>();
        // 查询主表全部字段,主表是 SgsMilitaryGeneral
        mpjLambdaWrapper.selectAll(SgsMilitaryGeneral.class)
                        // 选关联表的字段
                        .selectAs(SgsCamp::getName, SgsVO::getCampName)
                        .selectAs(SgsQuality::getName, SgsVO::getQualityName)
                        .selectAs(SgsBag::getName, SgsVO::getBagName)
                        // LEFT JOIN 关联表
                        .leftJoin(SgsCamp.class, SgsCamp::getId, SgsMilitaryGeneral::getCampId)
                        .leftJoin(SgsQuality.class, SgsQuality::getId, SgsMilitaryGeneral::getTypeId)
                        .leftJoin(SgsBag.class, SgsBag::getId, SgsMilitaryGeneral::getBagId)
                        // 查询条件
                        .eq(SgsMilitaryGeneral::getUserId, userId)
                        // 排序（按获得时间倒序）
                        .orderByDesc(SgsMilitaryGeneral::getGetTime);
        if (sgsGeneralQueryDTO.getName() != null && !sgsGeneralQueryDTO.getName().isBlank()) {
            mpjLambdaWrapper.like(SgsMilitaryGeneral::getName, sgsGeneralQueryDTO.getName());
        }
        if (sgsGeneralQueryDTO.getGender() != null && !sgsGeneralQueryDTO.getGender().isBlank()) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getGender, sgsGeneralQueryDTO.getGender());
        }
        if (sgsGeneralQueryDTO.getCampId() != null) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getCampId, sgsGeneralQueryDTO.getCampId());
        }
        if (sgsGeneralQueryDTO.getHp() != null && !sgsGeneralQueryDTO.getHp().isBlank()) {
            mpjLambdaWrapper.like(SgsMilitaryGeneral::getHp, sgsGeneralQueryDTO.getHp());
        }
        if (sgsGeneralQueryDTO.getTypeId() != null) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getTypeId, sgsGeneralQueryDTO.getTypeId());
        }
        // 时间区间
        if (sgsGeneralQueryDTO.getStartTime() != null && sgsGeneralQueryDTO.getEndTime() != null) {
            mpjLambdaWrapper.between(SgsMilitaryGeneral::getGetTime, sgsGeneralQueryDTO.getStartTime(), sgsGeneralQueryDTO.getEndTime());
        } else if (sgsGeneralQueryDTO.getStartTime() != null) {
            mpjLambdaWrapper.ge(SgsMilitaryGeneral::getGetTime, sgsGeneralQueryDTO.getStartTime());
        } else if (sgsGeneralQueryDTO.getEndTime() != null) {
            mpjLambdaWrapper.le(SgsMilitaryGeneral::getGetTime, sgsGeneralQueryDTO.getEndTime());
        }
        if (sgsGeneralQueryDTO.getStarRating() != null) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getStarRating, sgsGeneralQueryDTO.getStarRating());
        }
        if (sgsGeneralQueryDTO.getFtlRating() != null) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getFtlRating, sgsGeneralQueryDTO.getFtlRating());
        }
        if (sgsGeneralQueryDTO.getMcRating() != null) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getMcRating, sgsGeneralQueryDTO.getMcRating());
        }
        if (sgsGeneralQueryDTO.getBagId() != null) {
            mpjLambdaWrapper.eq(SgsMilitaryGeneral::getBagId, sgsGeneralQueryDTO.getBagId());
        }
        // 分页联查，返回封装好的VO分页数据
        Page<SgsVO> sgsVOPage = baseMapper.selectJoinPage(page, SgsVO.class, mpjLambdaWrapper);
        return sgsVOPage;
    }
}
