package com.chenjiahao.rouge.dao;

import com.chenjiahao.rouge.entity.Comment;
import com.chenjiahao.rouge.entity.Commodity;
import com.chenjiahao.rouge.params.CommodityParams;

import java.util.List;

public interface ICommentDao {
    //查询评论
    public List<Comment> getAllComment(Comment comment);

    //添加评论
    public int addComment(Comment comment);

    //修改评论
    public int updateComment(Comment comment);

    //删除评论
    public int delComment(List<Integer> commentids);


}
