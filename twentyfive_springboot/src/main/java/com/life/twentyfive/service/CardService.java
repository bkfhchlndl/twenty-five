package com.life.twentyfive.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.Card;

import java.util.List;

public interface CardService extends IService<Card> {

    // 查询全部卡片
    List<Card> selectAllCard(Long userId);

    // 添加卡片
    boolean insertCard(Card card, Long userId);

    // 删除卡片
    boolean deleteCard(Long id, Long userId);

    // 修改卡片
    boolean updateCard(Card card, Long userId);
}