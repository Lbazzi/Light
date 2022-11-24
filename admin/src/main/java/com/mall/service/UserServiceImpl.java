package com.mall.service;

import com.mall.mapper.UserMapper;
import com.mall.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    @Qualifier("userMapper")
    private UserMapper userMapper;

    @Override
    public User queryUserByUid(String uid) {
        return userMapper.queryUserByUid(uid);
    }

    @Override
    public List<User> queryAllUser(Map<String, Object> map) {
        return userMapper.queryAllUser(map);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUser(String uid) {
        return userMapper.deleteUser(uid);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int updateUserByPassword(String uid, String password) {
        return userMapper.updateUserByPassword(uid, password);
    }
}
