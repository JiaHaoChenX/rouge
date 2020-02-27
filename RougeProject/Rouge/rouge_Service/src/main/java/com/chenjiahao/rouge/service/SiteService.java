package com.chenjiahao.rouge.service;

import com.chenjiahao.rouge.dao.ISiteDao;
import com.chenjiahao.rouge.entity.Site;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SiteService implements ISiteService {

    @Autowired
    ISiteDao dao;

    public List<Site> getSite(String aid) {
        return dao.getSite(aid);
    }

    public int addSite(Site site) {
        return dao.addSite(site);
    }

    public int updateSite(Site site) {
        return dao.updateSite(site);
    }

    public int delSite(List<Integer> siteids) {
        return dao.delSite(siteids);
    }
}
