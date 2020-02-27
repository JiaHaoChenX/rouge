package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Commodityimg;
import com.chenjiahao.rouge.params.CommodityParams;
import com.chenjiahao.rouge.service.ICommodityImgService;
import com.chenjiahao.rouge.service.ICommodityService;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/rouge")
public class CommodityImgController {

    @Autowired
    ICommodityImgService dao;

    @RequestMapping("/getAllCommodityimg")
    @ResponseBody
    public R getAllCommodityimg(Commodityimg commodityimg) {
        R r = new R();
        List<Commodityimg> result = dao.getAllCommodityimg(commodityimg);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }


    @RequestMapping("/addCommodityimg")
    @ResponseBody
    public R addCommodityimg(@RequestBody List<String> imgPaths) {
        R r = new R();
        int result = 0;
        for (int i = 0; i < imgPaths.size() - 1; i++) {
            result += dao.addCommodityimg(new Commodityimg(Integer.parseInt(imgPaths.get(imgPaths.size() - 1)), imgPaths.get(i)));
        }
        if (result > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/delCommodityimg")
    @ResponseBody
    public R delCommodityimg(Commodityimg commodityimg) {
        R r = new R();
        int result = dao.addCommodityimg(commodityimg);
        if (result > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/delComidCommodityimg")
    @ResponseBody
    public R delComidCommodityimg(int comid) {
        R r = new R();
        int result = dao.delComidCommodityimg(comid);
        if (result > 0) {
            return r.ok(result);
        }
        return r.error();
    }


}
