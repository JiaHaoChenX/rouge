package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.Account;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IAccountService {
    //注册用户
    public int addAccount(Account account);

    //判断用户是否登录成功
    public  List<Account> isLoginAccount(Account account);

    //修改用户的类型
    public int updateAccountAtid(Account account);

    //查询所有的用户
    public List<Account> getAccount();
}
