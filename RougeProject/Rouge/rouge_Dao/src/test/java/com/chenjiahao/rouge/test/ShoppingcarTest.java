package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.ICommodityDao;
import com.chenjiahao.rouge.dao.IShoppingcarDao;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Shoppingcar;
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
public class ShoppingcarTest {

    @Autowired
    IShoppingcarDao dao;

    @Test
    public void addShoppingcar() {
        Shoppingcar shoppingcar = new Shoppingcar("niubihh", 1011,1,1, 1);
        System.out.println(dao.addShoppingcar(shoppingcar));
    }

    @Test
    public void getAllShoppingcar() {
        Shoppingcar shoppingcar = new Shoppingcar();
        shoppingcar.setAid("admin");
        System.out.println(dao.getAllShoppingcar(shoppingcar));
    }

    @Test
    public void delsShoppingcar() {
        List<String> ccarids = new ArrayList<String>();
        ccarids.add("1011");
        ccarids.add("1001");
        ccarids.add("1028");
        System.out.println(dao.delsShoppingcar(ccarids));
    }

    @Test
    public void getShoppingcarByScarids() {
        List<String> ccarids = new ArrayList<String>();
        ccarids.add("1011");
        ccarids.add("1001");
        ccarids.add("1028");
        System.out.println(dao.getShoppingcarByScarids(ccarids));
    }


    @Test
    public void updateShoppingScarcount() {

        System.out.println(dao.updateShoppingScarcount(new Shoppingcar(4,20)));
    }

}
