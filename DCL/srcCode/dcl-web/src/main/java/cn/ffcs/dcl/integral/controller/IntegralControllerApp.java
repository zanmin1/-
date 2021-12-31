package cn.ffcs.dcl.integral.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.JsonHelper;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.integral.service.IIntegralService;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**   
 * @Description: 积分模块控制器-App端
 * @Author: gonghf
 * @Date: 11-18 11:08:40
 * @Copyright: 2021 福富软件
 */ 
@Controller("IntegralControllerApp")
@RequestMapping("/public/wap/integralControllerApp")
public class IntegralControllerApp extends ZZBaseController {

	@Autowired
	private IIntegralService integralService;

	/**
	 * 添加积分
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param bizId 业务id
	 * @param dictCode 字典编码
	 * @param reason 活动事由
	 * @return boolean 是否成功
	 */
	@ResponseBody
	@RequestMapping(value = "/addPointsForJsonp")
	public Object addPointsForJsonp(HttpServletRequest request, HttpSession session, ModelMap map,
									@RequestParam(value = "bizId") Long bizId, @RequestParam(value = "dictCode") String dictCode,
									@RequestParam(value = "reason") String reason) {
		String jsoncallback = request.getParameter("jsoncallback");

		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		boolean result = integralService.addPoints(bizId, dictCode, reason, userInfo.getUserId(), userInfo.getOrgCode());   // 添加积分。

		jsoncallback = jsoncallback + "(" + JsonHelper.getJsonString(result) + ")";
		return jsoncallback;
	}

}