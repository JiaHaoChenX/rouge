package com.chenjiahao.rouge.entity;


public class Site {

    private long siteid;
    private String aid;
    private String sitename;
    private String sitephone;
    private String siteprovince;
    private String sitecity;
    private String sitecounty;
    private String sitedetailed;

    public Site() {
    }

    public Site(long siteid, String sitename, String sitephone, String siteprovince, String sitecity, String sitecounty, String sitedetailed) {
        this.siteid = siteid;
        this.sitename = sitename;
        this.sitephone = sitephone;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
    }

    public Site(String aid, String sitename, String sitephone, String siteprovince, String sitecity, String sitecounty, String sitedetailed) {
        this.aid = aid;
        this.sitename = sitename;
        this.sitephone = sitephone;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
    }

    public Site(long siteid, String aid, String sitename, String sitephone, String siteprovince, String sitecity, String sitecounty, String sitedetailed) {
        this.siteid = siteid;
        this.aid = aid;
        this.sitename = sitename;
        this.sitephone = sitephone;
        this.siteprovince = siteprovince;
        this.sitecity = sitecity;
        this.sitecounty = sitecounty;
        this.sitedetailed = sitedetailed;
    }

    @Override
    public String toString() {
        return "Site{" +
                "siteid=" + siteid +
                ", aid='" + aid + '\'' +
                ", sitename=" + sitename +
                ", sitephone='" + sitephone + '\'' +
                ", siteprovince='" + siteprovince + '\'' +
                ", sitecity='" + sitecity + '\'' +
                ", sitecounty='" + sitecounty + '\'' +
                ", sitedetailed='" + sitedetailed + '\'' +
                '}';
    }

    public long getSiteid() {
        return siteid;
    }

    public void setSiteid(long siteid) {
        this.siteid = siteid;
    }


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public String getSitename() {
        return sitename;
    }

    public void setSitename(String sitename) {
        this.sitename = sitename;
    }


    public String getSitephone() {
        return sitephone;
    }

    public void setSitephone(String sitephone) {
        this.sitephone = sitephone;
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

}
