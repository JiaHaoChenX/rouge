package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Accounttype;
import com.chenjiahao.rouge.service.IAccountService;
import com.chenjiahao.rouge.service.IAccountTypeService;
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
public class AccountTypeController {

    @Autowired
    IAccountTypeService dao;

    @RequestMapping("/getAllAccountType")
    @ResponseBody
    public R getAllAccountType() {
        R r = new R();
        List<Accounttype> result = dao.getAllAccountType();
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }
}
