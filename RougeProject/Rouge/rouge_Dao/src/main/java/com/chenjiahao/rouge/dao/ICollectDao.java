package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Collect;
import com.chenjiahao.rouge.entity.Comment;
import com.chenjiahao.rouge.entity.Commodity;

import java.util.List;

public interface ICollectDao {
    //添加收藏
    public int addCollec(Collect collect);

    //查询收藏
    public List<Collect> getAllCollec();

    //取消收藏
    public int delCollec(List<Integer> collectids);
}
