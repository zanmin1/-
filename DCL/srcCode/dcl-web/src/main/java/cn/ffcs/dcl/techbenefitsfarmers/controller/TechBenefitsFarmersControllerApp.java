package cn.ffcs.dcl.techbenefitsfarmers.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.gbp.infoOpen.common.InfoOpenCriteria;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.gmis.mybatis.domain.teamMembers.TeamMembers;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.shequ.crypto.HashIdManager;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Classname TechBenefitsFarmersControllerApp
 * @Description TODO 科技惠农模块控制器-小程序端
 * @Date 2021/10/13 19:40
 * @Created by xuewq
 * @Copyright: 2021 福富软件
 */
@Controller("techBenefitsFarmersControllerApp")
@RequestMapping({"/public/wap/techBenefitsFarmersApp","/dcl/techBenefitsFarmersApp"})//
public class TechBenefitsFarmersControllerApp extends ZZBaseController {
    @Autowired
    private ICommonInfoOpenService commonInfoOpenService;

    @Autowired
    private IModularContentService modularContentService;
    @Autowired
    private ITeamMembersService teamMembersService;
    /**
     * 科技惠农首頁
     *
     * @param request 客户端请求
     * @param session 会话
     * @param map     参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.addAttribute("token", session.getAttribute("token"));
        map.put("gmisDomain", funConfigurationService.getAppDomain("$GMIS_DOMAIN", null, null));
        map.put("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));

        return "/mobile/techbenefitsfarmers/technology_benefits_farmmers_app_list.jsp";
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

        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.put("gmisDomain", funConfigurationService.getAppDomain("$GMIS_DOMAIN", null, null));

        return "/mobile/techbenefitsfarmers/team_member_app_list.jsp";
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
    ,String memberId) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.addAttribute("memberId",memberId);
        map.put("gmisDomain", funConfigurationService.getAppDomain("$GMIS_DOMAIN", null, null));

        return "/mobile/techbenefitsfarmers/team_member_app_view.jsp";
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

    /**
     * 获取gbp工程接口数据
     * @param session 会话
     * @param page 当前页码
     * @param rows 页面条数
     * @param criteria 数据对象
     * @return 页面数据
     */
    @ResponseBody
    @RequestMapping(value = "/loadManageList")
    public EUDGPagination loadManageList(HttpSession session,
                                         @RequestParam(value = "page") int page, @RequestParam(value = "rows") int rows, InfoOpenCriteria criteria)
            throws Exception {
        User u = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        UserInfo userInfo = new UserInfo();
        userInfo.setOrgCode(u.getOrgCode());
        userInfo.setUserId(u.getUserId());

        Map<String, Object> params = new HashMap<>(criteria.convertToMap());
        params.put("infoOrgCode", u.getOrgCode());

        return commonInfoOpenService.findManageList(page, rows, params, userInfo);
    }

    /**
     *  科技惠农获取专家
     *  测试 http://my.v6.aishequ.org:8990/dcl/techBenefitsFarmersApp/getExpertList.json?page=1&rows=10&regionCode=35
     *  http://dcl.zhxc.fzyzxxjs.cn/dcl/dcl/techBenefitsFarmersApp/getExpertList.json?page=1&rows=10&regionCode=430725113218
     * @param session
     * @param page
     * @param rows
     * @param regionCode
     * @return
     */
    @ResponseBody
    @RequestMapping("/getExpertList")
    public Object getExpertList(HttpSession session, int page, int rows, String regionCode) {
        if (!checkDataPermission(session, CommonController.TYPE_GRID, regionCode)) {
            return new cn.ffcs.common.EUDGPagination(0, new ArrayList<>());
        } else {
            page = Math.max(page, 1);
            rows = Math.max(rows, 1);
            Map<String, Object> query = new HashMap<>();
            query.put("bizType", "20");
            query.put("regionCode", regionCode);
            cn.ffcs.common.EUDGPagination data = teamMembersService.findMembersForRegionPagination(page, rows, query);
            if (data != null && data.getRows() != null && data.getRows().size() > 0) {
                for (TeamMembers item : (List<TeamMembers>) data.getRows()) {
                    item.setHashId(HashIdManager.encrypt(item.getMemberId()));
                }
            }
            return data;
        }
    }
}
