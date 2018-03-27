package com.cn.hnust.dao;

import com.cn.hnust.pojo.Reply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("replyDao")
public interface IReplyDao {
    int deleteByPrimaryKey(Integer rId);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer rId);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);

    List<Reply> getListByPid(String pid);
}