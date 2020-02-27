package com.chenjiahao.rouge.params;

public class CommodityParams {
    private long comid;
    private String comname;
    private long comtid;
    private double comprice;
    private String comproduce;
    private long comstatic;
    private long cominventory;
    private String comtname;
    private double compriceMin;
    private double compriceMax;
    private int pageNo;
    private int pageSize;

    public CommodityParams() {

    }

    public CommodityParams(long comid) {
        this.comid = comid;
    }

    public CommodityParams(String comname, long comtid, long comstatic, double compriceMin, double compriceMax) {
        this.comname = comname;
        this.comtid = comtid;
        this.comstatic = comstatic;
        this.compriceMin = compriceMin;
        this.compriceMax = compriceMax;
    }
    public CommodityParams(long comid,String comname, long comtid, long comstatic, double compriceMin, double compriceMax) {
        this.comid=comid;
        this.comname = comname;
        this.comtid = comtid;
        this.comstatic = comstatic;
        this.compriceMin = compriceMin;
        this.compriceMax = compriceMax;
    }

    public CommodityParams(String comname, long comtid, long comstatic, double compriceMin, double compriceMax,int pageNo,int pageSize) {
        this.comname = comname;
        this.comtid = comtid;
        this.comstatic = comstatic;
        this.compriceMin = compriceMin;
        this.compriceMax = compriceMax;
        this.pageNo=pageNo;
        this.pageSize=pageSize;
    }
    public long getComid() {
        return comid;
    }

    public void setComid(long comid) {
        this.comid = comid;
    }

    public String getComname() {
        return comname;
    }

    public void setComname(String comname) {
        this.comname = comname;
    }

    public long getComtid() {
        return comtid;
    }

    public void setComtid(long comtid) {
        this.comtid = comtid;
    }

    public double getComprice() {
        return comprice;
    }

    public void setComprice(double comprice) {
        this.comprice = comprice;
    }

    public String getComproduce() {
        return comproduce;
    }

    public void setComproduce(String comproduce) {
        this.comproduce = comproduce;
    }

    public long getComstatic() {
        return comstatic;
    }

    public void setComstatic(long comstatic) {
        this.comstatic = comstatic;
    }

    public long getCominventory() {
        return cominventory;
    }

    public void setCominventory(long cominventory) {
        this.cominventory = cominventory;
    }

    public String getComtname() {
        return comtname;
    }

    public void setComtname(String comtname) {
        this.comtname = comtname;
    }

    public double getCompriceMin() {
        return compriceMin;
    }

    public void setCompriceMin(double compriceMin) {
        this.compriceMin = compriceMin;
    }

    public double getCompriceMax() {
        return compriceMax;
    }

    public void setCompriceMax(double compriceMax) {
        this.compriceMax = compriceMax;
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

    @Override
    public String toString() {
        return "CommodityParams{" +
                "comid=" + comid +
                ", comname='" + comname + '\'' +
                ", comtid=" + comtid +
                ", comprice=" + comprice +
                ", comproduce='" + comproduce + '\'' +
                ", comstatic=" + comstatic +
                ", cominventory=" + cominventory +
                ", comtname='" + comtname + '\'' +
                ", compriceMin=" + compriceMin +
                ", compriceMax=" + compriceMax +
                ", pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                '}';
    }
}
