package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.IAccountDao;
import com.chenjiahao.rouge.dao.ISiteDao;
import com.chenjiahao.rouge.entity.Account;
import com.chenjiahao.rouge.entity.Site;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

//指定bean注入的配置文件
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
//@TransactionConfiguration(defaultRollback = true)  //被弃用
//@Transactional
@Rollback(true)  //是否回滚
public class SiteTest {
    @Autowired
    ISiteDao dao;

    @Test
    public void getSite() {
        System.out.println(dao.getSite("niubihh"));
    }

    @Test
    public void addSite() {
        Site site = new Site("admin", "陈佳豪", "15073034644", "湖南省", "岳阳市", "岳阳县", "绕村乡东山村");
        System.out.println(dao.addSite(site));
    }

    @Test
    public void updateSite() {
        Site site = new Site(1, "陈佳豪", "15073034644", "广东省", "珠海市", "斗门区", "白蕉南路19号南方it学院");
        System.out.println(dao.updateSite(site));
    }

    @Test
    public void delSiteSite() {
        List<Integer> siteids = new ArrayList<Integer>();
        siteids.add(3);
        siteids.add(4);
        siteids.add(5);
        siteids.add(6);
        System.out.println(dao.delSite(siteids));
    }


}
