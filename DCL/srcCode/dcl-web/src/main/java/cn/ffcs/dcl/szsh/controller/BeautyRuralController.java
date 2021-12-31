package cn.ffcs.dcl.szsh.controller;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.attractionsmanagement.service.IAttractionsManagementService;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.villageproduct.VillageProduct;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.villageproduct.service.IVillageProductService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.service.IFunConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.uam.bo.UserInfo;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("BeautyRuralController")
@RequestMapping("/dcl/beautifulVillage")
public class BeautyRuralController extends ZZBaseController {


    @Autowired
    protected IFunConfigurationService funConfigurationService;
    @Autowired
    private IAttractionsManagementService attractionsManagementService; //注入景点管理表模块服务
    @Autowired
    private IVillageProductService villageProductService; //注入一村一品模块服务
    /**
     * 美丽乡村大屏首页
     * http://my.v6.aishequ.org:8990/dcl/beautifulVillage/index.jhtml
     * 切图 /10_WebCode/pages/web/big-screen/00-shuzishenghuo/subject/subject-meilixiangcun.html
     *
     * @Author Create by xuewq on 2021-11-09 9:13
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, @RequestParam Map<String, String> params, ModelMap map,String regionCode) {
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
            regionCode = u.getInfoOrgCodeStr();
        }
        String gbpDomain = funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null);
        map.put("gbpDomain", gbpDomain);
        map.put("regionCode", regionCode);
        map.put("FILE_URL", funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null));
        map.put("UAM_DOMAIN", funConfigurationService.getAppDomain("$UAM_DOMAIN", null, null));
        map.put("privilegeCode", "dcl_beautifulVillage");
        return "/dcl/szsh/beautyRural_index.ftl";
    }

    /**
     * http://my.v6.aishequ.org:8990/dcl/beautifulVillage/getVillageProj.jhtml
     * 列表数据
     */
    @ResponseBody
    @RequestMapping("/getVillageProj")
    public Object getVillageProj(HttpServletRequest request, HttpSession session, int page, int limit) {
        page = Math.max(page, 1);
        limit = limit < 1 ? 20 : limit;
        Map<String, Object> params = new HashMap<>();
        PaginationDto<VillageProduct> rst = new PaginationDto<>();
        String regionCode = request.getParameter("regionCode");
        if (StringUtils.isEmpty(regionCode)) {
            UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
            regionCode = u.getInfoOrgCodeStr();
        }
        if (checkDataPermission(session, CommonController.TYPE_GRID, regionCode)) {
            params.put("goodsName", request.getParameter("goodsName"));
            params.put("regionCode",regionCode);
            params.put("shelf", request.getParameter("shelf"));
            params.put("userOrgCode", getUserInfo(session).getOrgCode());
            rst = villageProductService.searchList(page, limit, params);
        }
        return rst;
    }

    /**
     * 列表数据
     * http://my.v6.aishequ.org:8990/dcl/beautifulVillage/showAttractions.jhtml
     * 查询条件 orgCode 必传
     */
    @ResponseBody
    @RequestMapping("/showAttractions")
    public Object showAttractions(HttpServletRequest request, HttpSession session, ModelMap map,
                           AttractionsManagement bo) {

        EUDGPagination pagination = new EUDGPagination();
        if(bo != null){
            if (StringUtils.isEmpty(bo.getOrgCode())) {
                UserInfo u = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);  //替换成本地常量
                bo.setOrgCode(u.getInfoOrgCodeStr());
            }

            // 越权检查。
            if (!StringUtils.isEmpty(bo.getOrgCode()) && checkDataPermission(session, bo.getOrgCode())) {
                UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
                pagination = attractionsManagementService.searchList(bo, userInfo.getInfoOrgCodeStr());
            }
        }


        return pagination;
    }

}
