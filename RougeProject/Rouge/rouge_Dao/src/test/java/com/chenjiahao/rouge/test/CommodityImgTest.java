package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.ICommodityDao;
import com.chenjiahao.rouge.dao.ICommodityImgDao;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Commodityimg;
import com.chenjiahao.rouge.params.CommodityParams;
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
public class CommodityImgTest {
    @Autowired
    ICommodityImgDao dao;

    @Test
    public void getAllCommodityimg() {
        System.out.println(dao.getAllCommodityimg(new Commodityimg(26)));
    }


    @Test
    public void addCommodityimg() {
        System.out.println(dao.addCommodityimg(new Commodityimg(1, "1.jpg")));
    }

    @Test
    public void delCommodityimg() {
        List<String> comiids = new ArrayList<String>();
        comiids.add("6");
        comiids.add("7");
        System.out.println(dao.delCommodityimg(comiids));
    }

    @Test
    public void delComidCommodityimg() {
        System.out.println(dao.delComidCommodityimg(26));
    }


}
