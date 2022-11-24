package com.mall.mapper;

import com.mall.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    //增加用户记录
    int addUser(User user);

    //根据用户id查找用户
    User queryUserByUid(@Param("uid") String uid);

    User queryUserByUphone(@Param("uphone") String uphone);

    //更新用户信息
    int updateUser(User user);

    int updateUserByPassword(@Param("uid") String uid, @Param("upassword") String password);
}