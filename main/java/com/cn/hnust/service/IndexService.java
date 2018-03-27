package com.cn.hnust.service;

import com.cn.hnust.pojo.Post;
import org.elasticsearch.search.SearchHits;

/**
 * Created by 170904 on 2018/2/19.
 */
public interface IndexService {
    public void addIndex(Post post,String username);
    public void updateIndex(Post post);
    public SearchHits getHits(String keyword ,int pageNum);
}
