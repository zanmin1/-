package cn.ffcs.dcl.voiceGroup.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.voiceGroup.VoiceGroup;
import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import cn.ffcs.dcl.voiceGroup.service.IVoiceGroupService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;

/**   
 * @Description: 语音群组表模块控制器
 * @Author: 王文杰
 * @Date: 12-27 16:41:33
 * @Copyright: 2021 福富软件
 */ 
@Controller("voiceGroupController")
@RequestMapping("/dcl/voiceGroup")
public class VoiceGroupController extends ZZBaseController {

	@Autowired
	private IVoiceGroupService voiceGroupService; //注入语音群组表模块服务



	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,	VoiceGroup bo
		) {

		EUDGPagination pagination = voiceGroupService.searchList(bo);
		return pagination;

	}


	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		VoiceGroup bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		// 越权检查。
		if (StringUtils.isEmpty(bo.getOrgCode()) || !bo.getOrgCode().startsWith(userInfo.getInfoOrgCodeStr())) {
			resultMap.put("result", result);
			return resultMap;
		}

		bo.setUpdator(userInfo.getUserId());  //设置更新人
		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = voiceGroupService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			};
		} else { //修改
			boolean updateResult = voiceGroupService.update(bo);
			if (updateResult) {
				result = "success";
			}
		}
		resultMap.put("result", result);
		return resultMap;
	}

	/**
	 * 删除数据
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
		VoiceGroup bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		VoiceGroup res = voiceGroupService.searchByuuId(bo.getUuid());

		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

		// 越权检查。
		if (res == null || !checkDataPermission(session, CommonController.TYPE_GRID, res.getOrgCode())) {
			resultMap.put("result", result);
			return resultMap;
		}

		boolean delResult = voiceGroupService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}