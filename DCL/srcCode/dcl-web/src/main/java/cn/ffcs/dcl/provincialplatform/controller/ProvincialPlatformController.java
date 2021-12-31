package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Description: 省平台大屏控制器
 * @Author: zhangzhj
 * @Date: 12-4 10:21:23
 * @Copyright: 2021 福富软件
 */
@Controller("ProvincialPlatformController")
@RequestMapping("/dcl/provincialPlatform")
public class ProvincialPlatformController extends ZZBaseController {

    /**
     * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param response 响应
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map, String positionCode) {
    	session.setMaxInactiveInterval(10 * 3600); // Session保存十小时
    	Cookie cookie = new Cookie("JSESSIONID", session.getId());
    	cookie.setMaxAge(10 * 3600); // 客户端的JSESSIONID也保存十小时
    	response.addCookie(cookie);
    	
        map.put("UI_DOMAIN", App.UI.getDomain(session));
        map.put("sysDomain", App.SYSTEM.getDomain(session));
        String ZZGRID_DOMAIN = funConfigurationService.getAppDomain("$ZZGRID_DOMAIN", null, null);
        map.put("ZZGRID_DOMAIN", ZZGRID_DOMAIN);
        String type = request.getParameter("type");
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        map.put("orgCode", userInfo.getOrgCode());
        String regionCode = request.getParameter("regionCode");
        if (regionCode==null) {
            regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        }else {
            map.put("orgCode", regionCode);
        }
        map.put("regionCode", regionCode);
        MixedGridInfo gridInfo = mixedGridInfoService.findMixedGridInfoById(Long.valueOf(defaultGridInfo.get(KEY_START_GRID_ID).toString()), false);
        map.put("gridInfo", gridInfo);
        String djDomain = funConfigurationService.getAppDomain("$DJ_DOMAIN", null, null);
        map.put("djDomain", djDomain);
        String WECHAT_DOMAIN = funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null);
        map.put("WECHAT_DOMAIN", WECHAT_DOMAIN);
        String rsDomain = funConfigurationService.getAppDomain("$RS_DOMAIN", null, null);
        map.put("rsDomain", rsDomain);
        String eventDomain = funConfigurationService.getAppDomain("$EVENT_DOMAIN", null, null);
        map.put("eventDomain", eventDomain);
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("FILE_URL", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("GMIS_DOMAIN", funConfigurationService.getAppDomain("$GMIS_DOMAIN", null, null));

        map.addAttribute("positionCode", positionCode);   // 套餐编码。

        // 智慧党建。
        if ("1".equals(type)) {
            return "/dcl/provincialplatform/smartPartyBuilding_index.ftl";
        } else if ("3".equals(type)) {
            map.put("title", request.getParameter("title"));
            map.put("module", request.getParameter("module"));
            map.put("catalogId", request.getParameter("catalogId"));
            map.put("infoOpenId", request.getParameter("infoOpenId"));
            return "/dcl/szxc/ztdr_index.ftl";
        }
        else if ("4".equals(type)) {
            map.put("title", request.getParameter("title"));
            map.put("module", request.getParameter("module"));
            map.put("catalogId", request.getParameter("catalogId"));
            map.put("infoOpenId", request.getParameter("infoOpenId"));
            return "/dcl/szxc/xcly_index.ftl";
        // 村务政务。
        } else {
            return "/dcl/provincialplatform/villageAdministration_index.ftl";
        }
    }
	
}
