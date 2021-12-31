package cn.ffcs.dcl.mailboxreply.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mailboxreply.service.IMailboxReplyService;
import cn.ffcs.dcl.mybatis.domain.mailboxreply.MailboxReply;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.dcl.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.uam.bo.UserInfo;

/**   
 * @Description: 书记信箱回复模块控制器
 * @Author: gonghf
 * @Date: 09-27 09:34:11
 * @Copyright: 2021 福富软件
 */ 
@Controller("mailboxReplyController")
@RequestMapping("/dcl/mailboxReply")
public class MailboxReplyController extends ZZBaseController {

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
		return "/dcl/secretarymailbox/secretary_mailbox_list.ftl";
	}

	/**
	 * 列表数据
	 * @param session 会话
	 * @param map 参数
	 * @param bo 数据对象
	 * @return 页面数据
	 */
	@ResponseBody
	@RequestMapping("/listData")
	public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
						   MailboxReply bo) {
		PaginationDto<MailboxReply> paginationDto = mailboxreplyService.searchList(bo);
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
		MailboxReply bo = mailboxreplyService.searchByUuid(uuid);
		map.addAttribute("bo", bo);
		return "/dcl/mailboxreply/mailbox_reply_view.ftl";
	}

	/**
	 * 表单页面
	 * @param session 会话
	 * @param map 参数
	 * @param uuid 唯一标识
	 * @return 页面数据
	 */
	@RequestMapping("/form")
	public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
					   String uuid) {
		if (!StringUtils.isEmpty(uuid)) {
			MailboxReply bo = mailboxreplyService.searchByUuid(uuid);
			map.put("bo", bo);
		}
		return "/dcl/mailboxreply/mailbox_reply_form.ftl";
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

		bo.setCreator(userInfo.getUserId());  //设置创建人

		if (StringUtils.isEmpty(bo.getUuid())) { //新增
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
		MailboxReply bo) {
		UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
		bo.setUpdator(userInfo.getUserId());  //设置更新人
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		boolean delResult = mailboxreplyService.delete(bo);
		if (delResult) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

}