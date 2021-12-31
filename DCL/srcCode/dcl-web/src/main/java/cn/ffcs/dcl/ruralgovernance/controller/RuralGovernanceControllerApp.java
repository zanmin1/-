package cn.ffcs.dcl.ruralgovernance.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Classname TechBenefitsFarmersControllerApp
 * @Description TODO 乡村治理模块控制器-移动端
 * @Date 2021/10/13 19:40
 * @Created by xuewq
 * @Copyright: 2021 福富软件
 */
@Controller("ruralGovernanceControllerApp")
//@RequestMapping("/dcl/ruralGovernanceControllerApp")
@RequestMapping("/public/wap/ruralGovernanceControllerApp")
public class RuralGovernanceControllerApp extends ZZBaseController {

    @Autowired
    private IModularContentService modularContentService;

    /**
     * 乡村治理首頁
     * 访问地址：http://dcl.zhxc.fzyzxxjs.cn/dcl/public/wap/ruralGovernanceControllerApp/index.jhtml?app=app&token=QVpjekovc2NSbEFPSUREai9pMEFoNkNOYzNBOHFGeG05R2wyNnlJQ3lOaUhqWmRtM2FqdTVlVkdVbmg5d3k5Vw==
     * 切图：/10_WebCode/pages/app/jzfp/fujian-xczx/2.7.1-xiangcunzhili.html
     * @param request 客户端请求
     * @param session 会话
     * @param map     参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        request.setAttribute("token",session.getAttribute("token"));
        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.put("CS_DOMAIN", funConfigurationService.getAppDomain("$CS_DOMAIN", null, null));

        return "/mobile/ruralGovernance/rural_governance_app_list.jsp";
    }

    /**
     * 农技专家更多列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/moreIndex")
    public Object moreIndex(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

        request.setAttribute("orgId", userInfo.getOrgCode()); // 组织Id
        map.addAttribute("token", session.getAttribute("token"));

        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.put("gmisDomain", funConfigurationService.getAppDomain("$GMIS_DOMAIN", null, null));

        return "/mobile/ruralGovernance/volunteer_activity_app_list.jsp";
    }


    /**
     * 农技专家详情页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/detailIndex")
    public Object detailIndex(HttpServletRequest request, HttpSession session, ModelMap map
    ,String id) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.addAttribute("id",id);

        return "/mobile/ruralGovernance/volunteer_activity_app_view.jsp";
    }

    /**
     * 获取模块内容配置信息
     * 列表数据
     *
     * @param request    客户端请求
     * @param session    会话
     * @param map        参数
     * @param regionCode 地区编码
     * @param useType   使用场景
     * @param type       模块类型
     * @return 页面数据
     */

    @ResponseBody
    @RequestMapping("/getTbbjData")
    public Object getTbbjData(HttpServletRequest request, HttpSession session, ModelMap map,
                              String regionCode, String useType, String type) {
        DvTheme dvTheme = null;
        if (regionCode!=null&&regionCode.length()>2){
            regionCode = regionCode.substring(0,2);
        }
        // 非空判断。
        if (!StringUtils.isEmpty(regionCode) && !StringUtils.isEmpty(useType) && !StringUtils.isEmpty(type)) {
            dvTheme = modularContentService.searchListForAPP(regionCode, useType, type);
        }

        return dvTheme;
    }

}
