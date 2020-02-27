package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Backup;

import java.util.List;

public interface IBackupDao {
    //获取备份记录
    List<Backup> getAllBackup(Backup backup);

    //getPageBackup 分页
    List<Backup> getPageBackup(Backup backup);

    //记录备份记录
    int addBackup(Backup backup);
}
