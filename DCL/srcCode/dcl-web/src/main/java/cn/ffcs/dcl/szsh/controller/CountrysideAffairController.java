package cn.ffcs.dcl.szsh.controller;

import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 村务政务大屏
 *
 * @Author Create by zheng on 2021-12-24 14:45
 */
@Controller("countrysideAffairController")
@RequestMapping("/dcl/countrysideAffair")
public class CountrysideAffairController extends ZZBaseController {

    /**
     * 大屏
     * http://my.v6.aishequ.org:8990/dcl/dcl/countrysideAffair/index.jhtml
     * 切图地址
     * /10_WebCode/pages/web/big-screen/00-shuzishenghuo/subject/subject-cunwuzhengwu.html
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
        } else {
            MixedGridInfo grid = mixedGridInfoService.getGridInfoByInfoOrgCode(regionCode);
            if (grid != null) {
                map.put("gridId", grid.getGridId());
                map.put("gridName", grid.getGridName());
            }
        }
        map.put("regionCode", regionCode);
        return "/dcl/provincialplatform/countryside_affair_index.ftl";
    }
}
