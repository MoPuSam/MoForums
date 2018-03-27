package com.cn.hnust.pojo;

import java.io.Serializable;
import java.util.List;

public class Category implements Serializable {
    private Integer gcId;

    private String gcName;

    private String addtime;

    private List<Pategory> pategoryList;

    private static final long serialVersionUID = 1L;

    public Integer getGcId() {
        return gcId;
    }

    public void setGcId(Integer gcId) {
        this.gcId = gcId;
    }

    public String getGcName() {
        return gcName;
    }

    public void setGcName(String gcName) {
        this.gcName = gcName == null ? null : gcName.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }

    public List<Pategory> getPategoryList() {
        return pategoryList;
    }

    public void setPategoryList(List<Pategory> pategoryList) {
        this.pategoryList = pategoryList;
    }
}