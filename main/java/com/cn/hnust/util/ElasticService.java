package com.cn.hnust.util;

import org.elasticsearch.ElasticsearchException;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import java.lang.reflect.Constructor;
import java.net.InetAddress;

/**
 * Created by Administrator on 2018/3/12.
 */
public class ElasticService  {
    public static String HOST="127.0.0.1";
    public static int PORT=9300;//http请求的端口是9200，客户端是9300
    private static TransportClient searchClient = null;

    private static Settings settings = Settings.settingsBuilder().put("client.transport.ping_timeout", "10s").put("client.transport.sniff", "true").build();

    public static TransportClient getElasticClient() throws ElasticsearchException {
        /**
         * 你可以设置client.transport.sniff为true来使客户端去嗅探整个集群的状态，
         * 把集群中其它机器的ip地址加到客户端中，这样做的好处是一般你不用手动设置集群里所有集群的ip到连接客户端，
         * 它会自动帮你添加，并且自动发现新加入集群的机器。
         */
        try {
            Settings settings = Settings.settingsBuilder().put("cluster.name", "wenbronk_escluster").build();
            searchClient = TransportClient.builder().build()
                    .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(HOST), PORT));
            return searchClient;
        } catch (Exception e) {
           // log.error("elasticSearch Client init error :"+e);
            throw new ElasticsearchException("elasticSearch Client init error", e);
        }
    }
    /**
     * 获取ElaticSearchClient
     *
     * @author yanghao
     * @throws Exception
     */
    public static TransportClient getSycElasticClient() throws Exception {
        if(searchClient == null){
            synchronized (new Object()) {//防止高并发时创建多个查询对象
                if (searchClient == null) {
                    searchClient = new ElasticService().getElasticClient();
                }
            }
        }
        return searchClient;
    }

    public void setHOST(String HOST) {
        HOST = HOST;
    }

    public String getHOST() {
        return HOST;
    }

    public void setPORT(int PORT) {
        PORT = PORT;
    }

    public int getPORT() {
        return PORT;
    }
}
