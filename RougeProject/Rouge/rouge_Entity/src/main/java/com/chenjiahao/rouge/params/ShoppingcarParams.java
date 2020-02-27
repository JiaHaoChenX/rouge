package com.chenjiahao.rouge.params;


import com.chenjiahao.rouge.entity.Comdescribe;
import com.chenjiahao.rouge.entity.Commodity;

public class ShoppingcarParams {

    private long comid;
    private long comsizeid;
    private long comcolorid;
    private long scarcount;
    private double orderMoney;
    private String scarid;

    public ShoppingcarParams() {
    }


    public ShoppingcarParams(long comid, long comsizeid, long comcolorid, long scarcount) {
        this.comid = comid;
        this.comsizeid = comsizeid;
        this.comcolorid = comcolorid;
        this.scarcount = scarcount;
    }


    public ShoppingcarParams(long comid, long comsizeid, long comcolorid, long scarcount, double orderMoney) {
        this.comid = comid;
        this.comsizeid = comsizeid;
        this.comcolorid = comcolorid;
        this.scarcount = scarcount;
        this.orderMoney = orderMoney;
    }

    public ShoppingcarParams(long comid, long comsizeid, long comcolorid, long scarcount, double orderMoney, String shoppingid) {
        this.comid = comid;
        this.comsizeid = comsizeid;
        this.comcolorid = comcolorid;
        this.scarcount = scarcount;
        this.orderMoney = orderMoney;
        this.scarid = shoppingid;
    }

    public String getScarid() {
        return scarid;
    }

    public void setScarid(String scarid) {
        this.scarid = scarid;
    }

    public double getOrderMoney() {
        return orderMoney;
    }


    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }

    public long getComid() {
        return comid;
    }

    public void setComid(long comid) {
        this.comid = comid;
    }

    public long getComsizeid() {
        return comsizeid;
    }

    public void setComsizeid(long comsizeid) {
        this.comsizeid = comsizeid;
    }

    public long getComcolorid() {
        return comcolorid;
    }

    public void setComcolorid(long comcolorid) {
        this.comcolorid = comcolorid;
    }

    public long getScarcount() {
        return scarcount;
    }

    public void setScarcount(long scarcount) {
        this.scarcount = scarcount;
    }

    @Override
    public String toString() {
        return "ShoppingcarParams{" +
                "comid=" + comid +
                ", comsizeid=" + comsizeid +
                ", comcolorid=" + comcolorid +
                ", scarcount=" + scarcount +
                '}';
    }
}
