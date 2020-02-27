package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IRefundDao;
import com.chenjiahao.rouge.entity.Refund;
import com.chenjiahao.rouge.entity.User;
import com.chenjiahao.rouge.params.UserParams;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

//指定bean注入的配置文件
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
//@TransactionConfiguration(defaultRollback = true)  //被弃用
//@Transactional
@Rollback(true)  //是否回滚
public class RefundTest {
    @Autowired
    IRefundDao dao;

    @Test
    public void getAllRefund() {
        System.out.println(dao.getAllRefund());
    }


    @Test
    public void addRefund() {
        System.out.println(dao.addRefund(new Refund(3,100,"发货太慢退钱",0,new Timestamp(2018),"")));
    }

    @Test
    public void updateRefund() {
        System.out.println(dao.updateRefund(new Refund(3,100,"发货太慢退钱",1,new Timestamp(2018),"退了 急个毛线")));

    }

}
