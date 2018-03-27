package com.cn.hnust.dao;

import com.cn.hnust.pojo.Pategory;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("pategoryDao")
public interface IPategoryDao {
    int deleteByPrimaryKey(String pId);

    int insert(Pategory record);

    int insertSelective(Pategory record);

    Pategory selectByPrimaryKey(String pId);

    int updateByPrimaryKeySelective(Pategory record);

    int updateByPrimaryKey(Pategory record);

    List<Pategory> getPateList(Integer gcId);
}