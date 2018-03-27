package com.cn.hnust.service.impl;

import com.cn.hnust.service.IFileService;
import com.cn.hnust.util.CurrentDayUtil;
import org.springframework.stereotype.Service;

import java.io.*;

/**
 * Created by 170904 on 2018/1/19.
 */
@Service("fileService")
public class FileServiceImpl implements IFileService{
    private static String rootPath;
    private static String articlePath;
    private static String localFilePath;
    private static String SYMBOL = System.getProperty("os.name").toLowerCase().indexOf("windows") >= 0 ? "\\" : "/";

    /**
     * 创建初始文件夹
     */
    private static void init(){
        File path = new File(rootPath);
        if (!path.exists()) {
            path.mkdir();
        }
        File arPath = new File(rootPath+articlePath);
        if (!arPath.exists()) {
            arPath.mkdir();
        }
        File filePath = new File(rootPath+localFilePath);
        if (!arPath.exists()) {
            arPath.mkdir();
        }
    }
    /**
     * 文章文件创建
     * @param content
     */
    public void createFile(String content,StringBuffer fullPath, String fileName) {
        try {
            OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(fullPath.append("\\").append(fileName).toString()),"UTF-8");
            out.write("<style>body{margin: 0px;padding: 0px;background-color: #FFF;}</style>"+content);
            out.flush();
            out.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e){
            e.printStackTrace();
        }
    }
    public void createDir(String path) {
        File pathFile = new File(path);
        if (pathFile.exists()) {
            return;
        }
        // 创建Path
        String[] pathUnits = path.substring(path.indexOf(rootPath) + rootPath.length()).replaceAll("\\\\", "/").split("/");
        StringBuffer subPath = new StringBuffer().append(rootPath);
        for (String unit : pathUnits) {
            if (unit.length() > 0) {
                subPath.append(unit).append(SYMBOL);
                File file = new File(subPath.toString());
                if (!file.exists()) {
                    file.mkdir();
                }
            }
        }
    }
    @Override
    public String createArticleFile(String content,String fileName) {
        StringBuffer fullpath = new StringBuffer();
        String currentDay = "\\"+CurrentDayUtil.getCurrentDay();
        fullpath.append(rootPath).append(articlePath).append(currentDay);
        File dir = new File(fullpath.toString());
        if(!dir.exists()){
            dir.mkdir();
        }
        createFile(content,fullpath,fileName);
        return fullpath.toString();
    }

    /**
     * 获取文件内容
     * @param path
     * @return
     */
    @Override
    public String getFileContent(String path) {
        File file=new File(path);
        BufferedReader reader=null;
        InputStreamReader isr;
        try {
            isr = new InputStreamReader(new FileInputStream(file), "UTF-8");
            reader=new BufferedReader(isr);}
        catch (FileNotFoundException e) {
            return "";}
        catch (UnsupportedEncodingException e) {
            return "";}

        StringBuffer content = new StringBuffer();
        String temp = "";

        try {
            while((temp=reader.readLine())!=null){
                content.append(temp);}}
        catch (IOException e) {
            e.printStackTrace();}

        try {
            reader.close();}
        catch (IOException e) {
            e.printStackTrace();}

        finally{
            if(reader!=null){
                try {
                    reader.close();}
                catch (IOException e) {
                    e.printStackTrace();}
            }//endif
        }//endfinally

        return content.toString();
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

    public String getSYMBOL() {
        return SYMBOL;
    }

    public void setSYMBOL(String SYMBOL) {
        this.SYMBOL = SYMBOL;
    }
}
