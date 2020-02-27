package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IShoppingcarDao;
import com.chenjiahao.rouge.entity.Shoppingcar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingcarService implements IShoppingcarService {

    @Autowired
    IShoppingcarDao dao;


    public int addShoppingcar(Shoppingcar shoppingcar) {
        return dao.addShoppingcar(shoppingcar);
    }

    public int updateShoppingScarcount(Shoppingcar shoppingcar) {
        return dao.updateShoppingScarcount(shoppingcar);
    }

    public List<Shoppingcar> getAllShoppingcar(Shoppingcar shoppingcar) {
        return dao.getAllShoppingcar(shoppingcar);
    }

    public int delsShoppingcar(List<String> scarids) {
        return dao.delsShoppingcar(scarids);
    }
}
