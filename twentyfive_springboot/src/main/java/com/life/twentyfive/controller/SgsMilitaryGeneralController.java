package com.life.twentyfive.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.life.twentyfive.common.Result;
import com.life.twentyfive.common.UserContext;
import com.life.twentyfive.entity.dto.SgsGeneralQueryDTO;
import com.life.twentyfive.entity.vo.SgsVO;
import com.life.twentyfive.service.SgsMilitaryGeneralService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sgsMilitaryGeneral")
public class SgsMilitaryGeneralController {

    @Resource
    private SgsMilitaryGeneralService sgsMilitaryGeneralService;

    // 查询全部武将信息
    @GetMapping("/selectSgsMilitaryGeneralList")
    public Result<Page<SgsVO>> selectSgsMilitaryGeneralList(@RequestParam(defaultValue = "1") Long pageNum,
                                                            @RequestParam(defaultValue = "20") Long pageSize,
                                                            // 所有筛选条件自动封装进DTO
                                                            SgsGeneralQueryDTO sgsGeneralQueryDTO) {
        Long userId = UserContext.getUserId();
        // 构建分页对象
        Page<SgsVO> page = new Page<>(pageNum, pageSize);
        Page<SgsVO> sgsVOPage = sgsMilitaryGeneralService.selectSgsMilitaryGeneralList(page, userId, sgsGeneralQueryDTO);
        return Result.success(sgsVOPage);
    }
}
