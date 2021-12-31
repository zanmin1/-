package cn.ffcs.dcl.newWorkbench.Commonfunctions.controller;

import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller("WorkBenchController")
@RequestMapping("/dcl/workBench")
public class WorkBenchController extends ZZBaseController {

    @Autowired
    private IModularContentService modularContentService;   // 模块内容管理。

    /**
     * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map, String positionCode) {
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
        map.addAttribute("regionCode", userInfo.getInfoOrgCodeStr());
        map.addAttribute("positionCode", positionCode);   // 套餐编码。

        map.addAttribute("uiDomain", funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.addAttribute("gbpDomain", newDomain(session, "$GBP_DOMAIN"));
        map.addAttribute("weChatDomain", App.WECHAT.getDomain(session));
        map.addAttribute("eventDomain", funConfigurationService.getAppDomain("$EVENT_DOMAIN", null, null));

        return "dcl/newWorkbench/workBench_index.ftl";
    }

    /**
     * 新版获取配置数据列表数据
     */
    @ResponseBody
    @RequestMapping("/getModularContentNew")
    public Object getModularContentNew(HttpServletRequest request, HttpSession session, ModelMap map) {
        String useType = request.getParameter("useType");
        String regionCode = request.getParameter("regionCode");
        String type = request.getParameter("type");
        String platform = request.getParameter("platform");

        if (!StringUtils.isEmpty(regionCode) && regionCode.length() > 2) {
            regionCode = regionCode.substring(0, 2);
        }

        DvTheme dvTheme = modularContentService.searchContents(regionCode, useType,type,platform);

        return dvTheme;
    }

}
