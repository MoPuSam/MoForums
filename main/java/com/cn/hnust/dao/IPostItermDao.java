package com.cn.hnust.dao;

import com.cn.hnust.pojo.PostIterm;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("postItermDao")
public interface IPostItermDao {
    int insert(PostIterm record);

    int insertSelective(PostIterm record);

    List<PostIterm> getAllList();

    List<PostIterm> getPateList(int pId);

    List<PostIterm> seachPostItermByTitle(int pId, String keyword);
}