package cn.ffcs.dcl.villageproduct.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.mybatis.domain.villageproduct.VillageProduct;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.dcl.villageproduct.service.IVillageProductService;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.UserInfo;
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
 * @Description: 一村一品模块控制器-Pc端
 * @Author: ZHENGYI
 * @Date: 09-16 14:57:48
 * @Copyright: 2021 福富软件
 */
@Controller("villageProductControllerPc")
@RequestMapping("/dcl/villageProductPc")
public class VillageProductControllerPc extends ZZBaseController {

    @Autowired
    private IVillageProductService villageProductService; //注入一村一品模块服务
    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;

    private void setCommonParams(ModelMap map) {
        map.addAttribute("bizType", ConstantValue.DCL_VILLAGE_PRODUCT_IMAGE);//图片附件
        map.addAttribute("bizVideoType", ConstantValue.DCL_VILLAGE_PRODUCT_VIDEO);//视频附件
    }

    /**
     * 列表页面
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap map) {
        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
        map.addAttribute("regionCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
        map.addAttribute("regionName", defaultGridInfo.get(KEY_START_GRID_NAME));
        return "/dcl/villageProduct/village_product_list.ftl";
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

        params.put("type", request.getParameter("type"));
        params.put("goodsName", request.getParameter("goodsName"));
        params.put("regionCode", request.getParameter("regionCode"));
        params.put("shelf", request.getParameter("shelf"));
        params.put("userOrgCode", getUserInfo(session).getOrgCode());
        return villageProductService.searchList(page, limit, params);

    }

    private void setBo(HttpSession session, ModelMap map, String uuid) {
        setCommonParams(map);
        if (!StringUtils.isEmpty(uuid)) {
            VillageProduct bo = villageProductService.searchByUuid(uuid, getUserInfo(session));
            map.put("bo", bo);
        }
    }

    /**
     * 详情页面
     */
    @RequestMapping("/view")
    public Object view(HttpSession session, ModelMap map, String uuid) {
        setBo(session, map, uuid);

        ArrayList<HashMap<String, String>> pathList = new ArrayList<>();

        List<AttachmentByUUID> videoList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.DCL_VILLAGE_PRODUCT_VIDEO);
        for (AttachmentByUUID file : videoList) {
            HashMap<String, String> item = new HashMap<>();
            item.put("type", "video");
            String url = file.getFilePath();
            item.put("url", file.getFilePath());
            item.put("cover", file.getCoverPath());
            String postfix = url.substring(url.lastIndexOf(".") + 1);
            item.put("postfix", postfix);
            pathList.add(item);
        }

        List<AttachmentByUUID> attList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.DCL_VILLAGE_PRODUCT_IMAGE);
        for (AttachmentByUUID file : attList) {
            HashMap<String, String> item = new HashMap<>();
            item.put("type", "img");
            item.put("url", file.getFilePath());
            pathList.add(item);
        }

        map.put("attList", pathList);
        return "/dcl/villageProduct/village_product_view.ftl";
    }

    /**
     * 表单页面
     */
    @RequestMapping("/form")
    public Object form(HttpSession session, ModelMap map, String uuid) {
        setBo(session, map, uuid);
        map.put("DICT_VILLAGE_PRODUCT_TYPE", ConstantValue.DICT_VILLAGE_PRODUCT_TYPE);
        map.put("DICT_VILLAGE_PRODUCT_UNIT", ConstantValue.DICT_VILLAGE_PRODUCT_UNIT);
        return "/dcl/villageProduct/village_product_form.ftl";
    }

    /**
     * 保存数据
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpSession session, VillageProduct bo) {
        UserInfo u = getUserInfo(session);
        Map<String, Object> resultMap = new HashMap<>();
        bo.setCreator(u.getUserId());
        bo.setUpdator(u.getUserId());
        if ("1".equals(bo.getShelf()) && !bo.getShelf().equals(bo.getCurShelfStatus())) {
            bo.setPulisher(u.getPartyName());// 发布人
            bo.setIssuOrgName(getDefaultInfoOrgName(session));// 发布机构名称
            bo.setReleaseTime(villageProductService.getSysdate());//发布时间
        }
        String result = villageProductService.save(bo) ? "success" : "fail";
        resultMap.put("result", result);
        return resultMap;
    }

    /**
     * 上下架
     */
    @ResponseBody
    @RequestMapping("/isShelve")
    public Object isShelve(HttpSession session, String uuid, boolean isShelve) {
        UserInfo u = getUserInfo(session);
        VillageProduct bo = new VillageProduct();
        bo.setUpdator(u.getUserId());
        bo.setUuid(uuid);
        bo.setShelf(isShelve ? "1" : "0");
//        if (isShelve) {
//            bo.setPulisher(u.getPartyName());// 发布人
//            bo.setIssuOrgName(getDefaultInfoOrgName(session));// 发布机构名称
//            bo.setReleaseTime(villageProductService.getSysdate());//发布时间
//        }
        String result = villageProductService.update(bo) ? "success" : "fail";
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }

    /**
     * 删除数据
     */
    @ResponseBody
    @RequestMapping("/del")
    public Object del(HttpSession session, VillageProduct bo) {
        UserInfo userInfo = getUserInfo(session);
        bo.setUpdator(userInfo.getUserId());  //设置更新人
        Map<String, Object> resultMap = new HashMap<>();
        String result = "fail";
        boolean delResult = villageProductService.delete(bo);
        if (delResult) {
            result = "success";
        }
        resultMap.put("result", result);
        return resultMap;
    }

    /**
     * 详情页面
     */
    @ResponseBody
    @RequestMapping("/detail")
    public Object detail(HttpSession session, String uuid) {
        HashMap<String,Object> map = new HashMap<>();
        if (!StringUtils.isEmpty(uuid)) {
            VillageProduct bo = villageProductService.searchByUuid(uuid, getUserInfo(session));
            map.put("data",bo);
        }

        ArrayList<HashMap<String, String>> pathList = new ArrayList<>();

        List<AttachmentByUUID> videoList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.DCL_VILLAGE_PRODUCT_VIDEO);
        for (AttachmentByUUID file : videoList) {
            HashMap<String, String> item = new HashMap<>();
            item.put("type", "video");
            String url = file.getFilePath();
            item.put("url", file.getFilePath());
            item.put("cover", file.getCoverPath());
            String postfix = url.substring(url.lastIndexOf(".") + 1);
            item.put("postfix", postfix);
            pathList.add(item);
        }

        List<AttachmentByUUID> attList = attachmentByUUIDService.findByBizId(uuid, ConstantValue.DCL_VILLAGE_PRODUCT_IMAGE);
        for (AttachmentByUUID file : attList) {
            HashMap<String, String> item = new HashMap<>();
            item.put("type", "img");
            item.put("url", file.getFilePath());
            pathList.add(item);
        }

        map.put("attList", pathList);
        return map;
    }
}