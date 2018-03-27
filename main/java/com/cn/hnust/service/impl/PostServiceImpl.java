package com.cn.hnust.service.impl;

import com.cn.hnust.dao.IPostDao;
import com.cn.hnust.dao.IPostItermDao;
import com.cn.hnust.pojo.Post;
import com.cn.hnust.pojo.PostIterm;
import com.cn.hnust.service.IPostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 170904 on 2018/1/19.
 */
@Service("postService")
public class PostServiceImpl implements IPostService{
    @Resource
    private IPostDao dao;
    @Resource
    private IPostItermDao itermDao;
    @Override
    public void insertPost(Post post) {
        dao.insert(post);
        //int pId = post.getpId();
    }
    @Override
    public Post getPost(String pid){
        return dao.selectByPrimaryKey(pid);
    }
    @Override
    public List<Post> getAllPost() {
        return dao.getAllPost();
    }

    @Override
    public List<PostIterm> getAllPostIterm() {
        return itermDao.getAllList();
    }

    @Override
    public List<PostIterm> getPostItermByPid(int pId) {
        return itermDao.getPateList(pId);
    }

    @Override
    public List<PostIterm> seachPostItermByTitle(int pId, String keyword) {
        return itermDao.seachPostItermByTitle(pId,keyword);
    }

    @Override
    public List<Post> getNoticeList() {
        return dao.getNoticeList();
    }

    @Override
    public List<Post> getHotList() {
        return dao.getHotList();
    }

    @Override
    public Integer getPostCountByUid(Integer uid) {
        return dao.getPostCountByUid(uid);
    }

    @Override
    public int updateHit(Integer pId) {
        return dao.updateHit(pId);
    }

}
