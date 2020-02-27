package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Comreserve;
import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.entity.Shoppingcar;
import com.chenjiahao.rouge.params.OrderParams;
import com.chenjiahao.rouge.params.ShoppingcarParams;
import com.chenjiahao.rouge.service.IComreserveService;
import com.chenjiahao.rouge.service.IOrderService;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rouge")
public class OrderController {
    @Autowired
    IOrderService dao;

    @Autowired
    IComreserveService ComreserveServiceDao;


    @Autowired
    IShoppingcarService ShoppingcarServiceDao;


    @RequestMapping("/getPageOrder")
    @ResponseBody
    public R getPageOrder(OrderParams orderParams) {
        R r = new R();
        List<Order> result = dao.getPageOrder(orderParams);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/secrecy/getAllClientOrder")
    @ResponseBody
    public R getAllClientOrder(Order order, ServletRequest servletRequest) {
        R r = new R();
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        if (session.getAttribute("aid") != "" && session.getAttribute("aid") != null) {
            order.setAid(session.getAttribute("aid") + "");
            List<Order> result = dao.getAllClientOrder(order);
            if (result.size() > 0) {
                r.put("count", result.size());
                return r.ok(result);
            }
        }
        return r.error();
    }

    @RequestMapping("/getAllOrder")
    @ResponseBody
    public R addAccount(OrderParams orderParams) {
        R r = new R();
        List<Order> result = dao.getAllOrder(orderParams);
        if (result.size() > 0) {
            r.put("count", result.size());
            return r.ok(result);
        }
        return r;
    }

    @RequestMapping("/secrecy/addOrder")
    @ResponseBody
    public R addOrder(@RequestBody List<ShoppingcarParams> shoppings, ServletRequest servletRequest) {
        R r = new R();
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        if (session.getAttribute("aid") != "" && session.getAttribute("aid") != null) {
            Order order = new Order(session.getAttribute("aid").toString(), 1, shoppings.get(0).getOrderMoney(), "");
            long result = dao.addOrder(order);
            if (result > 0) {
                List<Integer> resutlArr = new ArrayList<>();
                List<String> shoppingIds = new ArrayList<>();
                for (ShoppingcarParams shopping : shoppings) {
                    shoppingIds.add(shopping.getScarid());
                    System.out.println(shopping.getScarid() + "=======================");
                    Comreserve comreserve = new Comreserve(order.getOrderid(), shopping.getComid(), shopping.getScarcount(), shopping.getComcolorid());
                    resutlArr.add(ComreserveServiceDao.addComreserve(comreserve));
                }
                System.out.println("==================" + shoppingIds.size());
                ShoppingcarServiceDao.delsShoppingcar(shoppingIds);
                if (resutlArr.size() > 0) {
                    r.put("orderId", order.getOrderid());
                    return r.ok();
                }
            }
        }
        return r.error();
    }

    @RequestMapping("/secrecy/operation_ok")
    @ResponseBody
    public R operation_ok(Order order) {
        R r = new R();
        System.out.println(order);
        int result = dao.operation_ok(order);
        if (result > 0) {
            return r.ok();
        }
        return r.error();
    }


    @RequestMapping("/secrecy/updateCustomerOrder")
    @ResponseBody
    public R updateCustomerOrder(Order order, ServletRequest servletRequest) {
        R r = new R();
        System.out.println(order);
        int result = dao.updateCustomerOrder(order);
        System.out.println("=================" + result);
        if (result > 0) {
            return r.ok();

        }
        return r.error();
    }


    @RequestMapping("/getOrderByDate")
    @ResponseBody
    public R getOrderByDate(String date) {
        R r = new R();
        List<Order> result = dao.getOrderByDate(date);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }


    @RequestMapping("/secrecy/getGoodsByOrderid")
    @ResponseBody
    public R getGoodsByOrderid(int orderid, ServletRequest servletRequest) {
        R r = new R();
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        if (session.getAttribute("aid") != "" && session.getAttribute("aid") != null) {
            List<Comreserve> result = ComreserveServiceDao.getGoodsByOrderid(orderid);
            if (result.size() > 0) {
                for (Comreserve com : result) {
                    ShoppingcarServiceDao.addShoppingcar(new Shoppingcar(session.getAttribute("aid") + "", com.getComid(), 1, 1, com.getCrcount()));
                }
                int resultid = dao.updateCustomerOrder(new Order(orderid, 0, 0, 0, 0));
                if (resultid > 0) {
                    return r.ok();
                }
            }
        }
        return r.error();
    }


}
