package cn.ffcs.dcl.provincialplatform.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ffcs.dcl.ZZBaseController;
/**
 * @Description: 农村电商大屏控制器
 * @Author: linyt
 * @Date: 12-6 09:36:44
 * @Copyright: 2021 福富软件
 */
@Controller("RuralECommerceController")
    @RequestMapping("/dcl/ruralECommerce")
public class RuralECommerceController extends ZZBaseController {

    /**
     * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param map 参数
     * @return
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map) {
            return "/dcl/provincialplatform/ruralECommerce_index.ftl";
    }

	
}
