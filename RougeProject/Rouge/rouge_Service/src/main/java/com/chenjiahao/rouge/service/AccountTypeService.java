package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IAccountTypeDao;
import com.chenjiahao.rouge.entity.Accounttype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountTypeService implements IAccountTypeService {

    @Autowired
    IAccountTypeDao dao;

    public int addAccountType(Accounttype accounttype) {
        return dao.addAccountType(accounttype);
    }

    public List<Accounttype> getAllAccountType() {
        return dao.getAllAccountType();
    }

    public int delAccountType(List<Integer> atids) {
        return dao.delAccountType(atids);
    }
}
