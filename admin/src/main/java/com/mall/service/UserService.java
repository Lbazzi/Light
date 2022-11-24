package com.mall.service;

import com.mall.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {

    User queryUserByUid(String uid);

    List<User> queryAllUser(Map<String, Object> map);

    int addUser(User user);

    int deleteUser(String uid);

    int updateUser(User user);

    int updateUserByPassword(String uid, String password);
}
