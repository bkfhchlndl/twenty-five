package com.life.twentyfive.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.life.twentyfive.entity.Card;
import com.life.twentyfive.exception.BusinessException;
import com.life.twentyfive.mapper.CardMapper;
import com.life.twentyfive.service.CardService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardServiceImpl extends ServiceImpl<CardMapper, Card> implements CardService {

    // 查询所有卡片
    @Override
    public List<Card> selectAllCard(Long userId) {
        LambdaQueryWrapper<Card> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 条件：(公共卡片 0) OR (当前用户私有卡片)，同时过滤已删除
        lambdaQueryWrapper.and(
                wrapper ->
                        wrapper.eq(Card::getCardType, 0).or().
                                eq(Card::getUserId, userId))
                        .eq(Card::getIsDel, 0);
        // 排序：先公共卡片在前，再按sort升序
        lambdaQueryWrapper.orderByAsc(Card::getCardType)
                          .orderByAsc(Card::getSort);
        return list(lambdaQueryWrapper);
    }

    // 添加卡片
    @Override
    public boolean insertCard(Card card, Long userId) {
        LambdaQueryWrapper<Card> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 校验是否重复，不允许标题名字一样
        lambdaQueryWrapper.eq(Card::getUserId, userId)
                          .eq(Card::getTitle, card.getTitle())
                          .eq(Card::getIsDel, 0);
        Card one = this.getOne(lambdaQueryWrapper);
        if(one != null){
            throw new BusinessException(403, "标题已存在");
        }
        card.setUserId(userId);
        card.setCardType(1);
        return save(card);
    }

    // 删除卡片
    @Override
    public boolean deleteCard(Long id, Long userId) {
        LambdaQueryWrapper<Card> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Card::getUserId, userId)
                          .eq(Card::getId, id)
                          .eq(Card::getCardType, 1)
                          .eq(Card::getIsDel, 0);
        Card card = getOne(lambdaQueryWrapper);
        if (card == null) {
            throw new BusinessException(403, "无权限删除公共卡片");
        }
        return remove(lambdaQueryWrapper);
    }

    // 修改卡片
    @Override
    public boolean updateCard(Card card, Long userId) {
        LambdaQueryWrapper<Card> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Card::getUserId, userId)
                          .eq(Card::getId, card.getId())
                          .eq(Card::getCardType, 1)
                          .eq(Card::getIsDel, 0);
        Card one = this.getOne(lambdaQueryWrapper);
        if(one == null){
            throw new BusinessException(403, "数据不存在或无权操作");
        }
        one.setTitle(card.getTitle());
        one.setPath(card.getPath());
        one.setImagePath(card.getImagePath());
        one.setSort(card.getSort());
        return updateById(one);
    }
}