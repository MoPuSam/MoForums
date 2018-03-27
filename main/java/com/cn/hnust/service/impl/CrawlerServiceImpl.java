package com.cn.hnust.service.impl;

import com.cn.hnust.pojo.Article;
import com.cn.hnust.pojo.Information;
import com.cn.hnust.service.ICrawlerService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2018/3/14.
 */
@Service("crawService")
public class CrawlerServiceImpl implements ICrawlerService {
    @Override
    public List<Information> getInfoByURL(String url) {
        Document doc = null;
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //String title = doc.title();
        List<Information> list = new ArrayList<Information>(7);
        Elements es = doc.getElementsByClass("fb");
        Iterator e =es.iterator();
        while(e.hasNext()){
            Element ee = (Element) e.next();
            String href = ee.attr("href");
            String content = ee.html();
            /*System.out.println("链接："+href+"内容："+content);*/
            list.add(new Information(href,content));
        }
        return list;
    }

    @Override
    public Article getArticle(String url) {
        Document doc = null;
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //.shtml
        Elements sTitle = null;
        Element sContent = null;
        //.html
        Element eTitle = null;
        Elements eContent = null;
        String title = null;
        String content = null;
        if(url.endsWith(".shtml")) {
            sContent = doc.getElementById("mod_article");
            sTitle = doc.getElementsByClass("gb-final-tit-article");
            title = sTitle.first().html();
            content = sContent.html();
        }else if(url.endsWith(".html")){
            eTitle = doc.getElementById("thread_subject");
            eContent = doc.getElementsByClass("pct");
            title = eTitle.html();
            content = eContent.first().html();
        }
        /*System.out.println("标题:"+eTitle.first().html());
        System.out.println(eContent.html());*/
        Article article = new Article(title,content);
        return article;
    }
}
