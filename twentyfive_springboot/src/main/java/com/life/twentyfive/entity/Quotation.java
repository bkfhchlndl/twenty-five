package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("quotation")
public class Quotation extends BaseEntity{

    // 评论内容
    private String statementContent;

    // 排序
    private Integer sort;

    // 是否置顶
    private Integer isTop;
}