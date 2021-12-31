package cn.ffcs.dcl.xczxapphome.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.zone.user.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Description: 乡村振兴app首页
 * @Author: linguoxiong
 * @Date: 09-16 19:32:57
 * @Copyright: 2021 福富软件
 */
@Controller("xczxAppHomeController")
@RequestMapping("/public/wap/xczxAppHome")
public class XczxAppHomeController extends ZZBaseController {

    //index
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

//        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

        String orgCode = userInfo.getOrgCode();

        request.setAttribute("orgCode",orgCode);
//        request.setAttribute("orgCode",defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
//        request.setAttribute("orgName",defaultGridInfo.get(KEY_START_GRID_NAME));
//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名

//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名
//        String uiDomain = funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null);
//        request.setAttribute("uiDomain",uiDomain);
//        request.setAttribute("ANOLE_COMPONENT_URL", App.SYSTEM.getDomain(session));
//        request.setAttribute("imgDomain", imgDomain);
        setDomain(map);

        return "/mobile/xczxapphome/index-cxts.jsp";
    }

    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }

}
