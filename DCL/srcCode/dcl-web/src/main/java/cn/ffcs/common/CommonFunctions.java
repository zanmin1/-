package cn.ffcs.common;

import java.io.IOException;
import java.io.Writer;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.ffcs.file.service.FileUrlProvideService;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.common.utils.domain.IDomain;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;

/**
 * Created by IntelliJ IDEA.
 * User: guohh
 * Date: 11-9-7
 * Time: 上午9:44
 * To change this template use File | Settings | File Templates.
 */
public class CommonFunctions {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonFunctions.class);

    /**
     * 根据浏览器UA生成下载文件名称（解决乱码问题）
     * @param fileName
     * @param userAgent
     * @return
     */
	public static String buildFileNameByUa(String fileName, String userAgent) {
        try {
            String new_filename = URLEncoder.encode(fileName, "UTF8");
            // 如果没有UA，则默认使用IE的方式进行编码，因为毕竟IE还是占多数的
            String rtn = "filename=\"" + new_filename + "\"";
            if (userAgent!=null && !"".equals(userAgent)) {
                userAgent = userAgent.toLowerCase();
                // IE浏览器，只能采用URLEncoder编码
                if (userAgent.indexOf("msie") != -1) {
                    rtn = "filename=\"" + new_filename + "\"";
                }
                // Opera浏览器只能采用filename*
                else if (userAgent.indexOf("opera") != -1) {
                    rtn = "filename*=UTF-8''" + new_filename;
                }
                // Safari浏览器，只能采用ISO编码的中文输�?
                else if (userAgent.indexOf("safari") != -1) {
                    rtn = "filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO8859-1") + "\"";
                }
                // Chrome浏览器，只能采用MimeUtility编码或ISO编码的中文输�?
                else if (userAgent.indexOf("applewebkit") != -1) {
                    //new_filename = MimeUtility.encodeText(fileName, "UTF8", "B");
                    //rtn = "filename=\"" + new_filename + "\"";
                    rtn = "filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO8859-1") + "\"";
                }
                // FireFox浏览器，可以使用MimeUtility或filename*或ISO编码的中文输�?
                else if (userAgent.indexOf("mozilla") != -1) {
                    rtn = "filename*=UTF-8''" + new_filename;
                }
            }
            return rtn;
        } catch (Exception e) {
            return "";
        }
    }
    
	/**
	 * 根据文件名后缀获取文件类型
	 * @param subfix
	 * @return
	 */
	public static String getContentTypeBySubfix(String subfix) {
		if(subfix!=null && subfix.length()>0) {
			String tmpSubfix = subfix.toLowerCase();
			if(tmpSubfix.equals("doc") || tmpSubfix.equals("docx"))
				return "application/msword";
			else if(tmpSubfix.equals("dms") || tmpSubfix.equals("lha") || tmpSubfix.equals("lzh") || tmpSubfix.equals("exe") || tmpSubfix.equals("class"))
				return "application/octet-stream bin";
			else if(tmpSubfix.equals("pdf"))
				return "application/pdf";
			else if(tmpSubfix.equals("ppt") || tmpSubfix.equals("pptx"))
				return "appication/powerpoint";
			else if(tmpSubfix.equals("zip"))
				return "application/zip";
			else if(tmpSubfix.equals("mpeg") || tmpSubfix.equals("mp2"))
				return "audio/mpeg";
			else if(tmpSubfix.equals("xls") || tmpSubfix.equals("xlsx"))
				return "application/msexcel";
		}
		return "";
	}
	
	/**
	 * 根据类型获取当年的季度列表
	 * @param except 已有的季度列表
	 * @param type 1 排除  2 本身
	 * @return
	 */
	public static List<Map<String, String>> getQuarterListByType(List<String> except, int type) {
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String [] quarters = new String[]{(year+"01"),(year+"02"),(year+"03"),(year+"04")};
		switch(type){
		case 1: //排除
			for(int i=0; i<quarters.length; i++) {
				Map<String, String> quarter = new HashMap<String, String>();
				boolean canAdd = true;
				if(except!=null && except.size()>0) {
					for(int j=0; j<except.size(); j++) {
						if(quarters[i].equals(except.get(j))) canAdd = false;
					}
				}
				if(canAdd) {
					quarter.put("quarter_value", quarters[i]);
					quarter.put("quarter_text", (year+"年第"+(i+1)+"季度"));
					result.add(quarter);
				}
			}
			break;
		case 2: //包含
			if(except!=null && except.size()>0) {
				for(int j=0; j<except.size(); j++) {
					Map<String, String> quarter = new HashMap<String, String>();
					boolean extra = true;
					for(int i=0; i<quarters.length; i++) {
						if(quarters[i].equals(except.get(j))) {
							quarter.put("quarter_value", quarters[i]);
							quarter.put("quarter_text", (year+"年第"+(i+1)+"季度"));
							result.add(quarter);
							extra = false;
						}
					}
					if(extra) {
						String quarterValue = except.get(j);
						quarter.put("quarter_value", quarterValue);
						quarter.put("quarter_text", (quarterValue.substring(0, 4)+"年第"+quarterValue.substring(5)+"季度"));
						result.add(quarter);
					}
				}
			}
			break;
		}
		return result;
	}
	
	/**
	 * 获取季度名称
	 * @param quarter
	 * @return
	 */
	public static String getQuarterText(String quarter) {
		if(quarter==null || quarter.length()!=6) return "";
		String year = quarter.substring(0, 4);
		String count = quarter.substring(5);
		return (year+"年第"+count+"季度");
	}
	
	/**
	 * 获取访问者ip地址
	 * @param request
	 * @return
	 */
	public static String getRemoteIp(HttpServletRequest request) {
		//-- 获取ip地址
	    String ipKey = request.getHeader("X-Real-IP");
	    if (ipKey == null || ipKey.length() == 0 || "unknown".equalsIgnoreCase(ipKey))
	    	ipKey = request.getHeader("X-Forwarded-For");
		if (ipKey == null || ipKey.length() == 0 || "unknown".equalsIgnoreCase(ipKey))
			ipKey = request.getHeader("Proxy-Client-IP");
		else {
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ipKey.indexOf(',');
			if (index != -1) {
				ipKey = ipKey.substring(0, index);
			}
		}
		if (ipKey == null || ipKey.length() == 0 || "unknown".equalsIgnoreCase(ipKey))
			ipKey = request.getHeader("WL-Proxy-Client-IP");
		if (ipKey == null || ipKey.length() == 0 || "unknown".equalsIgnoreCase(ipKey))
			ipKey = request.getRemoteAddr();
		return ipKey;
	}
	
	/**
	 * 逗号隔开的数值列表转成List
	 * @param idListStr
	 * @return
	 */
	public static List<Long> idStrToList(String idListStr) {
		List<Long> idList = new ArrayList<Long>();
		if(!StringUtils.isBlank(idListStr)) {
			String [] idArray = idListStr.split(",");
			for(String idStr : idArray) {
				try {
					idList.add(Long.parseLong(idStr));
				} catch (Exception e) { e.printStackTrace(); }
			}
		}
		return idList;
	}
	
	/**
	 * 数值List转成逗号隔开的数值字符串
	 * @param idList
	 * @return
	 */
	public static String idListToStr(List<Long> idList) {
		String idStr = "";
		if(idList!=null && idList.size()>0) {
			for(Long id : idList) {
				idStr += (","+id);
			}
			idStr = idStr.substring(1);
		}
		return idStr;
	}
	
	/**
	 * 计算日期差
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static long daysBetween(Date date1, Date date2) {
		if(date1==null || date2==null) return 0L;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date1Tmp = sdf.parse(sdf.format(date1));
			Date date2Tmp = sdf.parse(sdf.format(date2));
			long nd = 1000*24*60*60;//一天的毫秒数
			long date1Time = date1Tmp.getTime();
			long date2Time = date2Tmp.getTime();
			long diff = date1Time - date2Time;
			long days = diff/nd;//计算差多少天
			if(diff%nd>0) days++;
			return days;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0L;
		}
	}
	
	/**
	 * 过滤字符串中的html标签
	 * @param source
	 * @return
	 */
	public static String filterHtml(String source) {
		if(StringUtils.isBlank(source)) return source;
		if(source.indexOf("<")==-1) return source;
		int start = source.indexOf("<");
		int end = source.indexOf(">");
		String result;
		if(end<start) {
			result = source.replaceFirst(">", "");
		} else {
			result = source.substring(0, start)+source.substring(end+1, source.length());
		}
		return filterHtml(result);
	}
	
	/**
	 * 数组转换String（如果有空返回空）
	 * @param resource
	 * @return
	 */
	public static String ArrayToString(String[] resource){
		StringBuffer retVal = new StringBuffer("");
		
		if(resource!=null && resource.length>0){
			for(String tmp : resource){
				if(StringUtils.isNotBlank(tmp)){
					retVal.append(tmp).append(",");
				}
			}
			
			if(retVal.length() > 0){
				retVal = new StringBuffer(retVal.substring(0, retVal.length() - 1));
			}
		}
		
		return retVal.toString();
	}
	
	/**
     * 对数组进行从小到大升序排列
     * @param intAttr
     * @return
     */
    public static Integer[] orderInturn(Integer[] intAttr){
		if(intAttr!=null && intAttr.length>0){
			for(int index = 0, j = 0, len = intAttr.length; index < len; index++){//从小到大，进行排序
				int temp = intAttr[index];
				j = index;
				
				while(++j < len){
					int tempj = intAttr[j];
					if(temp > tempj){
						intAttr[index] = tempj;
						intAttr[j] = temp;
						temp = tempj;
					}
				}
			}
		}
		
		return intAttr;
	}
    
    /**
     * 对数组进行从小到大升序排列
     * @param strAttr
     * @return
     */
    public static String[] orderInturn(String[] strAttr){
		if(strAttr!=null && strAttr.length>0){
			List<Integer> itemList = new ArrayList<Integer>();
			for(int index = 0, len = strAttr.length; index < len; index++){
				String itemStr = strAttr[index];
				if(StringUtils.isNotBlank(itemStr)){
					try{
						itemList.add(Integer.valueOf(itemStr));
					}catch(Exception e){}
				}
			}
			
			Integer[] itemAttr = itemList.toArray(new Integer[itemList.size()]);
			
			itemAttr = orderInturn(itemAttr);
			
			strAttr = new String[itemAttr.length];
			for(int index = 0, len = itemAttr.length; index < len; index++){
				strAttr[index] = String.valueOf(itemAttr[index]);
			}
		}
		
		return strAttr;
	}
    
    /**
	 * 提取一串url中的顶级域名
	 * @param path
	 * @return
	 */
	public static String getTopDomain(String path) {
		String pathInfo = path;
		pathInfo = pathInfo.replace("http://", "");
		int endIndex = pathInfo.indexOf("/");
		if (endIndex > 0) {
			pathInfo = pathInfo.substring(0, endIndex);
		}
		endIndex = pathInfo.indexOf(":");
		if (endIndex > 0) {
			pathInfo = pathInfo.substring(0, endIndex);
		}
		if (!isIP(pathInfo)) {
			int index = pathInfo.indexOf(".");
			pathInfo = pathInfo.substring(index + 1, pathInfo.length());
		}
		return pathInfo;
	}
	
	public static String resetDomain(String xxDomain, String topDomain) {
		if (StringUtils.isNotBlank(xxDomain)) {
			return xxDomain.replaceFirst(CommonFunctions.getTopDomain(xxDomain), topDomain);
		} else {
			return xxDomain;
		}
	}
	
	public static void initAppDomains(HttpServletRequest request, UserInfo userInfo,
			Map<String, Object> cookieMapInfo, String token) {
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		FileUrlProvideService fileUrlProvideService = ctx.getBean(FileUrlProvideService.class);
		IFunConfigurationService funConfigurationService = ctx.getBean(IFunConfigurationService.class);
		
		String topDomain = "";
		String httpUrl = request.getRequestURL().toString();
		if (!isIP(httpUrl)) {
			topDomain = cookieMapInfo == null ? CommonFunctions.getTopDomain(httpUrl) : null;
		}
		boolean isUpdate = false;
		
		if (session.getAttribute(ConstantValue.SESSION_TOKEN_KEY) == null) {
			isUpdate = true;
			session.setAttribute(ConstantValue.SESSION_TOKEN_KEY, token);//日志接口需要保存TOKEN,这里做下cookie的token保存
		} else {
			String oldToken = (String) session.getAttribute(ConstantValue.SESSION_TOKEN_KEY);
			if (!oldToken.equals(token)) {
				isUpdate = true;
				session.setAttribute(ConstantValue.SESSION_TOKEN_KEY, token);
			}
		}
		
		// 登陆域名
		if (cookieMapInfo != null) {
			topDomain = (String) cookieMapInfo.get(ConstantValue.USER_COOKIE_UAM_DOMAIN_KEY);// 获取域名
			if (session.getAttribute(App.TOP.getCode()) == null) {
				isUpdate = true;
				session.setAttribute(App.TOP.getCode(), topDomain);//从登录信息当中获取域名
			} else {
				String tempDomain = (String) session.getAttribute(App.TOP.getCode());
				if (!tempDomain.equals(topDomain)) {
					isUpdate = true;
					session.setAttribute(App.TOP.getCode(), topDomain);//从登录信息当中获取域名
				}
			}
			String uamLoginUrl = (String) cookieMapInfo.get(ConstantValue.REDIRECT_DOMAIN_KEY);
			String targetDomain = CommonFunctions.getTopDomain(uamLoginUrl);
			if (StringUtils.isNotBlank(uamLoginUrl) && CommonFunctions.isIP(targetDomain)) {
				ConstantValue.UAM_LOGIN_URL = uamLoginUrl;
			} else {
				ConstantValue.UAM_LOGIN_URL = uamLoginUrl.replace(targetDomain, topDomain);
			}
		}
		/*if (isUpdate || session.getAttribute(App.IMG.getCode()) == null) {
			String imgDoamin = fileUrlProvideService.getFileDomain();
			imgDoamin = imgDoamin + topDomain;
			session.setAttribute(App.IMG.getCode(), imgDoamin);
			session.setAttribute(App.IMG_ZZGRID.getCode(), imgDoamin + "/" + ConstantValue.RESOURSE_DOMAIN_KEY + "/");
		}*/
		for (App app : App.values()) {
			if (app.getType() == IDomain.REMOTE) {
				if (isUpdate || session.getAttribute(app.getCode()) == null) {
					CommonFunctions.setAppDomain(session, funConfigurationService, topDomain, app.getCode(), userInfo.getOrgCode());
				}
			}
		}
	}

	private static void setAppDomain(HttpSession session,
			IFunConfigurationService funConfigurationService, String topDomain,
			String appCode, String orgCode) {
		String appDomain = funConfigurationService.getAppDomain(appCode, orgCode, topDomain);
		if (StringUtils.isNotBlank(appDomain)) {
			session.setAttribute(appCode, appDomain.trim());
		} else {
			logger.error("请在系统管理->功能配置->域名配置->配置【" + appCode + "】的域名！");
		}
	}
	
	public static String getSendMsgUrl(HttpSession session) {
		return App.SMS.getDomain(session) + "/msgSend/sendPage.jhtml";
	}
	
	public static String getDomain(HttpSession session, String code) {
		String domain = "";
		if (StringUtils.isNotBlank(code)) {
			App[] apps = App.values();
			for (App app : apps) {
				if (code.trim().equals(app.getCode())) {
					domain = app.getDomain(session);
					break;
				}
			}
		}
		if (StringUtils.isBlank(domain)) new IllegalArgumentException("未找到【" + code + "】对应App域名");
		return domain;
	}
	
	public static boolean isIP(String httpUrl) {
		String addr = new String(httpUrl);
		if (StringUtils.isBlank(addr)) return false;
		addr = addr.trim();
		addr = addr.replaceFirst("http://", "").replaceFirst("https://", "");
		int i = addr.indexOf("/");
		if (i > 0) {
			addr = addr.substring(0, i);
		}
		i = addr.indexOf(":");
		if (i > 0) {
			addr = addr.substring(0, i);
		}
		if (addr.length() < 7 || addr.length() > 15 || "".equals(addr)) {
			return false;
		}
		/**
		 * 判断IP格式和范围
		 */
		String rexp = "([1-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}";

		Pattern pat = Pattern.compile(rexp);

		Matcher mat = pat.matcher(addr);

		boolean ipAddress = mat.find();

		return ipAddress;
	}
	
	/**
     * 判断map中key对应值是否非空
     * @param map
     * @param key
     * @return true为非空；false为空
     */
    public static boolean isNotBlank(Map<String, Object> map, String key){
    	return !isBlank(map, key);
    }
    
    /**
     * 判断map中key对应值是否为空
     * @param map
     * @param key
     * @return true为空；false为非空
     */
    public static boolean isBlank(Map<String, Object> map, String key){
    	boolean flag = true;
    	if(map!=null && StringUtils.isNotBlank(key)){
	    	Object keyObj = map.get(key);
	    	if(keyObj != null){
	    		String keyStr = keyObj.toString();
	    		flag = StringUtils.isBlank(keyStr);
	    	}
    	}
    	
    	return flag;
    }
    
    public static void message(HttpServletRequest request, HttpServletResponse response, String msg) throws IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		msg = new String(msg.getBytes("UTF-8"));
		Writer writer = response.getWriter();
		writer.write("<script>alert('" + msg + "');window.close();</script>");
		writer.flush();
		writer.close();
	}
    
	/**
	 * 根据名字获取cookie
	 * 
	 * @param request
	 * @param name
	 *            cookie名字
	 * @return
	 */
	public static Cookie getCookieByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = ReadCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie;
		} else {
			return null;
		}
	}

	/**
	 * 将cookie封装到Map里面
	 * 
	 * @param request
	 * @return
	 */
	private static Map<String, Cookie> ReadCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}
	
}