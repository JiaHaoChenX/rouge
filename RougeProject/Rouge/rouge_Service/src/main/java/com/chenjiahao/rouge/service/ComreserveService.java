package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IComreserveDao;
import com.chenjiahao.rouge.entity.Comreserve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComreserveService implements IComreserveService {

    @Autowired
    IComreserveDao dao;

    public int addComreserve(Comreserve comreserves) {
        return dao.addComreserve(comreserves);
    }

    public double getComreserveCommodity(int orderid) {
        double money = 0;
        List<Comreserve> comreserves = dao.getComreserveCommodity(orderid);
        System.out.println(comreserves);
        return money;
    }

    public List<Comreserve> getGoodsByOrderid(int orderid) {
        return dao.getGoodsByOrderid(orderid);
    }

}
