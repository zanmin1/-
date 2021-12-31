package cn.ffcs.dcl.homestaymanagement.controller;

import cn.ffcs.common.Gps;
import cn.ffcs.common.PositionUtil;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.homestaymanagement.service.IHomestayManagementService;
import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.zone.user.domain.User;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**   
 * @Description: 民宿管理模块控制器-App端
 * @Author: gonghf
 * @Date: 09-15 09:47:14
 * @Copyright: 2021 福富软件
 */ 
@Controller("HomestayManagementControllerApp")
@RequestMapping("/public/wap/homestayManagementApp")
public class HomestayManagementControllerApp extends ZZBaseController {

	@Autowired
	private IHomestayManagementService homestaymanagementService; //注入民宿管理模块服务

	@Autowired
	private IResMarkerService resMarkerService;   // gis地图接口

    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;

	@Autowired
	private IFunConfigurationService funConfigurationService;
	
    /**
     * app列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
     */
    @RequestMapping("/appIndex")
    public Object appIndex(HttpServletRequest request, HttpSession session, ModelMap map) {
		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        request.setAttribute("orgId", userInfo.getOrgCode()); // 组织Id
		map.addAttribute("orgCode", userInfo.getOrgCode());
		map.addAttribute("orgName", userInfo.getOrgName());

		setDomain(map);

		return "/mobile/homestaymanagement/homestay_app_list.jsp";
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
		if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermissionForWx(session, bo.getOrgCode())) {
			paginationDto = homestaymanagementService.searchList(bo);
		}

		return paginationDto;
	}

    /**
     * app详情页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param uuid 唯一标识
	 * @return 页面数据
     */
    @RequestMapping("/appView")
    public Object appView(HttpServletRequest request, HttpSession session, ModelMap map,
                             String uuid) {
		// 区域编码，数据字典用。
		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

		HomestayManagement bo = homestaymanagementService.searchByUuid(uuid, userInfo.getOrgCode());

		// 越权检查。
		if (bo != null && checkDataPermissionForWx(session, bo.getOrgCode())) {
            map.addAttribute("bo", bo);

			// 轮播图片
			try {
				List<AttachmentByUUID> imgList = attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.DCL_HOMESTAY_PHOTO);
				List<AttachmentByUUID> videoList = attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.DCL_HOMESTAY_VIDEO);
		
				List<HomestayManagement> fileList = new ArrayList<>();
		
				// 视频在前
				for(AttachmentByUUID att : videoList) {
					HomestayManagement homestayManagement = new HomestayManagement();
					homestayManagement.setPicUrl(att.getFilePath());
					homestayManagement.setFileType("video");
					fileList.add(homestayManagement);
				}
				// 图片在后
				for(AttachmentByUUID att : imgList) {
					HomestayManagement homestayManagement = new HomestayManagement();
					homestayManagement.setPicUrl(att.getFilePath());
					homestayManagement.setFileType("img");
					fileList.add(homestayManagement);
				}
		
				map.put("fileList", JSON.toJSONString(fileList));
			} catch (Exception e) {
				e.printStackTrace();
			}

			List<ResMarker> res = resMarkerService.findResMarkerByParam(DictConstantValue.DCL_HOMESTAY_MAP, uuid, null);

			if(res != null && res.size() > 0) {
				//84坐标转百度坐标
				Gps position = PositionUtil.gps84_To_Bd09(Double.parseDouble(res.get(0).getY()), Double.parseDouble(res.get(0).getX()));
	
				map.put("x", position.getWgLon());
				map.put("y", position.getWgLat());
			}

			setDomain(map);
		}

		return "/mobile/homestaymanagement/homestay_app_view.jsp";
    }

	/**
	 * app详情地图页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @param x 经度
	 * @param y 纬度
	 * @return 页面数据
	 */
	@RequestMapping(value = "/showMap")
	public Object showMap(HttpServletRequest request, HttpSession session, ModelMap map,
						  String x, String y) {
		map.put("X", x);
		map.put("Y", y);

		return "/mobile/map/map_religion.jsp";
	}

	/**
	 * 设置域名
	 * @param map 参数
	 */
	private void setDomain(ModelMap map) {
		map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
		map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
	}

}