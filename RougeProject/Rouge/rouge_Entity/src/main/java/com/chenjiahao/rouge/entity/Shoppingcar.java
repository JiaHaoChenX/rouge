package com.chenjiahao.rouge.entity;


public class Shoppingcar {

    private long scarid;
    private String aid;
    private long comid;
    private long comsizeid;
    private long comcolorid;
    private long scarcount;
    private Commodity commodity;
    private Comdescribe comdescribe;

    public Shoppingcar() {
    }

    public Shoppingcar(String aid) {
        this.aid = aid;
    }

    public Shoppingcar(long scarid, long scarcount) {
        this.scarid = scarid;
        this.scarcount = scarcount;
    }

    public Shoppingcar(String aid, long comid, long comsizeid, long comcolorid, long scarcount) {
        this.aid = aid;
        this.comid = comid;
        this.comsizeid = comsizeid;
        this.comcolorid = comcolorid;
        this.scarcount = scarcount;
    }

    public Shoppingcar(String aid, long comid, long scarcount) {
        this.aid = aid;
        this.comid = comid;
        this.scarcount = scarcount;
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

    public Shoppingcar(long scarid, String aid, long comid, long scarcount) {
        this.scarid = scarid;
        this.aid = aid;
        this.comid = comid;
        this.scarcount = scarcount;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Comdescribe getComdescribe() {
        return comdescribe;
    }

    public void setComdescribe(Comdescribe comdescribe) {
        this.comdescribe = comdescribe;
    }

    public long getScarid() {
        return scarid;
    }

    public void setScarid(long scarid) {
        this.scarid = scarid;
    }


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public long getComid() {
        return comid;
    }

    public void setComid(long comid) {
        this.comid = comid;
    }


    public long getScarcount() {
        return scarcount;
    }

    public void setScarcount(long scarcount) {
        this.scarcount = scarcount;
    }

    @Override
    public String toString() {
        return "Shoppingcar{" +
                "scarid=" + scarid +
                ", aid='" + aid + '\'' +
                ", comid=" + comid +
                ", scarcount=" + scarcount +
                ", commodity=" + commodity +
                ", comdescribe=" + comdescribe +
                '}';
    }
}
