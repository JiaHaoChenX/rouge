package com.chenjiahao.rouge.params;


import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Accounttype;

public class UserParams {

    private String aid;
    private long atid;
    private String uname;
    private long astatic;
    private int pageNo;
    private int pageSize;

    public UserParams() {
    }

    public UserParams(String aid, long atid, String uname, long astatic) {
        this.aid = aid;
        this.atid = atid;
        this.uname = uname;
        this.astatic = astatic;
    }

    public UserParams(String aid, long atid, String uname, long astatic, int pageNo, int pageSize) {
        this.aid = aid;
        this.atid = atid;
        this.uname = uname;
        this.astatic = astatic;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "UserParams{" +
                "aid='" + aid + '\'' +
                ", atid=" + atid +
                ", uname='" + uname + '\'' +
                ", astatic=" + astatic +
                ", pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                '}';
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public long getAtid() {
        return atid;
    }

    public void setAtid(long atid) {
        this.atid = atid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public long getAstatic() {
        return astatic;
    }

    public void setAstatic(long astatic) {
        this.astatic = astatic;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
