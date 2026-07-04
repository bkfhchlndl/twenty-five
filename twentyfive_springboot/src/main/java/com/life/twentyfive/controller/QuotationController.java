package com.life.twentyfive.controller;

import com.life.twentyfive.common.Result;
import com.life.twentyfive.common.UserContext;
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
        Long userId = UserContext.getUserId();
        boolean b = quotationService.insertQuotation(quotation, userId);
        return Result.success(b);
    }

    // 查询语录
    @GetMapping("/selectQuotationList")
    public Result selectQuotationList(){
        Long userId = UserContext.getUserId();
        List<Quotation> quotationList = quotationService.selectQuotationList(userId);
        return Result.success(quotationList);
    }

    // 删除语录
    @DeleteMapping("/deleteQuotation")
    public Result deleteQuotation(@RequestParam Long id){
        Long userId = UserContext.getUserId();
        boolean b = quotationService.deleteQuotation(id, userId);
        return Result.success(b);
    }

    // 修改语录
    @PutMapping("/updateQuotation")
    public Result updateQuotation(@RequestBody Quotation quotation){
        Long userId = UserContext.getUserId();
        boolean b = quotationService.updateQuotation(quotation, userId);
        return Result.success(b);
    }
}