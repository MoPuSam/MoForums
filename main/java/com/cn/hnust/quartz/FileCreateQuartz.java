package com.cn.hnust.quartz;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/3/9.
 */
public class FileCreateQuartz {
    private String rootPath;
    private String articlePath;
    private String localFilePath;
    //private static String SYMBOL = System.getProperty("os.name").toLowerCase().indexOf("windows") >= 0 ? "\\" : "/";
    /**
     * 每天创建一个时间为文件名的文件夹
     */
    public void init(){
        File path = new File(rootPath);
        if (!path.exists()) {
            path.mkdir();
        }
        Date today = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        String c=sdf.format(today);
        File arPath = new File(rootPath+articlePath);
        if (!arPath.exists()) {
            arPath.mkdir();
        }
        File tarPath = new File(rootPath+articlePath+"\\"+c);
        if (!tarPath.exists()) {
            tarPath.mkdir();
        }
        File filePath = new File(rootPath+localFilePath);
        if (!arPath.exists()) {
            arPath.mkdir();
        }
        File tfilePath = new File(rootPath+localFilePath+"\\"+c);
        if (!tfilePath.exists()) {
            tfilePath.mkdir();
        }
    }

    public String getRootPath() {
        return rootPath;
    }

    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }

    public String getArticlePath() {
        return articlePath;
    }

    public void setArticlePath(String articlePath) {
        this.articlePath = articlePath;
    }

    public String getLocalFilePath() {
        return localFilePath;
    }

    public void setLocalFilePath(String localFilePath) {
        this.localFilePath = localFilePath;
    }
}
