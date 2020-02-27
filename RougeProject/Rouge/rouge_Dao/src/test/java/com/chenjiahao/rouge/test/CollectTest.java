package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.ICollectDao;
import com.chenjiahao.rouge.dao.IUserDao;
import com.chenjiahao.rouge.entity.Collect;
import com.chenjiahao.rouge.entity.User;
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
public class CollectTest {
    @Autowired
    ICollectDao dao;

    @Test
    public void addCollec() {
        Collect collect=new Collect("admin",1);
         System.out.println(dao.addCollec(collect));
    }


    @Test
    public void getAllCollec() {
        System.out.println(dao.getAllCollec());
    }


    @Test
    public void delComment() {
        List<Integer> list=new ArrayList<Integer>();
        list.add(5);
        list.add(6);
        System.out.println(dao.delCollec(list));
    }

}
