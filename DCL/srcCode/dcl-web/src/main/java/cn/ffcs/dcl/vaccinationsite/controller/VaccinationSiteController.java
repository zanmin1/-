package cn.ffcs.dcl.vaccinationsite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.vaccinationsite.VaccinationSite;
import cn.ffcs.dcl.vaccinationsite.service.IVaccinationSiteService;
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
 * @Description: 疫苗接种点模块控制器
 * @Author: luchch
 * @Date: 12-14 15:09:21
 * @Copyright: 2021 福富软件
 */ 
@Controller("vaccinationSiteController")
@RequestMapping("/dcl/vaccinationSite")
public class VaccinationSiteController extends ZZBaseController {

	@Autowired
	private IVaccinationSiteService vaccinationSiteService; //注入疫苗接种点模块服务
	
	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		return "/dcl/vaccinationSite/vaccination_site_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map, String regionCode,
		int page, int rows) {
		page = page < 1 ? 1 : page;
		rows = rows < 1 ? 20 : rows;
		Map<String, Object> params = new HashMap<String, Object>();
//		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
//		params.put("regionCode", userInfo.getOrgCode());
		if (regionCode==null){
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
		}
		params.put("regionCode", regionCode);
		params.put("isValid","1");
		params.put("vaccinationsiteName", request.getParameter("vaccinationsiteName"));
		if (!checkDataPermission(session, CommonController.TYPE_GRID, regionCode)) {
			return new cn.ffcs.common.EUDGPagination(0, new ArrayList<>());
		} else {
			EUDGPagination pagination = vaccinationSiteService.searchList(page, rows, params);
			return pagination;
		}
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		VaccinationSite bo = vaccinationSiteService.searchById(id);
		map.addAttribute("bo", bo);
		return "/dcl/vaccinationSite/vaccination_site_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		if (id != null) {
			VaccinationSite bo = vaccinationSiteService.searchById(id);
			map.put("bo", bo);
		}
		return "/dcl/vaccinationSite/vaccination_site_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		VaccinationSite bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			bo.setUuid(UUID.randomUUID().toString().replaceAll("-","")); // 设置UUID
			bo.setIsValid(String.valueOf(1));
			bo.setRegionCode(userInfo.getOrgCode());
			bo.setRegionName(userInfo.getOrgName());
			Long id = vaccinationSiteService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			};
		} else { //修改
			bo.setUpdator(userInfo.getUserId());  //设置更新人
			boolean updateResult = vaccinationSiteService.update(bo);
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
		VaccinationSite bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = vaccinationSiteService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}