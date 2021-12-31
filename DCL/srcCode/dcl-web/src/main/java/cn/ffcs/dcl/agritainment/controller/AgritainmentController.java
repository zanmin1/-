package cn.ffcs.dcl.agritainment.controller;


import cn.ffcs.common.Gps;
import cn.ffcs.common.PositionUtil;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.farmhousemanagement.service.IFarmhouseManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.zone.user.domain.User;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
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


/**
 * @Description: 农家乐
 * @Author: linguoxiong
 * @Date: 09-16 19:32:57
 * @Copyright: 2021 福富软件
 */
@Controller("agritainmentController")
@RequestMapping("/public/wap/agritainment")
public class AgritainmentController extends ZZBaseController {

    @Autowired
    private IFarmhouseManagementService farmhouseManagementService; //注入农家乐管理模块服务

    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;

    @Autowired
    private IResMarkerService resMarkerService;//gis地图接口

    //index
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {

//        Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        setDomain(map);

        String orgCode = userInfo.getOrgCode();

        request.setAttribute("orgCode",orgCode);

//        request.setAttribute("orgCode",defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
//        request.setAttribute("orgName",defaultGridInfo.get(KEY_START_GRID_NAME));
//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名

//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名
//        String uiDomain = funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null);
//        request.setAttribute("uiDomain",uiDomain);
//        request.setAttribute("ANOLE_COMPONENT_URL", App.SYSTEM.getDomain(session));
//        request.setAttribute("imgDomain", imgDomain);

        return "/mobile/agritainment/lvyou-liebiao-njl.jsp";
    }

    /**
     * 列表数据
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
                           int page, int rows,FarmhouseManagement bo) {
        page = page < 1 ? 1 : page;
        rows = rows < 1 ? 20 : rows;
        EUDGPagination pagination = farmhouseManagementService.searchListToApp(page,rows, bo);
        for (int i = 0; i < pagination.getRows().size(); i++) {
            FarmhouseManagement b = (FarmhouseManagement) pagination.getRows().get(i);
            List<ResMarker> res = resMarkerService.findResMarkerByParam(DictConstantValue.FARMHOUSE_MANAGEMENT_MAP,b.getUuid(),null);
            if(res!=null&&res.size()>0){
                //84坐标转百度坐标
                Gps position = PositionUtil.gps84_To_Bd09(Double.parseDouble(res.get(0).getY()),Double.parseDouble(res.get(0).getX()));
                b.setX(position.getWgLon());
                b.setY(position.getWgLat());
            }
        }
        return pagination;
    }

    /**
     * 详情页面
     */
    @RequestMapping("/view")
    public Object view(HttpServletRequest request, HttpSession session, ModelMap map,
                       String uuId) {
//        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
        //附件类型
//        map.put("bizType", ConstantValue.ATTA_FAR_HOUSE_MANAGE); //附件上传

        map.put("markerType", DictConstantValue.FARMHOUSE_MANAGEMENT_MAP);//地图标注字典
        map.put("GIS_URL", App.GIS.getDomain(session));//新地图标注
        FarmhouseManagement bo = new FarmhouseManagement();
        if (StringUtils.isNotEmpty(uuId)) {
            bo = farmhouseManagementService.searchByUuId(uuId);
        }
//        bo.setPulisher(userInfo.getUserName());
//        bo.setIssuOrgName(userInfo.getOrgName());
        map.put("bo", bo);

        List<String> imgList = bo.getImgList();
        map.put("imgCount", imgList == null ? 0 : imgList.size());

        //轮播图片
        try{
            List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE);
            List<AttachmentByUUID>	 videoList=	attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);

            List<AttractionsManagement> pathList =new ArrayList<>();


//            视频在前
            for(AttachmentByUUID att:videoList){
                AttractionsManagement res =new AttractionsManagement();
                res.setPicUrl(att.getFilePath());
                res.setImg("video");
                pathList.add(res);
            }
            for(AttachmentByUUID att:attList){
                AttractionsManagement res =new AttractionsManagement();
                res.setPicUrl(att.getFilePath());
                res.setImg("img");
                pathList.add(res);

            }

            map.put("attList", JSON.toJSONString(pathList) );
        }catch (Exception e){
            e.printStackTrace();
        }

        List<ResMarker> res = resMarkerService.findResMarkerByParam(DictConstantValue.FARMHOUSE_MANAGEMENT_MAP,uuId,null);

        if(res!=null&&res.size()>0){
            //84坐标转百度坐标
            Gps position = PositionUtil.gps84_To_Bd09(Double.parseDouble(res.get(0).getY()),Double.parseDouble(res.get(0).getX()));

            map.put("x", position.getWgLon());
            map.put("y", position.getWgLat());
        }

//        map.put("gridId", this.getDefaultGridInfo(session).get(this.KEY_START_GRID_ID));
//        map.put("module", ConstantValue.DCL_FAR_HOUSE_MANAGE);
//        map.put("mapType", ConstantValue.MAP_TYPE);
//        map.put("markerOperation", 2);
//        map.put("markModule", ConstantValue.FAR_HOUSE_MANAGE_MARK);  //地图标注类型

        String orgCode = userInfo.getOrgCode();

        request.setAttribute("orgCode",orgCode);

//        String imgDomain = App.IMG.getDomain(request.getSession());// 支持多域名
//        String uiDomain = funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null);
//        request.setAttribute("uiDomain",uiDomain);
//        request.setAttribute("ANOLE_COMPONENT_URL", App.SYSTEM.getDomain(session));
//        request.setAttribute("imgDomain", imgDomain);
        setDomain(map);

        return "/mobile/agritainment/lvyou-xiangqing-njl.jsp";
    }


    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }

}
