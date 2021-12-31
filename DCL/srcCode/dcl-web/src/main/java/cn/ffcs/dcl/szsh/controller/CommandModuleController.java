package cn.ffcs.dcl.szsh.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.uam.bo.OrgSocialInfoBO;
import cn.ffcs.uam.bo.PositionInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import cn.ffcs.uam.service.PositionInfoOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller()
@RequestMapping("/dcl/commandModule")
public class CommandModuleController extends ZZBaseController {

    @Autowired
    protected IFunConfigurationService funConfigurationService;

    @Autowired
    private OrgSocialInfoOutService orgSocialInfoOutService;

    @Autowired
    private PositionInfoOutService positionInfoOutService;

    /**
     * DCL驾驶舱首页页头
     * http://my.v6.aishequ.org:8990/dcl/commandModule/index.jhtml
     * 切图 /big-screen/35-xiangcunzhenxing/index-jiashicang-cun-v1.html
     * @Author Create by xuewq on 2021-11-09 9:13
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map, String type, String regionCode) {
        // 三级穿透。
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        if (StringUtils.isEmpty(regionCode)) {
            regionCode = userInfo.getInfoOrgCodeStr();
        }
        map.put("regionCode", regionCode);

        // 判断登录用户是否归属于协星村或后洋村。
        if (!regionCode.equals("350125201209") && !regionCode.equals("350925103212")) {
            type = "3";

            // 升级指南套餐权限。
            Map<String, Object> params = new HashMap<>();
            params.put("orgId", userInfo.getOrgId());
            params.put("userId", userInfo.getUserId());
            List<PositionInfoBO> list = positionInfoOutService.queryPositionByPara(params);

            if (list != null && list.get(0) != null) {
                if (!StringUtils.isEmpty(list.get(0).getPositionCode()) && (list.get(0).getPositionCode().equals("00001") ||
                        list.get(0).getPositionCode().equals("00002") || list.get(0).getPositionCode().equals("00003"))) {
                    map.put("positionName", list.get(0).getPositionName());   // 职位名称：福建省基础版、福建省标准版、福建省尊享版。
                    map.put("positionCode", list.get(0).getPositionCode());   // 职位代码：00001、00002、00003。
                }
            }
        }

        map.put("type", type);   // 用于区别首页：1-静态页面，2-动态页面，3-工作台。

        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("GIS_DOMAIN", funConfigurationService.getAppDomain("$GIS_DOMAIN", null, null));
        map.put("GBP_DOMAIN", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));

        return "/dcl/szsh/commandModule_index.ftl";
    }

    /**
     * DCL驾驶舱首页页面iframe
     * http://my.v6.aishequ.org:8990/dcl/commandModule/subjectIndex.jhtml
     * 切图 /big-screen/35-xiangcunzhenxing/subject-jiashicang-cun-v1.html
     * @Author Create by xuewq on 2021-11-09 9:13
     */
    @RequestMapping("/subjectIndex")
    public Object subjectIndex(HttpSession session, @RequestParam Map<String, String> params, ModelMap map,
                               String type, String regionCode) {
        // 三级穿透。
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        if (StringUtils.isEmpty(regionCode)) {
            regionCode = userInfo.getInfoOrgCodeStr();
        }
        map.put("regionCode", regionCode);

        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));

        // 村情风采。
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        MixedGridInfo gridInfo = mixedGridInfoService.findMixedGridInfoById(Long.valueOf(defaultGridInfo.get(KEY_START_GRID_ID).toString()), false);
        map.put("gridId", gridInfo.getGridId());
        map.put("orgCode", userInfo.getOrgCode());
        map.put("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("gisDomain", funConfigurationService.getAppDomain("$GIS_DOMAIN", null, null));
        // 村情介绍。
        OrgSocialInfoBO bo = orgSocialInfoOutService.getOrgIdByLocationCode(regionCode);
        map.put("orgName", bo.getOrgName());   // 村名称。
        map.put("rsDomain", funConfigurationService.getAppDomain("$RS_DOMAIN", null, null));
        map.put("djDomain", funConfigurationService.getAppDomain("$DJ_DOMAIN", null, null));
        // 乡村治理。
        map.put("userId", userInfo.getUserId());
        map.put("orgId", userInfo.getOrgId());
        map.put("eventDomain", funConfigurationService.getAppDomain("$EVENT_DOMAIN", null, null));
        // 生态宜居。
        map.put("iotDomain", funConfigurationService.getAppDomain("$IOT_DOMAIN", null, null));
        map.put("weChatDomain", funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null));

        // 动态页面。
        if (!StringUtils.isEmpty(type) && type.equals("2")) {
            return "/dcl/szsh/commandModule_subject_index_dynamic.ftl";
        // 静态页面。
        } else {
            return "/dcl/szsh/commandModule_subject_index.ftl";
        }
    }

}
