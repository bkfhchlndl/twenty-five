package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("card")
public class Card extends BaseEntity{

    // 用户id
    private Long userId;

    // 卡片标题
    private String title;

    // 跳转路径
    private String path;

    // 图片路径
    private String imagePath;

    // 排序
    private Integer sort;

    // 是否公共
    private Integer cardType;
}