package cn.ffcs.dcl.intelligentParty.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.zone.user.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Classname IntelligentPartAppController
 * @Description TODO
 * @Date 2021/12/29 10:31
 * @Created by xuewq
 * @Copyright: 2021 福富软件
 */
@Controller
@RequestMapping("/public/wap/intelligentPartApp")
public class IntelligentPartAppController extends ZZBaseController {
    /**
     * 智慧党建首頁
     * 访问地址：http://dcl.zhxc.fzyzxxjs.cn/dcl/public/wap/intelligentPartApp/index.jhtml?app=app&token=QVpjekovc2NSbEFPSUREai9pMEFoNkNOYzNBOHFGeG05R2wyNnlJQ3lOaUhqWmRtM2FqdTVlVkdVbmg5d3k5Vw==
     * 切图：/10_WebCode/pages/app/jzfp/fujian-xczx/2.7.1-xiangcunzhili.html
     * @param request 客户端请求
     * @param session 会话
     * @param map     参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        map.addAttribute("orgCode", user.getOrgCode());
        map.addAttribute("orgName", user.getOrgName());
        map.put("gbpDomain", newDomain(session,"$GBP_DOMAIN"));
        map.put("djDomain", newDomain(session,"$DJ_DOMAIN"));
//        map.addAttribute("orgCode", "35");
        setDomain(map);
        return "/mobile/intelligentParty/intelligentParty_index.jsp";
    }



    /**
     * 设置域名
     * @param map 参数
     */
    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }
}
