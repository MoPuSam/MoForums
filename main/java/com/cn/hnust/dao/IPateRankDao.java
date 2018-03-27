package com.cn.hnust.dao;

import com.cn.hnust.pojo.PateRank;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("pateRankDao")
public interface IPateRankDao {
    int insert(PateRank record);

    int insertSelective(PateRank record);

    List<PateRank> getRankList();
}