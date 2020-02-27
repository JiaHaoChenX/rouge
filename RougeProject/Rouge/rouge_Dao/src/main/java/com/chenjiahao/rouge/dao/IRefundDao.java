package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.entity.Refund;

import java.util.List;

public interface IRefundDao {
    //查询所有退款
    public List<Refund> getAllRefund();

    //申请退款
    public int addRefund(Refund refund);

    //处理退款
    public int updateRefund(Refund refund);


}
