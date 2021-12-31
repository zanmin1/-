package cn.ffcs.dcl.newApp.culturaltourism.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**   
 * @Description: 文化旅游模块控制器-App端
 * @Author: gonghf
 * @Date: 12-20 15:30:00
 * @Copyright: 2021 福富软件
 */ 
@Controller("culturalTourismControllerApp")
@RequestMapping("/public/wap/culturalTourismControllerApp")
public class CulturalTourismControllerApp extends ZZBaseController {

	@Autowired
	private IFunConfigurationService funConfigurationService;
	
    /**
     * 列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		map.addAttribute("regionCode", user.getOrgCode());
		map.addAttribute("token", session.getAttribute("token"));
		setDomain(map,session);

		return "/mobile/newApp/culturaltourism/culturaltourism_app_list.jsp";
    }

	/**
	 * 设置域名
	 * @param map 参数
	 */
	private void setDomain(ModelMap map,HttpSession session) {

		if(session.getAttribute("mainTit")!=null){
			String   mainTit	= session.getAttribute("mainTit").toString();
			map.addAttribute("mainTit", mainTit);
		}


		map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
		map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
	}

}