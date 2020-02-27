package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.service.IAccountService;
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
@RequestMapping("/login")
public class AccountController {
    @Autowired
    IAccountService dao;

    /**
     * t注册账号
     */
    @RequestMapping("/addAccount")
    @ResponseBody
    public R addAccount(Account account) {
        R r = new R();
        if (dao.addAccount(account) > 0) {
            r.ok("注册成功!");
        }
        return r.error("注册失败!");
    }


    /**
     * 判断用户是否登录成功
     */
    @RequestMapping("/isLoginAccount")
    @ResponseBody
    public R isLoginAccount(Account account, ServletRequest servletRequest) {
        R r = new R();
        List<Account> result = dao.isLoginAccount(account);
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        if (result.size() > 0) {
            session.setAttribute("isLogin", "ture");
            session.setAttribute("aid", account.getAid());
            return r.ok("登录成功!!", result);
        }
        session.setAttribute("aid", "");
        return r.error("登录失败!");
    }
    

    /**
     * 修改用户的账号类型
     */
    @RequestMapping("/updateAccountAtid")
    @ResponseBody
    public R updateAccountAtid(Account account) {
        R r = new R();
        if (dao.updateAccountAtid(account) > 0) {
            return r.ok("修改成功!");
        }
        return r.error("修改失败!");
    }

    /**
     * 查询所有用户的信息
     */
    @RequestMapping("/getAccount")
    @ResponseBody
    public R getAccount() {
        R r = new R();
        List<Account> result = dao.getAccount();
        if (result.size() > 0) {
            r.ok("成功!", result);
        }
        return r.error("失败!");
    }
}
