package cn.ffcs.dcl.secretarymailbox.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mailboxreply.service.IMailboxReplyService;
import cn.ffcs.dcl.mybatis.domain.mailboxreply.MailboxReply;
import cn.ffcs.dcl.mybatis.domain.secretarymailbox.SecretaryMailbox;
import cn.ffcs.dcl.secretarymailbox.service.ISecretaryMailboxService;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.system.publicFilter.CommonController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.uam.bo.UserInfo;

/**   
 * @Description: 书记信箱模块控制器-Pc端
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */ 
@Controller("secretaryMailboxControllerPc")
@RequestMapping("/dcl/secretaryMailboxPc")
public class SecretaryMailboxControllerPc extends ZZBaseController {

	@Autowired
	private ISecretaryMailboxService secretarymailboxService; //注入书记信箱模块服务

	@Autowired
	private IMailboxReplyService mailboxreplyService; //注入书记信箱回复模块服务
	
	/**
	 * 列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
	 */
	@RequestMapping("/index")
	public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
		// 区域编码，数据字典用。
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
		map.addAttribute("regionCode", userInfo.getInfoOrgCodeStr());

		// 数据字典 - 回复状态。
		map.addAttribute("REPLY_STATUS", DictConstantValue.REPLY_STATUS);
		// 数据字典 - 是否公开。
		map.addAttribute("VISIBLE", DictConstantValue.VISIBLE);

		return "/dcl/secretarymailbox/secretary_mailbox_list.ftl";
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
		if (!StringUtils.isEmpty(bo.getRegionCode()) && checkDataPermission(session, bo.getRegionCode())) {
			// 区域编码，数据字典用。
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
			bo.setRegionCode(userInfo.getInfoOrgCodeStr());

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
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");

		SecretaryMailbox bo = secretarymailboxService.searchByUuid(uuid, userInfo.getInfoOrgCodeStr());

		// 越权检查。
		if (bo != null && checkDataPermission(session, CommonController.TYPE_GRID, bo.getRegionCode())) {
			map.addAttribute("bo", bo);

			// 附件。
			map.put("SECRETARY_MAILBOX_FILE", ConstantValue.SECRETARY_MAILBOX_FILE);   // 留言附件。
			map.put("MAILBOX_REPLY_FILE", ConstantValue.MAILBOX_REPLY_FILE);   // 回复附件。
		}

		return "/dcl/secretarymailbox/secretary_mailbox_view.ftl";
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
		if (uuid != null && !"".equals(uuid)) {
			// 区域编码，数据字典用。
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");

			SecretaryMailbox bo = secretarymailboxService.searchByUuid(uuid, userInfo.getInfoOrgCodeStr());

			// 越权检查。
			if (bo != null && checkDataPermission(session, CommonController.TYPE_GRID, bo.getRegionCode())) {
				map.put("bo", bo);
			}
		}

        // 数据字典 - 是否公开。
        map.addAttribute("VISIBLE", DictConstantValue.VISIBLE);

		// 附件。
		map.put("SECRETARY_MAILBOX_FILE", ConstantValue.SECRETARY_MAILBOX_FILE);   // 留言附件。
		map.put("MAILBOX_REPLY_FILE", ConstantValue.MAILBOX_REPLY_FILE);   // 回复附件。

		return "/dcl/secretarymailbox/secretary_mailbox_form.ftl";
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
                       MailboxReply bo) {
		ResultObj resultObj = new ResultObj(false, "保存失败！", null);
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量

		// 越权检查。
		if (!StringUtils.isEmpty(bo.getRegionCode()) && bo.getRegionCode().startsWith(userInfo.getInfoOrgCodeStr())) {
            bo.setUpdator(userInfo.getUserId());  //设置更新人

			bo.setReplyId(userInfo.getUserId().toString());  //设置回复人ID
			bo.setReplyName(userInfo.getUserName());  //设置回复人

			if (bo.getUuid() == null || "".equals(bo.getUuid())) { //新增
				bo.setCreator(userInfo.getUserId());  //设置创建人

				Long id = mailboxreplyService.insert(bo);
				if (id == null) {
					resultObj.setTipMsg("保存失败！");
				} else {
					resultObj.setSuccess(true);
					resultObj.setData(bo);//返回新增的数据
					resultObj.setTipMsg("保存成功！");
				}
			} else { //修改
				boolean updateResult = mailboxreplyService.update(bo);
				if (updateResult) {
					resultObj.setSuccess(true);
					resultObj.setTipMsg("保存成功！");
				} else {
					resultObj.setTipMsg("保存失败！");
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
					  SecretaryMailbox bo) {
		ResultObj resultObj = new ResultObj(false, "删除失败！", null);

		if (bo.getUuid() != null && !"".equals(bo.getUuid())) {
			// 区域编码，数据字典用。
			UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量

			SecretaryMailbox newBo = secretarymailboxService.searchByUuid(bo.getUuid(), userInfo.getInfoOrgCodeStr());

			// 越权检查。
			if (newBo == null || !checkDataPermission(session, CommonController.TYPE_GRID, newBo.getRegionCode())) {
				return resultObj;
			}

			bo.setUpdator(userInfo.getUserId());  //设置更新人

			boolean delResult = secretarymailboxService.delete(bo);
			if (delResult) {
				resultObj.setSuccess(true);
				resultObj.setTipMsg("删除成功！");
			}
		}

		return resultObj;
	}

}