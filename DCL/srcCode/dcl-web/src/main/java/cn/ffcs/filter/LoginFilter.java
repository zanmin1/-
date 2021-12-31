/**
 *
 */
package cn.ffcs.filter;

import cn.ffcs.common.CommonFunctions;
import cn.ffcs.common.utils.Base64;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.CookieUtils;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.cookie.bo.UserCookie;
import cn.ffcs.cookie.service.UserCookieService;
import cn.ffcs.shequ.base.domain.db.OrgExtraInfo;
import cn.ffcs.shequ.base.service.IOrgService;
import cn.ffcs.uam.bo.OrgEntityInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import com.ffcs.auth.platform.spring.util.AESEncoder;
import com.ffcs.auth.platform.spring.util.RSAEncoder;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 登录过滤器
 * @author guohh
 *
 */
public class LoginFilter implements Filter {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public void destroy() {
        // TODO Auto-generated method stub

    }

    /* (non-Javadoc)
     * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        logger.info("requestUrl: "+req.getRequestURL());


        //-- upload的不过滤
        String reqUri = req.getRequestURI();
        if(reqUri.contains("upLoadFile4x") ||reqUri.contains("upload") || reqUri.contains("getImportStatus")||reqUri.contains("/upFileServlet")
                || reqUri.contains("getSyncStatus")|| reqUri.contains("getExportStatus")|| reqUri.contains("oauth")) {
            filterChain.doFilter(req, res);
        } else {
            //-- 获取session中的用户信息
            HttpSession session = req.getSession();
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            ServletContext servletContext = session.getServletContext();
            WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);

            if(request.getParameter("defaultPageAction")!=null){
            	session.setAttribute("defaultPageAction", request.getParameter("defaultPageAction"));
            }else{
            	session.setAttribute("defaultPageAction", null);
            	//session.removeAttribute("defaultPageAction");
            }

            logger.info("==================统一认证 认证开始===================================");
            if (CookieUtils.getCookie(req, "UAM_TOKEN_FLAG") != null && (CookieUtils.getCookie(req, "UAM_TOKEN_FLAG").getValue()).equals("0")) {
                String tokenflag = CookieUtils.getCookie(req, "UAM_TOKEN_FLAG").getValue();
                String resourcekey = CookieUtils.getCookie(req, "resourcekey").getValue();
                String resource = CookieUtils.getCookie(req, "resource").getValue();
                if (tokenflag == null || !"0".equals(tokenflag) || resourcekey == null || resource == null) {
                    logger.info("cookies有认证信息存在---------------------->但是tokenflag为空，登录失败，清空session");
                    userInfo=null;
                    // ConstantValue.USER_INFO_IN_SESSION = null;
                    session.invalidate();
                } else {
                    try {
						if (!resourcekey.endsWith("==")) {
							resourcekey = resourcekey.concat("==");
						}
                        byte[] result = RSAEncoder.decryptByPublicKey(Base64.decode(resourcekey), ConstantValue.UAM_PUBLIC_KEY.getBytes());
                        String keyresoure = new String(result);
                        logger.info("keyresoure---------------------->" + keyresoure);
                        String token = AESEncoder.decryptAES(resource, keyresoure);
                        logger.info("token---------------------->" + token);

                        UserCookieService userCookieService = (UserCookieService) ctx.getBean("userCookieService");
                        //-- 根据token从统一认证中获取登录的用户信息
                        //UserCookie userCookie = userCookieService.getUserCookie(token);
                        //-- 新版userCookie改造，改成从map中获取userCookie
                        Map<String, Object> cookieMapInfo = userCookieService.getUserCookieAsMap(token);
                        if(cookieMapInfo!=null) {
	                        UserCookie userCookie = (UserCookie) cookieMapInfo.get(ConstantValue.USER_COOKIE_KEY);
	                        if(userCookie==null || userCookie.getUserId()==null || userCookie.getUserId()<=0L
	                                || userCookie.getOrgCode()==null || "".equals(userCookie.getOrgCode())
	                                || userCookie.getLocationList()==null || userCookie.getLocationList().size()==0) {
	                            logger.info("统一认证memcache中用户信息有误，系统判定非法进入，清空session");
	                            userInfo=null;
	                            // ConstantValue.USER_INFO_IN_SESSION = null;
	                            session.invalidate();
	                        } else {
	                        	session.setAttribute(ConstantValue.USER_COOKIE_IN_SESSION, userCookie);
	                            //add by zhanggf for 人口管理
	                            session.setAttribute(ConstantValue.SESSION_KEY_USERCOOKIE, userCookie);
	                            session.setAttribute(ConstantValue.SESSION_KEY_USERID, userCookie.getUserId());
	                            List<OrgEntityInfoBO> boList = userCookie.getLocationList();
	    						session.setAttribute(ConstantValue.SESSION_KEY_LOCATION_LIST, boList);
	    						//end
	    						//操作权限
	    						if( !StringUtils.isEmpty(req.getParameter("system_privilege_action"))){
	    							session.setAttribute("system_privilege_action", req.getParameter("system_privilege_action"));
	    						}
	    						session.setAttribute("system_role",userCookie.getRoleList());
						// ================新增解决越权失效问题==================
								String orgCode = null;
								List<OrgEntityInfoBO> orgList = userCookie.getLocationList();
								if(orgList != null && orgList.size() > 0){
									orgCode = orgList.get(0).getOrgCode();
									logger.info("=======userCookie.getLocationList() has elements, the fist value is:" + orgCode);
								}

								if(StringUtils.isBlank(orgCode)){
									logger.info("=======userCookie.getLocationList not get orgCode, so get userCookie.getOrgCode()");
									orgCode = userCookie.getOrgCode();
								}
								session.setAttribute("SQ_ORG_CODE", userCookie.getOrgCode());
								session.setAttribute("SQ_GRID_CODE", orgCode);
						// ================新增解决越权失效问题==================
	                            boolean userInfoChange = false;
	                            UserInfo oldUserInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
	                            if(oldUserInfo==null) userInfoChange = true;
	                            if(!userInfoChange && oldUserInfo.getUserId().longValue()!=userCookie.getUserId().longValue()) userInfoChange = true;
	                            if(!userInfoChange && !oldUserInfo.getOrgCode().equals(userCookie.getOrgCode())) userInfoChange = true;
	                            if(!userInfoChange && oldUserInfo.getInfoOrgList().size()!=userCookie.getLocationList().size()) userInfoChange = true;
	                            if(!userInfoChange) {
	                            	for(OrgEntityInfoBO org : userCookie.getLocationList()) {
	                            		boolean isExists = false;
										for(OrgEntityInfoBO org1 : oldUserInfo.getInfoOrgList()) {
	                            			if(org.getOrgId().longValue()==org1.getOrgId().longValue()) {
	                            				isExists = true;
	                            				break;
	                            			}
	                            		}
	                            		if(!isExists) {
	                            			userInfoChange = true;
	                            			break;
	                            		}
	                            	}
	                            }
	                            if(userInfoChange) {
		                            //-- 从userCookie生成本地UserInfo信息
		                            userInfo = new UserInfo();
		                            userInfo.setOrgCode(userCookie.getOrgCode());
		                            userInfo.setOrgId(userCookie.getOrgId());
		                            userInfo.setOrgName(userCookie.getOrgName());
		                            userInfo.setPartyId(userCookie.getPartyId());
		                            userInfo.setPartyName(userCookie.getPartyName());
		                            userInfo.setVerifyMobile(String.valueOf(userCookie.getVerifyMobile()));
		                            userInfo.setUserId(userCookie.getUserId());
		                            userInfo.setUserName(userCookie.getRegisValue());
		                            userInfo.setCatalogInfoId(userCookie.getCatalogInfoId());
		                            if(userCookie.getLocationList()!=null) {
										if (userInfo.getInfoOrgList() == null) {
											userInfo.setInfoOrgList(new ArrayList());
										}

										for(OrgEntityInfoBO org : userCookie.getLocationList()){
											OrgEntityInfoBO entity = new OrgEntityInfoBO();
											entity.setOrgId(org.getOrgId());
											entity.setOrgCode( org.getOrgCode());
											entity.setOrgName(org.getOrgName());
											entity.setLeaf(false);
											userInfo.getInfoOrgList().add(entity);
										}
		                            }
		                            //-- 获取用户归属地理地经纬度信息
		                            try {
		                            	IOrgService orgService = (IOrgService) ctx.getBean("orgService");
		                            	Long infoOrgId = (userInfo.getInfoOrgList()!=null && userInfo.getInfoOrgList().size()>0)?(userInfo.getInfoOrgList().get(0).getOrgId()):-1L;
		                            	OrgExtraInfo orgExtraInfo = orgService.getOrgExtraInfo(infoOrgId); //获取信息域的中心点位
		                            	userInfo.setOrgLatitude(orgExtraInfo.getLatitude());
										userInfo.setOrgLongitude(orgExtraInfo.getLongitude());
		                            } catch (Exception e) {
										logger.error("找不到userId："+userInfo.getUserId()+" 对应的组织地理信息！");
									}
		                            session.setAttribute(ConstantValue.USER_IN_SESSION, userInfo);
		                            session.removeAttribute(ConstantValue.SYSTEM_PRIVILEGE_ACTION);

		                            // ConstantValue.USER_INFO_IN_SESSION = userInfo;
	                            } else {
	                            	logger.info("userId："+userInfo.getUserId()+" 信息没变化无需更新！");
	                            }
	                            CommonFunctions.initAppDomains(req, userInfo, cookieMapInfo, token);
	                            // Add By @YangCQ : 添加SQ_ZZGRID_URL、ANOLE_COMPONENT_URL信息到请求里
	                            req.setAttribute("ANOLE_COMPONENT_URL", App.SYSTEM.getDomain(session));
	                            req.setAttribute("SQ_ZZGRID_URL", App.ZZGRID.getDomain(session));
	                            req.setAttribute("uiDomain", App.UI.getDomain(session));
								req.setAttribute("zzgridDomain", App.ZZGRID.getDomain(session));
								req.setAttribute("imgDomain", App.IMG.getDomain(session));
								req.setAttribute("fileDomain", App.SQFILE.getDomain(session));
								req.setAttribute("skyDomain", App.SKY.getDomain(session));
								req.setAttribute("componentsDomain", App.COMPONENTS.getDomain(session));
								req.setAttribute("rsDomain", App.RS.getDomain(session));

								req.setAttribute("gbpDomain", App.GBP.getDomain(session));
								req.setAttribute("sysDomain", App.SYSTEM.getDomain(session));
	                            req.setAttribute("JSESSIONID", session.getId());
	                            // Add By @YangCQ : 添加用户按钮权限
	                            this.initPrivilege(req, userCookie);
	                          //  this.initPrivilege(req, ctx, userCookie);
	                        }
                        } else {
                        	logger.info("统一认证memcache中用户信息有误，系统判定非法进入，清空session");
                            userInfo=null;
                            // ConstantValue.USER_INFO_IN_SESSION = null;
                            session.invalidate();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        logger.info("统一认证memcache读取有误，系统判定非法进入，清空session");
                        userInfo=null;
                        // ConstantValue.USER_INFO_IN_SESSION = null;
                        session.invalidate();
                    }
                }
            } else {
                logger.info("cookie中未读取到统一认证的相关信息");
            }
            logger.info("==================统一认证 认证结束===================================\n");

            if(userInfo!=null) {
                logger.info(userInfo.toString());
                filterChain.doFilter(req, res);
            } else {
                //writeErrorResponse(req, res, "未获取到登录信息！");
            	res.sendRedirect(CommonFunctions.resetDomain(ConstantValue.UAM_LOGIN_URL, CommonFunctions
						.getTopDomain(req.getRequestURL().toString())));
                return;
            }
        }
    }

    /**
     * 向客户端写错误提示信息
     * @param response
     * @throws IOException
     */
    private void writeErrorResponse(HttpServletRequest request, HttpServletResponse response, String message) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out;
        try {
            out = response.getWriter();
            out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
            out.println("<HTML>");
            out.println("<HEAD><TITLE>"+message+"</TITLE></HEAD>");
            out.println("<BODY>");
            out.print("<span style='font-size: 24px; font-weight: bold;'>"+message+"</span>");
            out.println("</BODY>");
            out.println("</HTML>");
            out.flush();
            out.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    /* (non-Javadoc)
     * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
     */
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }
    /*

    private void initPrivilege(HttpServletRequest req, WebApplicationContext ctx, UserCookie userCookie) {
    	HttpSession session = req.getSession();
    	String privilegeId = req.getParameter("system_privilege_action");
        if (StringUtils.isBlank(privilegeId)) {
        	privilegeId = "-1";
        }
        req.setAttribute("system_privilege_action", privilegeId);
        Map<String, String> json = (Map<String, String>) session.getAttribute(ConstantValue.SYSTEM_PRIVILEGE_ACTION);
		if (json == null) {
			json = new HashMap<String, String>();
		}
		if (!"-1".equals(privilegeId)) {
			CacheService cacheService = (CacheService) ctx.getBean("cacheService");
			UserManageOutService userManageService = ctx.getBean(UserManageOutService.class);
			if (cacheService != null && userManageService != null) {
				Map<String, PriActionBO> tempMap = cacheService.getActionMap();
				System.out.println("cacheService.getActionMap ==> "+DateUtils.getNow() +":" + tempMap);
				String menuAction = null;
				if (privilegeId != null && !"".equals(privilegeId) && !"null".equals(privilegeId)) {
					menuAction = userManageService.selectUserPrivilegeAction(
									userCookie.getUserId(),
									userCookie.getOrgId(),
									null,
									Long.valueOf(privilegeId));
					System.out.println("userManageService.selectUserPrivilegeAction ==> "+DateUtils.getNow() +":" + menuAction);
					// 清理
					List<String> temp = new ArrayList<String>();
					Set<Map.Entry<String, String>> set = json.entrySet();
					for (Map.Entry<String, String> entry : set) {
						if (privilegeId.equals(entry.getValue())) {
							temp.add(entry.getKey());
						}
					}
					for (String key : temp) {
						json.remove(key);
					}
				}
				if (menuAction != null && !"".equals(menuAction) && !"null".equals(menuAction)) {
					String[] actionStr = menuAction.split(",");
					for (String s : actionStr) {
						if (s != null && !"".equals(s) && !"null".equals(s)) {
							PriActionBO tempBO = tempMap.get(s);
							if (tempBO != null) {
								json.put(tempBO.getCode(), privilegeId);
							} else {
								System.out.println("actionKey:" + s + "==>actionMap:" + tempMap);
							}
						}
					}
				}
			} else {
				System.out.println("获取权限服务接口有误：cacheService=" + cacheService + " userManageService=" + userManageService);
				System.out.println("为了不影响按钮功能使用，默认写入所有权限。");
				json.put("all", privilegeId);
			}
		}
		session.setAttribute(ConstantValue.SYSTEM_PRIVILEGE_ACTION, json);
    }*/



	private void initPrivilege(HttpServletRequest req, UserCookie userCookie) {
		HttpSession session = req.getSession();
		String privilegeAction = req.getParameter(ConstantValue.SYSTEM_PRIVILEGE_ACTION);
		String privilegeCode = req.getParameter(ConstantValue.SYSTEM_PRIVILEGE_CODE);
		String userType = userCookie.getUserType();

		if (StringUtils.isBlank(userType)) {
			userType = ConstantValue.USER_TYPE_REGIST;
		}

		// 清空历史权限，防止影响后续未配置权限的菜单
		session.setAttribute(ConstantValue.SYSTEM_PRIVILEGE_ACTION, null);
		session.setAttribute(ConstantValue.SYSTEM_PRIVILEGE_CODE, null);

		if (StringUtils.isNotBlank(privilegeCode)) {
			session.setAttribute(ConstantValue.SYSTEM_PRIVILEGE_CODE, privilegeCode);
		} else if (StringUtils.isNotBlank(privilegeAction)) {
			session.setAttribute(ConstantValue.SYSTEM_PRIVILEGE_ACTION, privilegeAction);
		}

		session.setAttribute(ConstantValue.SYSTEM_ROLE, userCookie.getRoleList());// 存放角色信息

		// 判断是否是管理员
		if (ConstantValue.USER_TYPE_SUPER.equals(userType) || ConstantValue.USER_TYPE_DEVELOPER.equals(userType)
				|| ConstantValue.USER_TYPE_ADMIN.equals(userType)) {
			session.setAttribute(ConstantValue.SYSTEM_ADMIN, "1");
		}
	}
}
