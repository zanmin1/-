package cn.ffcs.dcl.utils;

import net.sf.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class WeastUtil {


    public enum StrEnum{
        //多个个枚举值,注意名字并不是构造方法名

        postRequestType("requestMethod","POST"),
        paramStr("contentType","application/json;charset=UTF-8");

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

    public static JSONObject invokeOutInterface(String accessUrl, String requestType, String paramStr) throws Exception{
        URL url = new URL(accessUrl);
        HttpURLConnection httpUrlConn = null;
        httpUrlConn = (HttpURLConnection) url.openConnection();
        httpUrlConn.setConnectTimeout(30000);
        httpUrlConn.setReadTimeout(30000);
        httpUrlConn.setDoOutput(true);
        httpUrlConn.setDoInput(true);
        httpUrlConn.setUseCaches(false);
        httpUrlConn.setRequestProperty("Content-Type", WeastUtil.StrEnum.paramStr.getValue());
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


    public static JSONObject invokeOutInterface(String accessUrl,String requestType,String paramStr,String token) throws Exception{
        URL url = new URL(accessUrl);
        HttpURLConnection httpUrlConn = null;
        httpUrlConn = (HttpURLConnection) url.openConnection();
        httpUrlConn.setConnectTimeout(30000);
        httpUrlConn.setReadTimeout(30000);
        httpUrlConn.setDoOutput(true);
        httpUrlConn.setDoInput(true);
        httpUrlConn.setUseCaches(false);
        httpUrlConn.setRequestProperty("Content-Type", WeastUtil.StrEnum.paramStr.getValue());
        httpUrlConn.setRequestProperty("Authorization",token);
        httpUrlConn.setRequestProperty("accept", "*/*");
        httpUrlConn.setRequestProperty("connection", "Keep-Alive");
        //httpUrlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
        httpUrlConn.setRequestMethod(requestType);

        if ("GET".equalsIgnoreCase(requestType))
            httpUrlConn.connect();
       /* if (null != paramStr) {
            OutputStream outputStream = httpUrlConn.getOutputStream();
            // 注意编码格式，防止中文乱码
            outputStream.write(paramStr.getBytes("UTF-8"));
            outputStream.flush();
            outputStream.close();
        }*/
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
    //获取用户token
    public static Object getToken() throws Exception {
        String url = "http://120.92.89.122/openapi/v1/login";
        //String body = "{\"loginName\":\"17779111191\",\"userPassword\":\"QWJjMTIzNDU2\"}";
        String body = "{\"appId\":\"JiangXi\",\"secret\":\"123456\"}";
        JSONObject json= WeastUtil.invokeOutInterface(url, "POST", body);
        String token = null;
        if(!json.get("data").equals("null")){
            JSONObject str = (JSONObject) json.get("data");
            token = (String) str.get("accesstoken");
        }
        return token;
    }
    public static void main(String[] args){
        try {
            getToken();
            System.out.println(getToken());
        }catch (Exception eo){

        }
    }
}
