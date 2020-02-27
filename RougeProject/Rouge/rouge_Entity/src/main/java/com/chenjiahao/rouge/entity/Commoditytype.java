package com.chenjiahao.rouge.entity;



public class Commoditytype {

  private long comtid;
  private String comtname;

  public Commoditytype() {
  }

  public Commoditytype(String comtname) {
    this.comtname = comtname;
  }

  public Commoditytype(long comtid, String comtname) {
    this.comtid = comtid;
    this.comtname = comtname;
  }

  @Override
  public String toString() {
    return "Commoditytype{" +
            "comtid=" + comtid +
            ", comtname='" + comtname + '\'' +
            '}';
  }

  public long getComtid() {
    return comtid;
  }

  public void setComtid(long comtid) {
    this.comtid = comtid;
  }


  public String getComtname() {
    return comtname;
  }

  public void setComtname(String comtname) {
    this.comtname = comtname;
  }

}
