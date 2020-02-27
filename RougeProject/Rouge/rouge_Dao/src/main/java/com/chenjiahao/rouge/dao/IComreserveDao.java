package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Comreserve;

import java.util.List;

public interface IComreserveDao {
    //添加商品到预订单表
    public int addComreserve(Comreserve comreserves);

    //连接商品表查询
    public List<Comreserve> getComreserveCommodity(int orderid);

    //根据订单编号查商品
    public List<Comreserve> getGoodsByOrderid(int orderid);
}


