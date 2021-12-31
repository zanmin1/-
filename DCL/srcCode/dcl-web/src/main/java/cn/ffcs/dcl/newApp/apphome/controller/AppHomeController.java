package cn.ffcs.dcl.newApp.apphome.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.integral.service.IIntegralService;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.OrgEntityInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.OrgEntityInfoOutService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.ffcs.zone.user.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Description:
 * @Author: luchch
 * @Date: 2021/12/20 15:28
 * @Copyright: 2021 福富软件
 */
@Controller("newAppindexController")
@RequestMapping({"/public/wap/appHome", "/dcl/appHome"})
public class AppHomeController extends ZZBaseController {

    @Autowired(required = false)
    private ICommonInfoOpenService commonInfoOpenService;

    @Autowired(required = false)
    private OrgEntityInfoOutService orgEntityInfoOutService;

    @Autowired
    private IModularContentService modularContentService; //注入模块内容服务

    @Autowired
    private IIntegralService integralService;


    //index
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        if (userInfo != null) {
            // 2、登录。（每日登录，获取 1 积分，每天一次）
            integralService.addPoints(userInfo.getUserId(), "F-OA004Z001002", "登录", userInfo.getUserId(), userInfo.getOrgCode());
        }
        String orgCode = userInfo.getOrgCode();

        request.setAttribute("orgCode",orgCode);
        request.setAttribute("token",session.getAttribute("token"));
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

        setDomain(map,session);

        return "mobile/newApp/appHome/index.jsp";
    }

    @RequestMapping("/all")
    public Object all(HttpServletRequest request, HttpSession session, ModelMap map){
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        String orgCode = userInfo.getOrgCode();


        request.setAttribute("token",session.getAttribute("token"));


        request.setAttribute("orgCode",orgCode);
        setDomain(map, session);

        return "mobile/newApp/appHome/all.jsp";
    }

    @RequestMapping("/test")
    public Object test(HttpServletRequest request, HttpSession session, ModelMap map){
        setDomain(map, session);
        String regionCode = "35";
        String useType = "index";
        String type = "7";
        String platform = "spt";
        DvTheme dvTheme = modularContentService.searchContents(regionCode, useType, type, platform);
        System.out.println(JSONObject.toJSONString(dvTheme));
        return "/mobile/secretarymailbox/secretary_mailbox_app_form.jsp";
    }

    private void setDomain(ModelMap map,HttpSession session) {

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
}
