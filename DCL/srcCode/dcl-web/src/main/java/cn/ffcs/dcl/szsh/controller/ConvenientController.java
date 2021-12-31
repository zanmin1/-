package cn.ffcs.dcl.szsh.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("ConvenientController")
@RequestMapping("/dcl/convenient")
public class ConvenientController extends ZZBaseController {

    @Autowired
    private IModularContentService modularContentService; //注入模块内容服务
    /**
     * 列表页面
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        map.put("UI_DOMAIN", App.UI.getDomain(session));
        map.put("sysDomain", App.SYSTEM.getDomain(session));
        String ZZGRID_DOMAIN = funConfigurationService.getAppDomain("$ZZGRID_DOMAIN", null, null);
        map.put("ZZGRID_DOMAIN", ZZGRID_DOMAIN);
        String type = request.getParameter("type");
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        map.put("orgCode", userInfo.getOrgCode());
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
        map.put("privilegeCode", "dcl_convenient");
            return "/dcl/szsh/convenient_index.ftl";
    }

    /**
     * 获取配置数据列表数据
     */
    @ResponseBody
    @RequestMapping("/getModularContent")
    public Object getModularContent(HttpServletRequest request, HttpSession session, ModelMap map, ModularContent bo
    ) {
        PaginationDto<ModularContent> paginationDto = new PaginationDto<ModularContent>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        bo.setRegionName(infoOrgCode);
        if(!StringUtils.isEmpty(infoOrgCode)){
            if(infoOrgCode.length()>2){
                infoOrgCode = infoOrgCode.substring(0,2);
            }
        }
        bo.setRegionCode(infoOrgCode);
        paginationDto= modularContentService.searchListByconvenient(bo);
        return paginationDto;
    }

}
