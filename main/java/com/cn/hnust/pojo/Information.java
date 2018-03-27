package com.cn.hnust.pojo;

/**
 * Created by Administrator on 2018/3/13.
 */
public class Information { //资讯类
    private String href;
    private String content;

    public Information(String href, String content) {
        this.href = href;
        this.content = content;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
