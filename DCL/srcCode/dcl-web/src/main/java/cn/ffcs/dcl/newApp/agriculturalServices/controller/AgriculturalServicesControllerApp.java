package cn.ffcs.dcl.newApp.agriculturalServices.controller;

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
 * @Description: 三农服务公众号
 * @Author: wj
 * @Date: 12-22 15:30:00
 * @Copyright: 2021 福富软件
 */ 
@Controller("agriculturalServicesControllerApp")
@RequestMapping("/public/wap/agriculturalServices")
public class AgriculturalServicesControllerApp extends ZZBaseController {


	@Autowired
	private IFunConfigurationService funConfigurationService;
	
    /**
     * 列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
		
		map.addAttribute("orgCode", user.getOrgCode());
		map.addAttribute("token", session.getAttribute("token"));
		setDomain(map,session);

		return "/mobile/newApp/agriculturalServices/4.0-snfw.jsp";
    }

	/**
	 * 列表页面
	 * @param request 客户端请求
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
	 */

	@RequestMapping("/nysp")
	public Object nysp(HttpServletRequest request, HttpSession session, ModelMap map) {

		User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

		map.addAttribute("orgCode", user.getOrgCode());
		map.addAttribute("token", session.getAttribute("token"));
		setDomain(map,session);

		return "/mobile/newApp/agriculturalServices/index-nysp.jsp";
	}

	/**
	 * 设置域名
	 * @param map 参数
	 */
	private void setDomain(ModelMap map,HttpSession session) {


		if(session.getAttribute("mainTit")!=null){
			String   mainTit	= session.getAttribute("mainTit").toString();
			map.addAttribute("mainTit", mainTit);
		}


		map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
		map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
		map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
		map.addAttribute("gbpDomain", newDomain(session,"$GBP_DOMAIN"));
		map.addAttribute("wechatDomain", newDomain(session,"$WECHAT_DOMAIN"));
	}

}