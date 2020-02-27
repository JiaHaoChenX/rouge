package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IAccountDao;
import com.chenjiahao.rouge.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService implements IAccountService{

    @Autowired
    IAccountDao accountDao;

    public int addAccount(Account account) {
        return accountDao.addAccount(account);
    }

    public List<Account> isLoginAccount(Account account) {
        return accountDao.isLoginAccount(account);
    }

    public int updateAccountAtid(Account account) {
        return accountDao.updateAccountAtid(account);
    }

    public List<Account> getAccount() {
        return accountDao.getAllAccount();
    }
}
