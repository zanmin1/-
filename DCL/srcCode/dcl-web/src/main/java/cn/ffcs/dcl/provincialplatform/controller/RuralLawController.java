package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.uam.service.PriActionUtilOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 乡村法制大屏
 *
 * @Author Create by zheng on 2021-11-10 15:00
 */
@Controller("RuralLawProvinceController")
@RequestMapping("/dcl/ruralLawProvince")
public class RuralLawController extends ZZBaseController {

    @Autowired
    private PriActionUtilOutService priActionUtilOutService;
    @Autowired
    private ITeamMembersService teamMembersService;

    /**
     * http://my.v6.aishequ.org:8990/dcl/dcl/ruralLawProvince/index.jhtml
     *
     * @Author Create by zheng on 2021-11-09 11:11
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map) {
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        String regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        map.put("regionCode", regionCode);
        map.put("gbpDomain", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));

        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_xcfz");
        return "/dcl/provincialplatform/ruralLaw_index.ftl";
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

}
