package com.chenjiahao.rouge.entity;


public class Comment {

    private long commentid;
    private String aid;
    private long comid;
    private String content;
    private long grade;
    private String commentimg;

    public Comment() {
    }

    public Comment(long commentid, String content, long grade, String commentimg) {
        this.commentid = commentid;
        this.content = content;
        this.grade = grade;
        this.commentimg = commentimg;
    }

    public Comment(String aid, long comid, String content, long grade, String commentimg) {
        this.aid = aid;
        this.comid = comid;
        this.content = content;
        this.grade = grade;
        this.commentimg = commentimg;
    }

    public Comment(long commentid, String aid, long comid, String content, long grade, String commentimg) {
        this.commentid = commentid;
        this.aid = aid;
        this.comid = comid;
        this.content = content;
        this.grade = grade;
        this.commentimg = commentimg;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentid=" + commentid +
                ", aid='" + aid + '\'' +
                ", comid=" + comid +
                ", content='" + content + '\'' +
                ", grade=" + grade +
                ", commentimg='" + commentimg + '\'' +
                '}';
    }

    public long getCommentid() {
        return commentid;
    }

    public void setCommentid(long commentid) {
        this.commentid = commentid;
    }


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public long getComid() {
        return comid;
    }

    public void setComid(long comid) {
        this.comid = comid;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public long getGrade() {
        return grade;
    }

    public void setGrade(long grade) {
        this.grade = grade;
    }


    public String getCommentimg() {
        return commentimg;
    }

    public void setCommentimg(String commentimg) {
        this.commentimg = commentimg;
    }

}
