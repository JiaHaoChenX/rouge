package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.*;
import com.chenjiahao.rouge.params.CommodityParams;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICommodityDao {
    //查询所有商品(后台管理)
    public List<Commodity> getAllCommodity(CommodityParams commodityParams);

    //查询所有商品(主页页面渲染)
    public List<Commodity> getAllGoods(@Param("comtid") String comtid);

    //根据商品id查询商品出售的数量
    public List<Integer> getGoodsCrcountByid(@Param("comid") String comid);

    //查询商品的详情
    public List<Commodity> getAllCommodityDetails(@Param("comid") String comid);

    //添加商品
    public int addCommodity(Commodity commodity);

    //修改商品
    public int updateCommodity(Commodity commodity);

    //商品的分页
    public List<Commodity> getPageCommodity(CommodityParams commodityParams);

}
