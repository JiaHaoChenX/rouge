package com.chenjiahao.rouge.test;

import com.chenjiahao.rouge.dao.ICommentDao;
import com.chenjiahao.rouge.dao.ISiteDao;
import com.chenjiahao.rouge.entity.Comment;
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
public class CommentTest {
    @Autowired
    ICommentDao dao;

    @Test
    public void addComment() {
        Comment comment = new Comment("admin", 1, "挺好用的", 10, "1.jpg");
        System.out.println(dao.addComment(comment));
    }

    @Test
    public void getAllComment() {
        Comment comment = new Comment("", 1, "挺好用的", 10, "1.jpg");
        System.out.println(dao.getAllComment(comment));
    }

    @Test
    public void updateComment() {
        Comment comment = new Comment(14, "牛逼的很!", 10, "1.jpg");
        System.out.println(dao.updateComment(comment));
    }

    @Test
    public void delComment() {
        List<Integer> comments = new ArrayList<Integer>();
        comments.add(11);
        comments.add(12);
        System.out.println(dao.delComment(comments));
    }


}
