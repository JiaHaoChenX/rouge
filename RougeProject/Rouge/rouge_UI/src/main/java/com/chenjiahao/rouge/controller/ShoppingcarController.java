package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.dao.IShoppingcarDao;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.entity.Shoppingcar;
import com.chenjiahao.rouge.service.IShoppingcarService;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/rouge")
public class ShoppingcarController {

    @Autowired
    IShoppingcarService dao;

    @RequestMapping("/addShoppingcar")
    @ResponseBody
    public R addShoppingcar(String comid, ServletRequest servletRequest) {
        R r = new R();
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        if(session.getAttribute("aid")!=""&& session.getAttribute("aid")!=null) {
            String aid = session.getAttribute("aid").toString();
            Shoppingcar shoppingcar = new Shoppingcar(aid, Integer.parseInt(comid), 1, 1, 1);
            int result = dao.addShoppingcar(shoppingcar);
            if (result > 0) {
                return r.ok();
            }
        }
        return r.error();
    }


    @RequestMapping("/secrecy/getAllShoppingcar")
    @ResponseBody
    public R getAllShoppingcar(ServletRequest servletRequest) {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        String aid = session.getAttribute("aid").toString();
        System.out.println(aid);
        R r = new R();
        List<Shoppingcar> result = dao.getAllShoppingcar(new Shoppingcar(aid));
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getAllShoppingcarCount")
    @ResponseBody
    public R getAllShoppingcarCount(ServletRequest servletRequest) {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("aid"));
        R r = new R();
        if (session.getAttribute("aid") != "" && session.getAttribute("aid") != null) {
            String aid = session.getAttribute("aid").toString();
            List<Shoppingcar> result = dao.getAllShoppingcar(new Shoppingcar(aid));
            if (result.size() > 0) {
                r.put("count", result.size());
            } else {
                r.put("count", 0);
            }
            return r.ok(result);
        }
        r.put("count", 0);
        return r.error();
    }


    @RequestMapping("/secrecy/delsShoppingcar")
    @ResponseBody
    public R delsShoppingcar(@RequestBody List<String> scarids) {
        R r = new R();
        dao.delsShoppingcar(scarids);
        return r;
    }

    @RequestMapping("/secrecy/updateShoppingScarcount")
    @ResponseBody
    public R updateShoppingScarcount(Shoppingcar shoppingcar) {
        System.out.println("===========" + shoppingcar);
        R r = new R();
        int result = dao.updateShoppingScarcount(shoppingcar);
        if (result > 0) {
            return r.ok(result);
        }
        return r.error();
    }
}
