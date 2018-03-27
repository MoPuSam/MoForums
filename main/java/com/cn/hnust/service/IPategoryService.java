package com.cn.hnust.service;

import com.cn.hnust.pojo.Pategory;

import java.util.List;

/**
 * Created by 170904 on 2018/2/21.
 */
public interface IPategoryService {
    public List<Pategory> getPateList(Integer gcId);
}
