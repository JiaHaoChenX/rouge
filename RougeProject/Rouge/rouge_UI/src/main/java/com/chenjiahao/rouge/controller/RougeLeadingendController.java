package com.chenjiahao.rouge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/leadingend")
public class RougeLeadingendController {
    @RequestMapping("/index")
    public String index() {
        return "rouge_leadingend/index";
    }

    @RequestMapping("/logon")
    public String logon() {
        return "rouge_leadingend/logon";
    }

    @RequestMapping("/login")
    public String login() {
        return "rouge_leadingend/login";
    }

    @RequestMapping("/secrecy/shoppingcar")
    public String shoppingcar() {
        return "rouge_leadingend/shoppingcar";
    }

    @RequestMapping("/secrecy/ContinueCheckingOut")
    public String ContinueCheckingOut() {
        return "rouge_leadingend/ContinueCheckingOut";
    }

    @RequestMapping("/secrecy/Order")
    public String Order() {
        return "rouge_leadingend/Order";
    }

    @RequestMapping("/productparticulars")
    public String productparticulars() {
        return "rouge_leadingend/productparticulars";
    }

    @RequestMapping("/secrecy/personal")
    public String personal() {
        return "rouge_leadingend/personal";
    }

    @RequestMapping("/userhome")
    public String userhome() {
        return "rouge_leadingend/userhome";
    }

    @RequestMapping("/comhome")
    public String comhome() {
        return "rouge_leadingend/comhome";
    }

    @RequestMapping("/commodity")
    public String commodity() {
        return "rouge_leadingend/commodity";
    }

}
