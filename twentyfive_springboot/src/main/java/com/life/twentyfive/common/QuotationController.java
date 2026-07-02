package com.life.twentyfive.common;

import com.life.twentyfive.entity.Quotation;
import com.life.twentyfive.service.QuotationService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/quotation")
public class QuotationController {

    @Resource
    private QuotationService quotationService;

    // 添加语录
    @PostMapping("/insertQuotation")
    public Result insertQuotation(@RequestBody Quotation quotation){
        boolean b = quotationService.insertQuotation(quotation);
        return Result.success(b);
    }

    // 查询语录
    @GetMapping("/selectQuotationList")
    public Result selectQuotationList(){
        List<Quotation> quotationList = quotationService.selectQuotationList();
        return Result.success(quotationList);
    }
}