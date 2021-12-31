package cn.ffcs.dcl.integral.controller;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.DateUtils;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.oa.entity.interalrule.IdRecord;
import cn.ffcs.oa.entity.interalrule.IntegralStatistics;
import cn.ffcs.oa.service.interalrule.IdRecordService;
import cn.ffcs.oa.service.interalrule.IntegralStatisticsService;
import cn.ffcs.system.publicUtil.EUDGPagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Description: 积分模块控制器
 * @Author: linguoxiong
 * @Date: 11-22 09:52:47
 * @Copyright: 2021 福富软件
 */
@Controller("integralControllerPc")
@RequestMapping("/dcl/integral")
public class IntegralControllerPc extends ZZBaseController {

    @Autowired
    private IntegralStatisticsService integralStatisticsService; //注入积分模块服务

    @Autowired
    private IdRecordService idRecordService; //注入积分模块服务

    /**
     * 访问入口
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @return 视图路径
     */
    @RequestMapping("/index")
    public Object index(HttpServletRequest request, HttpSession session, ModelMap map) {
        // 所属区域。
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        map.put("infoOrgCode", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE));
        map.put("infoOrgName", defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_NAME));
        // 数据字典 - 使用平台
        map.addAttribute("platformDictCode", DictConstantValue.DCL_PLATFORM_TYPE);
        return "/dcl/integral/integral_list.ftl";
    }

    /**
     * 列表数据
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @return 积分列表
     */
    @ResponseBody
    @RequestMapping("/listData")
    public Object listData(HttpServletRequest request, HttpSession session, ModelMap map,
                           int currentPage, int pageSize) {
        PaginationDto<IntegralStatistics> paginationDto = new PaginationDto<IntegralStatistics>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        String type = request.getParameter("type");
        String statDate = request.getParameter("statDate");
        String tableType = request.getParameter("tableType");
        String orgCode = request.getParameter("regionCode");
        String moduleClass = request.getParameter("moduleClass");
        String activityNum = request.getParameter("activityNum");
        if (statDate == null || "".equals(statDate)){
            Calendar c = Calendar.getInstance();
            statDate = String.valueOf(c.get(Calendar.YEAR));
        }
        if(StringUtils.isEmpty(orgCode)){
            orgCode = infoOrgCode;
        }
        if (checkDataPermission(session, orgCode)) {
            Map<String,Object> map1 = new HashMap<>();
            map1.put("type",type);
            map1.put("statDate",statDate);
            map1.put("tableType",tableType);
            map1.put("moduleClass",moduleClass);
            map1.put("orgCode",orgCode);
            EUDGPagination eudgPagination = integralStatisticsService.getTopUser(currentPage,pageSize,map1);
            if (eudgPagination != null && eudgPagination.getTotal() > 0){
                List<IntegralStatistics> list = null;
                try{
                    list = (List<IntegralStatistics>) eudgPagination.getRows();
                }catch (Exception e){
                    e.printStackTrace();
                }
                if (list != null) {
                    paginationDto.setData(list);
                    Integer count = eudgPagination.getTotal();
                    paginationDto.setCount(count.longValue());
                }
            }
        }
        return paginationDto;
    }

    /**
     * 详情页面
     * @param request 页面请求
     * @param session 页面会话
     * @param map 返回界面显示的数据模型
     * @return 视图路径
     */
    @RequestMapping("/view")
    public Object view(HttpServletRequest request, HttpSession session, ModelMap map) {
        String userId = request.getParameter("userId");
        String statDate = request.getParameter("statDate");
        String statType = request.getParameter("statType");
        String regionCode = request.getParameter("regionCode");

        map.addAttribute("userId", userId);
        map.addAttribute("statDate", statDate);
        map.addAttribute("statType", statType);
        map.addAttribute("regionCode", regionCode);
        return "/dcl/integral/integral_view.ftl";
    }

    /**
     * 积分详情列表数据
     *
     * @param request 页面请求
     * @param session 页面会话
     * @param map     返回界面显示的数据模型
     * @param bo      模块信息
     * @return 模块数据列表
     */
    @ResponseBody
    @RequestMapping("/listViewData")
    public Object listViewData(HttpServletRequest request, HttpSession session, ModelMap map,
                               int currentPage, int pageSize) {

        PaginationDto<IdRecord> paginationDto = new PaginationDto<IdRecord>();
        Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
        String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);
        String userId = request.getParameter("userId");
        String statDate = request.getParameter("statDate");
        String statType = request.getParameter("statType");
        String orgCode = request.getParameter("regionCode");
        Map<String, Object> params = new HashMap<>();
        String startTime = statDate + "-01-01 00:00:00";
        String endTime = statDate + "-12-31 23:59:59";
        params.put("userId", userId);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("orgCode", orgCode);
//        params.put("statType", statType);
//        params.put("statDate", statDate);
        EUDGPagination eudgPagination = idRecordService.searchListPublic(currentPage, pageSize, params);
        if (eudgPagination != null && eudgPagination.getTotal() > 0) {
            List<IdRecord> list = null;
            try{
                list = (List<IdRecord>) eudgPagination.getRows();
            }catch (Exception e){
                e.printStackTrace();
            }
            if (list != null) {
                for (IdRecord i : list) {
                    String time = DateUtils.formatDate(i.getInteralDate(), DateUtils.PATTERN_DATE);
                    i.setInteralDateStartStr(time);
                }
                paginationDto.setData(list);
                Integer count = eudgPagination.getTotal();
                paginationDto.setCount(count.longValue());
                map.addAttribute("statDate", statDate);
            }
        }
        return paginationDto;
    }

}
