package com.cn.hnust.service.impl;

import com.cn.hnust.dao.IPateRankDao;
import com.cn.hnust.pojo.PateRank;
import com.cn.hnust.service.InformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/14.
 */
@Service("infoService")
public class InformationServiceImpl implements InformationService{
    @Resource
    private IPateRankDao dao;
    @Override
    public List<PateRank> getRankList() {
        return dao.getRankList();
    }
}
