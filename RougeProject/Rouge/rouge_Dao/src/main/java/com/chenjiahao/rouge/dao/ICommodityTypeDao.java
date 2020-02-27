package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Accounttype;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Commoditytype;

import java.util.List;

public interface ICommodityTypeDao {
    //添加类型
    public int addCommodityType(Commoditytype commoditytype);

    //查询类型
    public List<Commoditytype> getAllCommodityType();

    //删除类型
    public int delCommodityType(List<Integer> atids);
}
