package com.cn.hnust.util;

import java.util.UUID;

/**
 * Created by 170904 on 2018/1/12.
 */
public class UUIDUtil {
    private static int num = 0;
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 获取下一个计数
     * @return
     */
    public static String getNextNum(){
        return String.valueOf(num++);
    }

    /*public static void main(String[] args) {
        System.out.println("格式前的UUID ： " + UUID.randomUUID().toString());
        System.out.println("格式化后的UUID ：" + getUUID());
    }*/
}
