package cn.ffcs.dcl.dvcontract.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.dvcontract.service.IDvContractService;
import cn.ffcs.dcl.mybatis.domain.dvcontract.DvContract;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description: 合同管理模块控制器
 * @Author: ZHENGYI
 * @Date: 09-07 11:20:18
 * @Copyright: 2021 福富软件
 */
@Controller("dvContractController")
@RequestMapping("/dcl/dvContract")
public class DvContractController extends ZZBaseController {

    @Autowired
    private IDvContractService dvContractService; //注入合同管理模块服务
    private String ATTACHMENT_TYPE = "DCL_ATTACHMENT_CONTRACT";

    /**
     * 列表页面
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map) {
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        map.addAttribute("regionCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));// 默认信息域组织编码
        map.addAttribute("regionName", defaultGridInfo.get(KEY_START_GRID_NAME));// 默认网格名称
        return "/dcl/dvcontract/dv_contract_list.ftl";
    }

    /**
     * 列表数据
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, int page, int rows) {
        page = Math.max(page, 1);
        rows = rows < 1 ? 20 : rows;
        Map<String, Object> params = new HashMap<>();
        params.put("contractName", request.getParameter("contractName"));
        params.put("timeStart", request.getParameter("timeStart"));
        params.put("timeEnd", request.getParameter("timeEnd"));
        params.put("endTimeStr", request.getParameter("endTimeStr"));
        params.put("regionCode", request.getParameter("regionCode"));
        return dvContractService.searchList(page, rows, params);
    }

    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("bizType", ATTACHMENT_TYPE);
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }

    /**
     * 详情页面
     */
    @RequestMapping("/view")
    public Object view(ModelMap map, String id) {
        setDomain(map);
        DvContract bo = dvContractService.searchByUuid(id);
        map.addAttribute("bo", bo);
        return "/dcl/dvcontract/dv_contract_view.ftl";
    }

    /**
     * 表单页面
     */
    @RequestMapping("/form")
    public Object form(HttpSession session, ModelMap map, String id) {
        setDomain(map);
        DvContract bo = new DvContract();
        if (!StringUtils.isEmpty(id)) {
            bo = dvContractService.searchByUuid(id);
        } else {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            bo.setRegionCode((String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
            bo.setRegionName((String) defaultGridInfo.get(KEY_START_GRID_NAME));
        }
        map.put("bo", bo);
        return "/dcl/dvcontract/dv_contract_form.ftl";
    }

    /**
     * 保存数据
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpSession session, DvContract bo) {
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量

        Map<String, Object> resultMap = new HashMap<>();
        String result = "fail";
        if (StringUtils.isEmpty(bo.getUuid())) { //新增
            bo.setCreator(userInfo.getUserId());  //设置创建人
            Long id = dvContractService.insert(bo);
            if (id != null && id > 0) {
                result = "success";
            }
        } else { //修改
            bo.setUpdator(userInfo.getUserId());  //设置更新人
            boolean updateResult = dvContractService.update(bo);
            if (updateResult) {
                result = "success";
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
    public Object del(HttpSession session, DvContract bo) {
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION); //替换成本地常量
        bo.setUpdator(userInfo.getUserId());  //设置更新人
        Map<String, Object> resultMap = new HashMap<>();
        String result = "fail";
        boolean delResult = dvContractService.delete(bo);
        if (delResult) {
            result = "success";
        }
        resultMap.put("result", result);
        return resultMap;
    }

}