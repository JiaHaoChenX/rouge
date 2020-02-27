package com.chenjiahao.rouge.dao;


import com.chenjiahao.rouge.entity.Comdiscount;

import java.util.List;

/**
 * 商品折扣的操作
 */
public interface IComdiscountDao {

    /**
     * 获取所有打折的商品
     */
    List<Comdiscount> getAllDiscount();
}
