package cn.ffcs.dcl.villagegroup.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.villagegroup.VillageGroup;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.dcl.villagegroup.service.IVillageGroupService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description: 村小组模块控制器
 * @Author: liangxj
 * @Date: 12-22 10:45:25
 * @Copyright: 2021 福富软件
 */
@Controller("villageGroupController")
@RequestMapping("/dcl/villageGroup")
public class VillageGroupController extends ZZBaseController {

    @Autowired
    private IVillageGroupService villageGroupService; //注入村小组模块服务

    /**
     * 列表页面
     * http://my.v6.aishequ.org:8990/dcl/dcl/villageGroup/index.jhtml
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map) {
        // 所属区域。
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        map.put("regionCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
        map.put("regionName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
        // 数据字典 - 村小组
        map.addAttribute("villageGroupDictCode", DictConstantValue.DCL_VILLAGE_GROUP_TYPE);
        return "/dcl/villageGroup/village_group_list.ftl";
    }

    /**
     * 列表数据
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpSession session, VillageGroup bo) {

        PaginationDto<VillageGroup> paginationDto = new PaginationDto<>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        if (StringUtils.isEmpty(bo.getRegionCode())) {
            bo.setRegionCode(infoOrgCode);
        }
        if (checkDataPermission(session, bo.getRegionCode())) {
            paginationDto = villageGroupService.searchList(bo);
        }
        return paginationDto;
    }

    /**
     * 详情页面
     */
    @RequestMapping("/view")
    public Object view(HttpSession session, ModelMap map, String uuid) {

        VillageGroup bo = villageGroupService.searchByUuid(uuid);
        // 越权检查
        if (checkDataPermission(session, CommonController.TYPE_GRID, bo != null ? bo.getRegionCode() : null)) {
            map.addAttribute("bo", bo);
        }
        map.put("bizType", ConstantValue.DCL_VILLAGE_GROUP_IMAGE);//图片附件
        return "/dcl/villageGroup/village_group_view.ftl";
    }

    /**
     * 表单页面
     */
    @RequestMapping("/form")
    public Object form(ModelMap map, String uuid) {
        VillageGroup bo = new VillageGroup();
        if (!StringUtils.isEmpty(uuid)) {
            bo = villageGroupService.searchByUuid(uuid);
        }
        map.put("bo", bo);
        map.put("bizType", ConstantValue.DCL_VILLAGE_GROUP_IMAGE);//图片附件
        // 数据字典 - 村小组
        map.addAttribute("villageGroupDictCode", DictConstantValue.DCL_VILLAGE_GROUP_TYPE);
        return "/dcl/villageGroup/village_group_form.ftl";
    }

    /**
     * 保存数据
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpSession session, VillageGroup bo) {
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量

        Map<String, Object> resultMap = new HashMap<>();
        String result = "fail";
        // 越权检查
        if (checkDataPermission(session, CommonController.TYPE_GRID, bo.getRegionCode())) {
            bo.setCreator(userInfo.getUserId());  //设置创建人
            bo.setUpdator(userInfo.getUserId());  //设置更新人
            String uuid = villageGroupService.saveOrUpdate(bo);
            if (!StringUtils.isEmpty(uuid)) {
                result = "success";
                resultMap.put("uuid", uuid);
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
    public Object del(HttpSession session, VillageGroup bo) {

        //初始化结果为错误信息
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", "false");
        if (!StringUtils.isEmpty(bo.getUuid())) {
            // 基础信息
            VillageGroup newBo = villageGroupService.searchByUuid(bo.getUuid());
            // 越权检查
            if (!checkDataPermission(session, CommonController.TYPE_GRID, newBo.getRegionCode())) {
                return resultMap;
            }
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION); //替换成本地常量
            bo.setUpdator(userInfo.getUserId());  //设置更新人
            boolean delResult = villageGroupService.delete(bo);
            //执行成功时修改结果返回为正确信息
            if (delResult) {
                resultMap.put("result", "success");
            }
        }
        return resultMap;
    }

    /**
     * 列表数据
     * http://my.v6.aishequ.org:8990/dcl/dcl/villageGroup/getList.json
     */
    @ResponseBody
    @RequestMapping("/getList")
    public Object getList(HttpSession session, VillageGroup bo) {
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        if (StringUtils.isEmpty(bo.getRegionCode())) {
            bo.setRegionCode(infoOrgCode);
            if (checkDataPermission(session, bo.getRegionCode())) {
                return villageGroupService.searchListWithImage(bo);
            }
        } else if (!StringUtils.isEmpty(infoOrgCode) && bo.getRegionCode().startsWith(infoOrgCode)) {
            return villageGroupService.searchListWithImage(bo);
        }
        return new ArrayList<VillageGroup>();
    }
}