package com.chenjiahao.rouge.controller;

import com.chenjiahao.rouge.entity.Backup;
import com.chenjiahao.rouge.utils.MySqlBackups;
import com.chenjiahao.rouge.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import com.chenjiahao.rouge.service.*;

import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/rouge")
public class BackupController {
    @Autowired
    IBackupService dao;

    @RequestMapping("/rougeBackup")
    @ResponseBody
    public R rougeBackup(HttpServletRequest request) throws IOException {
        //文件存放的位置
        R r = new R();
        String path = request.getServletContext().getRealPath("/mysqlBackup");
        String uuid = UUID.randomUUID().toString();
        String fileNewName = uuid + ".sql";
        System.out.println(path + "\\" + fileNewName);
        path += "\\" + fileNewName;
        int result = dao.addBackup(new Backup(uuid, "", ""));
        if (result > 0) {
            if (MySqlBackups.backup(path)) {
                return r.ok("备份成功!", path);
            } else {
                return r.error("备份失败!");
            }
        }
        return r.error("备份失败!");
    }

    @RequestMapping("/rougeRecover")
    @ResponseBody
    public R rougeRecover(HttpServletRequest request, String sqlname) throws IOException {
        //文件存放的位置
        R r = new R();
        String path = request.getServletContext().getRealPath("/mysqlBackup");
        path += "/" + sqlname + ".sql";
        if (MySqlBackups.recover(path)) {
            return r.ok("还原成功!");
        }
        return r.error("还原失败!");
    }

    @RequestMapping("/getAllBackup")
    @ResponseBody
    public R getAllBackup(Backup backup) throws IOException {
        R r = new R();
        List<Backup> result = dao.getAllBackup(backup);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getBackupCount")
    @ResponseBody
    public R getBackupCount(Backup backup) throws IOException {
        R r = new R();
        List<Backup> result = dao.getAllBackup(backup);
        if (result.size() > 0) {
            r.put("count", result.size());
            return r.ok(result);
        }
        return r.error();
    }

    @RequestMapping("/getPageBackup")
    @ResponseBody
    public R getPageBackup(Backup backup) throws IOException {
        R r = new R();
        List<Backup> result = dao.getPageBackup(backup);
        if (result.size() > 0) {
            return r.ok(result);
        }
        return r.error();
    }

    public static void main(String[] args) {
        try {
            System.out.println( MySqlBackups.backup("d:/"+ UUID.randomUUID()+".sql"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
