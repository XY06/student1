package com.suyike.service;

import com.suyike.bean.user;
import com.suyike.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class suyikeServiceImpl implements suyikeService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public List list() {
        return userMapper.list();
    }

    @Override
    public void addUser(user user) {
        userMapper.addUser(user);
    }

    @Override
    public user selectbyUser(String user) {
       return userMapper.selectbyUser(user);
    }
}
