package cn.ffcs.dcl.ncds.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.file.mybatis.domain.attachment.Attachment;
import cn.ffcs.file.service.IAttachmentService;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller("NcBigScreenController")
@RequestMapping("/dcl/ncBigScreen")
public class NcBigScreenController extends ZZBaseController {


    @Autowired
    private IAttachmentService attachmentService;//附件模块服务

    /**
     * 列表页面
     */
    @RequestMapping("/index")
    public Object xcIndex(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map, String regionCode, String positionCode) {
        // 三级穿透。
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            regionCode = userInfo.getInfoOrgCodeStr();
        }
        map.put("regionCode", regionCode);
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_beautifulVillage");

        map.put("positionCode", positionCode);   // 套餐编码。

        return "/dcl/ncds/subject-nongcundianshang-new.ftl";
    }


}
