package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sgs_bag")
public class SgsBag extends BaseEntity {

    // 包名
    private String name;
}