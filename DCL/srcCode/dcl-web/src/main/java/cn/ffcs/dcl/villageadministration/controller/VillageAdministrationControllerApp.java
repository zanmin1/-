package cn.ffcs.dcl.villageadministration.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.gbp.infoOpen.common.InfoOpen;
import cn.ffcs.gbp.infoOpen.common.InfoOpenCriteria;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.OrgSocialInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**   
 * @Description: 村务政务模块控制器-App端
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("villageAdministrationControllerApp")
@RequestMapping("/public/wap/villageAdministrationApp")
public class VillageAdministrationControllerApp extends ZZBaseController {

	@Autowired
	private IModularContentService modularContentService; //注入模块内容服务

	@Autowired
	private ICommonInfoOpenService commonInfoOpenService;

	@Autowired
	private OrgSocialInfoOutService orgSocialInfoOutService;

	/**
	 * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return 页面数据
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

		map.addAttribute("orgCode", userInfo.getOrgCode());
		map.addAttribute("token", session.getAttribute("token"));
		map.put("gbpDomain", newDomain(session,"$GBP_DOMAIN"));
		map.put("imgDomain",funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null) );

		return "/mobile/villageadministration/village_administration_app_list.jsp";

	}

	/**
	 * 列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
	 */
	@RequestMapping("/indexV0101")
	public Object indexV0101(HttpServletRequest request, HttpSession session, ModelMap map) {

		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

		map.addAttribute("orgCode", userInfo.getOrgCode());
		map.addAttribute("token", session.getAttribute("token"));
		map.put("gbpDomain", newDomain(session,"$GBP_DOMAIN"));
		map.put("imgDomain",funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null) );

		return "/mobile/villageadministration/village_administration_app_list_v0101.jsp";

	}

	/**
	 * 获取头部背景信息
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @param regionCode 区域编码
     * @param useType 村务政务
     * @param type 轮播图
     * @return 页面数据
	 */
    @ResponseBody
	@RequestMapping("/getTbbjData")
	public Object getTbbjData(HttpServletRequest request, HttpSession session, ModelMap map,
							  String regionCode, String useType, String type) {
		DvTheme dvTheme = null;

		// 越权检查。（方法里面已经对regionCode进行了非空判断）
		if (checkDataPermissionForWx(session, regionCode)) {
			if (regionCode.length() > 2) {
				regionCode = regionCode.substring(0, 2);
			}

			// 非空判断。
			if (!StringUtils.isEmpty(useType) && !StringUtils.isEmpty(type)) {
				dvTheme = modularContentService.searchListForAPP(regionCode, useType, type);
			}
		}

		return dvTheme;
	}

    /**
     * 获取gbp工程接口数据
	 * @param request 客户端请求
     * @param session 会话
     * @param page 当前页码
     * @param rows 页面条数
     * @param criteria 数据对象
     * @return 页面数据
     */
	@ResponseBody
	@RequestMapping(value = "/findReleaseListData")
	public EUDGPagination findReleaseListData(HttpServletRequest request, HttpSession session, ModelMap map, @RequestParam(value = "page") int page,
											  @RequestParam(value = "rows") int rows, InfoOpenCriteria criteria, String orgCode)
			throws Exception {
		EUDGPagination pagination = new EUDGPagination();

		// 越权检查。
		if (checkDataPermissionForWx(session, orgCode)) {
			Map<String, Object> params = new HashMap<>(criteria.convertToMap());

			// 根据用户地域编码 获取 组织信息。
			User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
			OrgSocialInfoBO bo = orgSocialInfoOutService.getOrgIdByLocationCode(user.getOrgCode());
			UserInfo userInfo = new UserInfo();
			userInfo.setOrgCode(bo.getOrgCode());

			pagination = commonInfoOpenService.findReleaseList(page, rows, params, userInfo);


			if(pagination.getRows()!=null&&pagination.getRows().size()>0){

				List<InfoOpen> infoOpen =(List<InfoOpen>) pagination.getRows();
				if(rows<5){
					for(InfoOpen info:infoOpen){

						Map<String, Object> infomap = new HashMap<>();
						infomap.put("infoOpenId",info.getInfoOpenId());
						//	infomap.put("mode",info.getInfoOpenId());
						InfoOpen	detail=	commonInfoOpenService.findInfoOpenById(infomap,userInfo);
						info.setOverView(detail.getOverView());

					}
					pagination.setRows(infoOpen);
				}
			}



		}

		return pagination;
	}

}