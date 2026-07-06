package com.life.twentyfive.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sgs_information")
public class SgsInformation extends BaseEntity{

    // 用户id
    private Long userId;

    // 用户官阶
    private String officialRank;

    // 昵称
    private String nickname;

    // VIP 等级
    private String vipLevel;

    // 头像路径
    private String avatar;
}
