package cn.ffcs.dcl.historybroadcastpush.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.historybroadcastpush.service.IHistoryBroadcastpushService;
import cn.ffcs.dcl.mybatis.domain.historybroadcastpush.HistoryBroadcastpush;
import cn.ffcs.dcl.mybatis.domain.secretarymailbox.SecretaryMailbox;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.shequ.web.ParamUtils;
import cn.ffcs.uam.bo.UserInfo;
import dm.jdbc.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;



/**   
 * @Description: 历史播报推送模块控制器
 * @Author: sunwb
 * @Date: 12-22 09:53:30
 * @Copyright: 2021 福富软件
 */ 
@Controller("historyBroadcastpushController")
@RequestMapping("/dcl/historyBroadcastpush")
public class HistoryBroadcastpushController extends ZZBaseController {

	@Autowired
	private IHistoryBroadcastpushService historyBroadcastpushService; //注入历史播报推送模块服务
	
	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		// 所属区域。
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
		// 数据字典 - 使用平台
		map.addAttribute("platformDictCode", DictConstantValue.DCL_PLATFORM_TYPE);
		return "/dcl/historyBroadcastpush/history_broadcastpush.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
		int page, int limit) {

		PaginationDto<HistoryBroadcastpush> paginationDto = new PaginationDto<>();
		page = page < 1 ? 1 : page;
		limit = limit < 1 ? 20 : limit;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sendtime", request.getParameter("sendtime"));
		params.put("sendpeople", request.getParameter("sendpeople"));
		params.put("recipient", request.getParameter("recipient"));
		paginationDto = historyBroadcastpushService.searchList(page, limit, params);
		return paginationDto;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		Long id) {
		HistoryBroadcastpush bo = historyBroadcastpushService.searchById(id);
		map.addAttribute("bo", bo);
		return "/dcl/historyBroadcastpush/history_broadcastpush_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		Long id) {
		if (id != null) {
			HistoryBroadcastpush bo = historyBroadcastpushService.searchById(id);
			map.put("bo", bo);
		}
		return "/dcl/historyBroadcastpush/history_broadcastpush_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		HistoryBroadcastpush bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		String id ="";
		if (StringUtil.isEmpty(bo.getPushId())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			 id = historyBroadcastpushService.insert(bo);
			if (id != null) {
				result = "success";
			};
		} else { //修改
			bo.setUpdator(userInfo.getUserId());  //设置更新人
			boolean updateResult = historyBroadcastpushService.update(bo);
			if (updateResult) {
				result = "success";
			}
		}
		resultMap.put("id", id);
		resultMap.put("result", result);
		return resultMap;
	}



	/**
	 * 删除数据
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
		HistoryBroadcastpush bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		String ids =request.getParameter("ids");
		bo.setDelList(Arrays.asList(ids.split(",").clone()));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = historyBroadcastpushService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}