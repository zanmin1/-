package cn.ffcs.dcl.utils;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.crypto.Cipher;

public class StringUtils {
    
	public static SimpleDateFormat fyyyy_mm_dd = new SimpleDateFormat("yyyy-MM-dd");
        private static final String[] IMG_FILE_SUFFIX = {"bmp","dib","gif","jfif","jpe","jpeg","jpg","png","tif","tiff","ico"};
        
	/**
	 * 转换为int
	 *
	 * @param obj          Object
	 * @param defaultValue int
	 * @return int
	 */
	public static int getInt(Object obj, int defaultValue) {
        if (obj == null) return defaultValue;
        try {
            if (obj instanceof Integer) return ((Integer) obj).intValue();
            if (obj instanceof String) return Integer.parseInt((String) obj);
            return Integer.parseInt(obj.toString());
        } catch (Throwable e) {
            return defaultValue;
        }
	}

	/**
	 * 转换为long
	 *
	 * @param obj          Ojbect
	 * @param defaultValue long
	 * @return long
	 */
	public static long getLong(Object obj, long defaultValue) {
		   if (obj == null) return defaultValue;
        try {
            if (obj instanceof Long) return ((Long) obj).longValue();
            if (obj instanceof String) return Long.parseLong((String) obj);
            return Long.parseLong(obj.toString());
        } catch (Throwable e) {
            return defaultValue;
        }
	}

    /**
     * 字符串参数转化成sql in('','')
     * @param str
     * @return
     */
    public static String toSqlStrInParam(String str){
        if(isEmpty(str)) {
            return "";
        } else {
            String states = "";
            if(str.endsWith(",")) str = str.substring(0,str.length());
            if(str.contains(",")) {
                String[] sp = str.split(",");
                StringBuffer sb = new StringBuffer();
                for(int i = 0; i < sp.length; i++) {
                    sb.append("'"+sp[i]+"'");
                }
                return sb.toString();
            } else {
               return "'"+str+"'";
            }
        }
    }

	public static boolean isEmpty(String str) {
		return str == null || str.trim().length() == 0;
	}
    public static String getStrFromMap(java.util.Map map,String key) {
        if(map == null || isEmpty(key)) return null;
        if(map.get(key) != null) {
            return map.get(key).toString();
        }
        return  null;
    }
    public static String getStrFromMap(java.util.Map map,String key,String defalutVal) {
        if(map == null || isEmpty(key)) return null;
        try{
            return map.get(key).toString();
        } catch (Exception e) {
            return defalutVal;
        }
    }
    public static Map getMapFromList(List dataList,String key,String value) {
        if(dataList == null || isEmpty(key)) return null;
        for(int i = 0; i < dataList.size(); i++) {
             Map map = (Map)dataList.get(i);
             String keyValue = getStrFromMap(map,key);
             if(keyValue != null && keyValue.equals(value)) {
                 return map;
             }
        }
        return null;
    }
    public static String toUnicode(String source){
        String str = "";
        for(int i = 0; i < source.length(); i++){
            char c = source.charAt(i);
            if(c < 256){
                str += "\\u00" + Integer.toHexString(c);
            }else if(c < 4096){
                str += "\\u0" + Integer.toHexString(c);
            }else{
                str += "\\u" + Integer.toHexString(c);
            }
        }
        return str;
    }
    /**
     *转化sql参数的模糊查询中含有特殊字符% _等 在语句里必须使用 and like '%%' escape '\' and
     * @param str
     * @return
     */
    public static String escapeSqlStr(String str) {
        if(isEmpty(str)) {
            return "";
        } else {
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < str.length(); i++) {
                char pos = str.charAt(i);
                if(pos == '%') {
                    sb.append("\\%");
                    //retStr = retStr.replaceAll("\u0025","\\u005c\\u0025");
                } else if(pos == '_') {
                    sb.append("\\_");
                } else {
                    sb.append(pos);
                }
            }
            return sb.toString();
        }
    }
    public static String toJSON(Object obj) {
        if (obj == null) return "null";
        StringBuffer sb = new StringBuffer();
        if (obj instanceof String) {
            return StringUtils.toJSONQuoteString((String) obj);
//        }else if (obj instanceof Array) {
        } else if (obj instanceof List) {
            List collection = (List) obj;
            sb.append("[");
            for (Iterator iterator = collection.iterator(); iterator.hasNext();) {
                Object o = iterator.next();
                if (sb.length() > 1) sb.append(",");
                sb.append(toJSON(o));
            }
            return sb.append("]").toString();
        } else if (obj instanceof Map) {
            Map m = (Map) obj;
            sb.append("{");
            Set keys = m.keySet();
            for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
                String key = (String) iterator.next();
                if (sb.length() > 1) sb.append(",");
                sb.append(StringUtils.toJSONQuoteString(key));
                sb.append(":");
                sb.append(toJSON(m.get(key)));
            }
            return sb.append("}").toString();
        } else if (obj instanceof Number) {
            return "" + obj;
        } else if (obj instanceof Timestamp) {
            return toJSON(StringUtils.getDateStringByFormat("yyyy-MM-dd HH:mm:ss", (Date) obj));
        } else if (obj instanceof Date) {
            return toJSON(StringUtils.getDateStringByFormat("yyyy-MM-dd HH:mm:ss", (Date) obj));
        } else if (obj instanceof Object[]) {
            Object[] collection = (Object[]) obj;
            sb.append("[");
            for (int i = 0; i < collection.length; i++) {
                Object o = collection[i];
                if (sb.length() > 1) sb.append(",");
                sb.append(toJSON(o));
            }
            return sb.append("]").toString();
        }  else { //default string
            return StringUtils.toJSONQuoteString("" + obj);
        }
    }
    public static String getDateStringByFormat(String format) {
        return getDateStringByFormat(format, new Date());
    }

    public static String getDateStringByFormat(String format, Date data) {
        return new SimpleDateFormat(format).format(data);
    }

    public static String getDateStringByFormat(String dateSrc, String srcFormat, String toFormat) {
        try {
            return new SimpleDateFormat(toFormat).format(new SimpleDateFormat(srcFormat).parse(dateSrc));
        } catch (Exception e) {
            return dateSrc;
        }
    }
    public static String toJSONQuoteString(String string) {
        if (string == null || string.length() == 0) {
            return "\"\"";
        }
        if (string.toLowerCase().equals("true")) return "true";
        if (string.toLowerCase().equals("false")) return "false";

        char c;
        int i;
        int len = string.length();
        StringBuffer sb = new StringBuffer(len + 4);
        String t;

        sb.append('"');
        for (i = 0; i < len; i += 1) {
            c = string.charAt(i);
            switch (c) {
                case '\\':
                case '"':
                case '/':
                    sb.append('\\');
                    sb.append(c);
                    break;
                case '\b':
                    sb.append("\\b");
                    break;
                case '\t':
                    sb.append("\\t");
                    break;
                case '\n':
                    sb.append("\\n");
                    break;
                case '\f':
                    sb.append("\\f");
                    break;
                case '\r':
                    sb.append("\\r");
                    break;
                default:
                    if (c < ' ' || c >= 128) {
                        t = "000" + Integer.toHexString(c);
                        sb.append("\\u");
                        sb.append(t.substring(t.length() - 4));
                    } else {
                        sb.append(c);
                    }
            }
        }
        sb.append('"');
        return sb.toString();
    }

    public static String getToken(String key) throws Exception{
        if(StringUtils.isEmpty(key)) return null;
        //初始化加密环境
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(512);
        KeyPair kp = keyGen.genKeyPair();
        //加密token
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, kp.getPublic());
        byte[] x = cipher.doFinal(key.getBytes());
        return (Base64.getMimeEncoder()).encodeToString(x);

        /*cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] y = cipher.doFinal(decryptByte);
        log.debug(new String(y));*/
    }
    public static String getTokenKey(String key) throws Exception{
        if(StringUtils.isEmpty(key)) return null;
        //初始化加密环境
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(512);
        KeyPair kp = keyGen.genKeyPair();
        //解密toke
        byte[] decryptByte = Base64.getMimeDecoder().decode(key);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, kp.getPrivate());
        byte[] y = cipher.doFinal(decryptByte);
        return  new String(y);
    }
    
    public static String getPercent(int y, int z) {  
        String baifenbi = "";
        double baiy = y * 1.0;  
        double baiz = z * 1.0;
        double fen = baiy / baiz;
        DecimalFormat df1 = new DecimalFormat("##.##%");
        baifenbi = df1.format(fen);
        return baifenbi;
    }
    
    public static String getAutoCodeByDate(String w, Long num){
        return getDateStringByFormat("yyyyMMdd") + String.format("%"+w+"d", num);
    }
    
    public static String getFileTypeBySuffix(String fileName){
        int lastDotIndex = fileName.lastIndexOf(".");
        if(lastDotIndex <= 0){
            return "none";
        }
        
        String suffix = fileName.substring(lastDotIndex+1);
        for(String s : IMG_FILE_SUFFIX){
           if(s.equalsIgnoreCase(suffix)){
               return "img";
           }
        }
        return suffix.toLowerCase();
    }
    
    public static void main(String[] args) throws Exception{
        System.out.println(getPercent(1018,1020));
    }
}
