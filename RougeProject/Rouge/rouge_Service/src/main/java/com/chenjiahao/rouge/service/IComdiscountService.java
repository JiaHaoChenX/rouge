package com.chenjiahao.rouge.service;


import com.chenjiahao.rouge.entity.Comdiscount;

import java.util.List;

/**
 * 商品折扣的操作
 */
public interface IComdiscountService {

    /**
     * 获取所有打折的商品
     */
    List<Comdiscount> getAllDiscount();
}
