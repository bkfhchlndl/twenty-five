package com.life.twentyfive.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.life.twentyfive.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {

}
