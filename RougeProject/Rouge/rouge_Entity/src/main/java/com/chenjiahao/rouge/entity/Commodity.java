package com.chenjiahao.rouge.entity;


import java.util.List;

public class Commodity {

    private long comid;
    private String comname;
    private long comtid;
    private double comprice;
    private String comproduce;
    private long comstatic;
    private long cominventory;
    private String comtname;
    private List<Commodityimg> commodityimgs;
    private Comdiscount comdiscount;
    private List<Comcolor> comcolors;
    private List<Comsize> comsizes;
    private List<Comdescribe> comdescribe;

    private Comdescribe describe;
    private int salesvolumes;


    public Commodity() {
    }

    public Commodity(String comname, long comtid, double comprice, String comproduce, long comstatic, long cominventory) {
        this.comname = comname;
        this.comtid = comtid;
        this.comprice = comprice;
        this.comproduce = comproduce;
        this.comstatic = comstatic;
        this.cominventory = cominventory;
    }


    public Commodity(long comid, String comname, long comtid, double comprice, String comproduce, long comstatic, long cominventory) {
        this.comid = comid;
        this.comname = comname;
        this.comtid = comtid;
        this.comprice = comprice;
        this.comproduce = comproduce;
        this.comstatic = comstatic;
        this.cominventory = cominventory;
    }

    public Commodity(long comid, String comname, long comtid, double comprice, String comproduce, long comstatic, long cominventory, String comtname) {
        this.comid = comid;
        this.comname = comname;
        this.comtid = comtid;
        this.comprice = comprice;
        this.comproduce = comproduce;
        this.comstatic = comstatic;
        this.cominventory = cominventory;
        this.comtname = comtname;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "comid=" + comid +
                ", comname='" + comname + '\'' +
                ", comtid=" + comtid +
                ", comprice=" + comprice +
                ", comproduce='" + comproduce + '\'' +
                ", comstatic=" + comstatic +
                ", cominventory=" + cominventory +
                ", comtname='" + comtname + '\'' +
                ", commodityimgs=" + commodityimgs +
                ", comdiscount=" + comdiscount +
                ", comcolors=" + comcolors +
                ", comsizes=" + comsizes +
                ", comdescribe=" + comdescribe +
                ", salesvolumes=" + salesvolumes +
                '}';
    }

    public int getSalesvolumes() {
        return salesvolumes;
    }

    public Comdescribe getDescribe() {
        return describe;
    }

    public void setDescribe(Comdescribe describe) {
        this.describe = describe;
    }

    public void setSalesvolumes(int salesvolumes) {
        this.salesvolumes = salesvolumes;
    }

    public List<Comdescribe> getComdescribe() {
        return comdescribe;
    }

    public void setComdescribe(List<Comdescribe> comdescribe) {
        this.comdescribe = comdescribe;
    }

    public List<Comcolor> getComcolors() {
        return comcolors;
    }

    public void setComcolors(List<Comcolor> comcolors) {
        this.comcolors = comcolors;
    }

    public List<Comsize> getComsizes() {
        return comsizes;
    }

    public void setComsizes(List<Comsize> comsizes) {
        this.comsizes = comsizes;
    }

    public List<Commodityimg> getCommodityimgs() {
        return commodityimgs;
    }

    public void setCommodityimgs(List<Commodityimg> commodityimgs) {
        this.commodityimgs = commodityimgs;
    }

    public Comdiscount getComdiscount() {
        return comdiscount;
    }

    public void setComdiscount(Comdiscount comdiscount) {
        this.comdiscount = comdiscount;
    }

    public String getComtname() {
        return comtname;
    }

    public void setComtname(String comtname) {
        this.comtname = comtname;
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


}
