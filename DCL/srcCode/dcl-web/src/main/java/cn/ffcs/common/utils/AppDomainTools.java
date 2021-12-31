package cn.ffcs.common.utils;

import cn.ffcs.common.utils.domain.App;
import cn.ffcs.uam.service.IFunConfigurationService;
import org.springframework.util.Assert;
import cn.ffcs.dcl.utils.SpringContextUtil;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 缓存所有的功能配置的域名
 * @author zkongbai
 *
 */
public class AppDomainTools {

	private static Map<String,String> cacheDomainMap = new HashMap<String, String>();

	/** 
	 * 设置域名到缓存与request
	 * @param request
	 */
	public static void putAppDomains(ServletRequest request) {
		App[] apps = App.values();
		for(App app : apps) {
			request.setAttribute(app.getCode(), getAppDomain(app));
			request.setAttribute(app.getCode().replace("$", ""), getAppDomain(app));
		}
	}
	
	/**
	 *  功能配置获取域名
	 * @return
	 */
	public static String getAppDomain(App app){
		Assert.notNull(app,"param is null");
		if(cacheDomainMap.get(app.getCode()) != null) {
			return cacheDomainMap.get(app.getCode());
		}
		String domain  = SpringContextUtil.getBean(IFunConfigurationService.class).getAppDomain(app.getCode(),null, null);
		if(domain != null) {
			cacheDomainMap.put(app.getCode(), domain);
			return cacheDomainMap.get(app.getCode());
		}
		return "";
	}
	
	/**
	 * 获取缓存
	 * @return
	 */
	public static Map<String,String> getCachedDomain() {
		return cacheDomainMap;
	}
	
	/**
	 *  重置缓存功能
	 */
	public static Map<String,String> resetCachedDomain(HttpServletRequest request) {
		cacheDomainMap.clear();
		putAppDomains(request);
		return getCachedDomain();
	}
}
