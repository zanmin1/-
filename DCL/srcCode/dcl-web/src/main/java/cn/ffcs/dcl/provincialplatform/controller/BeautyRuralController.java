package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller("BeautyRuralProvinceController")
@RequestMapping("/dcl/beautifulVillageProvince")
public class BeautyRuralController extends ZZBaseController {


    @Autowired
    protected IFunConfigurationService funConfigurationService;
    /**
     * 美丽乡村大屏首页
     * http://my.v6.aishequ.org:8990/dcl/beautifulVillageProvince/index.jhtml
     * 切图 /10_WebCode/pages/web/big-screen/00-shuzishenghuo/subject/subject-meilixiangcun.html
     *
     * @Author Create by xuewq on 2021-11-09 9:13
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, @RequestParam Map<String, String> params, ModelMap map) {
        UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
        String orgCode = u.getOrgCode();
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("regionCode", orgCode);
        map.put("FILE_URL", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_beautifulVillage");
            return "/dcl/provincialplatform/beautyRural_index.ftl";
    }
	
}
