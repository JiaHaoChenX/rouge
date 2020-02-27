package com.chenjiahao.rouge.params;

public class OrderParams {
    private long orderid;
    private long comstatic;
    private String sitename;
    private String sitepurchaseMin;
    private String sitepurchaseMax;
    private String siteprovince;
    private String sitecity;
    private String sitecounty;
    private String sitedetailed;
    private int pageNo;
    private int pageSize;

    public OrderParams() {
    }

    public OrderParams(long orderid, String sitename, String sitepurchaseMin, String sitepurchaseMax, String siteprovince, String sitecity, String sitecounty, String sitedetailed) {
        this.orderid = orderid;
        this.sitename = sitename;
        this.sitepurchaseMin = sitepurchaseMin;
        this.sitepurchaseMax = sitepurchaseMax;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
    }


    public OrderParams(long orderid, String sitename, String sitepurchaseMin, String sitepurchaseMax, String siteprovince, String sitecity, String sitecounty, String sitedetailed, int pageNo, int pageSize) {
        this.orderid = orderid;
        this.sitename = sitename;
        this.sitepurchaseMin = sitepurchaseMin;
        this.sitepurchaseMax = sitepurchaseMax;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public OrderParams(long orderid, long comstatic, String sitename, String sitepurchaseMin, String sitepurchaseMax, String siteprovince, String sitecity, String sitecounty, String sitedetailed) {
        this.orderid = orderid;
        this.comstatic = comstatic;
        this.sitename = sitename;
        this.sitepurchaseMin = sitepurchaseMin;
        this.sitepurchaseMax = sitepurchaseMax;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
    }

    public OrderParams(long orderid, long comstatic, String sitename, String sitepurchaseMin, String sitepurchaseMax, String siteprovince, String sitecity, String sitecounty, String sitedetailed, int pageNo, int pageSize) {
        this.orderid = orderid;
        this.comstatic = comstatic;
        this.sitename = sitename;
        this.sitepurchaseMin = sitepurchaseMin;
        this.sitepurchaseMax = sitepurchaseMax;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "OrderParams{" +
                "orderid=" + orderid +
                ", sitename='" + sitename + '\'' +
                ", sitepurchaseMin='" + sitepurchaseMin + '\'' +
                ", sitepurchaseMax='" + sitepurchaseMax + '\'' +
                ", siteprovince='" + siteprovince + '\'' +
                ", sitecity='" + sitecity + '\'' +
                ", sitecounty='" + sitecounty + '\'' +
                ", sitedetailed='" + sitedetailed + '\'' +
                ", pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                '}';
    }

    public long getComstatic() {
        return comstatic;
    }

    public void setComstatic(long comstatic) {
        this.comstatic = comstatic;
    }

    public long getOrderid() {
        return orderid;
    }

    public void setOrderid(long orderid) {
        this.orderid = orderid;
    }

    public String getSitename() {
        return sitename;
    }

    public void setSitename(String sitename) {
        this.sitename = sitename;
    }

    public String getSitepurchaseMin() {
        return sitepurchaseMin;
    }

    public void setSitepurchaseMin(String sitepurchaseMin) {
        this.sitepurchaseMin = sitepurchaseMin;
    }

    public String getSitepurchaseMax() {
        return sitepurchaseMax;
    }

    public void setSitepurchaseMax(String sitepurchaseMax) {
        this.sitepurchaseMax = sitepurchaseMax;
    }

    public String getSiteprovince() {
        return siteprovince;
    }

    public void setSiteprovince(String siteprovince) {
        this.siteprovince = siteprovince;
    }

    public String getSitecity() {
        return sitecity;
    }

    public void setSitecity(String sitecity) {
        this.sitecity = sitecity;
    }

    public String getSitecounty() {
        return sitecounty;
    }

    public void setSitecounty(String sitecounty) {
        this.sitecounty = sitecounty;
    }

    public String getSitedetailed() {
        return sitedetailed;
    }

    public void setSitedetailed(String sitedetailed) {
        this.sitedetailed = sitedetailed;
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
