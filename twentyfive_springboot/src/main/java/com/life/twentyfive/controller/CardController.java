package com.life.twentyfive.controller;

import com.life.twentyfive.common.Result;
import com.life.twentyfive.common.UserContext;
import com.life.twentyfive.entity.Card;
import com.life.twentyfive.service.CardService;
import com.life.twentyfive.util.FileUploadUtil;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/card")
public class CardController {

    @Resource
    private CardService cardService;

    @Resource
    private FileUploadUtil fileUploadUtil;

    // 单独的卡片图片上传接口
    @PostMapping("/uploadImage")
    public Result uploadImage(@RequestParam("file") MultipartFile file) {
        String imagePath = fileUploadUtil.uploadImage(file, "card");
        return Result.success(imagePath);
    }

    // 查询所有卡片
    @GetMapping("/selectAllCard")
    public Result<List<Card>> selectAllCard(){
        Long userId = UserContext.getUserId();
        List<Card> cards = cardService.selectAllCard(userId);
        return Result.success(cards);
    }

    // 添加卡片
    @PostMapping("/insertCard")
    public Result insertCard(@RequestBody Card card){
        Long userId = UserContext.getUserId();
        boolean b = cardService.insertCard(card, userId);
        return Result.success(b);
    }

    // 删除卡片
    @DeleteMapping("/deleteCard")
    public Result deleteCard(@RequestParam Long id){
        Long userId = UserContext.getUserId();
        boolean result = cardService.deleteCard(id, userId);
        return Result.success(result);
    }

    // 修改卡片
    @PutMapping("/updateCard")
    public Result updateCard(@RequestBody Card card){
        Long userId = UserContext.getUserId();
        boolean b = cardService.updateCard(card, userId);
        return Result.success(b);
    }
}