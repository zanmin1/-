package cn.ffcs.dcl.szsh.controller;

import cn.ffcs.common.EUDGPagination;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.gmis.mybatis.domain.teamMembers.TeamMembers;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.shequ.crypto.HashIdManager;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.service.PriActionUtilOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 乡村法制大屏
 *
 * @Author Create by zheng on 2021-11-10 15:00
 */
@Controller("RuralLawController")
@RequestMapping("/dcl/ruralLaw")
public class RuralLawController extends ZZBaseController {

    @Autowired
    private PriActionUtilOutService priActionUtilOutService;
    @Autowired
    private ITeamMembersService teamMembersService;

    /**
     * http://my.v6.aishequ.org:8990/dcl/dcl/ruralLaw/index.jhtml
     *
     * @Author Create by zheng on 2021-11-09 11:11
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map, String regionCode) {
        if (StringUtils.isEmpty(regionCode)) {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            if (defaultGridInfo != null) {
                regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
            }
        }
        map.put("regionCode", regionCode);
        map.put("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));

        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_xcfz");
        return "/dcl/szsh/ruralLaw_index.ftl";
    }

    /**
     * 获取更多按钮
     * http://my.v6.aishequ.org:8990/dcl/dcl/ruralLaw/getMoreBtn.json
     */
    @ResponseBody
    @RequestMapping("/getMoreBtn")
    public Object getMoreBtn(String privilegeCode, HttpSession session) {
        if (StringUtils.isEmpty(privilegeCode)) {
            return new ArrayList<>();
        }
        return priActionUtilOutService.findActionById(null, privilegeCode, (List<?>) session.getAttribute(ConstantValue.SYSTEM_ROLE), false);
    }

    /**
     * 法律顾问列表
     * http://my.v6.aishequ.org:8990/dcl/dcl/ruralLaw/getExpertList.json
     */
    @ResponseBody
    @RequestMapping("/getExpertList")
    public Object getExpertList(HttpSession session, int page, int rows, String regionCode, String bizType) {
        if (!checkDataPermission(session, CommonController.TYPE_GRID, regionCode)) {
            return new EUDGPagination(0, new ArrayList<>());
        } else {
            page = Math.max(page, 1);
            rows = Math.max(rows, 1);
            Map<String, Object> query = new HashMap<>();
            if (StringUtils.isEmpty(bizType)) {
                bizType = "23";
            }
            query.put("bizType", bizType);
            query.put("regionCode", regionCode);
            EUDGPagination data = teamMembersService.findMembersForRegionPagination(page, rows, query);
            if (data != null && data.getRows() != null && data.getRows().size() > 0) {
                for (TeamMembers item : (List<TeamMembers>) data.getRows()) {
                    item.setHashId(HashIdManager.encrypt(item.getMemberId()));
                }
            }
            return data;
        }
    }

    /**
     * 法律顾问详情
     * http://my.v6.aishequ.org:8990/dcl/dcl/ruralLaw/getExpertInfo.json
     */
    @ResponseBody
    @RequestMapping("/getExpertInfo")
    public Object getExpertInfo(HttpSession session, String hashId) {

        TeamMembers teamMembers = teamMembersService.getMemberById(HashIdManager.decryptLong(hashId));
        if (teamMembers != null) {
            if (!checkDataPermission(session, CommonController.TYPE_GRID, teamMembers.getRegionCode())) {
                teamMembers = new TeamMembers();
            }
        }
        return teamMembers;
    }

}
