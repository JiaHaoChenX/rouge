package com.chenjiahao.rouge.entity;


public class Commodityimg {

  private long comiid;
  private long comid;
  private String imgpath;


  public Commodityimg() {
  }

  public Commodityimg(long comid) {
    this.comid = comid;
  }

  public Commodityimg(long comid, String imgpath) {
    this.comid = comid;
    this.imgpath = imgpath;
  }

  public Commodityimg(long comiid, long comid, String imgpath) {
    this.comiid = comiid;
    this.comid = comid;
    this.imgpath = imgpath;
  }

  @Override
  public String toString() {
    return "Commodityimg{" +
            "comiid=" + comiid +
            ", comid=" + comid +
            ", imgpath='" + imgpath + '\'' +
            '}';
  }

  public long getComiid() {
    return comiid;
  }

  public void setComiid(long comiid) {
    this.comiid = comiid;
  }


  public long getComid() {
    return comid;
  }

  public void setComid(long comid) {
    this.comid = comid;
  }


  public String getImgpath() {
    return imgpath;
  }

  public void setImgpath(String imgpath) {
    this.imgpath = imgpath;
  }

}
