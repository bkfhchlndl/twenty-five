package com.life.twentyfive.entity.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class SgsGeneralQueryDTO {

    // 武将姓名
    private String name;

    // 性别
    private String gender;

    // 阵营id
    private Integer campId;

    // 血量
    private String hp;

    // 武将品质
    private Integer typeId;

    // 星级
    private Integer starRating;

    // 斗地主评分
    private Integer ftlRating;

    // 军争场评分
    private Integer mcRating;

    // 包名id
    private Integer bagId;

    // 开始时间
    LocalDate startTime;

    // 结束时间
    LocalDate endTime;
}
