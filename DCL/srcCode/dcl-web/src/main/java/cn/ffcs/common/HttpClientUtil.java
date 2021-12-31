package cn.ffcs.common;

import cn.ffcs.dcl.utils.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 文件名：  ${file_name}
 * 版权：    Copyright by ljm
 * 描述：
 * 修改人：  HuamingChen
 * 修改时间：2018/10/24
 * 跟踪单号：
 * 修改单号：
 * 修改内容：
 */
public class HttpClientUtil {

    /**
     * post请求
     *
     * @param url       请求路径
     * @param paramMap  请求参数map
     * @param charset   编码 utf-8
     * @param headerMap 请求头参数map
     */
    public static String doPost(String url, Map<String, String> paramMap, String charset, Map<String, String> headerMap) {
        CloseableHttpClient httpClient = null;
        HttpPost httpPost;
        String result = null;
        try {
            httpClient = HttpClients.createDefault();
            httpPost = new HttpPost(url);
            //设置参数
            if (paramMap != null) {
                List<NameValuePair> list = new ArrayList<>();
                for (Map.Entry<String, String> elem : paramMap.entrySet()) {
                    list.add(new BasicNameValuePair(elem.getKey(), elem.getValue()));
                }
                if (list.size() > 0) {
                    UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list, charset);
                    httpPost.setEntity(entity);
                }
            }

            //设置请求头
            if (headerMap != null) {
                for (Map.Entry<String, String> entry : headerMap.entrySet()) {
                    httpPost.addHeader(entry.getKey(), entry.getValue());
                }
            }
            //执行
            HttpResponse response = httpClient.execute(httpPost);
            if (response != null) {
                HttpEntity resEntity = response.getEntity();
                if (resEntity != null) {
                    result = EntityUtils.toString(resEntity, charset);
                }
                if (resEntity != null) {
                    resEntity.consumeContent();
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // 关闭连接,释放资源    
            try {
                if (httpClient != null) {
                    httpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return unicode2String(result);
    }

    /**
     * 将unicode码转化成字符串
     */
    private static String unicode2String(String unicode) {
        if (StringUtils.isEmpty(unicode)) {
            return null;
        }

        StringBuilder sb = new StringBuilder();
        int i;
        int pos = 0;
        int endIndex;
        while ((i = unicode.indexOf("\\u", pos)) != -1) {
            endIndex = (unicode.indexOf("\\\\u", pos) != -1) ? i - 1 : i;
            sb.append(unicode, pos, endIndex);
            if (i + 5 < unicode.length()) {
                pos = i + 6;
                sb.append((char) Integer.parseInt(unicode.substring(i + 2, i + 6), 16));
            }
        }
        //如果pos位置后，有非中文字符，直接添加
        sb.append(unicode.substring(pos));

        return sb.toString();
    }

}
