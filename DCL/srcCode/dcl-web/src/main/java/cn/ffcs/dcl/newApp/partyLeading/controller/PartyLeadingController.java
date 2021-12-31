package cn.ffcs.dcl.newApp.partyLeading.controller;

import cn.ffcs.common.EUDGPagination;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.gmis.mybatis.domain.teamMembers.TeamMembers;
import cn.ffcs.gmis.teamMembers.service.ITeamMembersService;
import cn.ffcs.shequ.crypto.HashIdManager;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller("PartyLeadingController")
@RequestMapping("/public/wap/PartyLeadingController")    //    /public/wap
public class PartyLeadingController extends ZZBaseController {


//    @Autowired
//    private NewsService newsService; //注入通知信息模块服务

    @Autowired
    private ITeamMembersService teamMembersService;

    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        map.addAttribute("orgCode", user.getOrgCode());
        map.addAttribute("orgName", user.getOrgName());

        map.put("gbpDomain", newDomain(session,"$GBP_DOMAIN"));
        map.put("djDomain", newDomain(session,"$DJ_DOMAIN"));


//        map.addAttribute("orgCode", "35");

        setDomain(map);

        return "/mobile/newApp/partyLeading/partyLeading_index.jsp";
    }
//    @ResponseBody
//    @RequestMapping("/getNews")
//    public  Object getNews(HttpServletRequest request, HttpSession session, ModelMap map){
//
//
//        Map<String, Object> params = new HashMap<String, Object>();
//        params.put("orgCode",35);
//        EUDGPagination pagination = newsService.searchList(1, 10, params);
//
//        return pagination;
//
//
//    }




    @RequestMapping("/toMofang")
    public  Object toMofang(HttpServletRequest request, HttpSession session, ModelMap map){
        setDomain(map);
        User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        map.addAttribute("orgCode", user.getOrgCode());
        map.put("djDomain", newDomain(session,"$DJ_DOMAIN"));
        return "/mobile/newApp/partyLeading/pioneerModel_index.jsp";


    }

    /**
     * 法律顾问列表
     * http://my.v6.aishequ.org:8990/dcl/dcl/ruralLaw/getExpertList.json
     */
    @ResponseBody
    @RequestMapping("/getExpertList")
    public Object getExpertList(HttpSession session, int page, int rows, String regionCode,String bizType) {
        if (!checkDataPermissionForWx(session,  regionCode)) {
            return new EUDGPagination(0, new ArrayList<>());
        } else {
            page = Math.max(page, 1);
            rows = Math.max(rows, 1);
            Map<String, Object> query = new HashMap<>();
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
     * 设置域名
     * @param map 参数
     */
    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }
}
