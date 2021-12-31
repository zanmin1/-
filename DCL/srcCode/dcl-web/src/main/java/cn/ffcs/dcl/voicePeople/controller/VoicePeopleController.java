package cn.ffcs.dcl.voicePeople.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.JsonHelper;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.historybroadcastpush.service.IHistoryBroadcastpushService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.voiceGroup.VoiceGroup;
import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import cn.ffcs.dcl.voiceGroup.service.IVoiceGroupService;
import cn.ffcs.dcl.voicePeople.service.IVoicePeopleService;
import cn.ffcs.sms.bo.SendResult;
import cn.ffcs.sms.service.SendSmsService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.bo.OrgSocialInfoBO;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IBaseDictionaryService;
import cn.ffcs.uam.service.OrgSocialInfoOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**   
 * @Description: 语音人员表模块控制器
 * @Author: 王文杰
 * @Date: 12-24 15:54:19
 * @Copyright: 2021 福富软件
 */ 
@Controller("voicePeopleController")
@RequestMapping("/dcl/voicePeople")
public class VoicePeopleController extends ZZBaseController {

	@Autowired
	private IVoicePeopleService voicePeopleService; //注入语音人员表模块服务

	@Autowired
	private IBaseDictionaryService baseDictionaryService;

	@Autowired
	private IHistoryBroadcastpushService historyBroadcastpushService; //注入历史播报推送模块服务
	@Autowired
	private IVoiceGroupService voiceGroupService; //注入语音群组表模块服务
	@Autowired
	private OrgSocialInfoOutService orgSocialInfoOutService;


	private void setStatis(ModelMap map) {
		//语音附件 如有
		//map.addAttribute("bizType", ConstantValue.DCL_ATTR_TITLLE);
		//性别
		map.addAttribute("DICT_SEX", DictConstantValue.DICT_SEX);
		//人员类型
		map.addAttribute("PEOPLE_TYPE", DictConstantValue.PEOPLE_TYPE);

	}


	/**
	 * 列表页面
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);

		//获取 linkname id  phone 电话
		OrgSocialInfoBO orgSocialInfoBO = orgSocialInfoOutService.selectOrgSocialInfoByOrgCode(userInfo.getOrgCode());
		map.addAttribute("linkMan",orgSocialInfoBO.getLinkMan());
		map.addAttribute("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.addAttribute("orgName", defaultGridInfo.get(KEY_START_GRID_NAME));

		setStatis(map);

		VoiceGroup bo =new VoiceGroup();
		bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());

		EUDGPagination pagination = voiceGroupService.searchList(bo);

		map.addAttribute("list",pagination.getRows());

		return "/dcl/voicePeople/yybb-table.ftl";
	}


	/**
	 * 录音页面
	 */
	@RequestMapping("/getVoice")
	public Object getVoice(HttpServletRequest request, HttpSession session, ModelMap map ,String people) {

		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		//获取 linkname id  phone 电话
		OrgSocialInfoBO bo = orgSocialInfoOutService.selectOrgSocialInfoByOrgCode(userInfo.getOrgCode());


		Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);

		map.addAttribute("orgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
		map.addAttribute("orgName", defaultGridInfo.get(KEY_START_GRID_NAME));

		map.addAttribute("linkMan",bo.getLinkMan());
		map.addAttribute("phone",bo.getPhone());

		map.addAttribute("bo",people);

		map.addAttribute("userName",userInfo.getPartyName());
		setStatis(map);

		return "/dcl/voicePeople/yybb-content.ftl";
	}




	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,VoicePeople bo) {

		EUDGPagination pagination = new EUDGPagination();
		// 越权检查。
		if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermission(session, bo.getOrgCode())) {
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

			 pagination = voicePeopleService.searchList( bo,bo.getOrgCode());
		}

		return pagination;
	}


	/**
	 * 列表数据
	 */
	@ResponseBody
	@RequestMapping("/checkTel")
	public Object checkTel(HttpServletRequest request, HttpSession session, ModelMap map,String tel) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

		VoicePeople bo =   voicePeopleService.searchByTel(tel);

		if(bo!=null){
			 result = "true";
		}

		resultMap.put("result", result);

		return resultMap;
	}

	/**
	 * 详情页面
	 */
	@RequestMapping("/view")
	public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
		String id) {
		VoicePeople bo = voicePeopleService.searchByUUId(id);
		// 越权检查。
		if (bo == null || !checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {

			return "/gmis/voicePeople/voice_people_view.ftl";
		}
		setStatis(map);
		map.addAttribute("bo", bo);

		return "/gmis/voicePeople/voice_people_view.ftl";
	}

	/**
	 * 表单页面
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
		String id, String peopleType) {

		map.addAttribute("peopleType",peopleType);

		setStatis(map);

		if (!StringUtils.isEmpty(id) ) {
			VoicePeople bo = voicePeopleService.searchByUUId(id);
			// 越权检查。
			if (bo != null && checkDataPermission(session, CommonController.TYPE_GRID, bo.getOrgCode())) {

				map.put("bo", bo);

			}
		}else {
			Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
			AttractionsManagement bo =new AttractionsManagement();
			bo.setOrgCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
			bo.setOrgName( defaultGridInfo.get(KEY_START_GRID_NAME).toString());
			map.put("bo", bo);
		}

		return "/dcl/voicePeople/yybb-people-add.ftl";
	}




	/**
	 * 保存数据
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
		VoicePeople bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

		// 越权检查。
		if (StringUtils.isEmpty(bo.getOrgCode()) || !bo.getOrgCode().startsWith(userInfo.getInfoOrgCodeStr())) {
			resultMap.put("result", result);
			return resultMap;
		}

		bo.setUpdator(userInfo.getUserId());  //设置更新人

		if (StringUtils.isEmpty(bo.getUuid())) { //新增
			bo.setCreator(userInfo.getUserId());  //设置创建人
			Long id = voicePeopleService.insert(bo);
			if (id != null && id > 0) {
				result = "success";
			}else if (id ==-2L){

				result = "tel";

			}
		} else { //修改
			boolean updateResult = voicePeopleService.update(bo);
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
		VoicePeople bo) {

		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量

		VoicePeople res = voicePeopleService.searchByUUId(bo.getUuid());

		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";

		// 越权检查。
		if (res == null || !checkDataPermission(session, CommonController.TYPE_GRID, res.getOrgCode())) {
			resultMap.put("result", result);
			return resultMap;
		}

		bo.setUpdator(userInfo.getUserId());  //设置更新人

		boolean delResult = voicePeopleService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

	@Autowired
	private SendSmsService sendSmsService;


	@ResponseBody
	@RequestMapping("/getPzListData")
	public Object getPzListData(HttpServletRequest request, HttpSession session, ModelMap map
			, VoicePeople bo) throws Exception {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		Map<String, Object> resultMap = new HashMap<>();
	try{
		boolean flag=sendSms("VOX",bo.getMp3Url(),"",bo.getvIds() ,userInfo.getUserId(),userInfo.getOrgCode());
		if(flag) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "false");
		}
	}catch (Exception e){
		e.printStackTrace();
		resultMap.put("result", "false");
	}
		return resultMap;
	}

	public boolean sendSms(String smsType, String audioUrl, String message, String[] phoneArr, Long userId, String orgCode){
		String content="";
		Map<String, Object> params = new HashMap<>();
		SendResult sendSms = new SendResult();
		if(smsType.equals("VOX")) {
			if(!cn.ffcs.dcl.utils.StringUtils.isEmpty(audioUrl)){
				//有音频文件的情况，使用音频文件
				params = Collections.singletonMap("channelCode", "bg_vox");
				//音频文件的绝对路径
				content = "/mnt/mfs/sq_upload" + audioUrl;
			}else if(!cn.ffcs.dcl.utils.StringUtils.isEmpty(message)) {
				params = Collections.singletonMap("channelCode", "tts_vox");
				content = message;
			}else {
				//没有音频,也没有文字
				return false;
			}
			smsType= SendSmsService.TYPE_VOX;
			sendSms = sendSmsService.sendSms("dcl",userId, orgCode,phoneArr, content,smsType, new Date(), params);
		}else if(smsType.equals("SMS")){
			content = message;
			smsType=SendSmsService.TYPE_SMS;
			sendSms = sendSmsService.sendSms("dcl",userId, orgCode,phoneArr, content,smsType, new Date(), null);
		}else {
			return false;
		}
		String submitFailNum = sendSms.getSubmitFailNum();

		if(sendSms.getCode()==0&& cn.ffcs.dcl.utils.StringUtils.isEmpty(submitFailNum)) {//发送成功
			return true;
		}

		return false;
	}

}