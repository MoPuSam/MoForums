package com.cn.hnust.service.impl;

import com.cn.hnust.pojo.Post;
import com.cn.hnust.service.IndexService;
import com.cn.hnust.util.ElasticService;
import com.google.gson.JsonObject;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.bootstrap.Elasticsearch;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * Created by 170904 on 2018/2/19.
 */
@Service("indexService")
public class IndexServiceImpl implements IndexService{
    public  String HOST;
    public  int PORT;//http请求的端口是9200，客户端是9300
    private TransportClient client;
    /*private Logger logger = LoggerFactory.getLogger(IndexServiceImpl.class);*/
    @Override
    public void addIndex(Post post,String username) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", post.getpId());
        jsonObject.addProperty("title", post.getpTitle());
        jsonObject.addProperty("text", post.getpContent());
        jsonObject.addProperty("updatetime",post.getUpdateTime());
        jsonObject.addProperty("username",username);
        jsonObject.addProperty("tag",post.getTags());
        jsonObject.addProperty("category",post.getCategory());
        String json = jsonObject.toString();
        //System.out.println(json);
        client = ElasticService.getElasticClient();
        IndexResponse response = client.prepareIndex("article", "post").setSource(json).get();
       // System.out.println("jsonObject索引名称:" + response.getIndex() + "\n jsonObject类型:" + response.getType()+ "\n jsonObject文档ID:" + response.getId());
    }

    @Override
    public void updateIndex(Post post) {

    }

    @Override
    public SearchHits getHits(String keyword,int pageNum) {
        client = ElasticService.getElasticClient();
        QueryBuilder query = QueryBuilders.multiMatchQuery(keyword, "text","title","tag");
        SearchRequestBuilder searchRequestBuilder = this.client.prepareSearch("article").setTypes("post")
                .setQuery(query);
        /*searchRequestBuilder.addHighlightedField("text");
        searchRequestBuilder.setHighlighterPreTags("<em>");
        searchRequestBuilder.setHighlighterPostTags("</em>");*/
        //设置返回记录数为8条
        searchRequestBuilder.setSize(8);
        //设置跳过的记录数
        searchRequestBuilder.setFrom(8*(pageNum-1));
        searchRequestBuilder.addHighlightedField("text");
        searchRequestBuilder.setHighlighterPreTags("<span style=\"color:red\">");
        searchRequestBuilder.setHighlighterPostTags("</span>");
        // 设置摘要大小
        searchRequestBuilder.setHighlighterFragmentSize(10);
        SearchResponse response = searchRequestBuilder.get();
    /*    SearchResponse response = client.prepareSearch("article")
                .setTypes("post").setQuery(query).execute().actionGet();*/
        SearchHits hits = response.getHits();
        return hits;
    }

    public String getHOST() {
        return HOST;
    }

    public void setHOST(String HOST) {
        this.HOST = HOST;
    }

    public int getPORT() {
        return PORT;
    }

    public void setPORT(int PORT) {
        this.PORT = PORT;
    }
}
