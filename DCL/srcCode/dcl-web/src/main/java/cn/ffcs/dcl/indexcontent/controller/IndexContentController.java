package cn.ffcs.dcl.indexcontent.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.indexcontent.service.IIndexContentService;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.indexcontent.IndexContent;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.ResultObj;
import cn.ffcs.dcl.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.UserInfo;

/**
 * @Description: 首页展示内容管理模块控制器
 * @Author: xuewq
 * @Date: 12-13 15:07:25
 * @Copyright: 2021 福富软件
 */
@Controller("indexContentController")
@RequestMapping("/dcl/indexContent")
public class IndexContentController {

    @Autowired
    private IIndexContentService indexContentService; //注入首页展示内容管理模块服务

    /**
     * 表单配置页面
     * 访问页面 http://my.v6.aishequ.org:8990/dcl/indexContent/form.jhtml?code=
     */

    @RequestMapping("/form")
    public Object form(ModelMap map,
                       IndexContent indexContent, HttpSession session) {
        IndexContent bo = new IndexContent();
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        if (indexContent != null) {
            if (StringUtils.isEmpty(indexContent.getRegionCode())) {
                indexContent.setRegionCode(userInfo.getOrgCode());
            }
            map.put("code", indexContent.getCode());
            bo = indexContentService.searchByParam(indexContent);
        }

        map.addAttribute("bo", bo);
        map.put("bizTypePhoto", indexContentService.DCL_IndexContent_PHOTO);
        map.addAttribute("disTypeDictCode", DictConstantValue.DIS_TYPE);

        return "/dcl/provincialplatform/indexContent_form.ftl";
    }

    /**
     * 表单配置页面
     * 访问页面 http://my.v6.aishequ.org:8990/dcl/indexContent/detatil.jhtml?code=village_index
     */
    @ResponseBody
    @RequestMapping("/detatil")
    public Object detatil(IndexContent indexContent) {
        HashMap<String, Object> map = new HashMap<>();
        IndexContent bo = new IndexContent();
        if (indexContent != null) {
            bo = indexContentService.searchByParam(indexContent);
        }

        map.put("bo", bo);
        map.put("bizTypePhoto", indexContentService.DCL_IndexContent_PHOTO);
        map.put("disTypeDictCode", DictConstantValue.DIS_TYPE);

        return map;
    }

    /**
     * 保存
     * 访问页面 http://my.v6.aishequ.org:8990/dcl/indexContent/save.jhtml?
     */
    @ResponseBody
    @RequestMapping("/save")
    public Object save(HttpServletRequest request, HttpSession session, ModelMap map,
                       IndexContent bo) {
        ResultObj resultObj = new ResultObj(false, "保存失败！", null);
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
        bo.setUpdator(userInfo.getUserId());  //设置更新人
        if (bo != null) {
            if (StringUtils.isEmpty(bo.getRegionCode())) {
                bo.setRegionCode(userInfo.getOrgCode());
            }
        }
        if (StringUtils.isEmpty(bo.getUuid())) { //新增
            bo.setCreator(userInfo.getUserId());  //设置创建人
            Long id = indexContentService.insert(bo);
            if (id == null) {
                resultObj.setTipMsg("该区域和code已存在，保存失败！");
                return resultObj;
            }
        } else { //修改
            boolean update = indexContentService.update(bo);
        }
        resultObj.setSuccess(true);
        resultObj.setTipMsg("保存成功！");
        return resultObj;
    }


}