package cn.ffcs.dcl.farmhousemanagement.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.farmhousemanagement.service.IFarmhouseManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
import cn.ffcs.system.publicUtil.EUDGPagination;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.uam.bo.UserInfo;


/**   
 * @Description: 农家乐管理模块控制器
 * @Author: os.liwei
 * @Date: 09-15 09:07:22
 * @Copyright: 2021 福富软件
 */ 
@Controller("farmhouseManagementController")
@RequestMapping("/dcl/farmhouseManagement")
public class FarmhouseManagementController extends ZZBaseController {

	@Autowired
	private IFarmhouseManagementService farmhouseManagementService; //注入农家乐管理模块服务
	@Autowired
	private IResMarkerService resMarkerService;//gis地图接口
	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;

	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		// 所属区域。
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		map.put("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.put("orgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
		return "/dcl/farmhouseManagement/farmhouse_management_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
						   int page, int rows,FarmhouseManagement bo) {
		page = page < 1 ? 1 : page;
		rows = rows < 1 ? 20 : rows;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("farmhouseName", request.getParameter("farmhouseName"));//关键字
		params.put("orgCode", request.getParameter("orgCode"));//地域编码
		params.put("address", request.getParameter("address"));//地址
		params.put("issuStatus", request.getParameter("issuStatus"));//发布状态
		EUDGPagination pagination = farmhouseManagementService.searchList(page,rows, params);
		return pagination;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String uuId) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		//附件类型
		map.put("bizType", ConstantValue.ATTA_FAR_HOUSE_MANAGE); //附件上传

		map.put("markerType", DictConstantValue.FARMHOUSE_MANAGEMENT_MAP);//地图标注字典
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注
		FarmhouseManagement bo = new FarmhouseManagement();
		if (StringUtils.isNotEmpty(uuId)) {
			bo = farmhouseManagementService.searchByUuId(uuId);
		}
		bo.setPulisher(userInfo.getUserName());
		bo.setIssuOrgName(userInfo.getOrgName());
		map.put("bo", bo);
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", ConstantValue.DCL_FAR_HOUSE_MANAGE);
		map.put("mapType", ConstantValue.MAP_TYPE);
		map.put("markerOperation", 2);
		map.put("markModule", ConstantValue.FAR_HOUSE_MANAGE_MARK);  //地图标注类型


		//轮播图片
		try{
			List<AttachmentByUUID> attList=	attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE);
			List<AttachmentByUUID>	 videoList=	attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);
			List<FarmhouseManagement> pathList =new ArrayList<>();

			//视频在前
			for(AttachmentByUUID att:videoList){
				FarmhouseManagement res =new FarmhouseManagement();
				res.setPicUrl(att.getFilePath());
				res.setImg("video");
				pathList.add(res);
			}
			for(AttachmentByUUID att:attList){
				FarmhouseManagement res =new FarmhouseManagement();
				res.setPicUrl(att.getFilePath());
				res.setImg("img");
				pathList.add(res);

			}
			map.put("attList", pathList );
		}catch (Exception e){
			e.printStackTrace();
		}



		return "/dcl/farmhouseManagement/farmhouse_management_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String uuId) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		/*map.put("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.put("orgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));*/
		//附件类型
		map.put("bizType", ConstantValue.ATTA_FAR_HOUSE_MANAGE); //附件上传
		map.put("bizTypeVideo", ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);//农家乐视频

		String markerOperation = "0";//地图标注 新增
		map.put("markerType", DictConstantValue.FARMHOUSE_MANAGEMENT_MAP);//地图标注字典
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注
		FarmhouseManagement bo = new FarmhouseManagement();
		if (StringUtils.isNotEmpty(uuId)) {
			 bo = farmhouseManagementService.searchByUuId(uuId);
			markerOperation = "1";  //地图标注

		}else{
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME).toString());
		}


		map.put("bo", bo);
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", ConstantValue.DCL_FAR_HOUSE_MANAGE);
		map.put("mapType", ConstantValue.MAP_TYPE);
		map.put("markerOperation", markerOperation);
		map.put("markModule", ConstantValue.FAR_HOUSE_MANAGE_MARK);  //地图标注类型
		return "/dcl/farmhouseManagement/farmhouse_management_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		FarmhouseManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		ResultObj resultObj = new ResultObj(false);
		bo.setPulisher(userInfo.getUserName());
		bo.setIssuOrgName(userInfo.getOrgName());



		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = null;
			try {
				id = farmhouseManagementService.insert(bo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (id != null && id > 0) {
				FarmhouseManagement farmhouseManagement	= farmhouseManagementService.searchById(id);
                 if(bo.getLongitude()!=null && bo.getLatitude()!=null){
				//当新增成功以后那么必须要调用新的地图保存接口
				System.out.println("/**********************进入地图新增的方法 start ********************************");
				ResMarker resMarker = new ResMarker();
				resMarker.setMarkerType(DictConstantValue.FARMHOUSE_MANAGEMENT_MAP);
				resMarker.setUuuId(farmhouseManagement.getUuid());
				resMarker.setMapType("5");
				resMarker.setCatalog("02");
				resMarker.setX(bo.getT_x());//经度
				resMarker.setY(bo.getT_y());//纬度
				resMarkerService.saveOrUpdateResMarker(resMarker);
				System.out.println("打印调用接口结果="+resMarkerService.saveOrUpdateResMarker(resMarker));
				System.out.println("/**********************进入地图新增的方法 end ********************************");
				 }

			resultObj.setSuccess(true);
				resultObj.setTipMsg("操作成功！");
				resultObj.setData(bo);
			}
		} else { //修改
			bo.setUpdator(userInfo.getUserId());  //设置更新人
			boolean updateResult = farmhouseManagementService.update(bo);
			if (updateResult) {

				if(bo.getT_x()!=null && bo.getT_y()!=null) {
					//当新增成功以后那么必须要调用新的地图保存接口
					ResMarker resMarker = new ResMarker();
					resMarker.setMarkerType(DictConstantValue.FARMHOUSE_MANAGEMENT_MAP);
					resMarker.setUuuId(bo.getUuid());
					resMarker.setMapType("5");
					resMarker.setCatalog("02");
					resMarker.setX(bo.getT_x());
					resMarker.setY(bo.getT_y());
					resMarkerService.saveOrUpdateResMarker(resMarker);
				}
				resultObj.setSuccess(true);
				resultObj.setData(bo);
				resultObj.setTipMsg("操作成功！");
			}
		}
		return resultObj;
	}

	/**
	 * 删除数据
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
		FarmhouseManagement bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = farmhouseManagementService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}