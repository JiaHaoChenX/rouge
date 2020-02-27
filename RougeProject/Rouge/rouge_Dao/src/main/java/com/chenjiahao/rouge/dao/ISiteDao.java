package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Site;

import java.util.List;

public interface ISiteDao {
    //查询地址
    public List<Site> getSite(String aid);

    //添加地址
    public int addSite(Site site);
    //修改地址
    public int updateSite(Site site);

    //删除地址
    public int delSite(List<Integer> siteids);

}
