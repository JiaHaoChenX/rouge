package com.chenjiahao.rouge.entity;

public class Account {

    private String aid;
    private String apassword;
    private long atid;
    private long astatic;
    private String atname;

    private Accounttype accounttype;



    public Account() {
    }

    public Account(String aid, String apassword, long atid, long astatic) {
        this.aid = aid;
        this.apassword = apassword;
        this.atid = atid;
        this.astatic = astatic;
    }

    public Account(String aid, String apassword, long atid, long astatic, String atname, Accounttype accounttype) {
        this.aid = aid;
        this.apassword = apassword;
        this.atid = atid;
        this.astatic = astatic;
        this.atname = atname;
        this.accounttype = accounttype;
    }

    @Override
    public String toString() {
        return "Account{" +
                "aid='" + aid + '\'' +
                ", apassword='" + apassword + '\'' +
                ", atid=" + atid +
                ", astatic=" + astatic +
                ", atname='" + atname + '\'' +
                ", accounttype=" + accounttype +
                '}';
    }

    public Accounttype getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(Accounttype accounttype) {
        this.accounttype = accounttype;
    }

    public String getAtname() {
        return atname;
    }

    public void setAtname(String atname) {
        this.atname = atname;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }


    public long getAtid() {
        return atid;
    }

    public void setAtid(long atid) {
        this.atid = atid;
    }

    public long getAstatic() {
        return astatic;
    }

    public void setAstatic(long astatic) {
        this.astatic = astatic;
    }

}
