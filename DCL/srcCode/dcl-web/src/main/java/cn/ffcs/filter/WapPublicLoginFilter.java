package cn.ffcs.filter;

import cn.ffcs.cms.site.api.SiteService;
import cn.ffcs.cms.site.api.domain.Site;
import cn.ffcs.common.utils.AppDomainTools;
import cn.ffcs.common.utils.CommonFunctions;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.cookie.bo.UserCookie;
import cn.ffcs.cookie.service.UserCookieService;
import cn.ffcs.shequ.base.domain.db.OrgExtraInfo;
import cn.ffcs.shequ.base.service.IOrgService;
import cn.ffcs.shequ.wap.index.Sys;
import cn.ffcs.uam.bo.OrgEntityInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import cn.ffcs.uam.service.UserManageOutService;
import cn.ffcs.weixin.entity.wx.WeixinAccount;
import cn.ffcs.weixin.entity.wx.WeixinUser;
import cn.ffcs.weixin.service.WeiXinAccountService;
import cn.ffcs.weixin.service.WeiXinUserService;
import cn.ffcs.weixin.service.WeixinZoneAppUserService;
import cn.ffcs.zone.common.ZoneApiConstants;
import cn.ffcs.zone.external.SiteExternalDomainService;
import cn.ffcs.zone.external.domain.SiteExternalDomain;
import cn.ffcs.zone.memcache.MyZoneMemcacheService;
import cn.ffcs.zone.token.TokenService;
import cn.ffcs.zone.user.UserService;
import cn.ffcs.zone.user.domain.User;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 登录过滤器(公众版过滤器)
 * @author guohh
 *
 */
public class WapPublicLoginFilter implements Filter {

	/**
	 * 请求失败,被拦截跳转url
	 */

	private final String errorURI = "/wap/login/login.jhtml";//oa微信端，登录信息失效后重定向登录页的地址
	private final String wgRedirectUrl = "/app/wgRedirect.jhtml"; //网格请求过来，登录信息失效后重定向登录页的地址
	private final String appRedirectUrl = "/wap/login/chooseOrg.jhtml"; //app端请求过来，没有默认组织或者有多个组织，重定向到选择组织
	private static final int SESSION_TIME_OUT = 30; //session过期时间,单位分钟



	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 哪些路径可以直接被放行,[拓展使用]
	 */
	public List<String> excludeUrls;


	private WebApplicationContext ctx;
	private UserCookieService userCookieService;
	private OrgSocialInfoOutService orgSocialInfoOutService;
	private IOrgService orgService;
	private UserManageOutService userManageOutService;
	private IFunConfigurationService funConfigurationService;
	private SiteExternalDomainService siteExternalDomainService;
	private SiteService siteService;


	//个人中心的用户
	private UserService userService;

	private TokenService tokenService;

	private MyZoneMemcacheService myZoneMemcacheService;

	//存储公众号域名
	private Map<String,String> villDomain = new HashMap<>();


	/**
	 * Default constructor.
	 */
	public WapPublicLoginFilter() {

	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		req.setAttribute("base", req.getContextPath());
		req.setAttribute("ct", new Date().getTime());//引入js或css文件时,使用该变量作为请求随机数
		String requestURI = req.getRequestURI();
		String url = requestURI;	//带参数的请求路径:	eg:	/projectName/a/b?t=130087450
		String queryStr = req.getQueryString();
		if(queryStr != null){
			url += "?"+queryStr;
		}


		HttpSession session = req.getSession();
		//在这里直接初始化一些域名（这个会使用内存缓存域名。如果域名变动，需要调用清除缓存的接口，或者重启工程）
		AppDomainTools.putAppDomains(req);


		req.setAttribute("base", req.getContextPath());
		if(excludeUrls != null && !excludeUrls.isEmpty()){
			PathMatcher matcher = new AntPathMatcher();
			for(String excludeUrl : excludeUrls){
				if(matcher.match(excludeUrl, url)){
					//路径匹配成功的时候,直接放行
					logger.debug("成功匹配路径表达式:\t"+excludeUrl+"\t直接放行当前请求路径:\t"+url);
					String tokenVal = req.getParameter("token");
					if (StringUtils.isNotEmpty(tokenVal)) {
						try {
							//通过token获取用户信息
							User user = getByTokenVal(tokenVal);
							if(user != null){
								req.getSession().setAttribute(ConstantValue.ZONE_USER_SESSION, user);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					chain.doFilter(req, res);
					return;
				}
			}
		}

		String requestType = req.getHeader("X-Requested-With");
		if(StringUtils.isNotEmpty(requestType) &&
				"XMLHTTPREQUEST".equals(requestType.toUpperCase())){//如果是ajax请求则不保存路径

		}else{

			session.setAttribute(ConstantValue.LAST_REDIRECT_URL_IN_SESSION, url);
			session.setMaxInactiveInterval(SESSION_TIME_OUT * 60);
			logger.debug("lastUrl in filter===="+session.getAttribute(ConstantValue.LAST_REDIRECT_URL_IN_SESSION));
		}

		String userAgent = req.getHeader("user-agent").toLowerCase();
		logger.debug("userAgent====>"+userAgent);

		String paramToken = req.getParameter("token");
		if(paramToken == null){
			paramToken = req.getParameter("tokenKey");
		}
		//session中有用户信息、不需要重新登录
		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		if (user != null ) {
			chain.doFilter(req, res);
			return;
		}
		String app = request.getParameter("app");
		if (StringUtils.isNotEmpty(paramToken) &&  "app".equals(app) ) {
			//来自app
			this.appLoginOAuth(req, res, chain);
		} else if (userAgent.indexOf("micromessenger") > -1 && userAgent.indexOf("miniprogram") < 0) {
			//公众号
			this.weixinLoginOAuth(req, res, chain);

		} else if(userAgent.indexOf("miniprogram") > -1){
			//小程序
			this.miniprogramLoginOAuth(req, res, chain);
		}else{
			//pc端，需读取cookie信息
			this.appLoginOAuth(req, res, chain);
		}
	}

	/**
	 * 从UserCookie中获取系统用户(UserInfo对象)
	 * @param userCookie
	 * @param ctx
	 * @return
	 */
	private synchronized UserInfo getUserInfoMsgFromUserCookie(UserCookie userCookie){
		UserInfo userInfo = new UserInfo();
		userInfo.setUserId(userCookie.getUserId());
		userInfo.setOrgCode(userCookie.getOrgCode());//组织orgcode
		userInfo.setOrgId(userCookie.getOrgId());
		userInfo.setOrgName(userCookie.getOrgName());
		userInfo.setPartyId(userCookie.getPartyId());
		userInfo.setPartyName(userCookie.getPartyName());
		userInfo.setVerifyMobile(String.valueOf(userCookie.getVerifyMobile()));
		userInfo.setUserName(userCookie.getRegisValue());
		userInfo.setCatalogInfoId(userCookie.getCatalogInfoId());
		if(userCookie.getLocationList()!=null) {//地域编码(原有方式)
			for(OrgEntityInfoBO org : userCookie.getLocationList()){
				if (userInfo.getInfoOrgList() == null){
					userInfo.setInfoOrgList(new ArrayList<>());
				}
				OrgEntityInfoBO entity = new OrgEntityInfoBO();
				entity.setOrgId(org.getOrgId());
				entity.setOrgCode(org.getOrgCode());
				entity.setOrgName(org.getOrgName());
				entity.setLeaf(false);
				userInfo.getInfoOrgList().add(entity);
			}
		}
		//-- 获取用户归属地理地经纬度信息
		try {
			Long infoOrgId = (userInfo.getInfoOrgList()!=null && userInfo.getInfoOrgList().size()>0)?(userInfo.getInfoOrgList().get(0).getOrgId()):-1L;
			OrgExtraInfo orgExtraInfo = orgService.getOrgExtraInfo(infoOrgId); //获取信息域的中心点位
			userInfo.setOrgLatitude(orgExtraInfo.getLatitude());
			userInfo.setOrgLongitude(orgExtraInfo.getLongitude());
		} catch (Exception e) {
			logger.error("找不到userId："+userInfo.getUserId()+" 对应的组织地理信息！");
		}
		return userInfo;
	}

	/**
	 * 获取不需要经过过滤器的路径[拓展使用],路径之间使用";"分隔
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		String urlExclude = fConfig.getInitParameter("excludeUrls");
		if(urlExclude != null){
			excludeUrls = Arrays.asList(urlExclude.split(";"));
		}
		ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(fConfig.getServletContext());
		userCookieService = ctx.getBean("userCookieService", UserCookieService.class);
		orgSocialInfoOutService = ctx.getBean("orgSocialInfoOutService", OrgSocialInfoOutService.class);
		userManageOutService = ctx.getBean("userManageOutService", UserManageOutService.class);
		userService=ctx.getBean("userServiceForZone",UserService.class);
		tokenService=ctx.getBean("tokenService",TokenService.class);
		funConfigurationService=ctx.getBean("funConfigurationService", IFunConfigurationService.class);
		myZoneMemcacheService=ctx.getBean("myZoneMemcacheService",MyZoneMemcacheService.class);
		siteService=ctx.getBean("siteService",SiteService.class);



		this.siteExternalDomainService = (SiteExternalDomainService) ctx.getBean("siteExternalDomainService");
		/*	baseInfoService = (BaseInfoService) ctx.getBean("baseInfoService");*/
		try {
			orgService = ctx.getBean("orgService", IOrgService.class);
		} catch (BeansException e) {

		}
	}


	/**
	 * app端获取用户信息
	 * @param request
	 * @param response
	 * @param filterChain
	 * @throws IOException
	 * @throws ServletException
	 */
	public void appLoginOAuth(HttpServletRequest request,
							  HttpServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		logger.info("wap requestUrl: " + req.getRequestURL());
		HttpSession session = req.getSession();

		String token = req.getParameter("token");

		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		if (user != null && StringUtils.isEmpty(token)) {
			filterChain.doFilter(req, res);
			return;
		}

		// 验证参数传递是否正确
		if (StringUtils.isEmpty(token)) {
			logger.error("token 参数丢失,app  端获取个人中心用户信息出错");
			String zoneDomain="http://"+ ConstantValue.ZONE_DOMAIN+"/zone/app/login.mhtml?redirectType=1&proType=zhdj&outsideRedirectUrl="+req.getRequestURL();
			res.sendRedirect(zoneDomain);
			//res.sendRedirect(ZoneApiConstants.WECHAT_LONGIN_LING);
			return;
		}
		// 验证token是否过期
		try {
			boolean isTokenInvalid = tokenService.isTokenInvalid(token);
			if (!isTokenInvalid) {
				//writeErrorResponse(req, res, "令牌过期!");
				//令牌过期重定向到登录页面
				logger.error("token 令牌过期  ");
				String zoneDomain="http://"+ ConstantValue.ZONE_DOMAIN+"/zone/app/login.mhtml?redirectType=1&proType=zhdj&outsideRedirectUrl="+req.getRequestURL();
				res.sendRedirect(zoneDomain);
				return;
			} else {
				user = getByTokenVal(token);
				if(user != null){
					//这个是lbl处理退伍军人用的（目前不是很清楚逻辑）
					if(user.getUserId()==null) {
						user = tokenService.getUserInfo(token);
					}
					session.setAttribute(ConstantValue.ZONE_USER_SESSION,user);
					filterChain.doFilter(req, res);
				}else {
					logger.error("未获取到登录信息! ");
				}
			}
			String appDomain = funConfigurationService.getAppDomain(App.UI.getCode(), null, CommonFunctions.getTopDomain(request.getRequestURL().toString()));
			session.setAttribute("uiDomain", appDomain);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("令牌验证异常! ");
		}
	}



	/**
	 * 微信端获取用户信息
	 * @param request
	 * @param response
	 * @param filterChain
	 * @throws IOException
	 * @throws ServletException
	 */
	public void weixinLoginOAuth(ServletRequest request,
								 ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {

		System.out.println("=====================微信过滤器=======================");

		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			String uri  = req.getRequestURI();
			HttpSession session = req.getSession();
			String appDomain = funConfigurationService.getAppDomain(App.UI.getCode(), null, null);
			session.setAttribute("uiDomain", appDomain);
			String jsTicketDomain = request.getServerName();
			SiteExternalDomain siteExtDomain = siteExternalDomainService.getByExternalDomain(jsTicketDomain);

			String url = req.getRequestURL().toString();

			if(siteExtDomain!=null){
				String protocol = "http://";
				List<Site> sites = siteService.getSiteByDomain(siteExtDomain.getSiteDomain());
				if(sites!= null && sites.size() > 0){
					Site site = sites.get(0);
					protocol = site.getProtocol();
				}
				String siteDomain = protocol+siteExtDomain.getSiteDomain();
				String jsTicketUrl = siteDomain + ZoneApiConstants.WEIXIN_JSAPI_TOKIT_LINK;
				session.setAttribute("jsTicketUrl", jsTicketUrl);
			}
			String token = req.getParameter("token");
			if (StringUtils.isEmpty(token)) {
				token = (String) session.getAttribute("token");
			}
			User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

			if (user != null) {
				System.out.println("修改前user = "+url);

				//判断是否改变url
				url =	this.getCount(url,user.getOrgCode());

				String mainTit =	villDomain.get(user.getOrgCode());

				if(StringUtils.isNotEmpty(mainTit)){
					session.setAttribute("mainTit",mainTit);
				}

				//	res.sendRedirect(url);

				System.out.println("修改后user = "+url);
				filterChain.doFilter(req, res);
				return;
			}
			String tokenUserId = req.getParameter("tokenUserId");
			if(tokenUserId == null){
				tokenUserId = (String) session.getAttribute("tokenUserId");
			}

			if(tokenUserId != null){
				session.setAttribute("tokenUserId", tokenUserId);
				user = userService.getByUserId(Long.parseLong(tokenUserId));
				session.setAttribute(ConstantValue.ZONE_USER_SESSION,user);
				session.setAttribute("orgCode",user.getOrgCode());
				optTokenUserId(tokenUserId,session,request,response);
				System.out.println("修改前tokenUserId = "+url);

				//判断是否改变url
				url =	this.getCount(url,user.getOrgCode());

				String mainTit =	villDomain.get(user.getOrgCode());

				if(StringUtils.isNotEmpty(mainTit)){
					session.setAttribute("mainTit",mainTit);
				}

				System.out.println("修改后tokenUserId = "+url);
				//res.sendRedirect(url);

				filterChain.doFilter(request, response);
				return;
			}
			if(token!=null){
				Map<String, Object> resultMap = myZoneMemcacheService.decodeUrlKey(token, true);
				if(resultMap != null){
					session.setAttribute(ConstantValue.ZONE_USER_SESSION, this.setWapUser(resultMap));
					session.setAttribute("orgCode",resultMap.get("orgCode"));
					session.setAttribute("token",token);
					System.out.println("修改前token = "+url);
					//判断是否改变url
					url =	this.getCount(url,resultMap.get("orgCode").toString());

					String mainTit =	villDomain.get(resultMap.get("orgCode").toString());

					if(StringUtils.isNotEmpty(mainTit)){
						session.setAttribute("mainTit",mainTit);
					}
					System.out.println("修改后token = "+url);
				//	res.sendRedirect(url);
				}
				getAccountAppId(req,token);
				filterChain.doFilter(request, response);
				return;
			} else {
				String redirectUrl = getRedirectUrl(req);
				System.out.println("redirectUrl = "+redirectUrl);
				res.sendRedirect(redirectUrl);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 传入 地域  url ,判断是否修改域名
	public  String getCount(String str, String code){

		if(str == null || "".equals(str.trim()) || str.indexOf("cn")==-1 ){
			return str;
		}

		//截取域名部门
		String  domain =	str.substring(7,str.indexOf("cn"));

		int count = 0;
		int index = 0;
		while((index=domain.indexOf(".",index))!=-1){
			index = index+".".length();
			count++;
		}

		//有公众号域名头
		if(count==3){

			domain =domain.substring(0,domain.indexOf("."));

			if(StringUtils.isNotEmpty(domain)){
				villDomain.put(code,domain );

				//	System.out.println( "villMap"+ code +","+domain);
			}

			//无公众号域名头
		}else if(count==2){

			//尝试从当前地域中获取 域名
			String	nowDomain =	villDomain.get(code);

			if(StringUtils.isNotEmpty(nowDomain)){
				return  "http://" + nowDomain +"."+ str.substring(7);
			}

		}

		return str;
	}

	public void miniprogramLoginOAuth(ServletRequest request,
									  ServletResponse response, FilterChain filterChain){
		logger.debug("=====================小程序过滤器=======================");
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			String uri = req.getRequestURI();
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
			if (user != null) {
				//缓存中已经用用户，直接登录
				filterChain.doFilter(req, res);
				return;
			}
			//获取token（小程序目前类似于app，如果登录成功。会在原生页面传递token给应用，类似安卓原生处理）

			String token = req.getParameter("token");
			if (StringUtils.isEmpty(token)) {
				token = req.getParameter("tokenKey");
			}

			if (StringUtils.isEmpty(token)){
				token = (String)session.getAttribute("token");
			}

			Map<String, Object> userMap = tokenService.getUserMapByToken(token);
			if(userMap != null){
				Long userId = Long.valueOf((String) userMap.get("USER_ID"));
				if(userId!= null){
					user = userService.getByUserId(userId);
					session.setAttribute(ConstantValue.ZONE_USER_SESSION,user);
					session.setAttribute("orgCode",user.getOrgCode());
					filterChain.doFilter(req, res);
					return;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 设置session用户信息
	 * @param resultMap
	 * @return
	 */
	private User setWapUser(Map<String, Object> resultMap) {

		String userId = String.valueOf(resultMap.get("userId"));
		User userTmp = userService.getByUserId(Long.parseLong(userId));
//			BaseInfo baseInfo = new BaseInfo();
//			baseInfo.setPhone(userTmp.getMobile());
//			BaseInfo resultBo = baseInfoService.searchByBo(baseInfo);
//			//如果没有党员信息。
//			if(resultBo != null){
//				User user = new User();
//				user.setUserId(resultBo.getUserId());
//				user.setOrgCode(resultBo.getOrgCode());
//				user.setUserName(resultBo.getName());
//				user.setMobile(resultBo.getPhone());
//				user.setAccount(resultBo.getPhone());
//				return user;
//			}
		return userTmp;
	}

	/**
	 * 获取去网站群获取用户数据的回调地址
	 * @param request
	 * @param token
	 * @return
	 */
	private String getRedirectUrl(HttpServletRequest request){
		String backUrl = null;
		try {
			backUrl =  (String) request.getSession().getAttribute("backUrl");
			if(backUrl==null){
				String domain = request.getServerName();
				String requestUrl = request.getRequestURL().toString();
				System.out.println("domain = "+domain);
				SiteExternalDomain siteExtDomain = siteExternalDomainService.getByExternalDomain(domain);
				if(siteExtDomain!=null && !cn.ffcs.system.publicUtil.StringUtils.isBlank(siteExtDomain.getExternalDomain())){
					backUrl = siteExtDomain.getSiteDomain();
					String protocol = "http://";
					List<Site> sites = siteService.getSiteByDomain(siteExtDomain.getSiteDomain());
					if(sites!= null && sites.size() > 0){
						Site site = sites.get(0);
						protocol = site.getProtocol();
					}
					//backUrl = "http://" + backUrl + ZoneApiConstants.FRONTDYNAMIC_LINK_UNIFIED+"?url="+requestUrl;
					backUrl = protocol + backUrl + ZoneApiConstants.FRONTDYNAMIC_LINK_UNIFIED;
					request.getSession().setAttribute("backUrl", backUrl);
				}else{
					siteExtDomain = new SiteExternalDomain();
					String externalDomain = domain;
					//获取前缀
					String djDomain = funConfigurationService.getAppDomain("$DJ_DOMAIN", null, null);
					String prefix = domain.replace(djDomain.replace("http://","").replace("https://",""), "").replace("http://","").replace("https://","");
					//拼接网站群站点域名 http://fjs.xqzz.ssdat.com.cn
					String siteDomain = prefix + djDomain.replace("http://dj.","").replace("https://dj.","");
					System.out.println("siteDomain======"+siteDomain);
					siteExtDomain.setExternalDomain(externalDomain);
					siteExtDomain.setSiteDomain(siteDomain);
					//siteExternalDomainService.insertEntity(siteExtDomain);
					backUrl = siteExtDomain.getSiteDomain();
					String protocol = "http://";
					List<Site> sites = siteService.getSiteByDomain(siteExtDomain.getSiteDomain());
					if(sites!= null && sites.size() > 0){
						Site site = sites.get(0);
						protocol = site.getProtocol();
					}
					backUrl = protocol + backUrl + ZoneApiConstants.FRONTDYNAMIC_LINK_UNIFIED;
					request.getSession().setAttribute("backUrl", backUrl);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("backUrl = "+backUrl);
		//java 获取请求 URL
		String   strBackUrl  = request.getScheme()+"://"; //请求协议 http 或 https
		strBackUrl+=request.getHeader("host");  // 请求服务器
		strBackUrl+=request.getRequestURI();     // 工程名
		if(request.getQueryString()!=null) //判断请求参数是否为空
			strBackUrl+="?"+request.getQueryString();   // 参数
		System.out.println("strBackUrl = "+strBackUrl);
		String redirectUrl = backUrl+"?url="+strBackUrl;
		System.out.println("redirectUrl = "+redirectUrl);
		return redirectUrl;
	}

	private String getTopDomain(String path) {
		try {
			// 判断是否是IP，如果是IP就为空不转抱紧
			String pathInfo = path;
			pathInfo = pathInfo.replace("http://", "");
			Pattern pattern = Pattern.compile(".*\\d+\\.\\d+\\.\\d+\\.\\d+.*");
			Matcher matcher = pattern.matcher(pathInfo);
			if (matcher.matches()) {
				return null;
			}
			int endIndex = pathInfo.indexOf("/");
			if (endIndex == 0) {
				return null;
			} else if (endIndex > 0) {
				pathInfo = pathInfo.substring(0, endIndex);
			}

			int index = pathInfo.indexOf(".");
			pathInfo = pathInfo.substring(index + 1, pathInfo.length());

			if (pathInfo.indexOf(":") > 0) {
				pathInfo = pathInfo.substring(0, pathInfo.indexOf(":"));
			}
			return pathInfo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 根据tokenUserId获取用户数据
	 * @param userIdStr
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	private boolean optTokenUserId(String userIdStr, HttpSession session, ServletRequest request, ServletResponse response){
		try {
			if(cn.ffcs.system.publicUtil.StringUtils.isEmpty(userIdStr))
				return true;
			Long userId = Long.parseLong(userIdStr);
			User user = userService.getByUserId(userId);
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			if(user != null){
				WeixinZoneAppUserService wxZoneAppUserService = ctx.getBean("weixinZoneAppUserService", WeixinZoneAppUserService.class);
				WeiXinUserService wxUserService = ctx.getBean("weiXinUserService", WeiXinUserService.class);
				WeiXinAccountService accountService = ctx.getBean("weiXinAccountService", WeiXinAccountService.class);
				Long wxUserId = wxZoneAppUserService.findByAppUserId(userId).getWxUserId();
				WeixinUser query = new WeixinUser();
				query.setUserId(wxUserId);
				List<WeixinUser> wxUsers = wxUserService.getWeiXinUsers(query);
				boolean flag = wxUsers==null || wxUsers.size()==0;
				if(flag)
					return false;
				WeixinUser wxUser = wxUsers.get(0);
				String openId = wxUser.getOpenId();
				WeixinAccount wxAccount = accountService.getWeiXinAccountByOpenId(openId);
				System.out.println("openId=" + openId);
				req.getSession().setAttribute(ConstantValue.MOBILE_WEIXIN_OPENID, openId);
				System.out.println("accountAppId=" + wxAccount.getAccountAppId());
				req.getSession().setAttribute(ConstantValue.MOBILE_WEIXIN_ACCOUNTAPPID, wxAccount.getAccountAppId());

				return true;
			}else{
				session.invalidate();
				writeErrorResponse(req, res, "用户不存在");
				return false;
			}
		} catch (Exception e) {
			session.invalidate();
			e.printStackTrace();
		}

		return false;

	}

	/**
	 * 将微信端AccountAppId保存到session
	 * @param request
	 * @param token
	 * @throws Exception
	 */
	private void getAccountAppId(HttpServletRequest request, String token)
			throws Exception {
		String resultKey = myZoneMemcacheService.decodeUrlKeyRtKey(token, true);
		System.out.println("resultKey=" + resultKey);
		if (!cn.ffcs.system.publicUtil.StringUtils.isBlank(resultKey)) {
			String resultArr[] = resultKey.split("@");
			if (resultArr != null && resultArr.length > 0) {
				String openId = resultArr[0];
				System.out.println("openId=" + openId);
				request.getSession().setAttribute(ConstantValue.MOBILE_WEIXIN_OPENID, openId);
				String accountAppId = resultArr[2];
				System.out.println("accountAppId=" + accountAppId);
				request.getSession().setAttribute(ConstantValue.MOBILE_WEIXIN_ACCOUNTAPPID, accountAppId);
			}
		}
	}

	/**
	 * 向客户端写错误提示信息
	 *
	 * @param response
	 * @throws IOException
	 */
	private void writeErrorResponse(HttpServletRequest request,
									HttpServletResponse response, String message) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("<HEAD><TITLE>" + message + "</TITLE></HEAD>");
			out.println("<BODY>");
			out.print("<span style='font-size: 24px; font-weight: bold;'>"
					+ message + "</span>");
			out.println("</BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		}
	}

	/**
	 * 通过token获取用户信息
	 * @param tokenVal
	 * @return
	 * @throws Exception
	 */
	private User getByTokenVal(String tokenVal)throws Exception{
		Map<String, Object> userInfo = tokenService.getUserMapByToken(tokenVal);
		User user = null;
		if (userInfo != null) {
			user = new User();
			String orgCode = (String) userInfo.get("ORG_CODE");
			if (StringUtils.isNotBlank(orgCode)) {
				user.setOrgCode(orgCode);
			}
			String orgName = (String) userInfo.get("ORG_NAME");
			if (StringUtils.isNotBlank(orgName)) {
				user.setOrgName(orgName);
			}
			String userId = (String) userInfo.get("USER_ID");
			if (StringUtils.isNotBlank(userId)) {
				user.setUserId(Long.valueOf(userId));
			}
			String account = (String) userInfo.get("ACCOUNT");
			if (StringUtils.isNotBlank(account)) {
				user.setAccount(account);
			}
			String userName = (String) userInfo.get("USER_NAME");
			if (StringUtils.isNotBlank(userName)) {
				user.setUserName(userName);
			}
			String nickName = (String) userInfo.get("NICKNAME");
			if (StringUtils.isNotBlank(nickName)) {
				user.setNickname(nickName);
			}
			String mobile = (String) userInfo.get("MOBILE");
			if (StringUtils.isNotBlank(mobile)) {
				user.setMobile(mobile);
			}
		}
		return user;
	}
}
