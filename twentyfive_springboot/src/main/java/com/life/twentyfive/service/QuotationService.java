package com.life.twentyfive.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.Quotation;

import java.util.List;

public interface QuotationService extends IService<Quotation> {

    // 添加语录
    boolean insertQuotation(Quotation quotation);

    // 查询全部语录
    List<Quotation> selectQuotationList();
}
