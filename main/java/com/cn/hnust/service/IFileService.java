package com.cn.hnust.service;

/**
 * Created by 170904 on 2018/1/19.
 */
public interface IFileService {
    public String createArticleFile(String content,String fileName);
    public String getFileContent(String path);
}
