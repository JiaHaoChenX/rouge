package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Commoditytype;
import com.chenjiahao.rouge.params.CommodityParams;
import com.chenjiahao.rouge.service.ICommodityService;
import com.chenjiahao.rouge.service.ICommodityTypeService;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/rouge")
public class CommodityTypeController {

    @Autowired
    ICommodityTypeService dao;

    @RequestMapping("/getAllCommodityType")
    @ResponseBody
    public R getAllCommodityType() {
        R r = new R();
        List<Commoditytype> result = dao.getAllCommodityType();
        if (result.size() > 0) {
            r.put("count", result.size());
            return r.ok(result);
        }
        return r.error();
    }

}
