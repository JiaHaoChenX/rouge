package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IAccountDao;
import com.chenjiahao.rouge.dao.ICommodityDao;
import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.params.CommodityParams;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.aop.target.LazyInitTargetSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;

//指定bean注入的配置文件
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
//@TransactionConfiguration(defaultRollback = true)  //被弃用
//@Transactional
@Rollback(true)  //是否回滚
public class CommodityTest {
    @Autowired
    ICommodityDao dao;

    @Test
    public void getAllCommodity() {
        CommodityParams commodityParams = new CommodityParams(1, "", 0, -1, 0, 0);
//        commodityParams.setComname("");
//        commodityParams.setCompriceMin(100);
//        commodityParams.setCompriceMax(700);
//        System.out.println(commodityParams);
        System.out.println(dao.getAllCommodity(commodityParams).size());
    }

    @Test
    public void addCommodity() {
        Commodity commodity = new Commodity("魅力", 1, 260.5, "全新魅惑釉唇膏", 0, 12);
        dao.addCommodity(commodity);
        System.out.println(commodity.getComid());
    }

    @Test
    public void getAllGoods() {
        List<Commodity> result = dao.getAllGoods("1");
        for (Commodity commodity : result) {
            int count = 0;
            List<Integer> ListCount = dao.getGoodsCrcountByid(commodity.getComid() + "");
            for (Integer i : ListCount) {
                count += i;
            }
            commodity.setSalesvolumes(count);
        }
        System.out.println(result.get(0));
    }

    @Test
    public void getAllCommodityDetails() {
        System.out.println(dao.getAllCommodityDetails("1000").get(0));
        System.out.println(dao.getAllCommodityDetails("1000").size());
    }

    @Test
    public void getPageCommodity() {
        CommodityParams commodityParams = new CommodityParams("", 0, -1, 0, 0, 1, 3);
        System.out.println(dao.getPageCommodity(commodityParams));
    }


    @Test
    public void updateCommodity() {
        Commodity commodity = new Commodity(1, "牛逼", 1, 20.5, "优秀", 1, 10);
        System.out.println(dao.updateCommodity(commodity));
    }

    @Test
    public void getGoodsCrcountByid() {
        System.out.println(dao.getGoodsCrcountByid("1000").size());
    }


}
