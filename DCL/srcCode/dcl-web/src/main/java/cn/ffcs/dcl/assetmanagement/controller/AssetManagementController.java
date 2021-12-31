package cn.ffcs.dcl.assetmanagement.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.assetmanagement.service.IAssetManagementService;
import cn.ffcs.dcl.mybatis.domain.assetmanagement.AssetManagement;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;



/**   
 * @Description: 资产管理表模块控制器
 * @Author: 王文杰
 * @Date: 09-08 19:32:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("assetManagementController")
@RequestMapping("/dcl/assetManagement")
public class AssetManagementController extends ZZBaseController {

	@Autowired
	private IAssetManagementService assetManagementService; //注入资产管理表模块服务
	
	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

		Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
		map.addAttribute("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.addAttribute("orgName", defaultGridInfo.get(KEY_START_GRID_NAME));

		//资产
		map.addAttribute("DICT_ASSET_TYPE", DictConstantValue.DICT_ASSET_TYPE);
		//使用
		map.addAttribute("DICT_USAGE", DictConstantValue.DICT_USAGE);



		return "/dcl/assetManagement/asset_management_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map, AssetManagement bo,
		int page, int rows) {
		page = page < 1 ? 1 : page;
		rows = rows < 1 ? 20 : rows;

		EUDGPagination pagination = assetManagementService.searchList(page, rows, bo);
		return pagination;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		AssetManagement bo = assetManagementService.searchById(id);
		map.addAttribute("bo", bo);
		return "/dcl/assetManagement/asset_management_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
	   String id) {

		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		//登记人默认
		map.addAttribute("userName", userInfo.getPartyName());

		if (!StringUtils.isEmpty(id)) {
			AssetManagement bo = assetManagementService.searchById(id);
			map.put("bo", bo);
		}else{
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			AssetManagement bo = new AssetManagement();
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.put("bo", bo);
		}


		//资产
		map.addAttribute("DICT_ASSET_TYPE", DictConstantValue.DICT_ASSET_TYPE);
		//使用
		map.addAttribute("DICT_USAGE", DictConstantValue.DICT_USAGE);


		return "/dcl/assetManagement/asset_management_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		AssetManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = assetManagementService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			};
		} else { //修改
			boolean updateResult = assetManagementService.update(bo);
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
		AssetManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = assetManagementService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}