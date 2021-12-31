package cn.ffcs.dcl.dvmodular.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.dvmodular.service.IDvModularService;
import cn.ffcs.dcl.dvtheme.service.IDvThemeService;
import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description: 模块管理模块控制器
 * @Author: xuewq
 * @Date: 09-24 09:53:02
 * @Copyright: 2021 福富软件
 */
@Controller("dvModularController")
@RequestMapping("/dcl/dvModular")
public class DvModularController extends ZZBaseController {

    @Autowired
    private IDvModularService dvModularService; //注入主题模块服务

    @Autowired
    private IDvThemeService dvThemeService; //注入主题模块服务

    @Autowired
    private IBaseDictionaryService baseDictionaryService; //注入字典模块服务

    /**
     * 访问入口
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @return 视图路径
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        // 所属区域。
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
        map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));

        return "/dcl/dvModular/dv_modular_list.ftl";
    }

    /**
     * 列表数据
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      模块信息
     * @return 模块数据列表
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
                           DvModular bo) {

        PaginationDto<DvModular> paginationDto = new PaginationDto<DvModular>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        if(StringUtils.isEmpty(bo.getRegionCode())){
            bo.setRegionCode(infoOrgCode.substring(0,2));
        }
//        if (StringUtils.isEmpty(bo.getRemark())) {
//            // 越权检查
//            if (checkDataPermission(session, bo.getRegionCode())) {
//                paginationDto = dvModularService.searchList(bo);
//            }
//        } else {
//            if(!StringUtils.isEmpty(infoOrgCode)){
//                bo.setRegionCode(infoOrgCode.substring(0,2));
//            }
            paginationDto = dvModularService.searchList(bo);
//        }


        return paginationDto;
    }

    /**
     * 详情页面
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param inType  返回 1为从主题进入。不展示基础信息，其他为展示基础信息
     * @param map     返回界面显示的数据模型
     * @param uuid    模块uuid
     * @return 视图路径
     */
    @RequestMapping("/view")
    public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuid, String inType) {
        // 基础信息
        DvModular bo = dvModularService.searchByUuid(uuid);
        // 越权检查
        if (checkDataPermission(session, CommonController.TYPE_GRID, bo!=null?bo.getRegionCode():null)) {
            map.addAttribute("bo", bo);
            if ("1".equals(inType)) {
                map.addAttribute("inType", inType);
            }
        }
        return "/dcl/dvModular/dv_modular_view.ftl";
    }

    /**
     * 表单页面
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param uuid    模块uuid
     * @return 视图路径
     */
    @RequestMapping("/form")
    public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuid) {
        DvModular bo = new DvModular();
        if (!StringUtils.isEmpty(uuid)) {
            bo = dvModularService.searchByUuid(uuid);
        } else {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            bo.setRegionCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
            bo.setRegionName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
        }

        // 越权检查
        if (checkDataPermission(session, CommonController.TYPE_GRID, bo.getRegionCode())) {
            map.addAttribute("bo", bo);
            // 数据字典 - 模块类型
            map.addAttribute("typeDictCode", DictConstantValue.DCL_MODULAR_TYPE);
            // 数据字典 - 是否启用
            map.addAttribute("isEnableDictCode", DictConstantValue.VISIBLE);
            // 数据字典 - 使用场景
            map.addAttribute("useTypeDictCode", DictConstantValue.USE_TYPE);
        }

        return "/dcl/dvModular/dv_modular_form.ftl";
    }

    /**
     * 保存数据
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      模块信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
                       DvModular bo) {
        ResultObj resultObj = new ResultObj(false, "保存失败！", null);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        bo.setUpdator(userInfo.getUserId());  //设置更新人
        if (StringUtils.isEmpty(bo.getUuid())) { //新增
            bo.setCreator(userInfo.getUserId());  //设置创建人
            Long id = dvModularService.insert(bo);
            if (id == 0) {
                return resultObj;
            }
        } else { //修改
            // 越权检查
            DvModular dvModular = dvModularService.searchByUuid(bo.getUuid());
            if (checkDataPermission(session, CommonController.TYPE_GRID, dvModular.getRegionCode())) {
                boolean update = dvModularService.update(bo);
                if (!update) {
                    return resultObj;
                }
            }
        }
        resultObj.setSuccess(true);
        resultObj.setTipMsg("保存成功！");
        return resultObj;
    }

    /**
     * 删除数据
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      模块信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/del")
    public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
                      DvModular bo) {
        //初始化结果为错误信息
        ResultObj resultObj = new ResultObj(false, "删除失败！", null);
        if (!StringUtils.isEmpty(bo.getUuid())) {
            // 基础信息
            DvModular newBo = dvModularService.searchByUuid(bo.getUuid());
            // 越权检查
            if (checkDataPermission(session, CommonController.TYPE_GRID, newBo!=null?newBo.getRegionCode():null)) {
                UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
                bo.setUpdator(userInfo.getUserId());  //设置更新人
                boolean delResult = dvModularService.delete(bo);
                //执行成功时修改结果返回为正确信息
                if (delResult) {
                    resultObj.setSuccess(true);
                    resultObj.setTipMsg("删除成功！");
                }
            }
        }
        return resultObj;
    }

}