package cn.ffcs.dcl.historydetail.controller;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.historydetail.service.HistoryDetailService;
import cn.ffcs.dcl.mybatis.domain.historydetail.HistoryDetail;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;


/**   
 * @Description: 历史推送详情模块控制器
 * @Author: niguolong
 * @Date: 12-21 19:58:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("historyDetailController")
@RequestMapping("/dcl/historyDetail")
public class HistoryDetailController extends ZZBaseController {

	@Autowired
	private HistoryDetailService historyDetailService; //注入历史推送详情模块服务
	
	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map, String id) {
		// 所属区域。
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
		// 数据字典 - 使用平台
		HistoryDetail bo = historyDetailService.searchById(id);

		map.addAttribute("id", id);

		map.addAttribute("platformDictCode", DictConstantValue.DCL_PLATFORM_TYPE);
		return "/dcl/historyDetail/history_detail_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
						   int page, int limit) {
		PaginationDto<HistoryDetail> paginationDto = new PaginationDto<HistoryDetail>();
		page = page < 1 ? 1 : page;
		limit = limit < 1 ? 20 : limit;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", request.getParameter("id"));
		params.put("name", request.getParameter("name"));
		params.put("regionName", request.getParameter("regionName"));
		paginationDto = historyDetailService.searchList(page, limit, params);
		return paginationDto;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		HistoryDetail bo = historyDetailService.searchById(id);
		System.out.println("+++++++++++++");
		map.addAttribute("bo", bo);
		return "/dcl/historyDetail/history_detail_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		if (id != null) {
			HistoryDetail bo = historyDetailService.searchById(id);
			map.put("bo", bo);
		}
		return "/dcl/historyDetail/history_detail_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		HistoryDetail bo) {
		System.out.println("保存+++++++++++");
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

			if (StringUtils.isEmpty(bo.getDetailId())) { //新增
			System.out.println("新增+++++++++++++++++++");
			bo.setCreator(userInfo.getUserId());  //设置创建人
				System.out.println(bo.getCreator()+"设置创建人+++++++++++++++++++");
			String id = historyDetailService.insert(bo);
			if (id != null) {
				result = "success";
			};
		} else { //修改
			System.out.println("修改-------------------");
			bo.setUpdator(userInfo.getUserId());  //设置更新人
			boolean updateResult = historyDetailService.update(bo);
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
		HistoryDetail bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		String ids =request.getParameter("ids");
		bo.setDelList(Arrays.asList(ids.split(",").clone()));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = historyDetailService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}