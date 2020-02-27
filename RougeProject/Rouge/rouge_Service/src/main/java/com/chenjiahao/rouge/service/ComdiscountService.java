package com.chenjiahao.rouge.service;


import com.chenjiahao.rouge.dao.IComdiscountDao;
import com.chenjiahao.rouge.entity.Comdiscount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品折扣的操作
 */
@Service
public class ComdiscountService implements IComdiscountService {

    @Autowired
    IComdiscountDao dao;

    /**
     * 获取所有打折的商品
     */
    public List<Comdiscount> getAllDiscount() {
        return dao.getAllDiscount();
    }

}
