package cn.ffcs.dcl.fundmanagement.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.assetmanagement.service.IAssetManagementService;
import cn.ffcs.dcl.fundmanagement.service.IFundManagementService;
import cn.ffcs.dcl.mybatis.domain.assetmanagement.AssetManagement;
import cn.ffcs.dcl.mybatis.domain.fundmanagement.FundManagement;
import cn.ffcs.dcl.resourcemanagement.service.IResourceManagementService;
import cn.ffcs.system.publicUtil.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;

/**   
 * @Description: 资金管理表模块控制器
 * @Author: 王文杰
 * @Date: 09-07 11:28:52
 * @Copyright: 2021 福富软件
 */ 
@Controller("fundManagementController")
@RequestMapping("/dcl/fundManagement")
public class FundManagementController extends ZZBaseController {

	@Autowired
	private IFundManagementService fundManagementService; //注入资金管理表模块服务

	@Autowired
	private IAssetManagementService assetManagementService; //注入资产管理表模块服务

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
		map.addAttribute("DICT_TYPE_P", DictConstantValue.DICT_TYPE_P);
		//二级收入
		map.addAttribute("DICT_TYPE_C_S", DictConstantValue.DICT_TYPE_C_S);
		//二级支出
		map.addAttribute("DICT_TYPE_C_Z", DictConstantValue.DICT_TYPE_C_Z);

		return "/dcl/fundManagement/fund_management_list.ftl";
	}




	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,FundManagement bo,
		int page, int rows) {
		page = page < 1 ? 1 : page;
		rows = rows < 1 ? 20 : rows;


		EUDGPagination pagination = fundManagementService.searchList(page, rows, bo);
		return pagination;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		FundManagement bo = fundManagementService.searchByUUId(id);
		map.addAttribute("bo", bo);


		return "/dcl/fundManagement/fund_management_view.ftl";
	}

	/**
	 * 统计数据
	 */
	@ResponseBody
	@RequestMapping("/sumData")
	public Object sumData(HttpServletRequest request, HttpSession session, ModelMap map
		,	String orgCode   ) {
		Map<String, Object> params =new HashMap<>();
		params.put("orgCode",orgCode);
		FundManagement bo = fundManagementService.sumData(params);
		map.addAttribute("bo", bo);

		Map<String,Object> res = new HashMap<>();
		res.put("data",bo);
		return res;
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {

		if (!StringUtils.isEmpty(id)) {
			FundManagement bo = fundManagementService.searchByUUId(id);
			map.put("bo", bo);
		}else{
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			FundManagement bo = new FundManagement();
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.put("bo", bo);
		}

		//一级类型
		map.addAttribute("DICT_TYPE_P", DictConstantValue.DICT_TYPE_P);
		//二级收入
		map.addAttribute("DICT_TYPE_C_S", DictConstantValue.DICT_TYPE_C_S);
		//二级支出
		map.addAttribute("DICT_TYPE_C_Z", DictConstantValue.DICT_TYPE_C_Z);


		return "/dcl/fundManagement/fund_management_form.ftl";
	}




	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		FundManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = fundManagementService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			};
		} else { //修改
			boolean updateResult = fundManagementService.update(bo);
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
		FundManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = fundManagementService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}


	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/bunchData")
	public Object bunchData(HttpServletRequest request, HttpSession session
		,	String orgCode ) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("orgCode",orgCode);



		resultMap.put("sum",fundManagementService.sumDataBanch(param) );
		resultMap.put("resList",resourceManagementService.searchListType(param) );
		resultMap.put("assList",assetManagementService.searchListType(param));
		return resultMap;
	}

}