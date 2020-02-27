package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.entity.Backup;

import java.util.List;

public interface IBackupService {
    //获取备份记录
    List<Backup> getAllBackup(Backup backup);

    //记录备份记录
    int addBackup(Backup backup);

    List<Backup> getPageBackup(Backup backup);
}
