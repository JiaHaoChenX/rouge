package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.Shoppingcar;

import java.util.List;

public interface IShoppingcarService {
    //添加商品
    public int addShoppingcar(Shoppingcar shoppingcar);


    //修改商品数量
    public int updateShoppingScarcount(Shoppingcar shoppingcar);

    //查询购物车
    public List<Shoppingcar> getAllShoppingcar(Shoppingcar shoppingcar);

    //删除购物车中的商品(可以多删除)
    public int delsShoppingcar(List<String> scarids);
}
