package com.chenjiahao.rouge.utils;

import java.util.HashMap;

public class R extends HashMap {

    public R ok() {
        this.put("code", 1);
        this.put("msg", "操作成功");
        this.put("data", null);
        return this;
    }

    public R ok(int code, String msg, Object data) {
        this.put("code", code);
        this.put("msg", msg);
        this.put("data", data);
        return this;
    }

    public R ok(String msg, Object data) {
        this.put("code", 1);
        this.put("msg", msg);
        this.put("data", data);
        return this;
    }

    public R ok(String msg) {
        this.put("code", 1);
        this.put("msg", msg);
        this.put("data", null);
        return this;
    }

    public R ok(Object data) {
        this.put("code", 1);
        this.put("msg", "操作成功!");
        this.put("data", data);
        return this;
    }


    public R error() {
        this.put("code", 0);
        this.put("msg", "操作失败");
        this.put("data", null);
        return this;
    }

    public R error(int code, String msg, Object data) {
        this.put("code", code);
        this.put("msg", msg);
        this.put("data", data);
        return this;
    }

    public R error(String msg, Object data) {
        this.put("code", 0);
        this.put("msg", msg);
        this.put("data", data);
        return this;
    }


    public R error(String msg) {
        this.put("code", 0);
        this.put("msg", "操作失败!");
        this.put("data", null);
        return this;
    }

    public R error(Object data) {
        this.put("code", 0);
        this.put("msg", "操作失败!");
        this.put("data", data);
        return this;
    }

}
