package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.User;
import com.chenjiahao.rouge.params.UserParams;

import java.util.List;

public interface IUserDao {
    //添加信息
    public int addUser(User user);

    //修改信息
    public int updateUser(User user);

    //查询用户信息
    public List<User> getAllUesr(UserParams userParams);

    //查询用户信息分页
    public List<User> getPageUesr(UserParams userParams);
}
