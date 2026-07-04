package com.life.twentyfive.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.life.twentyfive.entity.Quotation;
import com.life.twentyfive.exception.BusinessException;
import com.life.twentyfive.mapper.QuotationMapper;
import com.life.twentyfive.service.QuotationService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuotationServiceImpl extends ServiceImpl<QuotationMapper, Quotation> implements QuotationService {

    // 添加语录
    @Override
    public boolean insertQuotation(Quotation quotation, Long userId) {
        quotation.setUserId(userId);
        return save(quotation);
    }

    // 查询全部语录
    @Override
    public List<Quotation> selectQuotationList(Long userId) {
        LambdaQueryWrapper<Quotation> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 查询指定用户的语录
        lambdaQueryWrapper.eq(Quotation::getUserId, userId);
        // 根据是否置顶来排序
        lambdaQueryWrapper.orderByDesc(Quotation::getIsTop);
        // 再根据排序序号来排序
        lambdaQueryWrapper.orderByAsc(Quotation::getSort);
        return list(lambdaQueryWrapper);
    }

    // 删除语录
    @Override
    public boolean deleteQuotation(Long id, Long userId) {
        LambdaQueryWrapper<Quotation> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Quotation::getUserId, userId)
                          .eq(Quotation::getId, id);
        return remove(lambdaQueryWrapper);
    }

    // 修改语录
    @Override
    public boolean updateQuotation(Quotation quotation, Long userId) {
        LambdaQueryWrapper<Quotation> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Quotation::getUserId, userId)
                          .eq(Quotation::getId, quotation.getId());
        Quotation one = this.getOne(lambdaQueryWrapper);
        if(one == null){
            throw new BusinessException(403, "数据不存在或无权操作");
        }
        one.setStatementContent(quotation.getStatementContent());
        one.setSort(quotation.getSort());
        one.setIsTop(quotation.getIsTop());
        return updateById(quotation);
    }
}