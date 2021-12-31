package cn.ffcs.common.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import net.sf.json.JSONObject;



public class ChartInfoUtil {
	public static JSONObject invokeOutInterface(String accessUrl,String requestType,String paramStr) throws Exception{
		URL url = new URL(accessUrl);
		HttpURLConnection httpUrlConn = null;
		httpUrlConn = (HttpURLConnection) url.openConnection();
		httpUrlConn.setConnectTimeout(30000);
		httpUrlConn.setReadTimeout(30000);
		httpUrlConn.setDoOutput(true);
		httpUrlConn.setDoInput(true);
		httpUrlConn.setUseCaches(false);
		//httpUrlConn.setRequestProperty("Content-Type","application/json");
		httpUrlConn.setRequestProperty("accept", "*/*");
		httpUrlConn.setRequestProperty("connection", "Keep-Alive");
		httpUrlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
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
