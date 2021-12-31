package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller("ThreeCapitalProvinceController")
@RequestMapping("/dcl/threeCapitalProvince")
public class ThreeCapitalController extends ZZBaseController {


    @Autowired
    private ICommonInfoOpenService commonInfoOpenService;

    /**
     * 列表页面
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map, String positionCode) {
        map.put("UI_DOMAIN", App.UI.getDomain(session));
        map.put("sysDomain", App.SYSTEM.getDomain(session));
        String ZZGRID_DOMAIN = funConfigurationService.getAppDomain("$ZZGRID_DOMAIN", null, null);
        map.put("ZZGRID_DOMAIN", ZZGRID_DOMAIN);
        String type = request.getParameter("type");
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

        String orgCode = request.getParameter("orgCode");
        if (orgCode != null && !"".equals(orgCode)){
            map.put("orgCode", orgCode);
        }else {
            map.put("orgCode", userInfo.getOrgCode());
        }

        String regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
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

        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "threeCapital");

        map.put("positionCode", positionCode);   // 套餐编码。

        return "/dcl/provincialplatform/threeCapital_index.ftl";
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
	
}
