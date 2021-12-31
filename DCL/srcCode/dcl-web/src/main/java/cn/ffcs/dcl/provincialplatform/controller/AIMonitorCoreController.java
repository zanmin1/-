package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.gmis.mybatis.domain.teamMembers.TeamMembers;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.shequ.crypto.HashIdManager;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Description:
 * @Author: luchch
 * @Date: 2021/12/16 9:03
 * @Copyright: 2021 福富软件
 */
@Controller("AIMonitorCoreController")
@RequestMapping("/dcl/aiMonitorCoreController")
public class AIMonitorCoreController extends ZZBaseController {

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
    public Object index(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map) {
        map.put("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));

        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        String regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        map.addAttribute("WECHAT_DOMAIN", App.WECHAT.getDomain(session));
        map.put("regionCode", regionCode);

        return "dcl/provincialplatform/aiMonitorCore_index.ftl";
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
