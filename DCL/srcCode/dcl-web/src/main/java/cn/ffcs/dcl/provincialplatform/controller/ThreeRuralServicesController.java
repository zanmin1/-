package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.gmis.mybatis.domain.teamMembers.TeamMembers;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.shequ.crypto.HashIdManager;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 三农服务大屏控制器
 * @Author: gonghf
 * @Date: 12-6 09:36:44
 * @Copyright: 2021 福富软件
 */
@Controller("ThreeRuralServicesController")
@RequestMapping("/dcl/threeRuralServices")
public class ThreeRuralServicesController extends ZZBaseController {

    @Autowired
    private IBaseDictionaryService baseDictionaryService;   // 数据字典。

    @Autowired
    private ITeamMembersService teamMembersService;

    /**
     * 列表页面
     * @param request 客户端请求
     * @param session 会话
     * @param response 响应
     * @param map 参数
     * @return 页面数据
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map, String regionCode, String positionCode) {
        // 三级穿透。
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            regionCode = userInfo.getInfoOrgCodeStr();
        }
        map.put("regionCode", regionCode);

        map.put("uiDomain", App.UI.getDomain(session));
        map.put("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("weChatDomain", funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null));
        map.put("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));

        // 数据字典：农业百科分类，农业视频分类。
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");
        List<BaseDataDict> encyclopediasList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.Encyclopedias, userInfo.getOrgCode());
        map.put("encyclopediasList", encyclopediasList);
        List<BaseDataDict> agriculturalVideoList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.agriculturalVideo, userInfo.getOrgCode());
        map.put("agriculturalVideoList", agriculturalVideoList);

        map.put("positionCode", positionCode);   // 套餐编码。

        return "/dcl/provincialplatform/threeRuralServices_index.ftl";
    }

    /**
     * 获取农技专家数据
     * @param session 会话
     * @param page 页码
     * @param rows 行数
     * @param regionCode 区域编码
     * @return 页面数据
     */
    @ResponseBody
    @RequestMapping("/getExpertData")
    public Object getExpertData(HttpSession session, int page, int rows, String regionCode) {
        // 三级穿透。
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            regionCode = userInfo.getInfoOrgCodeStr();
        }

        // 越权检查。
        if (!checkDataPermission(session, CommonController.TYPE_GRID, regionCode)) {
            return new cn.ffcs.common.EUDGPagination(0, new ArrayList<>());
        } else {
            page = Math.max(page, 1);
            rows = Math.max(rows, 1);
            Map<String, Object> query = new HashMap<>();
            query.put("bizType", "20");
            query.put("regionCode", regionCode);
            cn.ffcs.common.EUDGPagination data = teamMembersService.findMembersForRegionPagination(page, rows, query);
            if (data != null && data.getRows() != null && data.getRows().size() > 0) {
                for (TeamMembers item : (List<TeamMembers>) data.getRows()) {
                    item.setHashId(HashIdManager.encrypt(item.getMemberId()));
                }
            }
            return data;
        }
    }

}
