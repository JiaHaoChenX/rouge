package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.params.OrderParams;

import java.util.List;

public interface IOrderDao {

    //所有订单
    public List<Order> getAllOrder(OrderParams orderParam);

    //根据时间查询当天所出售的商品
    public List<Order> getOrderByDate(String date);

    //客户端订单管理
    public List<Order> getAllClientOrder(Order order);

    //生成订单并返回主键
    public Long addOrder(Order order);

    //修改订单
    public int updateOrder(Order order);

    //下单成功时 修改订单
    public int operation_ok(Order order);


    //客户订单管理
    public int updateCustomerOrder(Order order);

    public List<Order> getPageOrder(OrderParams orderParmas);
}
