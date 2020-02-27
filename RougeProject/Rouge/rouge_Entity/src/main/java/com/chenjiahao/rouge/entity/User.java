package com.chenjiahao.rouge.entity;


public class User {

    private long uid;
    private String aid;
    private String uidentityid;
    private String uname;
    private String umail;
    private String uphone;
    private String uportrait;
    private Account account;
    private Accounttype accounttype;
    public User() {}

    public User(String aid, String uidentityid, String uname, String umail, String uphone, String uportrait) {
        this.aid = aid;
        this.uidentityid = uidentityid;
        this.uname = uname;
        this.umail = umail;
        this.uphone = uphone;
        this.uportrait = uportrait;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", aid='" + aid + '\'' +
                ", uidentityid='" + uidentityid + '\'' +
                ", uname='" + uname + '\'' +
                ", umail='" + umail + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uportrait='" + uportrait + '\'' +
                ", account=" + account +
                ", accounttype=" + accounttype +
                '}';
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Accounttype getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(Accounttype accounttype) {
        this.accounttype = accounttype;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public String getUidentityid() {
        return uidentityid;
    }

    public void setUidentityid(String uidentityid) {
        this.uidentityid = uidentityid;
    }


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }


    public String getUmail() {
        return umail;
    }

    public void setUmail(String umail) {
        this.umail = umail;
    }


    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }


    public String getUportrait() {
        return uportrait;
    }

    public void setUportrait(String uportrait) {
        this.uportrait = uportrait;
    }

}
