package com.cn.hnust.dao;

import com.cn.hnust.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("categoryDao")
public interface ICategoryDao {
    int deleteByPrimaryKey(String gcId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(String gcId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> getCatList();

    List<Category> getSelectCatList();
}