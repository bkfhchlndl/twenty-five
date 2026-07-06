package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sgs_military_general")
public class SgsMilitaryGeneral extends BaseEntity {

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
}