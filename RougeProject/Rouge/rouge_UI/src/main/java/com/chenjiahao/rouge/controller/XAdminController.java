package com.chenjiahao.rouge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/xadmin")
public class XAdminController {
    @RequestMapping("index")
    public String index() {
        return "rouge_backstage/index";
    }

    @RequestMapping("admin-list")
    public String admin_list() {
        return "rouge_backstage/admin-list";
    }

    @RequestMapping("admin-add")
    public String admin_add() {
        return "rouge_backstage/admin-list";
    }

    @RequestMapping("admin-cate")
    public String admin_cate() {
        return "rouge_backstage/admin-cate";
    }

    @RequestMapping("cate")
    public String cate() {
        return "rouge_backstage/cate";
    }

    @RequestMapping("city")
    public String city() {
        return "rouge_backstage/city";
    }

    @RequestMapping("echarts1")
    public String echarts1() {
        return "rouge_backstage/echarts1";
    }

    @RequestMapping("echarts2")
    public String echarts2() {
        return "rouge_backstage/echarts2";
    }

    @RequestMapping("echarts3")
    public String echarts3() {
        return "rouge_backstage/echarts3";
    }

    @RequestMapping("echarts4")
    public String echarts4() {
        return "rouge_backstage/echarts4";
    }

    @RequestMapping("echarts5")
    public String echarts5() {
        return "rouge_backstage/echarts5";
    }

    @RequestMapping("echarts6")
    public String echarts6() {
        return "rouge_backstage/echarts6";
    }

    @RequestMapping("echarts7")
    public String echarts7() {
        return "rouge_backstage/echarts7";
    }

    @RequestMapping("echarts8")
    public String echarts8() {
        return "rouge_backstage/echarts8";
    }

    @RequestMapping("goods-add")
    public String goods_add() {
        return "rouge_backstage/goods-add";
    }

    @RequestMapping("member-del")
    public String member_del() {
        return "rouge_backstage/member-del";
    }

    @RequestMapping("member-edit")
    public String member_edit() {
        return "rouge_backstage/member-edit";
    }

    @RequestMapping("goods-list")
    public String goods_list() {
        return "rouge_backstage/goods-list";
    }

    @RequestMapping("member-password")
    public String member_password() {
        return "rouge_backstage/member-password";
    }

    @RequestMapping("order-add")
    public String order_add() {
        return "rouge_backstage/order-add";
    }

    @RequestMapping("order-list")
    public String order_list() {
        return "rouge_backstage/order-list";
    }

    @RequestMapping("role-add")
    public String role_add() {
        return "rouge_backstage/role-add";
    }

    @RequestMapping("unicode")
    public String unicode() {
        return "rouge_backstage/unicode";
    }


    @RequestMapping("welcome")
    public String welcome() {
        return "rouge_backstage/welcome";
    }

    @RequestMapping("rouge-backup")
    public String rouge_backup() {
        return "rouge_backstage/rouge-backup";
    }

}
