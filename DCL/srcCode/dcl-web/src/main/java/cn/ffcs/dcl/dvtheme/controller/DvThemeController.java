package cn.ffcs.dcl.dvtheme.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.dvtheme.service.IDvThemeService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
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
 * @Description: 主题模块控制器
 * @Author: xuewq
 * @Date: 09-24 09:52:47
 * @Copyright: 2021 福富软件
 */
@Controller("dvThemeController")
@RequestMapping("/dcl/dvTheme")
public class DvThemeController extends ZZBaseController {

    @Autowired
    private IDvThemeService dvThemeService; //注入主题模块服务

    /**
     * 访问入口
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @return 视图路径
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        // 所属区域。
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
        map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
        // 数据字典 - 使用平台
        map.addAttribute("platformDictCode", DictConstantValue.DCL_PLATFORM_TYPE);
        return "/dcl/dvTheme/dv_theme_list.ftl";
    }

    /**
     * 列表数据
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @param bo 主题信息
     * @return 主题数据列表
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
                           DvTheme bo) {
        PaginationDto<DvTheme> paginationDto = new PaginationDto<DvTheme>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        if(StringUtils.isEmpty(bo.getRegionCode())){
            bo.setRegionCode(infoOrgCode);
        }
//        if (checkDataPermission(session, bo.getRegionCode())) {
                paginationDto = dvThemeService.searchList(bo);
//        }

        return paginationDto;
    }

    /**
     * 详情页面
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @param uuid 主题uuid信息
     * @return 视图路径
     */
    @RequestMapping("/view")
    public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuid) {
        // 基础信息
        DvTheme bo = dvThemeService.searchByUuid(uuid);
		// 越权检查
        if (checkDataPermission(session, CommonController.TYPE_GRID, bo!=null?bo.getRegionCode():null)) {
            map.addAttribute("bo", bo);
        }
        return "/dcl/dvTheme/dv_theme_view.ftl";
    }

    /**
     * 表单页面
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @param uuid 主题uuid
     * @return 视图路径
     */
    @RequestMapping("/form")
    public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuid) {
        DvTheme bo = new DvTheme();
        if (!StringUtils.isEmpty(uuid)) {
            bo = dvThemeService.searchByUuid(uuid);
        } else {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            bo.setRegionCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
            bo.setRegionName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
        }
		// 越权检查
        if (checkDataPermission(session, CommonController.TYPE_GRID, bo!=null?bo.getRegionCode():null)) {
            map.addAttribute("bo", bo);
            // 数据字典 - 模块类型
            map.addAttribute("platformDictCode", DictConstantValue.DCL_PLATFORM_TYPE);
        }
        return "/dcl/dvTheme/dv_theme_form.ftl";
    }

    /**
     * 保存数据
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @param bo 主题信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
                       DvTheme bo) {
        ResultObj resultObj = new ResultObj(false, "保存失败！", null);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        bo.setUpdator(userInfo.getUserId());  //设置更新人

		// 越权检查
		if (checkDataPermission(session, CommonController.TYPE_GRID, bo.getRegionCode())) {
			if (StringUtils.isEmpty(bo.getUuid())) { //新增
				bo.setCreator(userInfo.getUserId());  //设置创建人
				Long id = dvThemeService.insert(bo);
				if (id == null) {
					resultObj.setTipMsg("保存失败！同平台同区域仅可有一个主题");
					return resultObj;
				}
			} else { //修改
				boolean update = dvThemeService.update(bo);
				//已有重复
				if (!update) {
					resultObj.setTipMsg("更新失败！同平台同区域仅可有一个主题");
					return resultObj;
				}
			}
			resultObj.setSuccess(true);
			resultObj.setTipMsg("保存成功！");
		}
        return resultObj;
    }

    /**
     * 删除数据
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      主题信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/del")
    public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
                      DvTheme bo) {
        //初始化结果为错误信息
        ResultObj resultObj = new ResultObj(false, "删除失败！", null);
        if (!StringUtils.isEmpty(bo.getUuid())) {
            // 基础信息
            DvTheme newBo = dvThemeService.searchByUuid(bo.getUuid());
            // 越权检查
            if (!checkDataPermission(session, CommonController.TYPE_GRID, newBo.getRegionCode())) {
                return resultObj;
            }
            UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
            bo.setUpdator(userInfo.getUserId());  //设置更新人
            boolean delResult = dvThemeService.delete(bo);
            //执行成功时修改结果返回为正确信息
            if (delResult) {
                resultObj.setSuccess(true);
                resultObj.setTipMsg("删除成功！");
            }
        }
        return resultObj;
    }

}