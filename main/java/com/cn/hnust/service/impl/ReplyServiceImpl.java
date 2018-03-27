package com.cn.hnust.service.impl;

import com.cn.hnust.dao.IReplyDao;
import com.cn.hnust.pojo.Reply;
import com.cn.hnust.service.IReplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 170904 on 2018/2/24.
 */
@Service("replyService")
public class ReplyServiceImpl implements IReplyService{
    @Resource
    private IReplyDao dao;
    @Override
    public void insertReply(Reply reply) {
        dao.insert(reply);
    }

    @Override
    public List<Reply> getReplysByPid(String pid) {
        return dao.getListByPid(pid);
    }
}
