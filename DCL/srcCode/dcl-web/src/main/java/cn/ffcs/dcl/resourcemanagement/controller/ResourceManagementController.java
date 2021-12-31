package cn.ffcs.dcl.resourcemanagement.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.assetmanagement.AssetManagement;
import cn.ffcs.dcl.mybatis.domain.resourcemanagement.ResourceManagement;
import cn.ffcs.dcl.resourcemanagement.service.IResourceManagementService;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;



/**   
 * @Description: 资源管理表模块控制器
 * @Author: 王文杰
 * @Date: 09-09 15:04:53
 * @Copyright: 2021 福富软件
 */ 
@Controller("resourceManagementController")
@RequestMapping("/dcl/resourceManagement")
public class ResourceManagementController  extends ZZBaseController {

	@Autowired
	private IResourceManagementService resourceManagementService; //注入资源管理表模块服务
	
	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {


		Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
		map.addAttribute("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.addAttribute("orgName", defaultGridInfo.get(KEY_START_GRID_NAME));
		//一级类型
		map.addAttribute("DICT_RESOURCE", DictConstantValue.DICT_RESOURCE);


		return "/dcl/resourceManagement/resource_management_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,ResourceManagement bo,
		int page, int rows) {
		page = page < 1 ? 1 : page;
		rows = rows < 1 ? 20 : rows;

		EUDGPagination pagination = resourceManagementService.searchList(page, rows, bo);
		return pagination;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		ResourceManagement bo = resourceManagementService.searchById(id);
		map.addAttribute("bo", bo);
		return "/dcl/resourceManagement/resource_management_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
	String id) {
		if (!StringUtils.isEmpty(id)) {
			ResourceManagement bo = resourceManagementService.searchById(id);
			map.put("bo", bo);
		}else{
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);

			//登记人默认
			ResourceManagement bo =new ResourceManagement();
			bo.setCheckInPerson(userInfo.getPartyName());
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.addAttribute("bo",bo );
		}

		map.addAttribute("DICT_RESOURCE", DictConstantValue.DICT_RESOURCE);


		return "/dcl/resourceManagement/resource_management_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		ResourceManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = resourceManagementService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			};
		} else { //修改
			boolean updateResult = resourceManagementService.update(bo);
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
		ResourceManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = resourceManagementService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}