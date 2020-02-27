package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IUserDao;
import com.chenjiahao.rouge.entity.User;
import com.chenjiahao.rouge.params.UserParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements IUserService {

    @Autowired
    IUserDao dao;


    public int addUser(User user) {
        return dao.addUser(user);
    }

    public int updateUser(User user) {
        return dao.updateUser(user);
    }

    public List<User> getAllUesr(UserParams userParams) {
        return dao.getAllUesr(userParams);
    }

    public List<User> getPageUesr(UserParams userParams) {
        return dao.getPageUesr(userParams);
    }
}
