package com.life.twentyfive.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.life.twentyfive.entity.SgsMilitaryGeneral;
import com.life.twentyfive.entity.dto.SgsGeneralQueryDTO;
import com.life.twentyfive.entity.vo.SgsVO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;


public interface SgsMilitaryGeneralService extends IService<SgsMilitaryGeneral> {

    // 查询全部武将信息
    Page<SgsVO> selectSgsMilitaryGeneralList(Page<SgsVO> page,
                                             Long userId,
                                             SgsGeneralQueryDTO sgsGeneralQueryDTO);
}
