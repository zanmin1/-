/**
 * 
 */
package cn.ffcs.dcl.base.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.druid.sql.visitor.functions.Substring;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.uam.bo.UserInfo;

/**
 * 首页
 * @author zhongshm
 *
 */
@Controller
@RequestMapping(value="/system")
public class IndexController extends ZZBaseController{

	//--总入口------------------
	@RequestMapping(value="/index")
	public String index(HttpSession session, ModelMap map) {
		return "/frame/index.ftl";
	}
	@RequestMapping(value="/left")
	public String left(HttpSession session, ModelMap map) {
		return "/frame/left.ftl";
	}
	@RequestMapping(value="/switch")
	public String switchhtm(HttpSession session, ModelMap map) {
		return "/frame/switch.ftl";
	}
	@RequestMapping(value="/top")
	public String top(HttpSession session, ModelMap map) {
		UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
		map.addAttribute("userInfo", userInfo);
		return "/frame/top.ftl";
	}	
	
	/**
	 * 栏目设置快捷入口
	 * @param session 会话
	 * @param map 参数
	 * @return 页面数据
	 */
	@RequestMapping(value="/setindex")
	public String setindex(HttpServletRequest request,HttpSession session, ModelMap map) {
		int type = Integer.parseInt(request.getParameter("type"));
		String title="";
		String topName="基础数据";
		if(type<6) {
			title="党建大屏维护";
		}else if(type>5 && type <11){
			map.addAttribute("typeNum", 6);
			title="政务大屏维护";
		}else if(type>110 && type <120){
			map.addAttribute("typeNum", 111);
			title="政务大屏维护";
		}else if(type>10 && type <20){
			title="便民服务大屏维护";
		}else if(type>20 && type <30){
			if(type <23) {
				map.addAttribute("typeNum", 21);
			}
			title="积分银行大屏维护";
		}else if(type>30 && type <40){
			map.addAttribute("typeNum", 30);
			title="美丽乡村大屏维护";
		}else if(type>40 && type <50){
			if(type <44) {
				map.addAttribute("typeNum", 41);
			}
			title="三资管理大屏维护";
		}else if(type>50 && type <60){
			if(type == 52 || type == 53) {
				map.addAttribute("typeNum", 52);
			}
			title="乡村法治大屏维护";
		}else if(type>60 && type <70){
			map.addAttribute("typeNum", 60);
			if (type == 62) {
				type = 64;
				map.addAttribute("typeNum", 64);
			}
			title="网格管理大屏维护";
		}else if(type>70 && type <80){
			map.addAttribute("typeNum", 70);
			title="生态宜居大屏维护";
		}else if(type>80 && type <90){
			if(type <83) {
				map.addAttribute("typeNum", 81);
			}
			if(type >82) {
				map.addAttribute("typeNum", 83);
			}
			title="文化旅游大屏维护";
		}else if(type>90 && type <100){
			if(type == 52 || type == 53) {
				map.addAttribute("typeNum", 52);
			}
			title="农村电商大屏维护";
		}else if(type>100 && type <110){
			if(type == 101 || type == 102) {
				map.addAttribute("typeNum", 101);
			}
			title="三农服务大屏维护";
		}else if(type>130 && type <140){
	        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
	        map.put("orgCode", userInfo.getOrgCode());
			if(type == 131 || type == 132) {
				map.addAttribute("typeNum", 131);
			}
			if(type == 133 || type == 134) {
				map.addAttribute("typeNum", 133);
			}
			if(type == 135 || type == 136) {
				map.addAttribute("typeNum", 135);
			}
			title="村级大屏维护";
		}else if(type>140 && type <150){
			map.addAttribute("typeNum", 141);
			title="疫情防控大屏维护";
		}else if(type>150 && type <160){
			map.addAttribute("typeNum", 151);
			title="农村电商";
		} else if (type > 160 && type < 170) {
			if(type == 165) {
				map.addAttribute("typeNum", 164);
			}
			title="党建大屏维护";
		} else if (type > 170 && type < 180) {
			map.addAttribute("typeNum", 171);
			title="村务政务大屏维护";
		}else if (type > 180 && type < 190) {
			topName="智慧党建";
			title="乡村振兴平台";
		}else if (type > 190 && type < 200) {
			topName="疫情防控";
			title="乡村振兴平台";
		}else if (type > 200 && type < 210) {
			topName="村务通知";
			title="乡村振兴平台";
		}else if (type > 210 && type < 220) {
			topName="平安乡村";
			title="乡村振兴平台";
		}else if (type > 220 && type < 230) {
			topName="村务政务";
			title="乡村振兴平台";
		} else {
			title="大屏维护";
		}

		map.addAttribute("title", title);
		map.addAttribute("type", type);
		map.addAttribute("topName", topName);
		map.addAttribute("UI_DOMAIN", App.UI.getDomain(session));
		map.addAttribute("djDomain", App.DJ.getDomain(session));
		map.addAttribute("rsDomain", App.RS.getDomain(session));
		map.addAttribute("gbpDomain", App.GBP.getDomain(session));
		map.addAttribute("WECHAT_DOMAIN", App.WECHAT.getDomain(session));
		map.addAttribute("iotDomain", App.IOT.getDomain(session));
		map.addAttribute("ZZGRID_DOMAIN", App.ZZGRID.getDomain(session));
		map.addAttribute("eventDomain", App.EVENT.getDomain(session));
		map.addAttribute("gmisDomain", App.GMIS.getDomain(session));
		return "/frame/setindex.ftl";
	}
	
//	/**
//	 * 栏目设置快捷左侧入口
//	 * @param session 会话
//	 * @param map 参数
//	 * @return 页面数据
//	 */
//	@RequestMapping(value="/setleft")
//	public String setleft(HttpServletRequest request,HttpSession session, ModelMap map) {
//		map.addAttribute("djDomain", App.DJ.getDomain(session));
//		map.addAttribute("rsDomain", App.RS.getDomain(session));
//		map.addAttribute("gbpDomain", App.GBP.getDomain(session));
//		map.addAttribute("WECHAT_DOMAIN", App.WECHAT.getDomain(session));
//		map.addAttribute("iotDomain", App.IOT.getDomain(session));
//        String type=request.getParameter("type");
//		map.addAttribute("type", type);
//		if("1".equals(type)) {
//			return "/frame/setleft.ftl";
//		}else {
//			return "/frame/setleft2.ftl";
//		}
//	}
//	
//	/**
//	 * 栏目设置快捷头部入口
//	 * @param session 会话
//	 * @param map 参数
//	 * @return 页面数据
//	 */
//	@RequestMapping(value="/settop")
//	public String settop(HttpSession session, ModelMap map) {
//		UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
//		map.addAttribute("userInfo", userInfo);
//		return "/frame/settop.ftl";
//	}	
}
