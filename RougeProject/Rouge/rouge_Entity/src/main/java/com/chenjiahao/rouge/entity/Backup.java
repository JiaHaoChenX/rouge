package com.chenjiahao.rouge.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class Backup {

    private long backupid;
    private String backupidname;
    private java.sql.Timestamp refundTime;
    private String remarks;
    private String refundTimeMin;
    private String refundTimeMax;
    private int pageNo;
    private int pageSize;


    @Override
    public String toString() {
        return "Backup{" +
                "backupid=" + backupid +
                ", backupidname='" + backupidname + '\'' +
                ", refundTime=" + refundTime +
                ", remarks='" + remarks + '\'' +
                '}';
    }

    public Backup() {
    }

    public Backup(String refundTimeMin, String refundTimeMax) {
        this.refundTimeMin = refundTimeMin;
        this.refundTimeMax = refundTimeMax;
    }

    public Backup(String backupidname, String refundTime, String remarks) {
        this.backupidname = backupidname;
        this.remarks = remarks;
    }

    public Backup(String refundTimeMin, String refundTimeMax, int pageNo, int pageSize) {
        this.refundTimeMin = refundTimeMin;
        this.refundTimeMax = refundTimeMax;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public Backup(long backupid, String backupidname, Timestamp refundTime, String remarks) {
        this.backupid = backupid;
        this.backupidname = backupidname;
        this.refundTime = refundTime;
        this.remarks = remarks;
    }

    public Backup(long backupid, String backupidname, Timestamp refundTime, String remarks, String refundTimeMin, String refundTimeMax) {
        this.backupid = backupid;
        this.backupidname = backupidname;
        this.refundTime = refundTime;
        this.remarks = remarks;
        this.refundTimeMin = refundTimeMin;
        this.refundTimeMax = refundTimeMax;
    }

    public String getRefundTimeMin() {
        return refundTimeMin;
    }

    public void setRefundTimeMin(String refundTimeMin) {
        this.refundTimeMin = refundTimeMin;
    }

    public String getRefundTimeMax() {
        return refundTimeMax;
    }

    public void setRefundTimeMax(String refundTimeMax) {
        this.refundTimeMax = refundTimeMax;
    }

    public long getBackupid() {
        return backupid;
    }

    public void setBackupid(long backupid) {
        this.backupid = backupid;
    }


    public String getBackupidname() {
        return backupidname;
    }

    public void setBackupidname(String backupidname) {
        this.backupidname = backupidname;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8",locale = "zh")
    public java.sql.Timestamp getRefundTime() {
        return refundTime;
    }

    public void setRefundTime(java.sql.Timestamp refundTime) {
        this.refundTime = refundTime;
    }


    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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
