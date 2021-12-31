package cn.ffcs.dcl.helpproject.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.Gps;
import cn.ffcs.common.PositionUtil;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.helpproject.IHelpProjectService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.helpproject.HelpProject;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
import cn.ffcs.system.publicUtil.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;

/**   
 * @Description: 帮扶项目模块控制器
 * @Author: zhengby
 * @Date: 10-19 17:05:51
 * @Copyright: 2021 福富软件
 */ 
@Controller("helpProjectController")
@RequestMapping("/dcl/helpProject")
public class HelpProjectController extends ZZBaseController {

	@Autowired
	private IHelpProjectService helpProjectService; //注入帮扶项目模块服务
	@Autowired
	private IResMarkerService resMarkerService;//gis地图接口

	private void setStatis(ModelMap map) {
		map.addAttribute("bizType", ConstantValue.DCL_HELP_PROJECT_PHOTO);//图片附件
		map.addAttribute("bizFileType", ConstantValue.DCL_HELP_PROJECT_FILE);//文件附件
		//帮扶项目
		map.addAttribute("HELP_PROJECT", DictConstantValue.HELP_PROJECT);
	}

	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		// 所属区域。
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
		setStatis(map);
		return "/dcl/helpproject/help_project_list.ftl";
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
		params.put("helpProjectId", request.getParameter("helpProjectId"));
		params.put("uuId", request.getParameter("uuId"));
		params.put("helpProjectName", request.getParameter("helpProjectName"));
		params.put("projectType", request.getParameter("projectType"));
		params.put("prijectStatus", request.getParameter("prijectStatus"));
		params.put("orgCode", request.getParameter("orgCode"));
		PaginationDto<HelpProject> paginationDto = helpProjectService.searchList(page, rows, params);
		return paginationDto;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String uuId) {
		HelpProject bo = helpProjectService.searchByUUId(uuId);
		map.addAttribute("bo", bo);
		String markerOperation = "2";//地图标注 新增
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("markerType", DictConstantValue.HELP_PROJECT_MANAGE_MAP);
		map.put("markerOperation", markerOperation);
		setStatis(map);

		return "/dcl/helpproject/help_project_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String uuId) {

		String markerOperation = "0";//地图标注 新增
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注

		if (!StringUtils.isEmpty(uuId)) {
			HelpProject bo = helpProjectService.searchByUUId(uuId);
			markerOperation = "1";  //地图标注
			map.put("bo", bo);
		}else{
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			AttractionsManagement bo =new AttractionsManagement();
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName( defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.put("bo", bo);
		}
		setStatis(map);
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", DictConstantValue.HELP_PROJECT_MANAGE_MAP);
		map.put("markerOperation", markerOperation);
		return "/dcl/helpproject/help_project_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		HelpProject bo) {
		cn.ffcs.uam.bo.UserInfo userInfo = (cn.ffcs.uam.bo.UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		try{
			//地图84转百度02坐标系
			Gps position = PositionUtil.gps84_To_Bd09(Double.parseDouble(bo.getT_y()),Double.parseDouble(bo.getT_x()));
			bo.setX(position.getWgLon()+"");
			bo.setY(position.getWgLat()+"");
		}catch (Exception e){
			e.printStackTrace();
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		if (StringUtils.isEmpty(bo.getUuId())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			//项目状态 1-进行中 2--完结 3--挂起
			bo.setPrijectStatus("1");
			Long id = helpProjectService.insert(bo);
			if (id != null && id > 0) {
				bo = helpProjectService.searchById(id);
				result = "success";
				//当新增成功以后那么必须要调用新的地图保存接口
				System.out.println("/**********************进入地图新增的方法 start ********************************");
				ResMarker resMarker = new ResMarker();
				resMarker.setMarkerType(DictConstantValue.HELP_PROJECT_MANAGE_MAP);
				resMarker.setUuuId(bo.getUuId());
				resMarker.setMapType("5");
				resMarker.setCatalog("02");
				resMarker.setX(bo.getX());//经度
				resMarker.setY(bo.getY());//纬度
				resMarkerService.saveOrUpdateResMarker(resMarker);
				System.out.println("打印调用接口结果="+resMarkerService.saveOrUpdateResMarker(resMarker));
				System.out.println("/**********************进入地图新增的方法 end ********************************");
			};
		} else { //修改
			bo.setUpdator(userInfo.getUserId());  //设置更新人
			boolean updateResult = helpProjectService.update(bo);
			if (updateResult) {
				result = "success";
				if(bo.getT_x()!=null && bo.getT_y()!=null) {
					//当新增成功以后那么必须要调用新的地图保存接口
					ResMarker resMarker = new ResMarker();
					resMarker.setMarkerType(DictConstantValue.HELP_PROJECT_MANAGE_MAP);
					resMarker.setUuuId(bo.getUuId());
					resMarker.setMapType("5");
					resMarker.setCatalog("02");
					resMarker.setX(bo.getT_x());
					resMarker.setY(bo.getT_y());
					resMarkerService.saveOrUpdateResMarker(resMarker);
				}
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
		HelpProject bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		return helpProjectService.delete(bo);
	}

	/**
	 * 项目办理
	 */
	@RequestMapping("/handle")
	public Object handle(HttpServletRequest request, HttpSession session, ModelMap map,
						 String uuId){
		HelpProject bo = helpProjectService.searchByUUId(uuId);
		map.put("bo", bo);
		String markerOperation = "0";//地图标注 新增
		map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注
		setStatis(map);
		map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
		map.put("module", DictConstantValue.HELP_PROJECT_MANAGE_MAP);
		map.put("markerOperation", markerOperation);
		return "/dcl/helpproject/help_project_form_handle.ftl";
	}

	@ResponseBody
	@RequestMapping("/setStatus")
	public Object setStatus(HttpServletRequest request, HttpSession session, ModelMap map,
					  HelpProject bo) {
		return helpProjectService.update(bo);
	}

}