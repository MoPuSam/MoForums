package com.cn.hnust.service;

import com.cn.hnust.pojo.Reply;

import java.util.List;

/**
 * Created by 170904 on 2018/2/24.
 */
public interface IReplyService {
    public void insertReply(Reply reply);
    public List<Reply> getReplysByPid(String pid);
}
