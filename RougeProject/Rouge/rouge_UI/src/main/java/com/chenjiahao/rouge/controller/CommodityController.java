package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.params.CommodityParams;
import com.chenjiahao.rouge.service.ICommodityService;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class CommodityController {

    @Autowired
    ICommodityService dao;

    @RequestMapping("/getAllCommodity")
    @ResponseBody
    public R getAllCommodity(CommodityParams commodityParams) {
        R r = new R();
        List<Commodity> result = dao.getAllCommodity(commodityParams);
        if (result.size() > 0) {
            r.put("count", result.size());
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getPageCommodity")
    @ResponseBody
    public R getPageCommodity(CommodityParams commodityParams) {
        R r = new R();
        List<Commodity> result = dao.getPageCommodity(commodityParams);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getAllGoods")
    @ResponseBody
    public R getAllGoods() {
        R r = new R();
        List<Commodity> result = dao.getAllGoods("0");
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getGoodsByType")
    @ResponseBody
    public R getGoodsByType(String comtid) {
        R r = new R();
        List<Commodity> result = dao.getGoodsByType(comtid);
        if (result.size() > 0) {
            r.put("count", result.size());
            return r.ok(result);
        }
        r.put("count", 0);
        return r.error();
    }

    @RequestMapping("/getAllCommodityDetails")
    @ResponseBody
    public R getAllCommodityDetails(String comid) {
        R r = new R();
        List<Commodity> result = dao.getAllCommodityDetails(comid);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/addCommodity")
    @ResponseBody
    public R addCommodity(Commodity commodity) {
        R r = new R();
        int result = dao.addCommodity(commodity);
        if (result > 0) {
            r.put("comid", commodity.getComid());
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/updateCommodity")
    @ResponseBody
    public R updateCommodity(Commodity commodity) {
        R r = new R();
        int result = dao.updateCommodity(commodity);
        if (result > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    //图片上传
    @RequestMapping(path = "/toleademp", method = RequestMethod.POST)
    @ResponseBody
    public R toleadEmp(MultipartFile file, HttpServletRequest request) throws IOException {
        //文件存放的位置
        String path = request.getServletContext().getRealPath("/goods_img");
        //文件上传的文件名称
        String fielOldName = file.getOriginalFilename();

        String fileNewName = UUID.randomUUID() + "." + fielOldName.split("\\.")[1];

        System.out.println("--------------------------");
        File tempFile = new File(path);
        if (!tempFile.exists()) {
            tempFile.mkdir();
        }
        String savePath = path + "/" + fileNewName;
        // 转存文件
        file.transferTo(new File(path, fileNewName));
//      file.transferTo(new File(savePath));
        System.out.println(savePath);
        R r = new R();
        r.put("code", 1);
        r.put("msg", "成功");
        r.put("data", null);
        r.put("src", fileNewName);
        return r;
    }
}
