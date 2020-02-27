package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IOrderDao;
import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.params.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService implements IOrderService {

    @Autowired
    IOrderDao dao;

    public List<Order> getAllOrder(OrderParams orderParmas) {
        return dao.getAllOrder(orderParmas);
    }

    public List<Order> getOrderByDate(String date) {
        return dao.getOrderByDate(date);
    }

    public List<Order> getAllClientOrder(Order order) {
        return dao.getAllClientOrder(order);
    }

    public int updateCustomerOrder(Order order) {
        return dao.updateCustomerOrder(order);
    }

    public Long addOrder(Order order) {
        return dao.addOrder(order);
    }

    public int updateOrder(Order order) {
        return 0;
    }

    public int operation_ok(Order order) {
        return dao.operation_ok(order);
    }

    public List<Order> getPageOrder(OrderParams orderParmas) {
        return dao.getPageOrder(orderParmas);
    }
}
