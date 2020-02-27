package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IComreserveDao;
import com.chenjiahao.rouge.dao.IShoppingcarDao;
import com.chenjiahao.rouge.entity.Comreserve;
import com.chenjiahao.rouge.entity.Shoppingcar;
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
public class ComreserveTest {

    @Autowired
    IComreserveDao dao;

    @Test
    public void addComreserve() {
        Comreserve comreserve = new Comreserve(1,1000, 1, 1);
        System.out.println(dao.addComreserve(comreserve));
    }

    @Test
    public void getComreserveCommodity() {

    }
    @Test
    public void getGoodsByOrderid() {
        System.out.println(dao.getGoodsByOrderid(97));
    }

}
