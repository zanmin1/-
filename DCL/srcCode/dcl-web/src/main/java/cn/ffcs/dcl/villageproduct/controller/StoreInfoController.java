package cn.ffcs.dcl.villageproduct.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ffcs.dcl.mybatis.domain.villageproduct.StoreInfo;
import cn.ffcs.dcl.villageproduct.service.IStoreInfoService;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;

/**   
 * @Description: 商家信息模块控制器
 * @Author: 张志杰
 * @Date: 12-20 20:01:16
 * @Copyright: 2021 福富软件
 */ 
@Controller("storeInfoController")
@RequestMapping("/dcl/storeInfo")
public class StoreInfoController {

	@Autowired
	private IStoreInfoService storeInfoService; //注入商家信息模块服务
	
	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		return "/dcl/storeInfo/store_info_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
		int page, int rows) {
		page = page < 1 ? 1 : page;
		rows = rows < 1 ? 20 : rows;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("storeId", request.getParameter("storeId"));
		EUDGPagination pagination = storeInfoService.searchList(page, rows, params);
		return pagination;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		Long id) {
		Map<String, Object> params=new HashMap<>();
    	params.put("id", id);
		StoreInfo bo = storeInfoService.searchById(params);
		map.addAttribute("bo", bo);
		return "/dcl/storeInfo/store_info_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		Long id) {
		if (id != null) {
			Map<String, Object> params=new HashMap<>();
	    	params.put("id", id);
			StoreInfo bo = storeInfoService.searchById(params);
			map.put("bo", bo);
		}
		return "/dcl/storeInfo/store_info_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		StoreInfo bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		if (bo.getStoreId() == null) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = storeInfoService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			};
		} else { //修改
			bo.setUpdator(userInfo.getUserId());  //设置更新人
			boolean updateResult = storeInfoService.update(bo);
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
		StoreInfo bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = storeInfoService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}