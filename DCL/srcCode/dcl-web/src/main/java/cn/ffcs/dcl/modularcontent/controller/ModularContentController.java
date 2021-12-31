package cn.ffcs.dcl.modularcontent.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.dvtheme.service.IDvThemeService;
import cn.ffcs.dcl.modularcontent.service.IModularContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description: 模块内容管理模块控制器
 * @Author: xuewq
 * @Date: 09-24 09:53:07
 * @Copyright: 2021 福富软件
 */
@Controller("modularContentController")
@RequestMapping("/dcl/modularContent")
public class ModularContentController extends ZZBaseController {

    @Autowired
    private IDvThemeService dvThemeService; //注入主题服务

    @Autowired
    private IModularContentService modularContentService; //注入模块内容服务

    /**
     * 访问入口
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @return 视图路径
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map, String modularName) {
        // 所属区域。
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
        map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
        map.put("regionCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString().substring(0, 2));
        map.put("remark", modularName);

        return "/dcl/modularContent/modular_content_list.ftl";
    }

    /**
     * 列表数据
     *
     * @param request 客户端请求
     * @param session 页面会话
     * @param map     参数
     * @param bo      数据对象
     * @return 页面数据
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
                           ModularContent bo) {
        PaginationDto<ModularContent> paginationDto = new PaginationDto<ModularContent>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        if (StringUtils.isEmpty(bo.getRegionCode())) {
            bo.setRegionCode(infoOrgCode);
        }
        // 越权检查
        // 区分办事分类时（Remark有值）不做越权
//        if (StringUtils.isEmpty(bo.getRemark())) {
//            if (checkDataPermission(session, bo.getRegionCode())) {
//                paginationDto = modularContentService.searchList(bo);
//            }
//        } else {
            paginationDto = modularContentService.searchList(bo);
//        }
        return paginationDto;
    }

    /**
     * 详情页面
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param uuid    模块内容uuid
     * @return 视图路径
     */
    @RequestMapping("/view")
    public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuid) {
        // 基础信息
        ModularContent bo = modularContentService.searchByUuid(uuid);
        // 越权检查
        // 区分办事分类时（Remark有值）不做越权

//        if (StringUtils.isEmpty(bo.getRemark())) {
//        if (false) {
//            if (checkDataPermission(session, CommonController.TYPE_GRID, bo != null ? bo.getRegionCode() : null)) {
//                map.addAttribute("bo", bo);
//                map.addAttribute("bizTypePhoto", ConstantValue.DCL_ModularContent_PHOTO);
//            }
//        } else {
            map.addAttribute("bo", bo);
            map.addAttribute("bizTypePhoto", ConstantValue.DCL_ModularContent_PHOTO);
//        }
        return "/dcl/modularContent/modular_content_view.ftl";
    }

    /**
     * 表单页面
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param uuid    模块内容uuid
     * @return 视图路径
     */

    @RequestMapping("/form")
    public Object form(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuid, String remark) {
        ModularContent bo = new ModularContent();
        if (!StringUtils.isEmpty(uuid)) {
            bo = modularContentService.searchByUuid(uuid);
        } else {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            bo.setRegionCode(defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE).toString());
            bo.setRegionName(defaultGridInfo.get(KEY_START_GRID_NAME).toString());
        }
        // 区分办事分类时（Remark有值）不做越权

//        if (StringUtils.isEmpty(bo.getRemark())) {
//            if (checkDataPermission(session, CommonController.TYPE_GRID, bo != null ? bo.getRegionCode() : null)) {
//                map.addAttribute("bo", bo);
//                // 数据字典 - 是否启用
//                map.addAttribute("isEnableDictCode", DictConstantValue.VISIBLE);
//                // 图片附件，传图片
//                map.put("bizTypePhoto", ConstantValue.DCL_ModularContent_PHOTO);
//            }
//        } else {
            map.addAttribute("bo", bo);
            // 数据字典 - 是否启用
            map.addAttribute("isEnableDictCode", DictConstantValue.VISIBLE);
            // 图片附件，传图片
            map.put("bizTypePhoto", ConstantValue.DCL_ModularContent_PHOTO);
            map.put("remark", remark);
            String regionCode = bo.getRegionCode();
            if (regionCode != null && regionCode.length() > 2) {
                regionCode = regionCode.substring(0, 2);
            }
            map.put("regionCode", regionCode);
//        }

        return "/dcl/modularContent/modular_content_form.ftl";
    }

    /**
     * 保存数据
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      模块内容信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
                       ModularContent bo) {
        ResultObj resultObj = new ResultObj(false, "保存失败！", null);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        bo.setUpdator(userInfo.getUserId());  //设置更新人
        //越权检查
        DvTheme dvTheme = dvThemeService.searchByUuid(bo.getThemeUuId());
//        if (StringUtils.isEmpty(bo.getRemark())) {
//        if (false) {
//            if (dvTheme != null && dvTheme.getRegionCode().startsWith(userInfo.getInfoOrgCodeStr())) {
//                if (StringUtils.isEmpty(bo.getUuid())) { //新增
//                    bo.setCreator(userInfo.getUserId());  //设置创建人
//                    Long id = modularContentService.insert(bo);
//                    if (id == 0) {
//                        resultObj.setTipMsg("保存失败！");
//                        return resultObj;
//                    }
//                } else { //修改
//                    boolean update = modularContentService.update(bo);
//                }
//                resultObj.setSuccess(true);
//                resultObj.setTipMsg("保存成功！");
//            }
//        } else {
            if (StringUtils.isEmpty(bo.getUuid())) { //新增
                bo.setCreator(userInfo.getUserId());  //设置创建人
                Long id = modularContentService.insert(bo);
                if (id == 0) {
                    resultObj.setTipMsg("保存失败！");
                    return resultObj;
                }
            } else { //修改
                boolean update = modularContentService.update(bo);
            }
            resultObj.setSuccess(true);
            resultObj.setTipMsg("保存成功！");
//        }

        return resultObj;
    }

    /**
     * 删除数据
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      模块内容信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/del")
    public Object del(HttpServletRequest request, HttpSession session, ModelMap map,
                      ModularContent bo) {
        //初始化结果为错误信息
        ResultObj resultObj = new ResultObj(false, "删除失败！", null);

        // 基础信息
        ModularContent newBo = modularContentService.searchByUuid(bo.getUuid());
        // 越权检查
//        if (StringUtils.isEmpty(bo.getRemark())) {
//        if (false) {
//            if (checkDataPermission(session, CommonController.TYPE_GRID, newBo != null ? newBo.getRegionCode() : null)) {
//                if (!StringUtils.isEmpty(bo.getUuid())) {
//                    UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
//                    bo.setUpdator(userInfo.getUserId());  //设置更新人
//                    boolean delResult = modularContentService.delete(bo);
//                    //执行成功时修改结果返回为正确信息
//                    if (delResult) {
//                        resultObj.setSuccess(true);
//                        resultObj.setTipMsg("删除成功！");
//                    }
//                }
//            }
//        } else {
            if (!StringUtils.isEmpty(bo.getUuid())) {
                UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION"); //替换成本地常量
                bo.setUpdator(userInfo.getUserId());  //设置更新人
                boolean delResult = modularContentService.delete(bo);
                //执行成功时修改结果返回为正确信息
                if (delResult) {
                    resultObj.setSuccess(true);
                    resultObj.setTipMsg("删除成功！");
                }
            }
//        }

        return resultObj;
    }

    /**
     * 测试提供的接口
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param bo      模块内容信息
     * @return resultObj 结果信息
     */
    @ResponseBody
    @RequestMapping("/searchLists")
    public Object searchListForAPP(HttpServletRequest request, HttpSession session,
                                   ModularContent bo) {
        DvTheme dvTheme = modularContentService.searchListForAPP(bo.getRegionCode(), bo.getUseType(), bo.getType());
        HashMap<String, Object> map = new HashMap<>();
        map.put("forApp", dvTheme);
        DvTheme dvTheme1 = modularContentService.searchContents(bo.getRegionCode(), bo.getUseType(), bo.getType(), bo.getPlatform());
        map.put("contents", dvTheme1);
        return map;
    }
}