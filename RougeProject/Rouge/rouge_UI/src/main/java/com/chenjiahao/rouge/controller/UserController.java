package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Accounttype;
import com.chenjiahao.rouge.entity.User;
import com.chenjiahao.rouge.params.UserParams;
import com.chenjiahao.rouge.service.IAccountService;
import com.chenjiahao.rouge.service.IAccountTypeService;
import com.chenjiahao.rouge.service.IUserService;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/rouge")
public class UserController {
    @Autowired
    IUserService dao;


    @RequestMapping("/getAllUser")
    @ResponseBody
    public R geAlltUser(UserParams userParams) {
        R r = new R();
        List<User> result = dao.getAllUesr(userParams);
        if (result.size() > 0) {
            r.put("count", result.size());
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getPageUesr")
    @ResponseBody
    public R getPageUesr(UserParams userParams) {

        R r = new R();
        List<User> result = dao.getPageUesr(userParams);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    //导出表格
    @RequestMapping("/deriveemp")
    @ResponseBody
    public void deriveEmp(HttpServletResponse response) throws IOException {
        response.setHeader("Content-Type", "application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=register.csv");
        PrintWriter out = response.getWriter();
        //BOM,excel打开乱码问题
        byte[] bomStrByteArr = new byte[]{(byte) 0xef, (byte) 0xbb, (byte) 0xbf};
        String bomStr = new String(bomStrByteArr, "UTF-8");
        out.write(bomStr);

        StringBuffer str = new StringBuffer("");

        str.append("登录名,姓名,手机,邮箱,身份证号码\r\n");
        List<User> result = dao.getAllUesr(new UserParams());
        for (User user : result) {
            str.append(user.getAid() + "," + user.getUname() + "," + user.getUphone()+ "," + user.getUmail()+ "," + user.getUidentityid()+ "\r\n");
        }
        response.getWriter().write(str.toString());
    }





}
