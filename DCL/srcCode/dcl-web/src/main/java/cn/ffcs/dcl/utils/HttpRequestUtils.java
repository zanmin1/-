package cn.ffcs.dcl.utils;



import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
 
/**
 * HttpClient4.3工具类
 * 
 * @author tech
 * @date 2016-03-29
 *
 */
public class HttpRequestUtils {
//	private static Logger logger = LoggerFactory.getLogger(HttpClientUtils.class); // 日志记录
 
	
	/**
	 * post请求传输json参数
	 * 
	 * @param url
	 *            url地址
	 * @param json
	 *            参数
	 * @return
	 */
	public static JSONObject httpPost(String url, JSONObject jsonParam) {
		// post请求返回结果 
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		
		JSONObject jsonResult = null;
		HttpPost httpPost = new HttpPost(url);
		// 设置请求和传输超时时间
		//设置代理
		//HttpHost proxy= new HttpHost("192.168.13.19",7777,"http");
		//RequestConfig requestConfig=RequestConfig.custom().setProxy(proxy).setSocketTimeout(2000).setConnectTimeout(2000).build();
		RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectTimeout(20000).build();
		
		
		httpPost.setConfig(requestConfig);
		try {
			if (null != jsonParam) {
				//请求头 测试用
				//httpPost.addHeader("token","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6Inpoc3EuMTIzIiwiZXhwIjoxNjA2Mzc0NTk1LCJ1c2VybmFtZSI6Inpoc3EifQ.EW7vwtbU8oNQHvvpp1A6j7xlluF2F6P_39_KJrFcZ5g");
				// 解决中文乱码问题
				StringEntity entity = new StringEntity(jsonParam.toString(),"utf-8");
				entity.setContentEncoding("UTF-8");
				entity.setContentType("application/json");
				httpPost.setEntity(entity);
			}
			CloseableHttpResponse result = httpClient.execute(httpPost);
			//请求发送成功，并得到响应
			if (result.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				String str = "";
				try {
					//读取服务器返回过来的json字符串数据 
					str = EntityUtils.toString(result.getEntity(), "utf-8");
					//把json字符串转换成json对象 
					jsonResult = JSONObject.parseObject(str);
				} catch (Exception e) {
					//logger.error("post请求提交失败:" + url, e);
				}
			}
		} catch (IOException e) {
			//logger.error("post请求提交失败:" + url, e);
		} finally {
			httpPost.releaseConnection();
		}
		return jsonResult;
	}
	
	
	/**
	 * post请求传输String参数
	 * 例如：name=Jack&sex=1&type=2
	 * Content-type:application/x-www-form-urlencoded
	 * @param url
	 *            url地址
	 * @param strParam
	 *            参数
	 * @param noNeedResponse
	 *            不需要返回结果
	 * @return
	 */
	public static JSONObject httpPost2Json(String url, String strParam) {
		// post请求返回结果
		CloseableHttpClient httpClient = HttpClients.createDefault();
		JSONObject jsonResult = null;
		HttpPost httpPost = new HttpPost(url);
		// 设置请求和传输超时时间
		RequestConfig requestConfig = RequestConfig.custom()
				.setSocketTimeout(20000).setConnectTimeout(20000).build();
		httpPost.setConfig(requestConfig);
		try {
			if (null != strParam) {
				// 解决中文乱码问题
				StringEntity entity = new StringEntity(strParam,"utf-8");
				entity.setContentEncoding("UTF-8");
				entity.setContentType("application/x-www-form-urlencoded");
				httpPost.setEntity(entity);
			}
			CloseableHttpResponse result = httpClient.execute(httpPost);
			//请求发送成功，并得到响应
			if (result.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				String str = "";
				try {
					//读取服务器返回过来的json字符串数据
					str = EntityUtils.toString(result.getEntity(), "utf-8");
					
					
					
					
					//把json字符串转换成json对象
					jsonResult = JSONObject.parseObject(str);
				} catch (Exception e) {
					//logger.error("post请求提交失败:" + url, e);
				}
			}
		} catch (IOException e) {
			//logger.error("post请求提交失败:" + url, e);
		} finally {
			httpPost.releaseConnection();
		}
		return jsonResult;
	}
	
	

	/**
	 * post请求传输String参数
	 * 例如：name=Jack&sex=1&type=2
	 * Content-type:application/x-www-form-urlencoded
	 * @param url
	 *            url地址
	 * @param strParam
	 *            参数
	 * @param noNeedResponse
	 *            不需要返回结果
	 * @return
	 */
	public static String httpPost(String url) {
		// post请求返回结果
	 
		CloseableHttpClient httpClient = HttpClients.createDefault();
		String jsonResult = null;
		HttpPost httpPost = new HttpPost(url);
		// 设置请求和传输超时时间
		//设置代理
		/*HttpHost proxy = new HttpHost("192.168.13.19", 7777, "http"); //添加代理 	
		RequestConfig requestConfig = RequestConfig.custom().setProxy(proxy)
		.setSocketTimeout(2000).setConnectTimeout(2000).build();*/
		
		RequestConfig requestConfig = RequestConfig.custom()
				.setSocketTimeout(2000).setConnectTimeout(2000).build();
		httpPost.setConfig(requestConfig);
		try {
			/*if (null != strParam) {
				// 解决中文乱码问题
				StringEntity entity = new StringEntity(strParam,"utf-8");
				entity.setContentEncoding("UTF-8");
				entity.setContentType("application/x-www-form-urlencoded");
				httpPost.setEntity(entity);
			}*/
			CloseableHttpResponse result = httpClient.execute(httpPost);
			//请求发送成功，并得到响应
			if (result.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				try {
					//读取服务器返回过来的json字符串数据
					jsonResult = EntityUtils.toString(result.getEntity(), "utf-8");	
				} catch (Exception e) {
					//logger.error("post请求提交失败:" + url, e);
				}
			}
		} catch (IOException e) {
			//logger.error("post请求提交失败:" + url, e);
		} finally {
			httpPost.releaseConnection();
		}
		return jsonResult;
	}
 
	/**
	 * 发送get请求
	 * 
	 * @param url
	 *            路径
	 * @return
	 */
	public static JSONObject httpGet(String url) {
		// get请求返回结果
		JSONObject jsonResult = null;
		CloseableHttpClient client = HttpClients.createDefault();
		// 发送get请求
		HttpGet request = new HttpGet(url);
		// 设置请求和传输超时时间
		RequestConfig requestConfig = RequestConfig.custom()
				.setSocketTimeout(2000).setConnectTimeout(2000).build();
		request.setConfig(requestConfig);
		try {
			CloseableHttpResponse response = client.execute(request);
 
			//请求发送成功，并得到响应
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				//读取服务器返回过来的json字符串数据
				HttpEntity entity = response.getEntity();
				String strResult = EntityUtils.toString(entity, "utf-8");
				//把json字符串转换成json对象
				jsonResult = JSONObject.parseObject(strResult);
			} else {
			//	logger.error("get请求提交失败:" + url);
			}
		} catch (IOException e) {
			//logger.error("get请求提交失败:" + url, e);
		} finally {
			request.releaseConnection();
		}
		return jsonResult;
	}
	
	//带参数的post请求
	 public static String sendPostByParam(String url,Map<String,Object> param){
	        

	        //创建post请求对象
	        HttpPost post = new HttpPost(url);
	        try {
	            //创建参数集合
	            List<BasicNameValuePair> list = new ArrayList<BasicNameValuePair>();
	            //添加参数
	            if(param != null) {
	            	for (Map.Entry<String, Object> entry : param.entrySet()) {
	            	   String key = entry.getKey();
	            	   String value = (String) entry.getValue();
	            	   list.add(new BasicNameValuePair(key, value));
	            	}
	            }
	            
	            //把参数放入请求对象，，post发送的参数list，指定格式
	            post.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
	            //添加请求头参数
	            //post.addHeader("timestamp","1594695607545");
	            CloseableHttpClient client = HttpClients.createDefault();
	            //启动执行请求，并获得返回值
	            CloseableHttpResponse response = client.execute(post);
	            //得到返回的entity对象
	            HttpEntity entity = response.getEntity();
	            //把实体对象转换为string
	            String result = EntityUtils.toString(entity, "UTF-8");
	            //返回内容
	            System.out.println(result);
	            return result;
	        } catch (Exception e1) {
	            e1.printStackTrace();
	            return null;
	        }
	    }
}