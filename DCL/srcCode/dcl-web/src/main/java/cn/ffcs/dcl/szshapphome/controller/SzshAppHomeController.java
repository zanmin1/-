package cn.ffcs.dcl.szshapphome.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.integral.service.IIntegralService;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.OrgEntityInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.OrgEntityInfoOutService;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 数字生活app首页
 * @Author: linguoxiong
 * @Date: 09-16 19:32:57
 * @Copyright: 2021 福富软件
 */
@Controller("szshAppHomeController")
@RequestMapping({"/public/wap/szshAppHome", "/dddk/test"})
public class SzshAppHomeController extends ZZBaseController {

    @Autowired
    private ICommonInfoOpenService commonInfoOpenService;

    @Autowired
    private OrgEntityInfoOutService orgEntityInfoOutService;

    @Autowired
    private IModularContentService modularContentService; //注入模块内容服务

    @Autowired
    private IIntegralService integralService;

    //index
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

//        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        if (userInfo != null) {
            // 2、登录。（每日登录，获取 1 积分，每天一次）
            integralService.addPoints(userInfo.getUserId(), "F-OA004Z001002", "登录", userInfo.getUserId(), userInfo.getOrgCode());
        }

//        String orgCode = defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString();

        String orgCode = userInfo.getOrgCode();

        request.setAttribute("orgCode",orgCode);
        request.setAttribute("token",session.getAttribute("token"));

//        request.setAttribute("orgCode",defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
//        request.setAttribute("orgName",defaultGridInfo.get(KEY_START_GRID_NAME));
        OrgEntityInfoBO orgEntityInfoBO = orgEntityInfoOutService.selectOrgEntityInfoByOrgCode(orgCode);
        String orgEntityPath = orgEntityInfoBO.getOrgEntityPath();
        request.setAttribute("orgEntityPath",orgEntityPath);

        if (!StringUtils.isEmpty(orgCode) && orgCode.length() > 6){
            String targetCode = orgCode.substring(0,6);
            OrgEntityInfoBO orgEntityInfoBO2 = orgEntityInfoOutService.selectOrgEntityInfoByOrgCode(targetCode);
            request.setAttribute("orgName",orgEntityInfoBO2.getOrgName());
        }else {
            request.setAttribute("orgName",orgEntityInfoBO.getOrgName());
        }

//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名
//        String uiDomain = funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null);
//        request.setAttribute("uiDomain",uiDomain);
//        request.setAttribute("ANOLE_COMPONENT_URL", App.SYSTEM.getDomain(session));
//        request.setAttribute("imgDomain", imgDomain);
        setDomain(map,session);

        return "/mobile/szshapphome/index-szsh.jsp";
    }

    @RequestMapping("/indexV0101")
    public Object indexV0101(HttpServletRequest request, HttpSession session, ModelMap map) {

//        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        if (userInfo != null) {
            // 2、登录。（每日登录，获取 1 积分，每天一次）
            integralService.addPoints(userInfo.getUserId(), "F-OA004Z001002", "登录", userInfo.getUserId(), userInfo.getOrgCode());
        }

//        String orgCode = defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString();

        String orgCode = userInfo.getOrgCode();

        request.setAttribute("orgCode",orgCode);
        request.setAttribute("token",session.getAttribute("token"));

//        request.setAttribute("orgCode",defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
//        request.setAttribute("orgName",defaultGridInfo.get(KEY_START_GRID_NAME));
        OrgEntityInfoBO orgEntityInfoBO = orgEntityInfoOutService.selectOrgEntityInfoByOrgCode(orgCode);
        String orgEntityPath = orgEntityInfoBO.getOrgEntityPath();
        request.setAttribute("orgEntityPath",orgEntityPath);

        if (!StringUtils.isEmpty(orgCode) && orgCode.length() > 6){
            String targetCode = orgCode.substring(0,6);
            OrgEntityInfoBO orgEntityInfoBO2 = orgEntityInfoOutService.selectOrgEntityInfoByOrgCode(targetCode);
            request.setAttribute("orgName",orgEntityInfoBO2.getOrgName());
        }else {
            request.setAttribute("orgName",orgEntityInfoBO.getOrgName());
        }

//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名
//        String uiDomain = funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null);
//        request.setAttribute("uiDomain",uiDomain);
//        request.setAttribute("ANOLE_COMPONENT_URL", App.SYSTEM.getDomain(session));
//        request.setAttribute("imgDomain", imgDomain);
        setDomain(map,session);

        return "/mobile/szshapphome/index-szshV0101.jsp";
    }

    //index
    @RequestMapping("/indexqbyy")
    public Object indexqbyy(HttpServletRequest request, HttpSession session, ModelMap map) {

//        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        String orgCode = userInfo.getOrgCode();
        request.setAttribute("token",session.getAttribute("token"));


        request.setAttribute("orgCode",orgCode);


        setDomain(map,session);

        return "/mobile/szshapphome/index-qbyy.jsp";
    }

    /**
     * 便民查询页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/bmcxIndex")
    public Object bmcxIndex(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        request.setAttribute("orgCode", userInfo.getOrgCode());
        request.setAttribute("token", session.getAttribute("token"));

        setDomain(map,session);

        return "/mobile/szshapphome/index-bmcx.jsp";
    }

    /**
     * 党建引领页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/djylIndex")
    public Object djylIndex(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        request.setAttribute("orgCode", userInfo.getOrgCode());
        request.setAttribute("token", session.getAttribute("token"));

        setDomain(map,session);

        return "/mobile/szshapphome/index-djyl.jsp";
    }

    /**
     * 获取配置数据列表数据
     */
    @ResponseBody
    @RequestMapping("/getPzListData")
    public Object getPzListData(HttpServletRequest request, HttpSession session, ModelMap map,
                           int page, int rows) {
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        page = page < 1 ? 1 : page;
        rows = rows < 1 ? 20 : rows;
        EUDGPagination pagination = null;
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("catalogId", request.getParameter("catalogId"));//
        params.put("isEndPubDate", request.getParameter("isEndPubDate"));//
        params.put("isPic", request.getParameter("isPic"));//
        params.put("isPubOrg", request.getParameter("isPubOrg"));//
        params.put("isTop", request.getParameter("isTop"));//
        params.put("tKey", request.getParameter("tKey"));//
        params.put("infoOrgCode", request.getParameter("orgCode"));//
//        UserInfo userInfos = new UserInfo();
//        userInfos.setOrgCode(userInfo.getOrgCode());
//        userInfos.setUserId(userInfo.getUserId());
        try {
            pagination = commonInfoOpenService.findManageList(page,rows,params,null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pagination;
    }

    private void setDomain(ModelMap map, HttpSession session) {

        if(session.getAttribute("mainTit")!=null){
         String   mainTit	= session.getAttribute("mainTit").toString();
         map.addAttribute("mainTit", mainTit);
        }

        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
       // map.addAttribute("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));
        map.put("gbpDomain", newDomain(session,"$GBP_DOMAIN"));
        map.addAttribute("wechatDomain", funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }



    /**
     *  获取配置数据列表数据 （弃用）
     */
    @ResponseBody
    @RequestMapping("/getModularContent")
    public Object getModularContent(HttpServletRequest request, HttpSession session, ModelMap map
    ) {

        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);


        String  useType =request.getParameter("useType");
        String  regionCode=request.getParameter("orgCode");
        String  type=request.getParameter("type");

        if (regionCode!=null&&regionCode.length()>2){
            regionCode = regionCode.substring(0,2);
        }

        DvTheme dvTheme = modularContentService.searchListForAPP(regionCode, useType,type);

        return dvTheme;
    }



    /**
     * 新版获取配置数据列表数据
     */
    @ResponseBody
    @RequestMapping("/getModularContentNew")
    public Object getModularContentNew(HttpServletRequest request, HttpSession session, ModelMap map
    ) {

        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);


        String  useType =request.getParameter("useType");
        String  regionCode=request.getParameter("orgCode");
        String  type=request.getParameter("type");
        String  platform=request.getParameter("platform");

        if (regionCode!=null&&regionCode.length()>2){
            regionCode = regionCode.substring(0,2);
        }

        DvTheme dvTheme = modularContentService.searchContents(regionCode, useType,type,platform);

        return dvTheme;
    }

}
