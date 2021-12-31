package cn.ffcs.dcl.utils;

import net.sf.json.JSONObject;
import org.apache.commons.codec.digest.DigestUtils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author 
 * @version 
 */
public class NpSoap {
	
	
	public enum StrEnum{
        //多个个枚举值,注意名字并不是构造方法名
		
		postRequestType("requestMethod","POST"),
		paramStr("contentType","application/json");

        //枚举值所包含的属性
        private String key;
        private String value;

        //构造方法
        StrEnum(String key,String value){
            this.setKey(key);
            this.setValue(value);
        }
        public String getKey() {
            return key;
        }
        public void setKey(String key) {
            this.key = key;
        }
        public String getValue() {
            return value;
        }
        public void setValue(String value) {
            this.value = value;
        }
    }
	
	public static JSONObject invokeOutInterface(String accessUrl,String requestType,String paramStr) throws Exception{
		URL url = new URL(accessUrl);
		HttpURLConnection httpUrlConn = null;
		httpUrlConn = (HttpURLConnection) url.openConnection();
		httpUrlConn.setConnectTimeout(30000);
		httpUrlConn.setReadTimeout(30000);
		httpUrlConn.setDoOutput(true);
		httpUrlConn.setDoInput(true);
		httpUrlConn.setUseCaches(false);
		httpUrlConn.setRequestProperty("Content-Type",StrEnum.paramStr.getValue());
		httpUrlConn.setRequestProperty("accept", "*/*");
		httpUrlConn.setRequestProperty("connection", "Keep-Alive");
		//httpUrlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		httpUrlConn.setRequestMethod(requestType);
		
		if ("GET".equalsIgnoreCase(requestType))
			httpUrlConn.connect();
		if (null != paramStr) {
			OutputStream outputStream = httpUrlConn.getOutputStream();
			// 注意编码格式，防止中文乱码
			outputStream.write(paramStr.getBytes("utf-8"));
			outputStream.flush();
			outputStream.close();
		}
		// 将返回的输入流转换成字符串
		InputStream inputStream = httpUrlConn.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

		String str = null;
		StringBuffer buffer = new StringBuffer();
		while ((str = bufferedReader.readLine()) != null) {
			buffer.append(str);
		}
		bufferedReader.close();
		inputStreamReader.close();
		// 释放资源
		inputStream.close();
		inputStream = null;
		httpUrlConn.disconnect();
		String josnStr = buffer.toString();
		if(josnStr != null && josnStr.contains("HTTP/1.1")){
			josnStr = josnStr.substring(0,josnStr.indexOf("HTTP/1.1"));
		}
		JSONObject json = JSONObject.fromObject(josnStr);
		return json;
	}
	public static Date getDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, +2);//+1今天的时间加一天
		date = calendar.getTime();
		return date;
	}
	//获取秘钥
	public static String getSignature(String cid,String expire) {
		String signKey = "lingmou";// 请用申请的signKey
		Map<String, Object> signMap = new TreeMap<String, Object>();
		signMap.put("type", "m3u8");
		signMap.put("cid", cid);// cid为请求参数中的cid
		signMap.put("expire", expire);
		Iterator<String> iterator = signMap.keySet().iterator();
		StringBuffer buffer = new StringBuffer();
		while (iterator.hasNext()) {
			String key = iterator.next();
			buffer.append(key).append(signMap.get(key));
		}
		buffer.append(signKey);
		String signature = DigestUtils.md5Hex(buffer.toString());

		System.out.println("::::::::::::::::"+signature);
		return signature;

	}
	//把系统时间转换为时间戳
	public static String timestamp(){
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime=null;
		try {
			currentTime=simpleDateFormat.format(getDay(date));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return currentTime;
	}
	//把时间戳转换为毫秒
	public static String dateTimeMs(){
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddHHmmss");
		long msTime = -1;
		try {
			msTime=simpleDateFormat.parse(timestamp()).getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(msTime);

	}
	
	public static JSONObject invokeOutInterface(String accessUrl,String requestType,String paramStr,String token) throws Exception{
		URL url = new URL(accessUrl);
		HttpURLConnection httpUrlConn = null;
		httpUrlConn = (HttpURLConnection) url.openConnection();
		httpUrlConn.setConnectTimeout(30000);
		httpUrlConn.setReadTimeout(30000);
		httpUrlConn.setDoOutput(true);
		httpUrlConn.setDoInput(true);
		httpUrlConn.setUseCaches(false);
		httpUrlConn.setRequestProperty("Content-Type",StrEnum.paramStr.getValue());
		httpUrlConn.setRequestProperty("Authorization",token);
		httpUrlConn.setRequestProperty("accept", "*/*");
		httpUrlConn.setRequestProperty("connection", "Keep-Alive");
		//httpUrlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		httpUrlConn.setRequestMethod(requestType);
		
		if ("GET".equalsIgnoreCase(requestType))
			httpUrlConn.connect();
		if (null != paramStr) {
			OutputStream outputStream = httpUrlConn.getOutputStream();
			// 注意编码格式，防止中文乱码
			outputStream.write(paramStr.getBytes("UTF-8"));
			outputStream.flush();
			outputStream.close();
		}
		// 将返回的输入流转换成字符串
		InputStream inputStream = httpUrlConn.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

		String str = null;
		StringBuffer buffer = new StringBuffer();
		while ((str = bufferedReader.readLine()) != null) {
			buffer.append(str);
		}
		bufferedReader.close();
		inputStreamReader.close();
		// 释放资源
		inputStream.close();
		inputStream = null;
		httpUrlConn.disconnect();
		String josnStr = buffer.toString();
		if(josnStr != null && josnStr.contains("HTTP/1.1")){
			josnStr = josnStr.substring(0,josnStr.indexOf("HTTP/1.1"));
		}
		JSONObject json = JSONObject.fromObject(josnStr);
		return json;
	}
	
}


