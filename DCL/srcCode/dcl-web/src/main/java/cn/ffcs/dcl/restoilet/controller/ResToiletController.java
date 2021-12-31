package cn.ffcs.dcl.restoilet.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.restoilet.ResToilet;
import cn.ffcs.dcl.mybatis.domain.restoilet.ToiletEquip;
import cn.ffcs.dcl.restoilet.service.IResToiletService;
import cn.ffcs.dcl.restoilet.service.IToiletEquipService;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.file.service.FileUploadService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.uam.service.INumberConfigureService;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**   
 * @Description: 公厕信息表模块控制器
 * @Author: linguoxiong
 * @Date: 09-09 09:24:51
 * @Copyright: 2021 福富软件
 */ 
@Controller("resToiletController")
@RequestMapping("/dcl/resToilet")
public class ResToiletController extends ZZBaseController {


	@Autowired
	private INumberConfigureService numberConfigureService;
	@Autowired
	private IToiletEquipService toiletEquipService; //注入公厕配备信息表模块服务

	@Autowired
	private IResToiletService resToiletService; //注入公厕信息表模块服务

	@Autowired
	private IFunConfigurationService funConfigurationService;

	@Autowired
	private OrgSocialInfoOutService orgSocialInfoOutService;//组织

	@Autowired
	private FileUploadService fileUploadService;

	private static final String GC_WC_PIC_TYPE = "gcWcPicType";



	private void setStatis(ModelMap map) {
		//是否


		String componentsDomain = funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN",null,null);
		map.addAttribute("componentsDomain", componentsDomain);
		map.put("gcWcPicType",GC_WC_PIC_TYPE);
		String geoDomain = funConfigurationService.getAppDomain("$GEO_DOMAIN",null,null);
		map.addAttribute("GEO_DOMAIN", geoDomain);

		String importDomain = funConfigurationService.getAppDomain("$IMPEXP_NEW_DOMAIN",null,null);
		map.addAttribute("importDomain", importDomain);
		String systemDomain = funConfigurationService.getAppDomain("$SYSTEM_DOMAIN",null,null);
		map.addAttribute("SYSTEM_DOMAIN", systemDomain);

		
		/*
			public static final String GC_WC_TYPE = "D900052";
	public static final String TOILET_ADDR = "D900053";
	public static final String WC_CLASS = "D900054";
	public static final String IS_SUPPORT = "D900033";
	public static final String BUILD_TIME = "D900031";
	public static final String DISPOSAL_EX_METHON = "D900032";
		 */
		map.addAttribute("is_not", DictConstantValue.IS_NOT);
		map.addAttribute("GC_WC_TYPE", DictConstantValue.GC_WC_TYPE);
		map.addAttribute("TOILET_ADDR", DictConstantValue.TOILET_ADDR);
		map.addAttribute("WC_CLASS", DictConstantValue.WC_CLASS);
		map.addAttribute("IS_SUPPORT", DictConstantValue.IS_SUPPORT);
		map.addAttribute("BUILD_TIME", DictConstantValue.BUILD_TIME);
		map.addAttribute("DISPOSAL_EX_METHON", DictConstantValue.DISPOSAL_EX_METHON);
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
		return "/dcl/restoilet/res_toilet_list.ftl";
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map, ToiletEquip bo) {

		PaginationDto<ToiletEquip> paginationDto = new PaginationDto<ToiletEquip>();
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
		if(StringUtils.isEmpty(bo.getReOrgCode())){
			bo.setReOrgCode(infoOrgCode);
		}
		// 越权检查
        if (checkDataPermission(session, bo.getReOrgCode())) {
			paginationDto = toiletEquipService.searchList(bo);
        }

		return paginationDto;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {

		setStatis(map);

		// 基础信息
		ToiletEquip bo = toiletEquipService.searchById(id);
		// 越权检查
		if (checkDataPermission(session, CommonController.TYPE_GRID, bo!=null?bo.getReOrgCode():null)) {
			map.addAttribute("bo", bo);
		}

		return "/dcl/restoilet/res_toilet_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {

		setStatis(map);
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量



		ToiletEquip bo = new ToiletEquip();
		if (!StringUtils.isEmpty(id)) {
			bo = toiletEquipService.searchById(id);
		} else {
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			bo.setReOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setRegionName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
		}

		// 越权检查
		if (checkDataPermission(session, CommonController.TYPE_GRID, bo.getReOrgCode())) {
			map.addAttribute("bo", bo);
			map.addAttribute("name",userInfo.getPartyName() );
			map.addAttribute("phone",userInfo.getVerifyMobile());

		}

		return "/dcl/restoilet/res_toilet_form.ftl";
	}

	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
					   ToiletEquip bo) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
		if(!StringUtils.isEmpty(bo.getFillingDateStr())){
			bo.setFillingDate(simpleDateFormat.parse(bo.getFillingDateStr()));
		}


		ResultObj resultObj = new ResultObj(false, "保存失败！", null);
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		try {
			if (checkDataPermission(session, CommonController.TYPE_GRID, bo.getReOrgCode())) {
				bo.setUpdator(userInfo.getUserId());
				Boolean status = false;
				if (bo.getUuid() != null && !"".equals(bo.getUuid())) {

					//	ToiletEquip before =toiletEquipService.searchById(bo.getUuid()); //获取修改前的数据

					status = toiletEquipService.update(bo);

					ResToilet r = new ResToilet();
					ToiletEquip bos = toiletEquipService.searchByIdGetId(bo.getUuid());
					r.setResToiletEquipId(bos.getResToiletEquipId());
					r.setGuid(bo.getGuid());
					List<ResToilet> list = resToiletService.getResList(r);
					for (int i = 0; i < list.size(); i++) {
						ResToilet rs = new ResToilet();
						rs.setUuid(list.get(i).getUuid());
						rs.setGuid("");
						rs.setIsActualValid("1");
						resToiletService.updateFromEquip(rs);
					}


				} else {

					bo.setCreator(userInfo.getUserId());  //设置创建人
					Long id = toiletEquipService.insert(bo);
					if (id > 0) {

						status = true;
						if (bo.getWcIds() != null && bo.getWcIds().size() > 0) {
							ResToilet r = new ResToilet();
							r.setResToiletEquipId(id);
							r.setWcIds(bo.getWcIds());
							resToiletService.updateEquip(r);
						}

						ResToilet r = new ResToilet();
						r.setResToiletEquipId(id);
						r.setGuid(bo.getGuid());
						List<ResToilet> list = resToiletService.getResList(r);

						for (int i = 0; i < list.size(); i++) {
							ResToilet rs = new ResToilet();
							rs.setUuid(list.get(i).getUuid());
							rs.setGuid("");
							rs.setIsActualValid("1");
							resToiletService.updateFromEquip(rs);
						}

					} else {
						resultObj.setTipMsg("改区域数据已存在!");
					}
				}
				resultObj.setSuccess(status);
			}else {
				resultObj.setTipMsg("越权!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultObj;
	}

	/**
	 * 删除数据
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
					  ToiletEquip bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		ResultObj resultObj = new ResultObj(false, "删除失败！", null);
		if (bo.getUuid() != null) {
			ToiletEquip toiletEquip = toiletEquipService.searchById(bo.getUuid());

			// 越权检查
			if (checkDataPermission(session, CommonController.TYPE_GRID, toiletEquip!=null?toiletEquip.getReOrgCode():null)) {
				bo.setUpdator(userInfo.getUserId());  //设置更新人
				boolean delResult = toiletEquipService.delete(bo);
				//执行成功时修改结果返回为正确信息
				if (delResult) {
					resultObj.setSuccess(true);
					resultObj.setTipMsg("删除成功！");
				}
			}
		}
		return resultObj;
	}

	/**
	 * 新增公厕信息
	 * @param request
	 * @param registryId
	 * @param recYear
	 * @return
	 */


	@RequestMapping("/resMenberForm")
	public String resMenberForm(HttpServletRequest request, HttpSession session,ModelMap map, String guid,String puuid,String uuid,String reOrgCode,String wcCode) {
		setStatis(map);


		map.addAttribute("guid",guid);
		if (puuid != null && !"".equals(puuid)){

			ToiletEquip bos = toiletEquipService.searchByIdGetId(puuid);

			map.addAttribute("puuid",bos.getResToiletEquipId());
		}else {
			map.addAttribute("puuid",puuid);
		}
		map.addAttribute("reOrgCode",reOrgCode);
		map.addAttribute("wcCode",wcCode);
		if (uuid != null) {

			ResToilet bo = resToiletService.searchById(uuid);

			if (bo != null) {
				String orgCode = bo.getReOrgCode();
				// 越权检查
				if (checkDataPermission(session, CommonController.TYPE_GRID, bo.getReOrgCode())) {
					map.addAttribute("bo", bo);
				}
			}

		}
		return "/dcl/restoilet/res_toilet_member_form.ftl";
	}

	/**
	 * 公厕信息页面
	 * @param request
	 * @param
	 * @param
	 * @return
	 */
	@RequestMapping("/resMenberList")
	public String resMenberList(HttpServletRequest request, HttpSession session,ModelMap map, String guid,String uuid ,String type ) {

		setStatis(map);

			map.addAttribute("uuid",uuid);
			map.addAttribute("type",type);
			map.addAttribute("guid",guid);

		return "/dcl/restoilet/res_toilet_member_list.ftl";
	}



	/**
	 * 新增厕所
	 * @param request
	 * @param bo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveResMember")
	public Object saveResMember(HttpServletRequest request, HttpSession session, ModelMap map,
					   ResToilet bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
		ResultObj resultObj = new ResultObj(false, "保存失败！", null);

		try {

			String orgCode = bo.getReOrgCode();
			if (checkDataPermission(session, CommonController.TYPE_GRID, orgCode)) {
				bo.setUpdator(userInfo.getUserId());
				Boolean status = false;
				if (bo.getUuid() != null && !"".equals(bo.getUuid())) {
					resultObj.setSuccess(true);
					bo.setIsActualValid(null);
					status = resToiletService.update(bo);
				} else {
					if(StringUtils.isEmpty(bo.getGuid())){
						bo.setIsActualValid("1");
					}else{
						bo.setIsActualValid("0");
					}
//					if (bo.getWcCode() == null || "".equals(bo.getWcCode())) {
//						resultObj.setTipMsg("无法生成公厕编号");
//					} else {
					try {
						String number = numberConfigureService.getNumber(bo.getReOrgCode(),"spr_no");
						bo.setWcCode(number);
					} catch (Exception e) {
						resultObj.setTipMsg("无法生成公厕编号");
					}

						Long id = resToiletService.insert(bo);
						if (id > 0) {
							status = true;
						}
						resultObj.setData(id);
						resultObj.setSuccess(status);
			//		}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultObj;
	}

	/**
	 * 删除数据
	 */
	@ResponseBody
	@RequestMapping("/delMember")
	public Object delMember(HttpServletRequest request, HttpSession session, ModelMap map,
					  ResToilet bo) {
		ResultObj resultObj = new ResultObj(false, "删除失败！", null);
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		if (bo.getUuid() != null) {
			ResToilet resToilet = resToiletService.searchById(bo.getUuid());

			if (checkDataPermission(session, CommonController.TYPE_GRID, resToilet!=null?resToilet.getReOrgCode():null)) {
				boolean delResult = resToiletService.delete(bo);
				//执行成功时修改结果返回为正确信息
				if (delResult) {
					resultObj.setSuccess(true);
					resultObj.setTipMsg("删除成功！");
				}
			}
		}
		return resultObj;
	}

	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listDataMember")
	public Object listDataMember(HttpServletRequest request, HttpSession session, ResToilet bo){
		if (bo.getResToiletEquipId() == null || "".equals(bo.getResToiletEquipId())){
			bo.setResToiletEquipId(-1l);
		}
		ToiletEquip bos = toiletEquipService.searchByIdGetId(bo.getUuid());
		if (bos != null){
			bo.setResToiletEquipId(bos.getResToiletEquipId());
		}

		PaginationDto<ResToilet> paginationDto = new PaginationDto<ResToilet>();
		Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
		String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);

		if(StringUtils.isEmpty(bo.getReOrgCode())){
			bo.setReOrgCode(infoOrgCode);
		}

		paginationDto = resToiletService.searchList(bo);

		return paginationDto;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/viewMember")
	public Object viewMember(HttpServletRequest request, HttpSession session, ModelMap map,
					   String id) {

		setStatis(map);

		ResToilet bo = resToiletService.searchById(id);

		if (checkDataPermission(session, CommonController.TYPE_GRID, bo!=null?bo.getReOrgCode():null)){
			map.addAttribute("bo", bo);
		}
		return "/dcl/restoilet/res_toilet_member_view.ftl";
	}


}