package com.cn.hnust.service;

import com.cn.hnust.pojo.Article;
import com.cn.hnust.pojo.Information;

import java.util.List;

/**
 * Created by Administrator on 2018/3/14.
 */
public interface ICrawlerService {//爬虫服务
    public List<Information> getInfoByURL(String url);
    public Article getArticle(String url);
}
