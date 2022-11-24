package com.mall.service;

import com.mall.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    int addUser(User user);

    User queryUserByUid(String uid);

    User queryUserByUphone(String uphone);

    int updateUser(User user);

    int updateUserByPassword(String uid, String password);

}
