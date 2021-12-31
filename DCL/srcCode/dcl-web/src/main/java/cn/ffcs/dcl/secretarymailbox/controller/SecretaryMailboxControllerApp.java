package cn.ffcs.dcl.secretarymailbox.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.secretarymailbox.SecretaryMailbox;
import cn.ffcs.dcl.secretarymailbox.service.ISecretaryMailboxService;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**   
 * @Description: 书记信箱模块控制器-App端
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("secretaryMailboxControllerApp")
@RequestMapping("/public/wap/secretaryMailboxApp")
public class SecretaryMailboxControllerApp extends ZZBaseController {

	@Autowired
	private ISecretaryMailboxService secretarymailboxService; //注入书记信箱模块服务

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService; //UUID附件服务
	
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

		// 数据字典 - 回复状态。
		request.setAttribute("REPLY_STATUS", DataDictHelper.getDataDictTree(DictConstantValue.REPLY_STATUS, userInfo.getOrgCode()));

		map.addAttribute("userOrgCode", userInfo.getOrgCode());
        map.addAttribute("COMPONENTS_DOMAIN", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));

        return "/mobile/secretarymailbox/secretary_mailbox_app_list.jsp";
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
						   SecretaryMailbox bo) {
		PaginationDto<SecretaryMailbox> paginationDto = new PaginationDto<>();

		// 越权检查。
		if (!StringUtils.isEmpty(bo.getRegionCode()) && checkDataPermissionForWx(session, bo.getRegionCode())) {
			User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
			bo.setRegionCode(userInfo.getOrgCode());

			// 我的留言。
			if (!StringUtils.isEmpty(bo.getAppViewType()) && "my".equals(bo.getAppViewType())) {
				bo.setClaimantId(userInfo.getUserId().toString());   // 诉求人ID。
			}

			paginationDto = secretarymailboxService.searchList(bo);
		}

		return paginationDto;
	}

	/**
	 * 详情页面
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
		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

		SecretaryMailbox bo = secretarymailboxService.searchByUuid(uuid, userInfo.getOrgCode());

		// 越权检查。
		if (bo != null && checkDataPermissionForWx(session, bo.getRegionCode())) {
			map.addAttribute("bo", bo);

			// 附件。
			List<AttachmentByUUID> mailboxList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.SECRETARY_MAILBOX_FILE);   // 留言附件。
			SecretaryMailbox mailbox = secretarymailboxService.searchByUuid(uuid, userInfo.getOrgCode());
			List<AttachmentByUUID> replyList = attachmentByUUIDService.findByBizId(mailbox.getReplyUuid(), ConstantValue.MAILBOX_REPLY_FILE);   // 回复附件。
			map.put("mailboxList", formateAttList(mailboxList));
			map.put("replyList", formateAttList(replyList));
			map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
			map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
		}

		return "/mobile/secretarymailbox/secretary_mailbox_app_view.jsp";
	}

	/**
	 * 表单页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map) {
		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		map.addAttribute("userOrgCode", userInfo.getOrgCode());
		map.addAttribute("userInfo", userInfo);

		// 附件。
		map.put("SECRETARY_MAILBOX_FILE", ConstantValue.SECRETARY_MAILBOX_FILE);   // 留言附件。
		map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));

		String uiDomain = funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null);
		map.put("uiDomain", uiDomain);
		String csDomain = funConfigurationService.getAppDomain("$CS_OUT_DOMAIN", null, null);
		map.put("csDomain", csDomain);
		String compDomain = funConfigurationService.getAppDomain("$APP_COMPONENTS_DOMAIN", null, null);
		map.addAttribute("compDomain", compDomain);

		return "/mobile/secretarymailbox/secretary_mailbox_app_form.jsp";
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
					   SecretaryMailbox bo) {
		ResultObj resultObj = new ResultObj(false, "保存失败！", null);
		User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

		// 越权检查。
		if (!StringUtils.isEmpty(bo.getRegionCode()) && bo.getRegionCode().startsWith(userInfo.getOrgCode())) {
			bo.setUpdator(userInfo.getUserId());  //设置更新人

			if (StringUtils.isEmpty(bo.getUuid())) { //新增
				bo.setCreator(userInfo.getUserId());  //设置创建人

				bo.setClaimantId(userInfo.getUserId().toString());  //设置诉求人ID
				bo.setRegionCode(userInfo.getOrgCode());  //设置所属区域
				bo.setRegionName(userInfo.getOrgName());  //设置所属区域名称

				Long id = secretarymailboxService.insert(bo);
				if (id == null) {
					resultObj.setTipMsg("保存失败！");
				} else {
					resultObj.setSuccess(true);
					resultObj.setData(bo);//返回新增的数据
					resultObj.setTipMsg("保存成功！");
				}
			}
		}

		return resultObj;
	}

	/**
	 * 用Attachment类中的title字段表示其后缀，方便页面上展示
	 * @param attList 附件集合
	 * @return 附件集合
	 */
	private List<AttachmentByUUID> formateAttList(List<AttachmentByUUID> attList) {
		for (AttachmentByUUID att : attList) {
			att.setTitle(getFileSuffixByPath(att.getFilePath()));
		}
		return attList;
	}

	/**
	 * 根据路径获取文件后缀
	 * @param path 路径
	 * @return 后缀
	 */
	private String getFileSuffixByPath(String path) {
		// 获取文件后缀名并转化为写，用于后续比较
		String fileType = path.substring(path.lastIndexOf(".") + 1).toLowerCase();

		if ("bmp|jpg|jpeg|png|gif".contains(fileType)) {
			return "image";
		} else if ("xls|xlsx|xlsm|xltx".contains(fileType)) {
			return "excel";
		} else if("docx|docm|dotx|doc".contains(fileType)) {
			return "word";
		} else if("pptx|pptm|ppsx|ppt".contains(fileType)) {
			return "ppt";
		}

		return "other";
	}

}