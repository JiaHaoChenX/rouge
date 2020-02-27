package com.chenjiahao.rouge.entity;


public class Collect {

    private long collectid;
    private String aid;
    private long comid;


    public Collect() {
    }

    public Collect(String aid, long comid) {
        this.aid = aid;
        this.comid = comid;
    }

    public Collect(long collectid, String aid, long comid) {
        this.collectid = collectid;
        this.aid = aid;
        this.comid = comid;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "collectid=" + collectid +
                ", aid='" + aid + '\'' +
                ", comid=" + comid +
                '}';
    }

    public long getCollectid() {
        return collectid;
    }

    public void setCollectid(long collectid) {
        this.collectid = collectid;
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

}
