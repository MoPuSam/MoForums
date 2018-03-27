package org.zsl.testEs;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cn.hnust.pojo.Post;
import com.cn.hnust.pojo.PostIndex;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import net.sf.jsqlparser.expression.TimeValue;
import org.elasticsearch.action.ListenableActionFuture;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.highlight.HighlightField;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import javax.json.Json;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/7.
 */
public class ElasticSearchTest {
    public final static String HOST = "127.0.0.1";
    public final static int PORT = 9300;//http请求的端口是9200，客户端是9300
    private TransportClient client;
   // private Logger logger = LoggerFactory.getLogger(ElasticSearchTest.class);
   @Before
   public void testBefore() throws UnknownHostException {
       Settings settings = Settings.settingsBuilder().put("cluster.name", "wenbronk_escluster").build();
       client = TransportClient.builder().build()
               .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(HOST), PORT));
       System.out.println("success to connect escluster");
   }
    @Test
    public void addIndex() throws UnknownHostException {//加入索引
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("userName", "李四");
            jsonObject.addProperty("sendDate", "2017-11-23");
            jsonObject.addProperty("msg","你好王五");
            String json = jsonObject.toString();
            //System.out.println(json);
            IndexResponse response = client.prepareIndex("user", "post").setSource(json, XContentType.JSON).get();
            System.out.println("jsonObject索引名称:" + response.getIndex() + "\n jsonObject类型:" + response.getType()+ "\n jsonObject文档ID:" + response.getId());
    }
    @Test
    public void addPostIndex() throws UnknownHostException {//加入索引
        PostIndex pi = new PostIndex();
        pi.setpUid(9000);
        pi.setpTitle("标题测试2");
        pi.setpContent("多少块话费卡哈看到伐sdsdd");
        pi.setUpdateTime("2018-3-11 23:02:22");
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", pi.getpUid());
        jsonObject.addProperty("title", pi.getpTitle());
        jsonObject.addProperty("text", pi.getpContent());
        jsonObject.addProperty("updatetime",pi.getUpdateTime());
        String json = jsonObject.toString();
        System.out.println(json);
        //System.out.println(json);
        IndexResponse response = client.prepareIndex("article", "post").setSource(json).get();
        System.out.println("jsonObject索引名称:" + response.getIndex() + "\n jsonObject类型:" + response.getType()+ "\n jsonObject文档ID:" + response.getId());
    }
    @Test
    public void searchIndexById() throws UnknownHostException {//根据ID查找索引
        Client client = null;
        try {
            client = TransportClient.builder().build()
                    .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(HOST), PORT));
            GetRequestBuilder requestBuilder = client.prepareGet("user", "post", "AWIGEGsEJw8Wa4eyPC6_");
            GetResponse response = requestBuilder.execute().actionGet();
            GetResponse getResponse = requestBuilder.get();
            ListenableActionFuture<GetResponse> execute = requestBuilder.execute();
            System.out.println(response.getSourceAsString());
        }catch (UnknownHostException e){
            e.printStackTrace();
        }finally {
            if(client != null) {
                client.close();
            }
        }
    }

    /**
     * 使用QueryBuilder
     * termQuery("key", obj) 完全匹配
     * termsQuery("key", obj1, obj2..)   一次匹配多个值
     * matchQuery("key", Obj) 单个匹配, field不支持通配符, 前缀具高级特性
     * multiMatchQuery("text", "field1", "field2"..);  匹配多个字段, field有通配符忒行
     * matchAllQuery();         匹配所有文件
     */
    @Test
    public void testQueryBuilder() {
        QueryBuilder query = QueryBuilders.termsQuery("title",  "标题测试");
        //QueryBUilder query = QueryBuilders.termQuery("user", "kimchy", "wenbronk", "vini");
        //QueryBuilders.termsQuery("user", new ArrayList<String>().add("kimchy"));
//        QueryBuilder query = QueryBuilders.matchQuery("user", "kimchy");
//        QueryBuilder query = QueryBuilders.multiMatchQuery("kimchy", "user", "message", "gender");
      //  QueryBuilder query = QueryBuilders.matchAllQuery();

        searchFunction(query);
    }
    /**
     * 只查询一个id的
     * QueryBuilders.idsQuery(String...type).ids(Collection<String> ids)
     */
    @Test
    public void testIdsQuery() {
        QueryBuilder queryBuilder = QueryBuilders.idsQuery().ids("AWIGEGsEJw8Wa4eyPC6_");
        searchFunction(queryBuilder);
    }
    /**
     * 模糊查询
     * 不能用通配符, 不知道干啥用
     */
    @Test
    public void testFuzzyQuery() {
        QueryBuilder queryBuilder = QueryBuilders.fuzzyQuery("username", "lala");
        searchFunction(queryBuilder);
    }

    /**
     * moreLikeThisQuery: 实现基于内容推荐, 支持实现一句话相似文章查询
     * {
     "more_like_this" : {
     "fields" : ["title", "content"],   // 要匹配的字段, 不填默认_all
     "like_text" : "text like this one",   // 匹配的文本
     }
     }

     percent_terms_to_match：匹配项（term）的百分比，默认是0.3

     min_term_freq：一篇文档中一个词语至少出现次数，小于这个值的词将被忽略，默认是2

     max_query_terms：一条查询语句中允许最多查询词语的个数，默认是25

     stop_words：设置停止词，匹配时会忽略停止词

     min_doc_freq：一个词语最少在多少篇文档中出现，小于这个值的词会将被忽略，默认是无限制

     max_doc_freq：一个词语最多在多少篇文档中出现，大于这个值的词会将被忽略，默认是无限制

     min_word_len：最小的词语长度，默认是0

     max_word_len：最多的词语长度，默认无限制

     boost_terms：设置词语权重，默认是1

     boost：设置查询权重，默认是1

     analyzer：设置使用的分词器，默认是使用该字段指定的分词器
     */
    @Test
    public void testMoreLikeThisQuery() {
        QueryBuilder queryBuilder = QueryBuilders.moreLikeThisQuery("userName")
                .like("张").analyzer("ik");
//                            .minTermFreq(1)         //最少出现的次数
//                            .maxQueryTerms(12);        // 最多允许查询的词语
        searchFunction(queryBuilder);
    }
    /**
     * 组合查询
     * must(QueryBuilders) :   AND
     * mustNot(QueryBuilders): NOT
     * should:                  : OR
     */
    @Test
    public void testQueryBuilder2() {
        QueryBuilder queryBuilder = QueryBuilders.boolQuery()
                .must(QueryBuilders.termQuery("userName", "李四"))
                .mustNot(QueryBuilders.termQuery("sendDate", "2017-11-22"))
                .should(QueryBuilders.termQuery("msg", "你好"));
        searchFunction(queryBuilder);
    }

    /**
     * 复合查询
     */
    @Test
    public void testQueryBuilder7() {
        QueryBuilder queryBuilder = QueryBuilders.multiMatchQuery("标题", "text","title","tag");
        searchFunction(queryBuilder);
    }


    /**
     * 查询遍历抽取
     * @param query
     */
    private void searchFunction(QueryBuilder query) {
        SearchRequestBuilder searchRequestBuilder = this.client.prepareSearch("article").setTypes("post")
                .setQuery(query);
        searchRequestBuilder.addHighlightedField("text");
        searchRequestBuilder.setHighlighterPreTags("<em>");
        searchRequestBuilder.setHighlighterPostTags("</em>");
        // 设置摘要大小
        searchRequestBuilder.setHighlighterFragmentSize(10);
        SearchResponse response = searchRequestBuilder.get();
    /*    SearchResponse response = client.prepareSearch("article")
                .setTypes("post").setQuery(query).execute().actionGet();*/

        SearchHits hits = response.getHits();
        long total = hits.getTotalHits();
        System.out.println("total:" + total);
        int len = hits.getHits().length;
        System.out.println("len:" + len);
        for(SearchHit hit:hits){
            // 获取高亮内容
           /* Map<String, HighlightField> highlightFields = hit.getHighlightFields();
            HighlightField highlightField = highlightFields.get("title");
            Text[] texts = highlightField.getFragments();
            String title = "";
            for (Text text : texts) {
                title += text;
            }
            System.out.println(title);*/
            System.out.println(hit.getIndex()+hit.getSourceAsString()+hit.getSource().get("text"));
        }
    }
    @After
    public void closeClient(){
        if(client!=null){
            client.close();
            System.out.println("success to close");
        }
    }
}
