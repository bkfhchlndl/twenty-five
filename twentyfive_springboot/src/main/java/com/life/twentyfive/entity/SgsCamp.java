package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sgs_camp")
public class SgsCamp extends BaseEntity {

    // 阵营名
    private String name;
}