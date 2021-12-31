package cn.ffcs.filter;

import cn.ffcs.common.utils.AppDomainTools;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.cookie.bo.UserCookie;
import cn.ffcs.cookie.service.UserCookieService;
import cn.ffcs.system.publicUtil.Base64;
import cn.ffcs.uam.bo.OrgEntityInfoBO;
import cn.ffcs.uam.bo.OrgSocialInfoBO;
import cn.ffcs.uam.bo.UserExBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import cn.ffcs.uam.service.UserManageOutService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 手机端管理员账号登录过滤器,通过token获取用户信息（网格版过滤器）
 */
public class WapLoginFilter implements Filter {
    //	private final String errorURI = "/wap/login/login.mhtml";//oa微信端，登录信息失效后重定向登录页的地址
    private final String wgRedirectUrl = "/app/wgRedirect.jhtml"; //网格请求过来，登录信息失效后重定向登录页的地址
    private final String appRedirectUrl = "/wap/login/chooseOrg.jhtml"; //app端请求过来，没有默认组织或者有多个组织，重定向到选择组织

    private static final int SESSION_TIME_OUT = 30; //session过期时间,单位分钟
    private final Logger logger = LoggerFactory.getLogger(getClass());
    /**
     * 哪些路径可以直接被放行,[拓展使用]
     */
    public List<String> excludeUrls;

    private UserCookieService userCookieService;
    private OrgSocialInfoOutService orgSocialInfoOutService;
    //	private IOrgService orgService;
    private UserManageOutService userManageOutService;

    /**
     * Default constructor.
     */
    public WapLoginFilter() {

    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        req.setAttribute("ct", new Date().getTime());//引入js或css文件时,使用该变量作为请求随机数
        String url = req.getRequestURI();    //带参数的请求路径:	eg:	/projectName/a/b?t=130087450
        String queryStr = req.getQueryString();
        if (queryStr != null) {
            url += "?" + queryStr;
        }
        if (logger.isDebugEnabled()) {
            logger.debug("当前请求路径:\t" + url);
        }
        //在这里直接初始化一些域名（这个会使用内存缓存域名。如果域名变动，需要调用清除缓存的接口，或者重启工程）
        AppDomainTools.putAppDomains(req);

        if (excludeUrls != null && !excludeUrls.isEmpty()) {
            PathMatcher matcher = new AntPathMatcher();
            for (String excludeUrl : excludeUrls) {
                if (matcher.match(excludeUrl, url)) {//路径匹配成功的时候,直接放行
                    if (logger.isDebugEnabled()) {
                        logger.debug("成功匹配路径表达式:\t" + excludeUrl + "\t直接放行当前请求路径:\t" + url);
                    }
                    chain.doFilter(req, res);
                    return;
                }
            }
        }
        String requestType = req.getHeader("X-Requested-With");
        if (StringUtils.isEmpty(requestType) ||
                !"XMLHTTPREQUEST".equals(requestType.toUpperCase())) {//如果是ajax请求则不保存路径
            //session中保存上次的访问路径
            session.setAttribute(ConstantValue.LAST_REDIRECT_URL_IN_SESSION, url);
            session.setMaxInactiveInterval(SESSION_TIME_OUT * 60);
        }
        String paramToken = req.getParameter("token");
        if (paramToken == null) {
            paramToken = req.getParameter("tokenKey");
        }
        String sessionToken = (String) session.getAttribute("token");
        String userOrgCode = req.getParameter("userOrgCode");//传参过来的组织参数
        UserInfo userInfo;
        if (StringUtils.isNotEmpty(paramToken) && StringUtils.isNotEmpty(sessionToken)) {
            if (sessionToken.equals(paramToken)) {
                userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
                if (userInfo != null && StringUtils.isEmpty(userOrgCode)) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        } else {
            userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            if (userInfo != null && StringUtils.isEmpty(userOrgCode)) {
                chain.doFilter(request, response);
                return;
            }
        }

        String app = request.getParameter("app");
        if (StringUtils.isNotEmpty(paramToken) && "app".equals(app)) {//来自app
            appRequest(req, res, chain);
        } else {
            appRequest(req, res, chain);
        }
    }

    /**
     * 从UserCookie中获取系统用户(UserInfo对象)
     */
    private synchronized UserInfo getUserInfoMsgFromUserCookie(UserCookie userCookie) {
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
//      userInfo.setRegionCode(userCookie.getLocationCode());//地域编码(新方式)
        userInfo.setInfoOrgList(userCookie.getLocationList());
        //-- 获取用户归属地理地经纬度信息
//        try {
//			Long infoOrgId = (userInfo.getInfoOrgList()!=null && userInfo.getInfoOrgList().size()>0)?(userInfo.getInfoOrgList().get(0).getOrgId()):-1L;
//			OrgExtraInfo orgExtraInfo = orgService.getOrgExtraInfo(infoOrgId); //获取信息域的中心点位
//			userInfo.setOrgLatitude(orgExtraInfo.getLatitude());
//			userInfo.setOrgLongitude(orgExtraInfo.getLongitude());
//        } catch (Exception e) {
//            logger.error("找不到userId：" + userInfo.getUserId() + " 对应的组织地理信息！");
//        }
        return userInfo;
    }

    /**
     * 获取不需要经过过滤器的路径[拓展使用],路径之间使用";"分隔
     */
    public void init(FilterConfig fConfig) {
        String urlExclude = fConfig.getInitParameter("excludeUrls");
        if (urlExclude != null) {
            excludeUrls = Arrays.asList(urlExclude.split(";"));
        }
        WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(fConfig.getServletContext());
        userCookieService = ctx.getBean("userCookieService", UserCookieService.class);
        orgSocialInfoOutService = ctx.getBean("orgSocialInfoOutService", OrgSocialInfoOutService.class);
        userManageOutService = ctx.getBean("userManageOutService", UserManageOutService.class);
    }

    /**
     * app端过来的请求
     */
    private void appRequest(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String token = req.getParameter("token");
        if (token == null) {
            token = req.getParameter("tokenKey");
        }
        if (token == null) {
            token = (String) session.getAttribute("token");
        }
        if (token != null) {
            session.setAttribute("token", token);
            token = new String(Base64.decode(token.getBytes()), StandardCharsets.UTF_8);
            UserCookie userCookie = userCookieService.getUserCookieForMobile(token);
            session.setAttribute(ConstantValue.USER_COOKIE_MOBILE, userCookie);
            if (userCookie != null) {
                String userOrgCode = req.getParameter("userOrgCode");//传参过来的组织参数
                UserInfo userInfo = getUserInfoMsgFromUserCookie(userCookie);
                if (StringUtils.isEmpty(userCookie.getOrgCode()) || StringUtils.isNotEmpty(userOrgCode)) {
                    logger.debug("当前登录用户\"" + userCookie.getPartyName() + "\"没有默认组织");
                    List<UserExBO> exBolist = null;
                    try {
                        exBolist = userManageOutService.findUserExBoForUserId(userCookie.getUserId());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (exBolist != null && exBolist.size() > 0) {
                        if (exBolist.size() == 1 || userOrgCode != null) {//只有一个组织，不需要进行选择组织
                            if (userOrgCode != null) {
                                OrgSocialInfoBO socil = orgSocialInfoOutService.selectOrgSocialInfoByOrgCode(userOrgCode);
                                userCookie.setOrgCode(socil.getOrgCode());
                                userCookie.setOrgId(socil.getOrgId());
                                userCookie.setOrgName(socil.getOrgName());
                            } else {
                                UserExBO ueb = exBolist.get(0);
                                userCookie.setOrgCode(ueb.getOrgCode());
                                userCookie.setOrgId(ueb.getSocialOrgId());
                                userCookie.setOrgName(ueb.getOrgName());
                            }
                            // 地域信息
                            List<OrgEntityInfoBO> orgBoList = new ArrayList<>();
                            OrgEntityInfoBO orgBo = orgSocialInfoOutService.selectOrgEntityInfoByOrgCode(userCookie.getOrgCode());
                            if (orgBo != null) {
                                orgBoList.add(orgBo);
                            }
                            userCookie.setLocationList(orgBoList);
                            session.setAttribute(ConstantValue.USER_COOKIE_MOBILE, userCookie);
                            userInfo = getUserInfoMsgFromUserCookie(userCookie);

                            session.setAttribute(ConstantValue.USER_IN_SESSION, userInfo);
                            int success = userCookieService.setUserCookieForMobile(token, userCookie);
                            if (success == 0) {
                                if (logger.isDebugEnabled()) {
                                    logger.debug("用户登录信息设置到memcache成功.......");
                                }
                            } else {
                                logger.error("用户登录时，用户登录信息设置到memcache失败.......");
                            }
                        } else {//用户有多个组织，需要跳转到组织选择页面
                            userInfo = getUserInfoMsgFromUserCookie(userCookie);
                            session.setAttribute(ConstantValue.USER_IN_SESSION, userInfo);
                            //跳转页面
                            res.sendRedirect(req.getContextPath() + appRedirectUrl);
                            return;
                        }
                    } else {
                        logger.error("\"" + userCookie.getPartyName() + "\"没有挂到任何组织下，获取当前用户(userId=" + userCookie.getUserId() + ")的组织失败....");
                    }
                }
                session.setAttribute(ConstantValue.USER_IN_SESSION, userInfo);
                chain.doFilter(req, res);
            } else {
                logger.error("token获取用户信息失败!");
                //session.invalidate();
                res.sendRedirect(req.getContextPath() + wgRedirectUrl);//跳转页面
            }
        } else {
            logger.error("token为空,并且session中没有user对象");
            //session.invalidate();
            res.sendRedirect(req.getContextPath() + wgRedirectUrl);//跳转页面
        }
    }

    /**
     * 用户切换组织后需要将切换后的组织编码重新设置到session中的用户数据中 UN
     */
    @Deprecated
    private void resetUserOrgCode(HttpSession session, UserInfo userInfo, String userOrgCode) {
        if (StringUtils.isBlank(userOrgCode) || userOrgCode.equals(userInfo.getOrgCode())) {
            return;
        }
        if (logger.isDebugEnabled()) {
            logger.debug("=========用户切换了组织============{}", userOrgCode);
        }
        userInfo.setOrgCode(userOrgCode);
        session.setAttribute(ConstantValue.ADMIN_WAP_USER_IN_SESSION, userInfo);
    }

}
