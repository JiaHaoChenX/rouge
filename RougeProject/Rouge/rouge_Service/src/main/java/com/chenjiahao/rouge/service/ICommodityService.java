package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.params.CommodityParams;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICommodityService {
    //查询所有商品
    public List<Commodity> getAllCommodity(CommodityParams commodityParams);

    //添加商品
    public int addCommodity(Commodity commodity);

    //查询所有商品(页面渲染)
    public List<Commodity> getAllCommodityDetails(@Param("comid") String comid);

    //修改商品
    public int updateCommodity(Commodity commodity);

    //商品的分页
    public List<Commodity> getPageCommodity(CommodityParams commodityParams);

    //查询所有商品(页面渲染)
    public List<Commodity> getAllGoods(String comtid);

    //根据商品类型查询商品
    public List<Commodity> getGoodsByType(String comtid);
}
