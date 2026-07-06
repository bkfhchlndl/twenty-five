package com.life.twentyfive.entity.vo;

import com.life.twentyfive.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

@Data
@EqualsAndHashCode(callSuper = true)
public class SgsVO extends BaseEntity {

    // 用户id
    private Long userId;

    // 武将姓名
    private String name;

    // 头像路径
    private String avatar;

    // 性别
    private String gender;

    // 阵营id
    private Integer campId;

    // 血量
    private String hp;

    // 武将品质
    private Integer typeId;

    // 获得时间
    private LocalDate getTime;

    // 星级
    private Integer starRating;

    // 斗地主评分
    private Integer ftlRating;

    // 军争场评分
    private Integer mcRating;

    // 包名id
    private Integer bagId;

    // 阵营名
    private String campName;

    // 品质名
    private String qualityName;

    // 包名
    private String bagName;

//    // 开始时间
//    LocalDate startTime;
//
//    // 结束时间
//    LocalDate endTime;
}