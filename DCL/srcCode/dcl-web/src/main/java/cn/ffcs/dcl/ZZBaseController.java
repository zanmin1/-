/**
 *
 */
package cn.ffcs.dcl;

import cn.ffcs.common.Total;
import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.JsonHelper;
import cn.ffcs.common.utils.domain.App;
import cn.ffcs.shequ.mybatis.domain.zzgl.grid.MixedGridInfo;
import cn.ffcs.shequ.mybatis.domain.zzgl.map.data.GisMapInfo;
import cn.ffcs.shequ.zzgl.service.grid.IMixedGridInfoService;
import cn.ffcs.system.publicFilter.CommonController;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.zone.user.domain.User;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.*;

/**
 * 综治基础控制器
 *
 */
public class ZZBaseController extends CommonController {
    @Autowired
    protected IMixedGridInfoService mixedGridInfoService;
    protected static final String KEY_START_GRID_ID = "startGridId"; //默认网格入口
    protected static final String KEY_START_GRID_PHOTO = "startGridPhoto"; //默认网格封面
    protected static final String KEY_START_GRID_NAME = "startGridName"; //默认网格名称
    protected static final String KEY_START_GRID_LEVEL = "startGridLevel"; //默认网格名称
    protected static final String KEY_START_GRID_CODE_NAME = "startGridCodeName"; //默认网格名称
    protected static final String KEY_DEFAULT_INFO_ORG_ID = "defaultInfoOrgId"; //默认信息域组织ID
    protected static final String KEY_DEFAULT_INFO_ORG_CODE = "defaultInfoOrgCode"; //默认信息域组织编码
    protected static final String KEY_DEFAULT_INFO_ORG_NAME = "defaultInfoOrgName"; //默认信息域组织名称
    //福州市级平台的特定排序
    protected static final String GRID_CODE[] = {"350102", "350103", "350104", "350111", "350105", "350181", "350182", "350121", "350122", "350124", "350123", "350125"};
    protected static final int[] STAT_OF_GRID_SQ = {69, 52, 0, 66, 14, 0, 22, 27, 31, 22, 7, 10};//64,42

    protected boolean isEmpty(Object obj) {
        if (obj == null || "".equals(obj + "") || "null".equals(obj + "") || ((obj + "").trim()).isEmpty()) return true;

        return false;
    }

    @Autowired
    protected IFunConfigurationService funConfigurationService;

    /**
     * 获取登录用户对应的默认信息域
     * @param session
     * @return
     */
    protected Map<String, Object> getDefaultOrgInfo(HttpSession session) {
        Map<String, Object> defaultOrgInfo = new HashMap<String, Object>();
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        //-- 获取管理的信息域组织
        Long defaultInfoOrgId = -99L;
        String defaultInfoOrgCode = "";
        String defaultInfoOrgName = "";
        List<Long> infoOrgIdList = new ArrayList<Long>();
        if (userInfo.getInfoOrgList() != null && userInfo.getInfoOrgList().size() > 0) {
            defaultInfoOrgId = userInfo.getInfoOrgList().get(0).getOrgId();
            infoOrgIdList.add(defaultInfoOrgId);
            defaultInfoOrgCode = userInfo.getInfoOrgList().get(0).getOrgCode();
            defaultInfoOrgName = userInfo.getInfoOrgList().get(0).getOrgName();
        }
        defaultOrgInfo.put(KEY_DEFAULT_INFO_ORG_ID, defaultInfoOrgId);
        defaultOrgInfo.put(KEY_DEFAULT_INFO_ORG_CODE, defaultInfoOrgCode);
        defaultOrgInfo.put(KEY_DEFAULT_INFO_ORG_NAME, defaultInfoOrgName);
        return defaultOrgInfo;
    }


    /**
     * 公众号获取domain时使用
     *  过滤器根据地域获取域名头 配置新的域名
     *  传入 session
     *  配置域名 如$GBP_DOMAIN ..
     *  返回适配新域名
     * @param session
     * @return
     */
    protected String newDomain(HttpSession session,String  doMainName) {

        String mainTit =null;

        if(session.getAttribute("mainTit")!=null){
            mainTit	= session.getAttribute("mainTit").toString();
            mainTit=	"http://" + mainTit +"."+ funConfigurationService.getAppDomain(doMainName, null, null).substring(7);
        }else{
            mainTit =funConfigurationService.getAppDomain(doMainName, null, null);
        }

        return mainTit;
    }



    /**
     * 根据网格orgCode获取网格数据
     */
    public MixedGridInfo getGridInfoByOrgCode(String orgCode) {
        return mixedGridInfoService.getDefaultGridByOrgCode(orgCode);
    }

    protected String getDefaultInfoOrgCode(HttpSession session) {
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        // -- 获取管理的信息域组织
        String defaultInfoOrgCode = "";
        if (userInfo.getInfoOrgList() != null && userInfo.getInfoOrgList().size() > 0) {
            defaultInfoOrgCode = userInfo.getInfoOrgList().get(0).getOrgCode();
        }
        return defaultInfoOrgCode;
    }

    protected String getDefaultInfoOrgName(HttpSession session) {
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        // -- 获取管理的信息域组织
        String defaultInfoOrgName = "";
        if (userInfo.getInfoOrgList() != null && userInfo.getInfoOrgList().size() > 0) {
            defaultInfoOrgName = userInfo.getInfoOrgList().get(0).getOrgName();
        }
        return defaultInfoOrgName;
    }

    /**
     * 获取登录用户对应的默认网格
     * @param session
     * @return
     */
    protected Map<String, Object> getDefaultGridInfo(HttpSession session) {
        Map<String, Object> defaultGridInfo = new HashMap<String, Object>();
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        //-- 获取管理的信息域组织
        Long defaultInfoOrgId = -99L;
        String defaultInfoOrgCode = "";
        List<Long> infoOrgIdList = new ArrayList<Long>();
        System.out.println("------------------------------");
        if (userInfo.getInfoOrgList() != null && userInfo.getInfoOrgList().size() > 0) {
            defaultInfoOrgId = userInfo.getInfoOrgList().get(0).getOrgId();
            infoOrgIdList.add(defaultInfoOrgId);
            defaultInfoOrgCode = userInfo.getInfoOrgList().get(0).getOrgCode();
        }
        defaultGridInfo.put(KEY_DEFAULT_INFO_ORG_ID, defaultInfoOrgId);
        defaultGridInfo.put(KEY_DEFAULT_INFO_ORG_CODE, defaultInfoOrgCode);
        //-- 获取对应的网格根节点
        List<MixedGridInfo> gridInfoList = mixedGridInfoService.getMixedGridMappingListByOrgIdList(infoOrgIdList, ConstantValue.ORG_TYPE_ALL);
        //-- 设置列表默认网格入口
        Long startGridId = -99L;
        String startGridName = "";
        String startGridCodeName = "";
        String startGridPhoto = "";
        Integer startGridLevel = 0;
		/*Long startGridId = 283314L;//-99L;
		String startGridName = "测试街道";
		String startGridCodeName = "630101001 - 测试街道";
		String startGridPhoto = "";
		Integer startGridLevel = 0;*/
        if (gridInfoList != null && gridInfoList.size() > 0) {
            startGridId = gridInfoList.get(0).getGridId();
            startGridName = gridInfoList.get(0).getGridName();
            startGridCodeName = (gridInfoList.get(0).getGridCode() + " - " + gridInfoList.get(0).getGridName());
            startGridPhoto = gridInfoList.get(0).getGridPhoto();
            startGridLevel = gridInfoList.get(0).getGridLevel();
        }
        defaultGridInfo.put(KEY_START_GRID_ID, startGridId);
        defaultGridInfo.put(KEY_START_GRID_PHOTO, startGridPhoto);
        defaultGridInfo.put(KEY_START_GRID_NAME, startGridName);
        defaultGridInfo.put(KEY_START_GRID_CODE_NAME, startGridCodeName);
        defaultGridInfo.put(KEY_START_GRID_LEVEL, startGridLevel);
        return defaultGridInfo;
    }

    /**
     * 2013-08-06 liush
     * 获取登录用户对应的默认网格，没有等级的限制
     * @param session
     * @return
     */
    protected Map<String, Object> getDefaultGridInfoForEvent(HttpSession session) {
        Map<String, Object> defaultGridInfo = new HashMap<String, Object>();
        UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
        //-- 获取管理的信息域组织
        Long defaultInfoOrgId = -99L;
        String defaultInfoOrgCode = "";
        List<Long> infoOrgIdList = new ArrayList<Long>();
        if (userInfo.getInfoOrgList() != null && userInfo.getInfoOrgList().size() > 0) {
            defaultInfoOrgId = userInfo.getInfoOrgList().get(0).getOrgId();
            infoOrgIdList.add(defaultInfoOrgId);
            defaultInfoOrgCode = userInfo.getInfoOrgList().get(0).getOrgCode();
        }
        defaultGridInfo.put(KEY_DEFAULT_INFO_ORG_ID, defaultInfoOrgId);
        defaultGridInfo.put(KEY_DEFAULT_INFO_ORG_CODE, defaultInfoOrgCode);
        //-- 获取对应的网格根节点
        List<MixedGridInfo> gridInfoList = mixedGridInfoService.getMixedGridMappingListByOrgIdListForEvent(infoOrgIdList);
        //-- 设置列表默认网格入口
        Long startGridId = -99L;
        String startGridName = "";
        String startGridCodeName = "";
        String startGridPhoto = "";
        if (gridInfoList != null && gridInfoList.size() > 0) {
            startGridId = gridInfoList.get(0).getGridId();
            startGridName = gridInfoList.get(0).getGridName();
            startGridCodeName = (gridInfoList.get(0).getGridCode() + " - " + gridInfoList.get(0).getGridName());
            startGridPhoto = gridInfoList.get(0).getGridPhoto();
        }
        defaultGridInfo.put(KEY_START_GRID_ID, startGridId);
        defaultGridInfo.put(KEY_START_GRID_PHOTO, startGridPhoto);
        defaultGridInfo.put(KEY_START_GRID_NAME, startGridName);
        defaultGridInfo.put(KEY_START_GRID_CODE_NAME, startGridCodeName);
        return defaultGridInfo;
    }

    /**
     * 获取当前请求对应grid信息
     * @param session
     * @param request
     * @return
     */
    protected MixedGridInfo getMixedGridInfo(HttpSession session, HttpServletRequest request) {
        MixedGridInfo defaultGridInfo = null;
        Long gridId;
        if (!StringUtils.isBlank(request.getParameter("gridId"))) {
            gridId = Long.parseLong(request.getParameter("gridId"));
            defaultGridInfo = mixedGridInfoService.findMixedGridInfoById(gridId, false);
        } else {
            UserInfo userInfo = (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
            Long defaultInfoOrgId = -99L;
            List<Long> infoOrgIdList = new ArrayList<Long>();
            if (userInfo.getInfoOrgList() != null && userInfo.getInfoOrgList().size() > 0) {
                defaultInfoOrgId = userInfo.getInfoOrgList().get(0).getOrgId();
                infoOrgIdList.add(defaultInfoOrgId);
            }
            //-- 获取对应的网格根节点
            List<MixedGridInfo> gridInfoList = mixedGridInfoService.getMixedGridMappingListByOrgIdList(infoOrgIdList, ConstantValue.ORG_TYPE_ALL);
            if (gridInfoList != null && gridInfoList.size() > 0) {
                defaultGridInfo = gridInfoList.get(0);
            }
        }
        return defaultGridInfo;
    }

    /**
     * 输出xml文件
     * @param res
     * @param xmlStr
     * @throws Exception
     */
    public void outXml(HttpServletResponse res, String xmlStr) throws Exception {
        res.setCharacterEncoding("utf-8");
        res.setContentType("application/xml");
        res.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = res.getWriter();
        pw.write(xmlStr);
        pw.close();
    }


    /**
     * 输出json文件
     * @param res
     * @param xmlStr
     * @throws Exception
     */
    public void outJosn(HttpServletResponse res, String jsonStr) throws Exception {
        res.setCharacterEncoding("utf-8");
        res.setContentType("application/json;charset=UTF-8");
        res.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = res.getWriter();
        pw.write(jsonStr);
        pw.close();
    }

    /**
     * 返回json字段形式字符串，如： "name":"张三"
     * @param Name
     * @param obj
     * @return
     */
    public String getJsonFieldString(String fieldName, Object value) {
        String name = "\"" + fieldName + "\"";
        if (value == null) {
            return name + ":\"\"";
        } else {
            if (value.getClass() == Long.class || value.getClass() == Integer.class || value.getClass() == Float.class) {
                return name + ":" + value.toString();
            } else {
                return name + ":\"" + value.toString() + "\"";
            }
        }
    }

    /**
     * 返回xml元素形式字符串，如： <name>张三</name>
     * @param fieldName
     * @param value
     * @param isCDATA
     * @return
     */
    public String getXmlElementString(String fieldName, Object value, boolean isCDATA) {
        String val = (value == null) ? "" : value.toString();
        if (isCDATA) {
            return "<" + fieldName + "><![CDATA[" + val + "]]></" + fieldName + ">";
        } else {
            return "<" + fieldName + ">" + val + "</" + fieldName + ">";
        }
    }


    /**
     *
     * @param gisInfo
     * @return
     */
    public String getGisInfoXml(GisMapInfo gisInfo) {
        StringBuffer sb_xml = new StringBuffer("\n<GisForm>");
        sb_xml.append("\n<id>" + gisInfo.getId() + "</id>");
        sb_xml.append("\n<wid>" + gisInfo.getWid() + "</wid>");
        sb_xml.append("\n<gridId>" + gisInfo.getGridId() + "</gridId>");
        sb_xml.append("\n<gridCode>" + gisInfo.getGridCode() + "</gridCode>");
        sb_xml.append("\n<level>" + gisInfo.getLevel() + "</level>");
        sb_xml.append("\n<mapt>" + gisInfo.getMapt() + "</mapt>");
        sb_xml.append("\n<gridName><![CDATA[" + gisInfo.getGridName() + "]]></gridName>");
        sb_xml.append("\n<code>" + gisInfo.getInfoOrgCode() + "</code>");
        sb_xml.append("\n<gid>" + gisInfo.getGid() + "</gid>");
        sb_xml.append("\n<hs>" + gisInfo.getHs() + "</hs>");
        sb_xml.append("\n<x>" + gisInfo.getX() + "</x>");
        sb_xml.append("\n<y>" + gisInfo.getY() + "</y>");
        sb_xml.append("\n<c>" + gisInfo.getC() + "</c>");
        sb_xml.append("\n<name><![CDATA[" + gisInfo.getName() + "]]></name>");
        sb_xml.append("\n<path><![CDATA[" + gisInfo.getPath() + "]]></path>");
        sb_xml.append("\n<pid>" + gisInfo.getPid() + "</pid>");
        sb_xml.append("\n<address><![CDATA[" + gisInfo.getAddress() + "]]></address>");
        sb_xml.append("\n<legdate>" + gisInfo.getLegdate() + "</legdate>");
        sb_xml.append("\n<isGreatEvent>" + gisInfo.getIsGreatEvent() + "</isGreatEvent>");
        sb_xml.append("\n<urgencyDegree>" + gisInfo.getUrgencyDegree() + "</urgencyDegree>");
        if (gisInfo.getTid() != null) sb_xml.append("\n<tid>" + gisInfo.getTid() + "</tid>");
        sb_xml.append("\n<type>" + gisInfo.getType() + "</type>");
        sb_xml.append("\n<buildingName><![CDATA[" + gisInfo.getBuildingName() + "]]></buildingName>");
        sb_xml.append("\n</GisForm>");
        return sb_xml.toString();
    }

    /**
     * 呼叫中心事件录入
     * @param gisInfo
     * @return
     */
    public String getGisInfoCallInXml(GisMapInfo gisInfo, String id, String sCalleeNbr) {
        StringBuffer sb_xml = new StringBuffer("\n<Gisinfo>");
        sb_xml.append("\n<id>" + gisInfo.getId() + "</id>");
        sb_xml.append("\n<wid>" + gisInfo.getWid() + "</wid>");
        sb_xml.append("\n<gridId>" + gisInfo.getGridId() + "</gridId>");
        sb_xml.append("\n<gridCode>" + gisInfo.getGridCode() + "</gridCode>");
        sb_xml.append("\n<level>" + gisInfo.getLevel() + "</level>");
        sb_xml.append("\n<mapt>" + gisInfo.getMapt() + "</mapt>");
        sb_xml.append("\n<gridName>" + gisInfo.getGridName() + "</gridName>");
        sb_xml.append("\n<code>" + gisInfo.getInfoOrgCode() + "</code>");
        sb_xml.append("\n<gid>" + gisInfo.getGid() + "</gid>");
        sb_xml.append("\n<hs>" + gisInfo.getHs() + "</hs>");
        sb_xml.append("\n<x>" + gisInfo.getX() + "</x>");
        sb_xml.append("\n<y>" + gisInfo.getY() + "</y>");
        sb_xml.append("\n<c>" + gisInfo.getC() + "</c>");
        sb_xml.append("\n<name>" + gisInfo.getName() + "</name>");
        sb_xml.append("\n<path>" + gisInfo.getPath() + "</path>");
        sb_xml.append("\n<pid>" + gisInfo.getPid() + "</pid>");
        sb_xml.append("\n<address>" + gisInfo.getAddress() + "</address>");
        sb_xml.append("\n<userId>" + id + "</userId>");
        sb_xml.append("\n<phone>" + sCalleeNbr + "</phone>");
        sb_xml.append("\n<legdate>" + gisInfo.getLegdate() + "</legdate>");
        sb_xml.append("\n<urgencyDegree>" + gisInfo.getUrgencyDegree() + "</urgencyDegree>");
        //sb_xml.append("\n<isGreatEvent>"+gisInfo.getIsGreatEvent()+"</isGreatEvent>");
        if (gisInfo.getTid() != null) sb_xml.append("\n<tid>" + gisInfo.getTid() + "</tid>");
        sb_xml.append("\n<type>" + gisInfo.getType() + "</type>");
        sb_xml.append("\n</Gisinfo>");
        return sb_xml.toString();
    }

    /**
     * 将List转化为xml格式的数据
     *
     * @param totalNum
     * @param inList
     *            ，需要转换的list
     * @return String
     */
    public String getXmlFromList(long totalNum, List inList) {
        Total total = new Total();
        // 创建临时的List对象
        List results = inList;
        results.add(total);
        // 创建XStream对象
        XStream xs = new XStream(new DomDriver());
        // 为所有的类创建别名，别名为不包含包名的类名
        for (int i = 0; i < results.size(); i++) {
            Class clzz = results.get(i).getClass();
            // 得到全限定类名
            String fullName = clzz.getName();
            // System.out.println("==========="+fullName);

            // 以"."分割字符串
            String[] temp = fullName.split("\\.");
            xs.alias(temp[temp.length - 1], clzz);
        }
        String xmlString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                + xs.toXML(results);
        return xmlString;
    }

    /**
     * 域名内容进行替换,支持多个域名访问综治网格
     * @param request
     * @param url
     * @return
     */
    protected String getNewUrl(HttpSession session, String url) {
        try {
            String defaultDomain = getTopDomain(url);
            String newDoMain = App.TOP.getDomain(session);
            if (org.apache.commons.lang.StringUtils.isNotBlank(newDoMain)) {
                url = url.replace(defaultDomain, newDoMain);//都进行替换,因为即使域名一样,session也不同,每个登陆用户都有一个session
            }
            return url;
        } catch (Exception e) {
            e.printStackTrace();
            return url;
        }
    }

    /**
     * 提取一串url中的顶级域名
     * @param path
     * @return
     */
    private String getTopDomain(String path) {
        try {
            java.net.URI uri = new java.net.URI(path);
            String pathInfo = uri.getHost();

            pathInfo = pathInfo.replace("http://", "");
            int endIndex = pathInfo.indexOf("/");
            if (endIndex > 0) {
                pathInfo = pathInfo.substring(0, endIndex);
            }

            int index = pathInfo.indexOf(".");
            pathInfo = pathInfo.substring(index + 1, pathInfo.length());
			
			/*if(pathInfo.indexOf(":")>0){
				pathInfo = pathInfo.substring(0,pathInfo.indexOf(":"));
			}*/

            return pathInfo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    protected List parseRsrelFromStr(HttpServletRequest req, Class cl, String paramName) {
        String str1 = req.getParameter("attrs1");
        JSONArray arr1 = JSONArray.fromObject(str1);
        if (arr1.size() > 0) {
            return JsonHelper.getObjectList(str1, cl);
        }
        return Collections.EMPTY_LIST;
    }

    public UserInfo getUserInfo(HttpSession session) {
        return (UserInfo) session.getAttribute(ConstantValue.USER_IN_SESSION);
    }

	/**
     * 越权判断（适用于Pc，App过滤器存的是UserInfo也适用）
	 * @param session 会话
	 * @param bizRegionCode 业务地域代码
	 * @return 是否越权
	 */
	protected boolean checkDataPermission(HttpSession session, String bizRegionCode) {
		try {
			boolean isExceed = true;
			Map<String, Object> defaultGridInfo = this.getDefaultOrgInfo(session);
			String infoOrgCode = (String)defaultGridInfo.get(KEY_DEFAULT_INFO_ORG_CODE);

			if (StringUtils.isEmpty(bizRegionCode)) {
				isExceed = false;
			} else {
				// 传入的业务区域代码为当前用户的上级
				if (infoOrgCode.length() > bizRegionCode.length()) {
					isExceed = false;

				// 传入的业务区域代码与当前用户同级
				} else if (infoOrgCode.length() == bizRegionCode.length()) {
					// 传入的业务区域代码与当前用户不一致
					if (!infoOrgCode.equals(bizRegionCode)) {
						isExceed = false;
					}

				// 传入的业务区域代码是当前用户子级
				} else {
					if (!bizRegionCode.startsWith(infoOrgCode)) {
						isExceed = false;
					}
				}
			}

			return isExceed;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}







    /**
     * 越权判断（适用于微信公众号，App过滤器存的是User也适用）
     * @param session 会话
     * @param bizRegionCode 业务地域代码
     * @return 是否越权
     */
    protected boolean checkDataPermissionForWx(HttpSession session, String bizRegionCode) {
        try {
            boolean isExceed = true;
            User userInfo = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
            String infoOrgCode = userInfo.getOrgCode();

            if (StringUtils.isEmpty(bizRegionCode)) {
                isExceed = false;
            } else {
                // 传入的业务区域代码为当前用户的上级
                if (infoOrgCode.length() > bizRegionCode.length()) {
                    isExceed = false;

                // 传入的业务区域代码与当前用户同级
                } else if (infoOrgCode.length() == bizRegionCode.length()) {
                    // 传入的业务区域代码与当前用户不一致
                    if (!infoOrgCode.equals(bizRegionCode)) {
                        isExceed = false;
                    }

                // 传入的业务区域代码是当前用户子级
                } else {
                    if (!bizRegionCode.startsWith(infoOrgCode)) {
                        isExceed = false;
                    }
                }
            }

            return isExceed;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
