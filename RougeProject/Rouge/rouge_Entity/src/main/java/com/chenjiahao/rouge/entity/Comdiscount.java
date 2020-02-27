package com.chenjiahao.rouge.entity;


import java.util.List;

public class Comdiscount {

    private long comdisid;
    private long comid;
    private double discount;
    private Commodity commodity;
    private List<Commodityimg> commodityimgs;

    public List<Commodityimg> getCommodityimgs() {
        return commodityimgs;
    }

    public void setCommodityimgs(List<Commodityimg> commodityimgs) {
        this.commodityimgs = commodityimgs;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public long getComdisid() {
        return comdisid;
    }

    public void setComdisid(long comdisid) {
        this.comdisid = comdisid;
    }


    public long getComid() {
        return comid;
    }

    public void setComid(long comid) {
        this.comid = comid;
    }


    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Comdiscount{" +
                "comdisid=" + comdisid +
                ", comid=" + comid +
                ", discount=" + discount +
                ", commodity=" + commodity +
                ", commodityimgs=" + commodityimgs +
                '}';
    }
}
