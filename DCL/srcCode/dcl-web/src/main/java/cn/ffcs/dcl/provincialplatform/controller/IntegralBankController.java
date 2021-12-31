package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.oa.entity.interalrule.ZoneIntegralStatistics;
import cn.ffcs.oa.service.interalrule.IntegralStatisticsService;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("IntegralBankProvinceController")
@RequestMapping("/dcl/integralBankProvince")
public class IntegralBankController extends ZZBaseController {

    @Autowired
    private IntegralStatisticsService integralStatisticsService;   // 积分排名。

    /**
     * 列表页面
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map, String positionCode) {
        map.put("uiDomain", App.UI.getDomain(session));
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
        map.put("weChatDomain", WECHAT_DOMAIN);
        String rsDomain = funConfigurationService.getAppDomain("$RS_DOMAIN", null, null);
        map.put("rsDomain", rsDomain);
        String eventDomain = funConfigurationService.getAppDomain("$EVENT_DOMAIN", null, null);
        map.put("eventDomain", eventDomain);
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));

        // “更多”配置。
        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_integralBank");

        map.put("positionCode", positionCode);   // 套餐编码。

        return "/dcl/provincialplatform/integralBank_index.ftl";

    }

    /**
     * 获取积分排名信息
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @param orderNum 前几（非必填）
     * @param type 1-月度，2-年度（必填）
     * @param tableType 模块编码：公众用户ZONE_USER_INTEGRAL（必填）
     * @param orgCode 地域编码（必填）
     * @param setSearchDate 查询时间段：list<String> 月度格式 YYYYMM 年度YYYY（必填）
     * @return 页面数据
     */

    @ResponseBody
    @RequestMapping("/getScoreRankingData")
    public Object getScoreRankingData(HttpServletRequest request, HttpSession session, ModelMap map,
                                      String orderNum, String type, String tableType, String orgCode, String setSearchDate) {

        List<ZoneIntegralStatistics> listData = new ArrayList<>();

        // 越权检查。
        if (checkDataPermission(session, orgCode)) {
            Map<String, Object> param = new HashMap<>();
            param.put("orderNum", orderNum);
            param.put("type", type);
            param.put("tableType", tableType);
            param.put("orgCode", orgCode);
            List<String> setSearchDateList = new ArrayList<>();
            setSearchDateList.add(setSearchDate);
            param.put("setSearchDate", setSearchDateList);

            try {
                listData = integralStatisticsService.getTopUser(param);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return listData;

    }
	
}
