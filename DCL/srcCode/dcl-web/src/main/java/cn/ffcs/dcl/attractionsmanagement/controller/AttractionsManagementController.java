package cn.ffcs.dcl.attractionsmanagement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.Gps;
import cn.ffcs.common.PositionUtil;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.attractionsmanagement.service.IAttractionsManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**
 * @Description: 景点管理表模块控制器
 * @Author: 王文杰
 * @Date: 09-13 11:02:34
 * @Copyright: 2021 福富软件
 */
@Controller("attractionsManagementController")
@RequestMapping("/dcl/attractionsManagement")
public class AttractionsManagementController extends ZZBaseController {

	@Autowired
	private IAttractionsManagementService attractionsManagementService; //注入景点管理表模块服务

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;


	private void setStatis(ModelMap map) {
		//图片附件
		map.addAttribute("bizType", ConstantValue.DCL_ATTR_TITLLE);
		//视频附件
		map.addAttribute("bizVideoType", ConstantValue.DCL_ATTR_VIDEO);
		//收费
		map.addAttribute("DICT_PAY", DictConstantValue.DICT_PAY);
		//景点类型
		map.addAttribute("DICT_ATTR_TYPE", DictConstantValue.DICT_ATTR_TYPE);
		//发布状态
		map.addAttribute("issuStatusDictCode", DictConstantValue.ISSU_STATUS_ATT);

	}

	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

		Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);

		map.addAttribute("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.addAttribute("orgName", defaultGridInfo.get(KEY_START_GRID_NAME));

		setStatis(map);

		return "/dcl/attractionsManagement/attractions_management_list.ftl";
	}

	/**
	 * 列表数据
	 * 查询条件 orgCode 必传
	 *
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
		AttractionsManagement bo) {

		EUDGPagination pagination = new EUDGPagination();
		// 越权检查。
		if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermission(session, bo.getOrgCode())) {
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

			 pagination = attractionsManagementService.searchList(bo,userInfo.getOrgCode());
		}

		return pagination;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {

		AttractionsManagement bo = attractionsManagementService.searchByUUId(id);
		// 越权检查。
		if (bo == null || !checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {

			return "/dcl/homestaymanagement/homestay_management_view.ftl";
		}

		map.addAttribute("bo", bo);

		int markerOperation = ConstantValue.WATCH_MARKER;//地图标注 查看
		map.put("GIS_URL", App.GIS.getDomain(session));//地图标注用
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));//地图标注用
		map.put("module", DictConstantValue.ATTR_MANAGE_MAP); //景点地图 dictCode
		map.put("markerOperation", markerOperation);

		setStatis(map);

		//轮播图片
		try{
			List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_TITLLE);
			List<AttachmentByUUID>	 videoList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_VIDEO);

			List<AttractionsManagement> pathList =new ArrayList<>();

			//视频在前
			for(AttachmentByUUID att:videoList){
				AttractionsManagement res =new AttractionsManagement();
				res.setPicUrl(att.getFilePath());
				res.setImg("video");
				pathList.add(res);
			}
			for(AttachmentByUUID att:attList){
				AttractionsManagement res =new AttractionsManagement();
				res.setPicUrl(att.getFilePath());
				res.setImg("img");
				pathList.add(res);

			}

			map.put("attList", pathList );
		}catch (Exception e){

			e.printStackTrace();

		}
		return "/dcl/attractionsManagement/attractions_management_view.ftl";
	}


	/**
	 * 详情页面
	 */
	@ResponseBody
	@RequestMapping("/detail")
	public Object detail(HttpServletRequest request, HttpSession session,
					   String uuid) {
		HashMap<String, Object> map = new HashMap<>();
		AttractionsManagement bo = attractionsManagementService.searchByUUId(uuid);
		// 越权检查。
		if (bo == null || !checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {
			return map;
		}

		map.put("bo", bo);

		int markerOperation = ConstantValue.WATCH_MARKER;//地图标注 查看
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", DictConstantValue.ATTR_MANAGE_MAP);
		map.put("markerOperation", markerOperation);

		//轮播图片
		try{
			List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_TITLLE);
			List<AttachmentByUUID>	 videoList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_VIDEO);

			List<AttractionsManagement> pathList =new ArrayList<>();

			//视频在前
			for(AttachmentByUUID att:videoList){
				AttractionsManagement res =new AttractionsManagement();
				res.setPicUrl(att.getFilePath());
				res.setImg("video");
				pathList.add(res);
			}
			for(AttachmentByUUID att:attList){
				AttractionsManagement res =new AttractionsManagement();
				res.setPicUrl(att.getFilePath());
				res.setImg("img");
				pathList.add(res);
			}

			map.put("attList", pathList );
		}catch (Exception e){

			e.printStackTrace();

		}
		return map;
	}


	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
					   String id) {

		 int markerOperation = ConstantValue.ADD_MARKER;//地图标注 新增
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注


		if (!StringUtils.isEmpty(id)) {
			AttractionsManagement bo = attractionsManagementService.searchByUUId(id);

			// 越权检查。
			if (bo != null && checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {

				markerOperation = ConstantValue.EDIT_MARKER;  //地图标注
				map.put("bo", bo);

			}

		}else{
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			AttractionsManagement bo =new AttractionsManagement();
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName( defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.put("bo", bo);
		}

		setStatis(map);

		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", DictConstantValue.ATTR_MANAGE_MAP);
		map.put("markerOperation", markerOperation);

		return "/dcl/attractionsManagement/attractions_management_form.ftl";

	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		AttractionsManagement bo) {

		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

		// 越权检查。
		if (StringUtils.isEmpty(bo.getOrgCode()) || !bo.getOrgCode().startsWith(userInfo.getInfoOrgCodeStr())) {
			resultMap.put("result", result);
			return resultMap;
		}

		//默认字段 发布人 发布组织名称
		bo.setIssuPerson(userInfo.getPartyName());
		bo.setIssuOrgName(userInfo.getOrgName());

		if(!StringUtils.isEmpty(bo.getT_x())){
			
		try{
			//地图84转百度02坐标系
			Gps position = PositionUtil.gps84_To_Bd09(Double.parseDouble(bo.getT_y()),Double.parseDouble(bo.getT_x()));

			bo.setX(position.getWgLon()+"");
			bo.setY(position.getWgLat()+"");

		}catch (Exception e){
			e.printStackTrace();
			resultMap.put("result", result);
			return resultMap;
		}

		}


		bo.setUpdator(userInfo.getUserId());  //设置更新人
		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = attractionsManagementService.insert(bo);

			if (id != null && id > 0) {

				result = "success";
			};
		} else { //修改
			boolean updateResult = attractionsManagementService.update(bo);
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
		AttractionsManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

		AttractionsManagement res = attractionsManagementService.searchByUUId(bo.getUuid());

		// 越权检查。
		if (res == null || !checkDataPermission(session, CommonController.TYPE_GRID, res.getOrgCode())) {
			resultMap.put("result", result);
			return resultMap;
		}

		bo.setUpdator(userInfo.getUserId());  //设置更新人

		boolean delResult = attractionsManagementService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}



//	@RequestMapping("/mobileIndex")
//	public Object mobileIndex(HttpServletRequest request, HttpSession session, ModelMap map) {
//
//		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
//
//		Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
//
//		request.setAttribute("regionId",defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_ID)); //地域Id
//		request.setAttribute("orgId",userInfo.getOrgId()); //组织Id
//
//		map.addAttribute("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
//		map.addAttribute("orgName", defaultGridInfo.get(KEY_START_GRID_NAME));
//
//		return "/mobile/ruraltourism/lvyou-liebiao.jsp";
//
//	}

//
//	@RequestMapping("/mobileView")
//	public Object mobileView(HttpServletRequest request, HttpSession session, ModelMap map ,String uuid) {
//
//		AttractionsManagement bo = attractionsManagementService.searchByUUId(uuid);
//		map.addAttribute("bo", bo);
//
//		//轮播图片
//		try{
//			List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_TITLLE);
//			List<AttachmentByUUID>	 videoList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_VIDEO);
//
//			List<AttractionsManagement> pathList =new ArrayList<>();
//
//
//			//视频在前
//			for(AttachmentByUUID att:videoList){
//				AttractionsManagement res =new AttractionsManagement();
//				res.setPicUrl(att.getFilePath());
//				res.setImg("video");
//				pathList.add(res);
//			}
//			for(AttachmentByUUID att:attList){
//				AttractionsManagement res =new AttractionsManagement();
//				res.setPicUrl(att.getFilePath());
//				res.setImg("img");
//				pathList.add(res);
//
//			}
//
//			map.put("attList", JSON.toJSONString(pathList) );
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//
////		List<ResMarker> res = resMarkerService.findResMarkerByParam(DictConstantValue.ATTR_MANAGE_MAP,uuid,null);
////
////		if(res!=null&&res.size()>0){
////			//84坐标转百度坐标
////			Gps position = PositionUtil.gps84_To_Bd09(Double.parseDouble(res.get(0).getY()),Double.parseDouble(res.get(0).getX()));
////
////			map.put("x", position.getWgLon());
////			map.put("y", position.getWgLat());
////		}
//
//		setStatis(map);
//
//		return "/mobile/ruraltourism/lvyou-xiangqing.jsp";
//
//	}


}