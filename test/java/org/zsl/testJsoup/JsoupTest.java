/*
package org.zsl.testJsoup;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import java.io.IOException;
import java.util.Iterator;


*/
/**
 * Created by Administrator on 2018/3/13.
 *//*

public class JsoupTest {//爬虫测试
    @Test
    public void test(){
        Document doc = null;
        try {
            doc = Jsoup.connect("https://www.17173.com/").get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String title = doc.title();
        Elements es = doc.getElementsByClass("fb");
        Iterator e =es.iterator();
        while(e.hasNext()){
            Element ee = (Element) e.next();
            System.out.println("链接："+ee.attr("href")+"内容："+ee.html());
        }
        //System.out.println(title);//::17173.com::中国游戏第一门户站
    }
    @Test
    public void testArticleGet(){
        Document doc = null;
        try {
            doc = Jsoup.connect("http://bbs.17173.com/thread-10835011-1-1.html").get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Element title = doc.getElementById("thread_subject");
        Elements es = doc.getElementsByClass("pct");
        System.out.println("标题:"+title.html());
        System.out.println(es.first().html());
    }
    @Test
    public void testArticleGet2(){
        Document doc = null;
        try {
            doc = Jsoup.connect("http://news.17173.com/content/03142018/083005491.shtml").get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Element content = doc.getElementById("mod_article");
        Elements es = doc.getElementsByClass("gb-final-tit-article");
        System.out.println("标题:"+es.first().html());
        System.out.println(content.html());
    }
}
*/
