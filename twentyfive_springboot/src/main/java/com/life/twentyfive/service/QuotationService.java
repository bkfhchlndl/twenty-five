package com.life.twentyfive.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.Quotation;

import java.util.List;

public interface QuotationService extends IService<Quotation> {

    // 添加语录
    boolean insertQuotation(Quotation quotation, Long userId);

    // 查询全部语录
    List<Quotation> selectQuotationList(Long userId);

    // 删除语录
    boolean deleteQuotation(Long id, Long userId);

    // 修改语录
    boolean updateQuotation(Quotation quotation, Long userId);
}
