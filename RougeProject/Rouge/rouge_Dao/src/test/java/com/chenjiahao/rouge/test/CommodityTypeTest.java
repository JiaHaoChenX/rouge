package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IAccountTypeDao;
import com.chenjiahao.rouge.dao.ICommodityTypeDao;
import com.chenjiahao.rouge.entity.Accounttype;
import com.chenjiahao.rouge.entity.Commoditytype;
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
public class CommodityTypeTest {
    @Autowired
    ICommodityTypeDao dao;

    @Test
    public void addCommodityType() {

        Commoditytype commoditytype=new Commoditytype("牛逼");
        System.out.println(dao.addCommodityType(commoditytype));
    }

    @Test
    public void getAllAccountType() {

        System.out.println(dao.getAllCommodityType());
    }

    @Test
    public void delAccountType() {
        List<Integer> atids = new ArrayList<Integer>();
        atids.add(7);
        atids.add(6);
        System.out.println(dao.delCommodityType(atids));
    }
}
