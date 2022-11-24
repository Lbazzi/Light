package com.mall.mapper;

import com.mall.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    User queryUserByUid(@Param("uid") String uid);

    List<User> queryAllUser(Map<String, Object> map);

    int addUser(User user);

    int deleteUser(@Param("uid") String uid);

    int updateUser(User user);

    int updateUserByPassword(@Param("uid") String uid, @Param("upassword") String password);
}