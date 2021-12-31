package cn.ffcs.dcl.article.controller;

import cn.ffcs.common.PositionUtil;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.attractionsmanagement.service.IAttractionsManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.gbp.infoOpen.service.ICommonInfoOpenService;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("articleController")
@RequestMapping("/public/wap/article")
public class ArticleController extends ZZBaseController {

    @Autowired
    private IAttractionsManagementService attractionsManagementService; //注入景点管理表模块服务

    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;

    @Autowired
    private IFunConfigurationService funConfigurationService;



    //文章动态
    @RequestMapping("/wzdt")
    public Object wzdt(HttpServletRequest request, HttpSession session) {

        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        request.setAttribute("orgCode", userInfo.getOrgCode());
        request.setAttribute("orgName", userInfo.getOrgName());

       return "/mobile/article/tongzhi-wzdt.jsp";
    }

    /**
     * 列表数据
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
             AttractionsManagement bo) {

        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        EUDGPagination pagination = attractionsManagementService.searchList(bo,userInfo.getOrgCode());
        return pagination;
    }



    //文章详情
    @RequestMapping("/wzxq")
    public Object wzxq(HttpServletRequest request, HttpSession session) {

        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);


        request.setAttribute("orgCode", userInfo.getOrgCode());
        request.setAttribute("orgName", userInfo.getOrgName());

        return "/mobile/article/tongzhi-wzxq.jsp";

    }


    @RequestMapping(value = "/showMap")
    public Object showMap(HttpServletRequest request, HttpSession session, ModelMap map,String x,String y){

        map.put("X", x);
        map.put("Y", y);

        return "/mobile/map/map_religion.jsp";
    }

    /*
    微信端 详情
     */

    @RequestMapping("/mobileView")
    public Object mobileView(HttpServletRequest request, HttpSession session, ModelMap map ,String id) {

        AttractionsManagement bo = attractionsManagementService.searchByUUId(id);
        map.addAttribute("bo", bo);

        //轮播图片
        try{
            List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_TITLLE);
            List<AttachmentByUUID>	 videoList=	attachmentByUUIDService.findByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_VIDEO);

            List<AttractionsManagement> pathList =new ArrayList<>();

            //视频在前
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

        setStatis(map);
        setDomain(map);

        return "/mobile/ruraltourism/lvyou-xiangqing.jsp";

    }

    @RequestMapping("/mobileIndex")
    public Object mobileIndex(HttpServletRequest request, HttpSession session, ModelMap map) {

        setDomain(map);

        User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

        map.addAttribute("orgCode", userInfo.getOrgCode());
        map.addAttribute("orgName", userInfo.getOrgName());

        return "/mobile/ruraltourism/lvyou-liebiao.jsp";

    }

    private void setStatis(ModelMap map) {
        map.addAttribute("bizType", ConstantValue.DCL_ATTR_TITLLE);//图片附件
        map.addAttribute("bizVideoType", ConstantValue.DCL_ATTR_VIDEO);//视频附件
        //收费
        map.addAttribute("DICT_PAY", DictConstantValue.DICT_PAY);
        //景点类型
        map.addAttribute("DICT_ATTR_TYPE", DictConstantValue.DICT_ATTR_TYPE);

    }

    private void setDomain(ModelMap map) {
        map.addAttribute("components_domain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        map.addAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        map.addAttribute("imgDomain", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
    }

}
