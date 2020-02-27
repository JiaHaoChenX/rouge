package com.chenjiahao.rouge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class RougeController {
    @RequestMapping("/")
    public String index(HttpServletRequest request) {
        System.out.println("==============" + getIp(request));
        return "rouge_leadingend/index";
    }


    //获得用户ip地址
    public static String getIp(HttpServletRequest request) {
        String remoteAddr = request.getRemoteAddr();
        String forwarded = request.getHeader("X-Forwarded-For");
        String realIp = request.getHeader("X-Real-IP");

        String ip = null;
        if (realIp == null) {
            if (forwarded == null) {
                ip = remoteAddr;
            } else {
                ip = remoteAddr + "/" + forwarded;
            }
        } else {
            if (realIp.equals(forwarded)) {
                ip = realIp;
            } else {
                ip = realIp + "/" + forwarded.replaceAll(", " + realIp, "");
            }
        }
        return ip;
    }


    @RequestMapping("/esclogin")
    public String esclogin(ServletRequest servletRequest) {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        session.setAttribute("isLogin", "false");
        session.setAttribute("aid", "");
        return "rouge_leadingend/index";
    }
}
