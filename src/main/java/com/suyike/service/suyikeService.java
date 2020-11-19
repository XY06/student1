package com.suyike.service;

import com.suyike.bean.user;
import java.util.List;

public interface suyikeService {
    List list();

    void addUser(user user);

    user selectbyUser(String user);
}
