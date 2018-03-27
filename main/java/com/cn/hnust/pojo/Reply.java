package com.cn.hnust.pojo;

import java.io.Serializable;

public class Reply implements Serializable {
    private Integer rId;

    private Integer rUid;

    private String rContent;

    private String addtime;

    private String pId;

    private String ispass;

    private User replyer;

    private static final long serialVersionUID = 1L;

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getrUid() {
        return rUid;
    }

    public void setrUid(Integer rUid) {
        this.rUid = rUid;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent == null ? null : rContent.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId == null ? null : pId.trim();
    }

    public String getIspass() {
        return ispass;
    }

    public void setIspass(String ispass) {
        this.ispass = ispass == null ? null : ispass.trim();
    }

    public User getReplyer() {
        return replyer;
    }

    public void setReplyer(User replyer) {
        this.replyer = replyer;
    }
}