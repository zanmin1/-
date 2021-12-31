package cn.ffcs.dcl.newApp.ruralGovernance.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**   
 * @Description: 乡村治理模块控制器-App端
 * @Author: xuewq
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("ruralGovernanceControllerNewApp")
@RequestMapping({"/public/wap/ruralGovernanceNewApp","/dcl/ruralGovernanceNewApp"})
public class RuralGovernanceControllerApp extends ZZBaseController {

	@Autowired
	private IModularContentService modularContentService; //注入模块内容服务

	@Autowired
	private ICommonInfoOpenService commonInfoOpenService;

	@Autowired
	private OrgSocialInfoOutService orgSocialInfoOutService;

	/**
	 * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
	 * 现网调试地址 ：https://dcl.zgdxxczx.cn/dcl/public/wap/ruralGovernanceNewApp/index.jhtml?token=
	 * 本地前端调试地址：http://my.v6.aishequ.org:8990/dcl/ruralGovernanceNewApp/index.jhtml
     * @return 页面数据
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		map.addAttribute("orgCode", user.getOrgCode());
		map.addAttribute("token", session.getAttribute("token"));
		System.out.println("============token============");
		System.out.println("token = "+session.getAttribute("token"));
		System.out.println("============token============");

		return "/mobile/newApp/ruralGovernance/rural_governance_newApp_list.jsp";

	}


}