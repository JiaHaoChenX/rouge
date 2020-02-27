package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.ISiteDao;
import com.chenjiahao.rouge.dao.IUserDao;
import com.chenjiahao.rouge.entity.Site;
import com.chenjiahao.rouge.entity.User;
import com.chenjiahao.rouge.params.UserParams;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

//指定bean注入的配置文件
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
//@TransactionConfiguration(defaultRollback = true)  //被弃用
//@Transactional
@Rollback(true)  //是否回滚
public class UserTest {
    @Autowired
    IUserDao dao;

    @Test
    public void addUser() {
        User user = new User("rose", "430000020020101", "rose", "rose@qq.com", "110120119", "rose.jpg");
        System.out.println(dao.addUser(user));
    }


    @Test
    public void updateUser() {
        User user = new User("rose", "00000000000000", "rose", "rose@qq.com", "110120119", "rose.jpg");
        System.out.println(dao.updateUser(user));
    }

    @Test
    public void geAlltUesr() {
        UserParams user = new UserParams("", 0, "", 1);
        System.out.println(dao.getAllUesr(user));
    }

    @Test
    public void getPageUesr() {
        UserParams user = new UserParams("", 0, "", 1,1,10);
        System.out.println(dao.getPageUesr(user));
    }

}
