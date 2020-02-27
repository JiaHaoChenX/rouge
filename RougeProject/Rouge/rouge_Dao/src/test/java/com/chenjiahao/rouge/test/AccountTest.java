package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IAccountDao;
import com.chenjiahao.rouge.entity.Account;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//指定bean注入的配置文件
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
//@TransactionConfiguration(defaultRollback = true)  //被弃用
//@Transactional
@Rollback(true)  //是否回滚
public class AccountTest {
    @Autowired
    IAccountDao dao;

    @Test
    public void addAccount() {
        Account account=new Account("jack","123456789",1,0);
        System.out.println(dao.addAccount(account));
    }

    @Test
    public void isLoginAccount() {
        Account account=new Account("admin","admin",2,0);
        System.out.println(dao.isLoginAccount(account));
    }

    @Test
    public void updateAccountAtid() {
        Account account=new Account("e","",2,1);
        System.out.println(dao.updateAccountAtid(account));
    }

    @Test
    public void getAllAccount() {
        System.out.println(dao.getAllAccount().size());
    }
}
