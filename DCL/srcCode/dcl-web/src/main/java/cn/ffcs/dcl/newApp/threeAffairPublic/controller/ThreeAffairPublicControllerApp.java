package cn.ffcs.dcl.newApp.threeAffairPublic.controller;

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
 * @Description: 三务公开模块控制器-App端
 * @Author: xuewq
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("threeAffairPublicControllerApp")
@RequestMapping({"/public/wap/threeAffairPublicApp","/dcl/threeAffairPublicApp"})
public class ThreeAffairPublicControllerApp extends ZZBaseController {

	@Autowired
	private IModularContentService modularContentService; //注入模块内容服务

	@Autowired
	private ICommonInfoOpenService commonInfoOpenService;

	@Autowired
	private OrgSocialInfoOutService orgSocialInfoOutService;

	/**
	 * 列表页面
	 *
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map     参数
	 *                现网调试地址 ：https://dcl.zgdxxczx.cn/dcl/public/wap/threeAffairPublicApp/index.jhtml
	 *                本地前端调试地址：http://my.v6.aishequ.org:8990/dcl/threeAffairPublicApp/index.jhtml
	 * @return 页面数据
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		map.addAttribute("orgCode", user.getOrgCode());
//		map.addAttribute("token", session.getAttribute("token"));

		map.put("CS_DOMAIN", funConfigurationService.getAppDomain("$CS_DOMAIN", null, null));
		map.put("gbpDomain", newDomain(session, "$GBP_DOMAIN"));

		return "/mobile/newApp/threeAffairPublic/three_affair_newApp_list.jsp";

	}

}