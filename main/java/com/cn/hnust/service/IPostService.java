package com.cn.hnust.service;

import com.cn.hnust.pojo.Post;
import com.cn.hnust.pojo.PostIterm;

import java.util.List;

/**
 * Created by 170904 on 2018/1/19.
 */
public interface IPostService {
    public void insertPost(Post post);
    public Post getPost(String pid);
    public List<Post> getAllPost();
    public List<PostIterm> getAllPostIterm();
    public List<PostIterm> getPostItermByPid(int pId);
    public List<PostIterm> seachPostItermByTitle(int pId,String keyword);

    public List<Post> getNoticeList();
    public List<Post> getHotList();

    Integer getPostCountByUid(Integer uid);

    int updateHit(Integer pId);
}
