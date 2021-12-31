package cn.ffcs.dcl.homestaymanagement.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.dcl.homestaymanagement.service.IHomestayManagementService;

/**   
 * @Description: 民宿管理模块控制器-Pc端
 * @Author: gonghf
 * @Date: 09-15 09:47:14
 * @Copyright: 2021 福富软件
 */ 
@Controller("HomestayManagementControllerPc")
@RequestMapping("/dcl/homestayManagementPc")
public class HomestayManagementControllerPc extends ZZBaseController {

	@Autowired
	private IHomestayManagementService homestaymanagementService; //注入民宿管理模块服务

	@Autowired
	private IBaseDictionaryService baseDictionaryService;   // 数据字典。

	@Autowired
	private IResMarkerService resMarkerService;   // gis地图接口

    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;
	
	/**
	 * pc列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		// 所属区域。
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));

		// 数据字典 - 发布状态。
		map.addAttribute("issuStatusDictCode", DictConstantValue.ISSU_STATUS);

		return "/dcl/homestaymanagement/homestay_management_list.ftl";
	}

	/**
	 * 列表数据
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param bo 数据对象
	 * @return 页面数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
						   HomestayManagement bo) {
		PaginationDto<HomestayManagement> paginationDto = new PaginationDto<>();

		// 越权检查。
		if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermission(session, bo.getOrgCode())) {
			// 区域编码，数据字典用。
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
			bo.setOrgCode(userInfo.getInfoOrgCodeStr());

			paginationDto = homestaymanagementService.searchList(bo);
		}

		return paginationDto;
	}

	/**
	 * pc详情页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param uuid 唯一标识
	 * @return 页面数据
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
					   String uuid) {
		// 区域编码，数据字典用。
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");

		HomestayManagement bo = homestaymanagementService.searchByUuid(uuid, userInfo.getInfoOrgCodeStr());

		// 越权检查。
		if (bo != null && checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {
			map.addAttribute("bo", bo);

			// 地图。
			String markerOperation = "2"; // 地图标注 新增
			map.put("GIS_URL", App.GIS.getDomain(session)); // 新地图标注
			map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
			map.put("module", DictConstantValue.DCL_HOMESTAY_MAP);
			map.put("markerOperation", markerOperation);

			// 轮播图片
			try {
				List<AttachmentByUUID> imgList = attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.DCL_HOMESTAY_PHOTO);
				List<AttachmentByUUID> videoList = attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.DCL_HOMESTAY_VIDEO);
	
				List<HomestayManagement> fileList = new ArrayList<>();
	
				// 视频在前
				for(AttachmentByUUID video : videoList) {
					HomestayManagement homestayManagement = new HomestayManagement();
					homestayManagement.setPicUrl(video.getFilePath());
					homestayManagement.setFileType("video");
					fileList.add(homestayManagement);
				}
				// 图片在后
				for(AttachmentByUUID img : imgList) {
					HomestayManagement homestayManagement = new HomestayManagement();
					homestayManagement.setPicUrl(img.getFilePath());
					homestayManagement.setFileType("img");
					fileList.add(homestayManagement);
				}
	
				map.put("fileList", fileList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "/dcl/homestaymanagement/homestay_management_view.ftl";
	}

	/**
	 * 表单页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param uuid 唯一标识
	 * @return 页面数据
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
					   String uuid) {
		String markerOperation = "0"; // 地图标注 新增

		if (!StringUtils.isEmpty(uuid)) {
			// 区域编码，数据字典用。
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");

			HomestayManagement bo = homestaymanagementService.searchByUuid(uuid, userInfo.getInfoOrgCodeStr());

			// 越权检查。
			if (bo != null && checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {
                markerOperation = "1"; // 地图标注
                map.put("bo", bo);
			}
		} else {
			HomestayManagement bo = new HomestayManagement();
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName( defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.put("bo", bo);
		}

		// 数据字典 - 发布状态。
		map.addAttribute("accommodationDictCode", DictConstantValue.ACCOMMODATION);
		map.addAttribute("issuStatusDictCode", DictConstantValue.ISSU_STATUS);

		// 地图。
		map.put("GIS_URL", App.GIS.getDomain(session)); // 新地图标注
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", DictConstantValue.DCL_HOMESTAY_MAP);
		map.put("markerOperation", markerOperation);

		// 照片，视频。
		map.put("bizTypePhoto", ConstantValue.DCL_HOMESTAY_PHOTO);
		map.put("bizTypeVideo", ConstantValue.DCL_HOMESTAY_VIDEO);

		return "/dcl/homestaymanagement/homestay_management_form.ftl";
	}

	/**
	 * 保存数据
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param bo 数据对象
	 * @return 页面数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
					   HomestayManagement bo) {
		ResultObj resultObj = new ResultObj(false, "保存失败！", null);
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		// 越权检查。
		if (!StringUtils.isEmpty(bo.getOrgCode()) && bo.getOrgCode().startsWith(userInfo.getInfoOrgCodeStr())) {
			// 设置已发布。
			List<BaseDataDict> issuStatusList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.ISSU_STATUS, userInfo.getInfoOrgCodeStr());
			for (BaseDataDict baseDataDict : issuStatusList) {
				if (baseDataDict.getDictGeneralCode().equals(bo.getIssuStatus()) && baseDataDict.getDictName().equals("已发布")) {
					bo.setPulisher(userInfo.getUserName());   // 发布人。
					bo.setIssuOrgName(userInfo.getOrgName());   // 发布机构名称。
				}
			}
			bo.setUpdator(userInfo.getUserId());  //设置更新人

			if (StringUtils.isEmpty(bo.getUuid())) { //新增
				bo.setCreator(userInfo.getUserId());  //设置创建人

				Long id = homestaymanagementService.insert(bo);
				if (id == null) {
					resultObj.setTipMsg("保存失败！该民宿信息已存在！");
				} else {
					resultObj.setSuccess(true);
					resultObj.setData(bo);//返回新增的数据
					resultObj.setTipMsg("保存成功！");

					HomestayManagement newBo = homestaymanagementService.searchById(id);
					// 地图标注方法
					if(StringUtils.isNotEmpty(bo.getNewGisX()) && StringUtils.isNotEmpty(bo.getNewGisY())) {
						// 当新增成功以后那么必须要调用新的地图保存接口
						ResMarker resMarker = new ResMarker();
						resMarker.setMarkerType(DictConstantValue.DCL_HOMESTAY_MAP);
						resMarker.setUuuId(newBo.getUuid());
						resMarker.setMapType("5");
						resMarker.setCatalog("02");
						resMarker.setX(bo.getNewGisX());//经度
						resMarker.setY(bo.getNewGisY());//纬度
						resMarkerService.saveOrUpdateResMarker(resMarker);
					}
				}
			} else { //修改
				boolean updateResult = homestaymanagementService.update(bo);
				if (updateResult) {
					resultObj.setSuccess(true);
					resultObj.setTipMsg("保存成功！");

					// 地图标注方法
					if(StringUtils.isNotEmpty(bo.getNewGisX()) && StringUtils.isNotEmpty(bo.getNewGisY())) {
						// 当新增成功以后那么必须要调用新的地图保存接口
						ResMarker resMarker = new ResMarker();
						resMarker.setMarkerType(DictConstantValue.DCL_HOMESTAY_MAP);
						resMarker.setUuuId(bo.getUuid());
						resMarker.setMapType("5");
						resMarker.setCatalog("02");
						resMarker.setX(bo.getNewGisX());
						resMarker.setY(bo.getNewGisY());
						resMarkerService.saveOrUpdateResMarker(resMarker);
					}
				} else {
					resultObj.setTipMsg("保存失败！该民宿信息已存在！");
				}
			}
		}

		return resultObj;
	}

	/**
	 * 删除数据
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param bo 数据对象
	 * @return 页面数据
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
					  HomestayManagement bo) {
		ResultObj resultObj = new ResultObj(false, "删除失败！", null);

		if (!StringUtils.isEmpty(bo.getUuid())) {
			// 区域编码，数据字典用。
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");

			HomestayManagement homestayManagement = homestaymanagementService.searchByUuid(bo.getUuid(), userInfo.getInfoOrgCodeStr());

			// 越权检查。
			if (homestayManagement == null || !checkDataPermission(session, CommonController.TYPE_GRID, homestayManagement.getOrgCode())) {
				return resultObj;
			}

			bo.setUpdator(userInfo.getUserId());  //设置更新人

			boolean delResult = homestaymanagementService.delete(bo);
			if (delResult) {
				resultObj.setSuccess(true);
				resultObj.setTipMsg("删除成功！");
			}
		}

		return resultObj;
	}

}