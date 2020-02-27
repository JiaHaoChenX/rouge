package com.chenjiahao.rouge.entity;


public class Comreserve {

  private long crid;
  private long orderid;
  private long comid;
  private long crcount;
  private long comcolorid;
  private long comsizeid;


  public Comreserve() {
  }

  public Comreserve(long orderid, long comid, long crcount, long comcolorid) {
    this.orderid = orderid;
    this.comid = comid;
    this.crcount = crcount;
    this.comcolorid = comcolorid;
  }

  public Comreserve(long orderid, long comid, long crcount, long comcolorid, long comsizeid) {
    this.orderid = orderid;
    this.comid = comid;
    this.crcount = crcount;
    this.comcolorid = comcolorid;
    this.comsizeid = comsizeid;
  }

  public Comreserve(long crid, long orderid, long comid, long crcount, long comcolorid, long comsizeid) {
    this.crid = crid;
    this.orderid = orderid;
    this.comid = comid;
    this.crcount = crcount;
    this.comcolorid = comcolorid;
    this.comsizeid = comsizeid;
  }

  public long getCrid() {
    return crid;
  }

  public void setCrid(long crid) {
    this.crid = crid;
  }


  public long getOrderid() {
    return orderid;
  }

  public void setOrderid(long orderid) {
    this.orderid = orderid;
  }


  public long getComid() {
    return comid;
  }

  public void setComid(long comid) {
    this.comid = comid;
  }


  public long getCrcount() {
    return crcount;
  }

  public void setCrcount(long crcount) {
    this.crcount = crcount;
  }


  public long getComcolorid() {
    return comcolorid;
  }

  public void setComcolorid(long comcolorid) {
    this.comcolorid = comcolorid;
  }


  public long getComsizeid() {
    return comsizeid;
  }

  public void setComsizeid(long comsizeid) {
    this.comsizeid = comsizeid;
  }

  @Override
  public String toString() {
    return "Comreserve{" +
            "crid=" + crid +
            ", orderid=" + orderid +
            ", comid=" + comid +
            ", crcount=" + crcount +
            ", comcolorid=" + comcolorid +
            ", comsizeid=" + comsizeid +
            '}';
  }
}
