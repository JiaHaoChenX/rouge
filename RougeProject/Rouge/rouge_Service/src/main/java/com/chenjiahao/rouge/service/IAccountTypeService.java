package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.Accounttype;

import java.util.List;

public interface IAccountTypeService {
    //添加类型
    public int addAccountType(Accounttype accounttype);

    //查询类型
    public List<Accounttype> getAllAccountType();

    //删除类型
    public int delAccountType(List<Integer> atids);
}
