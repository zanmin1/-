package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.attractionsmanagement.service.IAttractionsManagementService;
import cn.ffcs.dcl.farmhousemanagement.service.IFarmhouseManagementService;
import cn.ffcs.dcl.homestaymanagement.service.IHomestayManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.gmis.mybatis.domain.teamMembers.TeamMembers;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.shequ.crypto.HashIdManager;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Classname CulturalTourismController
 * @Description TODO
 * @Date 2021/12/6 9:23
 * @Created by xuewq
 * @Copyright: 2021 福富软件
 */
@Controller
@RequestMapping("/dcl/culturalTourism")
public class CulturalTourismController extends ZZBaseController {

    @Autowired
    protected IFunConfigurationService funConfigurationService;

    @Autowired
    private ITeamMembersService teamMembersService;  //注入乡贤管理模块服务

    @Autowired
    private IAttractionsManagementService attractionsManagementService; //注入景点管理表模块服务

    @Autowired
    private IHomestayManagementService homestaymanagementService; //注入民宿管理模块服务

    @Autowired
    private IFarmhouseManagementService farmhouseManagementService; //注入农家乐管理模块服务

    /**
     * 省平台文化旅游大屏首页
     * http://my.v6.aishequ.org:8990/dcl/culturalTourism/index.jhtml
     * 切图 \10_WebCode\pages\web\big-screen\35-xiangcunzhenxing\subject-cun
     *
     * @Author Create by xuewq on 2021-12-06 9:13
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, @RequestParam Map<String, String> params, ModelMap map, String regionCode, String positionCode) {
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
            regionCode = u.getInfoOrgCodeStr();
        }
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("regionCode", regionCode);
        map.addAttribute("UI_DOMAIN", App.UI.getDomain(session));
        map.put("FILE_URL", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_beautifulVillage");

        map.put("positionCode", positionCode);   // 套餐编码。

        return "/dcl/provincialplatform/cultural_tourism_index.ftl";
    }

    /**
     * 省平台文化旅游大屏首页   乡贤榜  接口
     * 展示村规民约文章的封面图和文章简介，如涉及多篇文章，有翻页效果
     * http://my.v6.aishequ.org:8990/dcl/culturalTourism/getExpertList.jhtml?page=1&rows=20&regionCode=35
     * <p>
     * 功能url：
     * http://gmis.zhxc.fzyzxxjs.cn/gmis/gmis/teamMembers/index.jhtml?bizType=23&type=experts
     *
     * @Author Create by xuewq on 2021-12-06 9:13
     */
    @ResponseBody
    @RequestMapping("/getExpertList")
    public Object getExpertList(HttpSession session, int page, int rows, String regionCode) {
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
            regionCode = u.getInfoOrgCodeStr();
        }
        if (!checkDataPermission(session, CommonController.TYPE_GRID, regionCode)) {
            return new cn.ffcs.common.EUDGPagination(0, new ArrayList<>());
        } else {
            page = Math.max(page, 1);
            rows = Math.max(rows, 1);
            Map<String, Object> query = new HashMap<>();
            query.put("bizType", "23");
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

    /**
     * 省平台文化旅游大屏首页   乡村旅游  接口
     * 展示景区照片、景区简介；（多个有翻页效果）
     * http://my.v6.aishequ.org:8990/dcl/culturalTourism/getAttraction.jhtml?page=1&rows=20&orgCode=35&issuStatus=1
     * <p>
     * 功能url：
     * http://dcl.zhxc.fzyzxxjs.cn/dcl//dcl/attractionsManagement/index.jhtml
     *
     * @Author Create by xuewq on 2021-12-06 9:13
     */
    @ResponseBody
    @RequestMapping("/getAttraction")
    public Object getAttraction(HttpServletRequest request, HttpSession session, ModelMap map,
                                AttractionsManagement bo) {
        EUDGPagination pagination = new EUDGPagination();
        if(bo!=null){
            if (StringUtils.isEmpty(bo.getOrgCode())) {
                UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
                bo.setOrgCode(u.getInfoOrgCodeStr());
            }
        // 越权检查。
        if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermission(session, bo.getOrgCode())) {
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
            if(!StringUtils.isEmpty(bo.getOrgCode())){
                pagination = attractionsManagementService.searchList(bo, bo.getOrgCode());
            }
            else {
                pagination = attractionsManagementService.searchList(bo, userInfo.getInfoOrgCodeStr());
            }
        }
        }
        return pagination;
    }

/**
 * 省平台文化旅游大屏首页   乡村民宿  接口
 * 展示民宿名称、图片、详细地址、联系电话、民宿介绍（如有多个，有翻页效果）
 * http://my.v6.aishequ.org:8990/dcl/culturalTourism/getHomestay.jhtml?currentPage=1&pageSize=20&orgCode=35
 *
 * 功能url：
 * http://dcl.zhxc.fzyzxxjs.cn/dcl//dcl/homestayManagementPc/index.jhtml
 *
 * @Author Create by xuewq on 2021-12-06 9:13
 */
    /**
     * 列表数据
     *
     * @param request 客户端请求
     * @param session 会话
     * @param map     参数
     * @param bo      数据对象
     * @return 页面数据
     */
    @ResponseBody
    @RequestMapping("/getHomestay")
    public Object getHomestay(HttpServletRequest request, HttpSession session, ModelMap map,
                              HomestayManagement bo) {
        PaginationDto<HomestayManagement> paginationDto = new PaginationDto<>();
        if(bo!=null) {
            if (StringUtils.isEmpty(bo.getOrgCode())) {
                UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
                bo.setOrgCode(userInfo.getInfoOrgCodeStr());
            }
            // 越权检查。
            if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermission(session, bo.getOrgCode())) {
                paginationDto = homestaymanagementService.searchList(bo);
            }
        }
        return paginationDto;
    }

    /**
     * 省平台文化旅游大屏首页   农家乐  接口
     * 展示农家乐名称、图片、详细地址、联系电话、服务介绍（如有多个，有翻页效果）
     * http://my.v6.aishequ.org:8990/dcl/culturalTourism/getFarmhouse.jhtml?page=1&rows=20&orgCode=35
     * <p>
     * 功能url：
     * http://dcl.zhxc.fzyzxxjs.cn/dcl//dcl/farmhouseManagement/index.jhtml
     *
     * @Author Create by xuewq on 2021-12-06 9:13
     */

    @ResponseBody
    @RequestMapping("/getFarmhouse")
    public Object getFarmhouse(HttpServletRequest request, HttpSession session, ModelMap map,
                               int page, int rows, FarmhouseManagement bo) {
        page = page < 1 ? 1 : page;
        rows = rows < 1 ? 20 : rows;
        Map<String, Object> params = new HashMap<String, Object>();
        EUDGPagination pagination = new EUDGPagination();

        params.put("farmhouseName", request.getParameter("farmhouseName"));//关键字
        String orgCode = request.getParameter("orgCode");
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
        if(StringUtils.isEmpty(orgCode)){
            orgCode = userInfo.getInfoOrgCodeStr();
        }
        params.put("orgCode", orgCode);//地域编码
        params.put("address", request.getParameter("address"));//地址
        params.put("issuStatus", request.getParameter("issuStatus"));//发布状态
        // 越权检查。
        if (!StringUtils.isEmpty(orgCode) && checkDataPermission(session, orgCode)) {
            pagination = farmhouseManagementService.searchList(page, rows, params);
        }
        return pagination;
    }
}
