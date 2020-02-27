package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IBackupDao;
import com.chenjiahao.rouge.dao.IOrderDao;
import com.chenjiahao.rouge.entity.Backup;
import com.chenjiahao.rouge.entity.Order;
import com.chenjiahao.rouge.params.OrderParams;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.List;

//指定bean注入的配置文件
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
//@TransactionConfiguration(defaultRollback = true)  //被弃用
//@Transactional
@Rollback(true)  //是否回滚
public class BackupTest {


    @Autowired
    IBackupDao dao;

    @Test
    public void getAllBackup() {
        List<Backup> result = dao.getAllBackup(new Backup("",""));
        System.out.println(result);
    }

    @Test
    public void addBackup() {
        System.out.println(dao.addBackup(new Backup("121.sql","","")));
    }
}
