package cn.ffcs.dcl.provincialplatform.controller;

import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.iot.mybatis.domain.sewage.SewageManager;
import cn.ffcs.iot.sewage.service.ISewageManagerService;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.toiletCollect.service.IToiletCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 生态宜居大屏
 *
 * @Author Create by zheng on 2021-12-06 9:51
 */
@Controller("hospitableEcologyController")
@RequestMapping("/dcl/hospitableEcologyProvince")
public class HospitableEcologyController extends ZZBaseController {

    @Autowired
    private IToiletCollectService toiletCollectService;
    @Autowired
    private ISewageManagerService sewageManagerService;

    /**
     * 大屏
     * http://my.v6.aishequ.org:8990/dcl/dcl/hospitableEcologyProvince/index.jhtml
     * 村图集采集地址
     * http://my.v6.aishequ.org:8990/dcl/dcl/xcBigScreen/xcPicture.jhtml?model=beautifulCountry
     * 切图地址
     * /10_WebCode/pages/web/big-screen/35-xiangcunzhenxing/subject-cun/subject-shengtaiyiju.html
     *
     * @Author Create by zheng on 2021-11-09 11:11
     */
    @RequestMapping("/index")
    public Object index(HttpSession session, ModelMap map, String regionCode) {
        if (StringUtils.isEmpty(regionCode)) {
            Map<String, Object> defaultGridInfo = this.getDefaultGridInfo(session);
            if (defaultGridInfo != null) {
                regionCode = (String) defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
                map.put("gridId", defaultGridInfo.get(KEY_START_GRID_ID));
            }
        } else {
            MixedGridInfo grid = mixedGridInfoService.getGridInfoByInfoOrgCode(regionCode);
            if (grid != null) {
                map.put("gridId", grid.getGridId());
            }
        }
        map.put("regionCode", regionCode);
        map.put("wechatDomain", funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null));
        map.put("iotDomain", funConfigurationService.getAppDomain("$IOT_DOMAIN", null, null));
        return "/dcl/provincialplatform/hospitable_ecology_index.ftl";
    }

    /**
     * 统计厕所情况
     * http://my.v6.aishequ.org:8990/dcl/dcl/hospitableEcologyProvince/countToiletInfo.json
     * 数据来源
     * http://cs.v6.aishequ.org/wechat-web/web/toiletCollect/index.mhtml?system_privilege_code=
     * Map<String, Object> params orgCode 组织
     *
     * @return {TOTAL: 户厕数, POLLUTION_FREE: 无公害厕所数, REFORMED: 完成改革户厕数}
     * @author Create by zheng on 2021-12-07 16:39
     */
    @ResponseBody
    @RequestMapping("/countToiletInfo")
    public Object countToiletInfo(HttpSession session, String regionCode) {
        Map<String, Object> params = new HashMap<>();

        String infoOrgCode = this.getDefaultInfoOrgCode(session);

        if (StringUtils.isEmpty(regionCode)) {
            params.put("orgCode", infoOrgCode);
        } else {
            if (!StringUtils.isEmpty(infoOrgCode) && !regionCode.startsWith(infoOrgCode)) {
                return new HashMap<>();
            }
            params.put("orgCode", regionCode);// orgCode实际使用的是infoOrgCode
        }
        return toiletCollectService.countToiletInfo(params);
    }

    /**
     * 污水处理
     * http://my.v6.aishequ.org:8990/dcl/dcl/hospitableEcologyProvince/countToiletInfo.json
     * 数据来源
     * http://iot.v6.aishequ.org/iot/iot/sewageManager/index.jhtml?type=2&system_privilege_action=
     * Map<String, Object> params orgCode 组织
     *
     * @return {count: 处理点数量, pictures: List<SewageManager> -> SewageManager.sewagePicture }
     * @author Create by zheng on 2021-12-07 16:39
     */
    @ResponseBody
    @RequestMapping("/getSewageTreatmentInfo")
    public Object getSewageTreatmentInfo(HttpSession session, String regionCode) {
        SewageManager bo = new SewageManager();
        bo.setType("2");

        String infoOrgCode = this.getDefaultInfoOrgCode(session);
        if (StringUtils.isEmpty(regionCode)) {
            bo.setReginCode(Long.parseLong(infoOrgCode));
        } else {
            if (!StringUtils.isEmpty(infoOrgCode) && !regionCode.startsWith(infoOrgCode)) {
                return new HashMap<>();
            }
            bo.setReginCode(Long.parseLong(regionCode));
        }
        return sewageManagerService.getSewageManagerPicture(bo);
    }

}
