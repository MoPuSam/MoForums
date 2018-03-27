package com.cn.hnust.dao;

import com.cn.hnust.pojo.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("tagDao")
public interface ITagDao {
    int deleteByPrimaryKey(Integer tId);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(Integer tId);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);

    List<Tag> getTagList();
}