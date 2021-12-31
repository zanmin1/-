package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Description: 疫情防控大屏控制器
 * @Author: gonghf
 * @Date: 12-14 10:12:14
 * @Copyright: 2021 福富软件
 */
@Controller("EpidemicPreventionAndControlController")
@RequestMapping("/dcl/epidemicPreventionAndControl")
public class EpidemicPreventionAndControlController extends ZZBaseController {

    /**
     * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param response 响应
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map, String regionCode, String positionCode) {
        map.put("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));
        map.addAttribute("WECHAT_DOMAIN", App.WECHAT.getDomain(session));

        // 三级穿透。
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            regionCode = userInfo.getInfoOrgCodeStr();
        }
        map.put("regionCode", regionCode);
        map.addAttribute("positionCode", positionCode);   // 套餐编码。

        return "dcl/provincialplatform/epidemicPreventionAndControl_index.ftl";
    }

}
