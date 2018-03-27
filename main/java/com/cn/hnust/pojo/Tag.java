package com.cn.hnust.pojo;

import java.io.Serializable;

public class Tag implements Serializable {
    private Integer tId;

    private String tName;

    private static final long serialVersionUID = 1L;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName == null ? null : tName.trim();
    }
}