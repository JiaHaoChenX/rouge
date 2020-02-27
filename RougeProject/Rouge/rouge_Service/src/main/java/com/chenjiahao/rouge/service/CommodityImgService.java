package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.ICommodityImgDao;
import com.chenjiahao.rouge.entity.Commodityimg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityImgService implements ICommodityImgService {

    @Autowired
    ICommodityImgDao dao;

    public List<Commodityimg> getAllCommodityimg(Commodityimg commodityimg) {
        return dao.getAllCommodityimg(commodityimg);
    }

    public int addCommodityimg(Commodityimg commodityimg) {
        return dao.addCommodityimg(commodityimg);
    }

    public int delCommodityimg(List<String> comiids) {
        return dao.delCommodityimg(comiids);
    }

    public int delComidCommodityimg(int comid) {
        return dao.delComidCommodityimg(comid);
    }
}
