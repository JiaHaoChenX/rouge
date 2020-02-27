package com.chenjiahao.rouge.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.List;

public class Order {

    private long orderid;
    private String aid;
    private long siteid;
    private java.sql.Timestamp sitepurchase;
    private double orderMoney;
    private String orderRemark;
    private long comPending;
    private long comstatic;
    private long deliverStatic;
    private long receivablesStatic;
    private List<Comreserve> comreserves;
    private List<Commodity> commodity;
    private List<Comdescribe> comdescribe;
    private Site site;

    public Order() {
    }

    public Order(long orderid, long siteid, String orderRemark, long comstatic) {
        this.orderid = orderid;
        this.siteid = siteid;
        this.orderRemark = orderRemark;
        this.comstatic = comstatic;
    }

    public Order(long orderid, String aid, long comPending, long comstatic, long deliverStatic, long receivablesStatic) {
        this.orderid = orderid;
        this.aid = aid;
        this.comPending = comPending;
        this.comstatic = comstatic;
        this.deliverStatic = deliverStatic;
        this.receivablesStatic = receivablesStatic;
    }

    public Order(String aid, long siteid, double orderMoney, String orderRemark) {
        this.aid = aid;
        this.siteid = siteid;
        this.orderMoney = orderMoney;
        this.orderRemark = orderRemark;
    }

    public Order(String aid, long comPending, long comstatic, long deliverStatic, long receivablesStatic) {
        this.aid = aid;
        this.comPending = comPending;
        this.comstatic = comstatic;
        this.deliverStatic = deliverStatic;
        this.receivablesStatic = receivablesStatic;
    }

    public Order(long orderid, long comPending, long comstatic, long deliverStatic, long receivablesStatic) {
        this.orderid = orderid;
        this.comPending = comPending;
        this.comstatic = comstatic;
        this.deliverStatic = deliverStatic;
        this.receivablesStatic = receivablesStatic;
    }

    public List<Commodity> getCommodity() {
        return commodity;
    }

    public void setCommodity(List<Commodity> commodity) {
        this.commodity = commodity;
    }

    public List<Comdescribe> getComdescribe() {
        return comdescribe;
    }

    public void setComdescribe(List<Comdescribe> comdescribe) {
        this.comdescribe = comdescribe;
    }

    public List<Comreserve> getComreserves() {
        return comreserves;
    }

    public void setComreserves(List<Comreserve> comreserves) {
        this.comreserves = comreserves;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public long getOrderid() {
        return orderid;
    }

    public void setOrderid(long orderid) {
        this.orderid = orderid;
    }


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public long getSiteid() {
        return siteid;
    }

    public void setSiteid(long siteid) {
        this.siteid = siteid;
    }


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8",locale = "zh")
    public java.sql.Timestamp getSitepurchase() {
        return sitepurchase;
    }

    public void setSitepurchase(java.sql.Timestamp sitepurchase) {
        this.sitepurchase = sitepurchase;
    }


    public double getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }


    public String getOrderRemark() {
        return orderRemark;
    }

    public void setOrderRemark(String orderRemark) {
        this.orderRemark = orderRemark;
    }


    public long getComPending() {
        return comPending;
    }

    public void setComPending(long comPending) {
        this.comPending = comPending;
    }


    public long getComstatic() {
        return comstatic;
    }

    public void setComstatic(long comstatic) {
        this.comstatic = comstatic;
    }


    public long getDeliverStatic() {
        return deliverStatic;
    }

    public void setDeliverStatic(long deliverStatic) {
        this.deliverStatic = deliverStatic;
    }


    public long getReceivablesStatic() {
        return receivablesStatic;
    }

    public void setReceivablesStatic(long receivablesStatic) {
        this.receivablesStatic = receivablesStatic;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderid=" + orderid +
                ", aid='" + aid + '\'' +
                ", siteid=" + siteid +
                ", sitepurchase=" + sitepurchase +
                ", orderMoney=" + orderMoney +
                ", orderRemark='" + orderRemark + '\'' +
                ", comPending=" + comPending +
                ", comstatic=" + comstatic +
                ", deliverStatic=" + deliverStatic +
                ", receivablesStatic=" + receivablesStatic +
                ", comreserves=" + comreserves +
                ", commodity=" + commodity +
                ", comdescribe=" + comdescribe +
                ", site=" + site +
                '}';
    }
}
