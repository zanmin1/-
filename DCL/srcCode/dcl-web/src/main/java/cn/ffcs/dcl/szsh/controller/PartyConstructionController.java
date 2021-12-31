package cn.ffcs.dcl.szsh.controller;

import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.DateUtils;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 党建大屏
 * @Author Create by zheng on 2021-12-27 16:27
 */
@Controller("partyConstructionController")
@RequestMapping("/dcl/partyConstruction")
public class PartyConstructionController extends ZZBaseController {

    /**
     * 大屏
     * http://my.v6.aishequ.org:8990/dcl/dcl/partyConstruction/index.jhtml
     * 切图地址
     * /10_WebCode/pages/web/big-screen/00-shuzishenghuo/subject/subject-zhihuidangjian.html
     *
     * @Author Create by zheng on 2021-12-24 14:46
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map, String regionCode) {
        if (StringUtils.isEmpty(regionCode)) {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            if (defaultGridInfo != null) {
                regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
                map.put("gridId", defaultGridInfo.get(KEY_START_GRID_ID));
                map.put("gridName", defaultGridInfo.get(KEY_START_GRID_NAME));
            }

            UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
            map.put("orgCode", userInfo.getOrgCode());
        } else {
            MixedGridInfo grid = mixedGridInfoService.getGridInfoByInfoOrgCode(regionCode);
            if (grid != null) {
                map.put("gridId", grid.getGridId());
                map.put("gridName", grid.getGridName());
            }

            map.put("orgCode", regionCode);
        }

        map.put("djDomain", funConfigurationService.getAppDomain("$DJ_DOMAIN", null, null));
        map.put("regionCode", regionCode);
        map.put("year", DateUtils.getYear());
        return "/dcl/provincialplatform/party_construction_index.ftl";
    }
}
