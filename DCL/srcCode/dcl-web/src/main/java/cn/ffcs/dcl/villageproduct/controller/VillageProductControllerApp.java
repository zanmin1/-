package cn.ffcs.dcl.villageproduct.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.villageproduct.VillageProduct;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.dcl.villageproduct.service.IVillageProductService;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.zone.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 一村一品模块控制器-App端
 * @Author: ZHENGYI
 * @Date: 09-16 14:57:48
 * @Copyright: 2021 福富软件
 */
@Controller("villageProductControllerApp")
@RequestMapping({"/public/wap/villageProductApp"})
public class VillageProductControllerApp extends ZZBaseController {

    @Autowired
    private IVillageProductService villageProductService; //注入一村一品模块服务
    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;

    /**
     * http://my.v6.aishequ.org:8990/dcl/dcl/villageProduct/wap/index.jhtml?userOrgCode=&tokenKey=
     *
     * @Author Create by zheng on 2021-09-18 14:56
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request) {
        request.setAttribute("componentsDomain", funConfigurationService.getAppDomain("$APP_COMPONENTS_DOMAIN", null, null));
        request.setAttribute("imgDomain", funConfigurationService.getAppDomain("$APP_IMG_DOMAIN", null, null));
        return "/mobile/villageProduct/village_product_list.jsp";
    }

    /**
     * 列表数据
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, int page, int limit) {
        page = Math.max(page, 1);
        limit = limit < 1 ? 20 : limit;
        Map<String, Object> params = new HashMap<>();
        params.put("goodsName", request.getParameter("goodsName"));
        params.put("shelf", request.getParameter("shelf"));
        User u = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        params.put("userOrgCode", u.getOrgCode());
        params.put("regionCode", u.getOrgCode());
        return villageProductService.searchList(page, limit, params);
    }

    /**
     * http://my.v6.aishequ.org:8990/dcl/dcl/villageProduct/wap/view.jhtml?userOrgCode=&tokenKey=
     *
     * @Author Create by zheng on 2021-09-18 14:56
     */
    @RequestMapping("/view")
    public Object view(String uuid, HttpServletRequest request, HttpSession session) {
        if (!StringUtils.isEmpty(uuid)) {
            User user = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

            UserInfo userInfo = new UserInfo();
            userInfo.setUserId(user.getUserId());
            userInfo.setOrgCode(user.getOrgCode());

            VillageProduct bo = villageProductService.searchByUuid(uuid, userInfo);
            request.setAttribute("bo", bo);
            ArrayList<HashMap<String, String>> fileList = new ArrayList<>();

            List<AttachmentByUUID> videoList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.DCL_VILLAGE_PRODUCT_VIDEO);
            request.setAttribute("videoListLength", videoList.size());
            if (videoList.size() > 0) {
                for (AttachmentByUUID file : videoList) {
                    HashMap<String, String> item = new HashMap<>();
                    item.put("type", "video");
                    String url = file.getFilePath();
                    item.put("url", file.getFilePath());
                    item.put("cover", file.getCoverPath());
                    String postfix = url.substring(url.lastIndexOf(".") + 1);
                    item.put("postfix", postfix);
                    fileList.add(item);
                }
            }
            List<AttachmentByUUID> imgList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.DCL_VILLAGE_PRODUCT_IMAGE);
            request.setAttribute("imgListLength", imgList.size());
            if (imgList.size() > 0) {
                for (AttachmentByUUID file : imgList) {
                    HashMap<String, String> item = new HashMap<>();
                    item.put("type", "img");
                    item.put("url", file.getFilePath());
                    fileList.add(item);
                }
            }

            request.setAttribute("fileList", fileList);
        }
        request.setAttribute("imgDomain", funConfigurationService.getAppDomain("$APP_IMG_DOMAIN", null, null));
        return "/mobile/villageProduct/village_product_view.jsp";
    }

}