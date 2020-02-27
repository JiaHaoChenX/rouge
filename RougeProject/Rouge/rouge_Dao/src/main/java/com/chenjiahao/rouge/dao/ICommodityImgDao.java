package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Commodityimg;

import java.util.List;

public interface ICommodityImgDao {
    //查询所有图片
    public List<Commodityimg> getAllCommodityimg(Commodityimg commodityimg);

    //添加图片
    public int addCommodityimg(Commodityimg commodityimg);

    //删除图片
    public int delCommodityimg(List<String> comiids);

    //删除图片 根据商品删除
    public int delComidCommodityimg(int comid);

}
