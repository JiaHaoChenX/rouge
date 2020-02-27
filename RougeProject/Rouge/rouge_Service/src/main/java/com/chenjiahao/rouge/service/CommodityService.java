package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.ICommodityDao;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.params.CommodityParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityService implements ICommodityService {
    @Autowired
    ICommodityDao dao;

    public List<Commodity> getAllCommodity(CommodityParams commodityParams) {
        return dao.getAllCommodity(commodityParams);
    }

    public int addCommodity(Commodity commodity) {
        return dao.addCommodity(commodity);
    }

    public List<Commodity> getAllCommodityDetails(String comid) {
        return dao.getAllCommodityDetails(comid);
    }

    public int updateCommodity(Commodity commodity) {
        return dao.updateCommodity(commodity);
    }

    public List<Commodity> getPageCommodity(CommodityParams commodityParams) {
        return dao.getPageCommodity(commodityParams);
    }

    public List<Commodity> getAllGoods(String comtid) {
        return dao.getAllGoods(comtid);
    }

    public List<Commodity> getGoodsByType(String comtid) {
        List<Commodity> result = dao.getAllGoods(comtid);
        for (Commodity commodity : result) {
            int count = 0;
            List<Integer> ListCount = dao.getGoodsCrcountByid(commodity.getComid() + "");
            for (Integer i : ListCount) {
                count += i;
            }
            commodity.setSalesvolumes(count);
        }
        return result;
    }
}



