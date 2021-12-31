package cn.ffcs.dcl.AIBigScreen.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.attractionsmanagement.service.IAttractionsManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.zone.user.domain.User;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller("AIBigScreenController")
@RequestMapping("/dcl/AIBigScreenController")
public class AIBigScreenController extends ZZBaseController {





    @RequestMapping("/index")
    public Object mobileIndex(HttpServletRequest request, HttpSession session, ModelMap map) {

        setDomain(map);



        return "dcl/aiBigScreen/aiBigScreen_index.ftl";

    }



    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }
}
