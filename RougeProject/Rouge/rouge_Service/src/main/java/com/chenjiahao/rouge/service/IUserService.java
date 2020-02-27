package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.User;
import com.chenjiahao.rouge.params.UserParams;

import java.util.List;

public interface IUserService {
    //添加信息
    public int addUser(User user);

    //修改信息
    public int updateUser(User user);

    //查询用户信息
    public List<User> getAllUesr(UserParams userParams);

    public List<User> getPageUesr(UserParams userParams);
}
