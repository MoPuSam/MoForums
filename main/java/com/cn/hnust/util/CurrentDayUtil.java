package com.cn.hnust.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 170904 on 2018/2/18.
 */
public class CurrentDayUtil {
    public static Date current = new Date();
    public static String getCurrentDay(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        String c=sdf.format(current);
        return c;
    }
    public static String getCurrentTime(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String c=sdf.format(current);
        return c;
    }
    public static String getUpdateTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String ymd = sdf.format(current);
        return ymd;
    }
}
