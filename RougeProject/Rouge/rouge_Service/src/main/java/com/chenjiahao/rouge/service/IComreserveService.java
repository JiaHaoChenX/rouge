package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.Comreserve;

import java.util.List;

public interface IComreserveService {
    //添加商品到预订单表
    public  int addComreserve(Comreserve comreserves);

    //连接商品表查询
    public double getComreserveCommodity(int orderid);


    //根据订单编号查商品
    public List<Comreserve> getGoodsByOrderid(int orderid);
}


