package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IOrderDao;
import com.chenjiahao.rouge.dao.IShoppingcarDao;
import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.entity.Shoppingcar;
import com.chenjiahao.rouge.params.OrderParams;
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
public class OrderTest {

    @Autowired
    IOrderDao dao;

    @Test
    public void getAllOrder() {
        List<Order> result = dao.getAllOrder(new OrderParams(0, 1, "", "", "", "", "", "", ""));
        System.out.println(result);
    }

    @Test
    public void addOrder() {
        Order order = new Order("niubihh", 1, 1000, "加急");
        System.out.println("=====" + dao.addOrder(order));
        System.out.println(order.getOrderid());
    }

    @Test
    public void updateOrder() {
        Order order = new Order("niubihh", 1, 1000, "加急");
        System.out.println(dao.updateOrder(order));
    }

    @Test
    public void updateCustomerOrder() {
        Order order = new Order(80,0, 0, 0,0);
        System.out.println(dao.updateCustomerOrder(order));
    }



    @Test
    public void operation_ok() {
        Order order = new Order(76, 2, "麻烦快一点发货 挺急的", 1);
        System.out.println(dao.operation_ok(order));
    }

    @Test
    public void getPageOrder() {
        List<Order> result = dao.getPageOrder(new OrderParams(0, -1, "", "", "", "", "", "", "", 1, 2));
        System.out.println(result);
    }

    @Test
    public void getAllClientOrder() {
        System.out.println(dao.getAllClientOrder(new Order("niubihh", 1, 1, 1, 1))
        );
    }
    @Test
    public void getOrderByDate() {
        System.out.println(dao.getOrderByDate("2019-01-02"));
    }




}
