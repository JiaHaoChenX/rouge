package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Site;
import com.chenjiahao.rouge.service.ISiteService;
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
public class SiteController {
    @Autowired
    ISiteService dao;

    @RequestMapping("/secrecy/getSite")
    @ResponseBody
    public R getSite(ServletRequest servletRequest) {
        R r = new R();
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        if (session.getAttribute("aid") != "" && session.getAttribute("aid") != null) {
            String aid = session.getAttribute("aid").toString();
            System.out.println(aid);
            List<Site> result = dao.getSite(aid);
            if (result.size() > 0) {
                return r.ok(result);
            }

        }
        return r.error();
    }


}
