package cn.ffcs.dcl.szxc.controller;

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

@Controller("XCBigScreenController")
@RequestMapping("/dcl/xcBigScreen")
public class XCBigScreenController extends ZZBaseController {

    private static final String xcPictureModel = "xcPicture";

    @Autowired
    private IAttachmentService attachmentService;//附件模块服务

    /**
     * 列表页面
     */
    @RequestMapping("/xcIndex")
    public Object xcIndex(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap map) {
        session.setMaxInactiveInterval(10 * 3600); // Session保存十小时
        Cookie cookie = new Cookie("JSESSIONID", session.getId());
        cookie.setMaxAge(10 * 3600); // 客户端的JSESSIONID也保存十小时
        response.addCookie(cookie);


        map.put("UI_DOMAIN", App.UI.getDomain(session));
        map.put("sysDomain", App.SYSTEM.getDomain(session));
        String ZZGRID_DOMAIN = funConfigurationService.getAppDomain("$ZZGRID_DOMAIN", null, null);
        map.put("ZZGRID_DOMAIN", ZZGRID_DOMAIN);
        String type = request.getParameter("type");
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        map.put("orgCode", userInfo.getOrgCode());

        String regionCode = request.getParameter("regionCode");
        if (regionCode==null) {
            regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        }else {
            map.put("orgCode", regionCode);
        }
        map.put("regionCode", regionCode);
        MixedGridInfo gridInfo = mixedGridInfoService.findMixedGridInfoById(Long.valueOf(defaultGridInfo.get(KEY_START_GRID_ID).toString()), false);
        map.put("gridInfo", gridInfo);
        String djDomain = funConfigurationService.getAppDomain("$DJ_DOMAIN", null, null);
        map.put("djDomain", djDomain);
        String WECHAT_DOMAIN = funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null);
        map.put("WECHAT_DOMAIN", WECHAT_DOMAIN);
        String rsDomain = funConfigurationService.getAppDomain("$RS_DOMAIN", null, null);
        map.put("rsDomain", rsDomain);
        String eventDomain = funConfigurationService.getAppDomain("$EVENT_DOMAIN", null, null);
        map.put("eventDomain", eventDomain);
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("FILE_URL", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("GMIS_DOMAIN", funConfigurationService.getAppDomain("$GMIS_DOMAIN", null, null));
        if ("1".equals(type)) {
            return "/dcl/szxc/djyl_index.ftl";
        } else if ("3".equals(type)) {
            map.put("title", request.getParameter("title"));
            map.put("module", request.getParameter("module"));
            map.put("catalogId", request.getParameter("catalogId"));
            map.put("infoOpenId", request.getParameter("infoOpenId"));
            return "/dcl/szxc/ztdr_index.ftl";
        } else if ("4".equals(type)) {
            map.put("title", request.getParameter("title"));
            map.put("module", request.getParameter("module"));
            map.put("catalogId", request.getParameter("catalogId"));
            map.put("infoOpenId", request.getParameter("infoOpenId"));
            return "/dcl/szxc/xcly_index.ftl";
        } else {
            return "/dcl/szxc/zwgk_index.ftl";
        }
    }

    /**
     * 列表页面
     */
    @ResponseBody
    @RequestMapping("/xcPictureList")
    public Object xcPictureList(HttpServletRequest request, HttpSession session, String model, String regionCode) {
        String idStr = request.getParameter("id");
        Long id = -99L;
        if (StringUtils.isEmpty(idStr)) {
            if (!StringUtils.isEmpty(regionCode)) {
                MixedGridInfo grid = mixedGridInfoService.getGridInfoByInfoOrgCode(regionCode);
                if (grid != null) {
                    id = grid.getGridId();
                }
            }
        } else {
            id = Long.parseLong(idStr);
        }
        Map<String, Object> defaultInfo = this.getDefaultGridInfo(session);
        if (defaultInfo != null) {
            long defaultId = (Long) defaultInfo.get(KEY_START_GRID_ID);
            if (defaultId != id) {
                return new ArrayList<Attachment>();
            }
            if (StringUtils.isEmpty(model)) {
                model = xcPictureModel;
            }
            return attachmentService.findByBizId(id, model);
        } else {
            return new ArrayList<Attachment>();
        }
    }

    /**
     * 列表页面
     */
    @RequestMapping("/xcPicture")
    public Object xcPicture(HttpServletRequest request, HttpSession session, ModelMap map, String model) {
        if (StringUtils.isEmpty(model)) {
            model = xcPictureModel;
        }
        map.put("model", model);
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        if (defaultGridInfo != null) {
            Long id = (Long) defaultGridInfo.get(KEY_START_GRID_ID);
            map.put("id", id);
            map.put("pictures", attachmentService.findByBizId(id, model));
            map.put("editable", true);
        } else {
            map.put("editable", false);
        }
        request.setAttribute("FILE_URL", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        return "/dcl/szxc/xcPicture_index.ftl";
    }

    /**
     * 保存相册
     */
    @ResponseBody
    @RequestMapping("/pictureSave")
    public Object pictureSave(Long id, Long[] pictures, String model) {
        if (StringUtils.isEmpty(model)) {
            model = xcPictureModel;
        }
        Map<String, Object> resultMap = new HashMap<>();
        try {
            List<Long> idList = new ArrayList<>();
            if (pictures != null && pictures.length > 0) {
                attachmentService.updateBizId(id, model, pictures, "001");
                idList = Arrays.asList(pictures);
            }
            List<Attachment> attachments = attachmentService.findByBizId(id, model);
            if (attachments != null && attachments.size() > 0) {
                for (Attachment att : attachments) {
                    if (!idList.contains(att.getAttachmentId())) {
                        attachmentService.deleteAttachmentById(att.getAttachmentId());
                    }
                }
            }
            resultMap.put("result", "success");
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("result", "fail");
            resultMap.put("message", e.getMessage());
        }
        return resultMap;
    }

}
