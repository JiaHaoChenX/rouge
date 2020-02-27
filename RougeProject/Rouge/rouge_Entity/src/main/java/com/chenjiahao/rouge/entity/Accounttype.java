package com.chenjiahao.rouge.entity;


public class Accounttype {

    private long atid;
    private String atname;


    public Accounttype() {
    }

    public Accounttype(String atname) {
        this.atname = atname;
    }

    public Accounttype(long atid, String atname) {
        this.atid = atid;
        this.atname = atname;
    }

    @Override
    public String toString() {
        return "Accounttype{" +
                "atid=" + atid +
                ", atname='" + atname + '\'' +
                '}';
    }

    public long getAtid() {
        return atid;
    }

    public void setAtid(long atid) {
        this.atid = atid;
    }


    public String getAtname() {
        return atname;
    }

    public void setAtname(String atname) {
        this.atname = atname;
    }

}
