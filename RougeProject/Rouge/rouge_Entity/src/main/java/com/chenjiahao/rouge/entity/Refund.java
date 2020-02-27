package com.chenjiahao.rouge.entity;


import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.entity.User;

import java.sql.Timestamp;

public class Refund {

  private long refundid;
  private long orderid;
  private double refundMoney;
  private String refundRemark;
  private long refundstatic;
  private java.sql.Timestamp refundTime;
  private String refundMerchantRemark;
  private Order order;
  private User user;

  public Refund() {
  }
  public Refund(long orderid, double refundMoney, String refundRemark, long refundstatic, Timestamp refundTime, String refundMerchantRemark) {
    this.orderid = orderid;
    this.refundMoney = refundMoney;
    this.refundRemark = refundRemark;
    this.refundstatic = refundstatic;
    this.refundTime = refundTime;
    this.refundMerchantRemark = refundMerchantRemark;
  }

  public Order getOrder() {
    return order;
  }

  public void setOrder(Order order) {
    this.order = order;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public long getRefundid() {
    return refundid;
  }

  public void setRefundid(long refundid) {
    this.refundid = refundid;
  }


  public long getOrderid() {
    return orderid;
  }

  public void setOrderid(long orderid) {
    this.orderid = orderid;
  }


  public double getRefundMoney() {
    return refundMoney;
  }

  public void setRefundMoney(double refundMoney) {
    this.refundMoney = refundMoney;
  }


  public String getRefundRemark() {
    return refundRemark;
  }

  public void setRefundRemark(String refundRemark) {
    this.refundRemark = refundRemark;
  }


  public long getRefundstatic() {
    return refundstatic;
  }

  public void setRefundstatic(long refundstatic) {
    this.refundstatic = refundstatic;
  }


  public java.sql.Timestamp getRefundTime() {
    return refundTime;
  }

  public void setRefundTime(java.sql.Timestamp refundTime) {
    this.refundTime = refundTime;
  }


  public String getRefundMerchantRemark() {
    return refundMerchantRemark;
  }

  public void setRefundMerchantRemark(String refundMerchantRemark) {
    this.refundMerchantRemark = refundMerchantRemark;
  }

  @Override
  public String toString() {
    return "Refund{" +
            "refundid=" + refundid +
            ", orderid=" + orderid +
            ", refundMoney=" + refundMoney +
            ", refundRemark='" + refundRemark + '\'' +
            ", refundstatic=" + refundstatic +
            ", refundTime=" + refundTime +
            ", refundMerchantRemark='" + refundMerchantRemark + '\'' +
            ", order=" + order +
            ", user=" + user +
            '}';
  }
}
