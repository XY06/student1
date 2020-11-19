package com.suyike.mapper;

import com.suyike.bean.user;

import java.util.List;

public interface UserMapper {
    List list();

    void addUser(user user);

    user selectbyUser(String user);
}
