package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Comdiscount;
import com.chenjiahao.rouge.service.IAccountService;
import com.chenjiahao.rouge.service.IComdiscountService;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/rouge")
public class ComdiscountController {
    @Autowired
    IComdiscountService dao;

    /**
     * 获取所有打折的商品
     */
    @RequestMapping("/getAllDiscount")
    @ResponseBody
    public R getAllDiscount() {
        R r = new R();
        List<Comdiscount> result = dao.getAllDiscount();
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error("没有打折商品！");
    }
}
