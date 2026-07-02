package com.life.twentyfive.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.life.twentyfive.entity.Quotation;
import com.life.twentyfive.mapper.QuotationMapper;
import com.life.twentyfive.service.QuotationService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuotationServiceImpl extends ServiceImpl<QuotationMapper, Quotation> implements QuotationService {

    // 添加语录
    @Override
    public boolean insertQuotation(Quotation quotation) {
        return save(quotation);
    }

    // 查询全部语录
    @Override
    public List<Quotation> selectQuotationList() {
        LambdaQueryWrapper<Quotation> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据是否置顶来排序
        lambdaQueryWrapper.orderByAsc(Quotation::getIsTop);
        // 再根据排序序号来排序
        lambdaQueryWrapper.orderByAsc(Quotation::getSort);
        return list(lambdaQueryWrapper);
    }
}