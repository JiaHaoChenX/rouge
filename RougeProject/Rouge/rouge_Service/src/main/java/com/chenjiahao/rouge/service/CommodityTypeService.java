package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.ICommodityTypeDao;
import com.chenjiahao.rouge.entity.Accounttype;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Commoditytype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityTypeService implements ICommodityTypeService {

    @Autowired
    ICommodityTypeDao dao;

    public int addCommodityType(Commoditytype commoditytype) {
        return dao.addCommodityType(commoditytype);
    }

    public List<Commoditytype> getAllCommodityType() {
        return dao.getAllCommodityType();
    }

    public int delCommodityType(List<Integer> atids) {
        return dao.delCommodityType(atids);
    }
}
