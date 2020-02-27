package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.IBackupDao;
import com.chenjiahao.rouge.entity.Backup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BackupService implements IBackupService {

    @Autowired
    IBackupDao dao;

    public List<Backup> getAllBackup(Backup backup) {
        return dao.getAllBackup(backup);
    }

    public int addBackup(Backup backup) {
        return dao.addBackup(backup);
    }

    public List<Backup> getPageBackup(Backup backup) {
        return dao.getPageBackup(backup);
    }
}
