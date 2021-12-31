package cn.ffcs.dcl.oauth.controller;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.EncryptUtil;
import cn.ffcs.dcl.integral.service.IIntegralService;
import cn.ffcs.dcl.utils.DateUtils;
import cn.ffcs.dcl.utils.Md5Util;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.dj.mybatis.domain.partymember.BaseInfo;
import cn.ffcs.dj.service.partymember.BaseInfoService;
import cn.ffcs.uam.service.IFunConfigurationService;
import cn.ffcs.zone.EUDGPagination;
import cn.ffcs.zone.token.TokenService;
import cn.ffcs.zone.user.UserService;
import cn.ffcs.zone.user.domain.User;
import cn.ffcs.zone.user.domain.UserPwd;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.net.ssl.SSLContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 第三方登录认证
 *
 * @Title OauthController
 * @Author Create by zheng on 2021-10-11 14:13
 */
@Controller("oauthController")
@RequestMapping("/oauth")
public class OauthController {

    private final static String SMART_HOME_LOGIN_URL = "https://smarthome.thirdcloud.ott4china.com:9021/thirdcloud/openapi/1.0/user/partnerAuth";
    private final static String SMART_HOME_AES_KEY = "Yjk4MGY3NjM3MzhhNzFjYQ==";
    private final static String SMART_HOME_PARTNER_SECRET = "456b44c671b94d17b980f763738a71ca";
    private final static String SMART_HOME_PARTNER_ID = "c01914f7d9154c9e9f706e7a042b2462";
    private final static String CHARSETS_UTF_8 = "UTF-8";
    private final static String CONTENT_TYPE = "application/json";
    private final static int RESPONSE_STATUS_SUCCESS = 200;
    private static int SMART_HOME_ORDER = 0;
    private final static String PAGE_PATH_BING_REGION = "/bind_region.jsp";// 绑定乡村
    private final static String PAGE_PATH_CERTIFICATE_PARTY_MEMBER = "/certificate_party_member.jsp";// 党员认证
    private final static String DEFAULT_PW = "Ffcs@123";

    @Autowired
    protected IFunConfigurationService funConfigurationService;
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;
    @Autowired
    private BaseInfoService baseInfoService;

    @Autowired
    private IIntegralService integralService;

    /**
     * 设置参数后，服务器内部转发到目标页面
     *
     * @param url 目标页面
     * @Author Create by zheng on 2021-10-18 16:54
     */
    private void setForward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        request.setAttribute("originalUrl", request.getRequestURI());
        request.setAttribute("params", JSON.toJSON(request.getParameterMap()));
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * 检查是否需要党员认证，需要则直接转发认证页面
     *
     * @param redirect      重定向地址
     * @param certificatePM 是否需要认证党员，传任意值进行认证
     * @param tel           党员手机号
     * @param second        是否为再次触发认证
     * @return 是否转发
     * @Author Create by zheng on 2021-10-18 16:54
     */
    private boolean checkIsPM(HttpServletRequest request, HttpServletResponse response, String certificatePM,
                              String redirect, String tel, String second) throws ServletException, IOException {
        // 第一次触发且需要认证的模块才进行认证
        if (StringUtils.isEmpty(second) && !StringUtils.isEmpty(tel) &&
                (!StringUtils.isEmpty(certificatePM) || (!StringUtils.isEmpty(redirect) && redirect.contains("prj_dj/wap/news/index.jhtml")))) {
            BaseInfo certificate = new BaseInfo();
            certificate.setPhone(tel);
            BaseInfo isPM = baseInfoService.searchByBo(certificate);
            if (isPM == null) {
                setForward(request, response, PAGE_PATH_CERTIFICATE_PARTY_MEMBER);
                return true;
            }
        }
        return false;
    }

    /**
     * 通过partner_token获取小翼管家信息并检查ZoneUser
     *
     * @Author Create by zheng on 2021-10-26 9:30
     */
    private void getSmartHomeInfoAndCheckZoneUser(String partnerToken, HttpServletRequest request, HttpServletResponse response, HttpSession session,
                                                  String redirect, String certificatePM, String second) throws IOException {
        JSONObject form = new JSONObject();
        // signature规则： 序列号 + partnerSecret + partnerId + partnerToken + linux标准格式时间戳
        String sequenceNo = getNextSequence();
        long timestamp = System.currentTimeMillis();
        partnerToken = partnerToken.replaceAll(" ", "+");
        String signature = Md5Util.toMD5(sequenceNo + SMART_HOME_PARTNER_SECRET + SMART_HOME_PARTNER_ID + partnerToken + timestamp);
        form.put("sequenceNo", sequenceNo);
        form.put("timestamp", timestamp);
        form.put("signature", signature);
        form.put("partnerId", SMART_HOME_PARTNER_ID);
        form.put("partner_token", partnerToken);

        long beginTime = System.currentTimeMillis();
        JSONObject json = (JSONObject) sendHttpRequest(form, SMART_HOME_LOGIN_URL);
        System.out.println("请求耗时：" + (System.currentTimeMillis() - beginTime));
        System.out.println("请求入参：" + form);
        System.out.println("响应内容：" + json);

        if (json != null) {
            String errorCode = json.getString("error_code");
            if ("0".equals(errorCode)) {
                String encryptParam = json.getString("encryptParam");
                if (StringUtils.isEmpty(encryptParam)) {
                    renderString(response, "登录小翼管家失败，原因:" + json.getString("error_msg"));
                } else {
                    try {
                        // 解析密文
                        String decryptAES = EncryptUtil.decryptAES(json.getString("encryptParam"), SMART_HOME_AES_KEY);
                        JSONObject infoJson = JSONObject.parseObject(decryptAES);

                        System.out.println("明文内容:" + infoJson);
                        // 获取用户信息后转网站群账号
                        String userTel = infoJson.getString("phoneNumber");

                        if (!StringUtils.isEmpty(userTel)) {
                            Map<String, Object> queryUser = new HashMap<>();
                            queryUser.put("account", userTel);
                            queryUser.put("userType", "app");
                            User user;
                            EUDGPagination users = userService.getUserPageList(1, 1, queryUser);
                            if (users != null && users.getTotal() > 0) {
                                user = (User) users.getRows().get(0);
                            } else {
                                user = new User();
                                user.setAccount(userTel);
                                user.setMobile(userTel);
                                user.setUserName(userTel);
                                user.setNickname(userTel);
                                user.setCertificationFlag("0");
                                user.setFinalStatus("");
                                user.setIsAdmin("0");
                                user.setStatus("1");
                                user.setDataflg(1L);
                                user.setUserBoType("app");
                                user.setCreateby("source-dcl-oauth-SmartHome");
                                user.setPasswordMd5(Md5Util.toMD5(DEFAULT_PW).toLowerCase());
                                UserPwd userPwd = new UserPwd();
                                userPwd.setPasswordShow(DEFAULT_PW);
                                int id = userService.saveUser(user, userPwd);
                                user.setUserId((long) id);
                            }

                            try {
                                // 2、登录。（每日登录，获取 1 积分，每天一次）
                                integralService.addPoints(user.getUserId(), "F-OA004Z001002", "登录", user.getUserId(), user.getOrgCode());
                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                            Map<String, Object> map = tokenService.getUserInfoAsMap(userTel, Md5Util.toMD5(DEFAULT_PW).toLowerCase(), null);
                            System.out.println("line:169 tokenService.getUserInfoAsMap---------------------" + map);

                            session.setAttribute(ConstantValue.ZONE_USER_SESSION, user);
                            session.setAttribute("token", map.get("token"));
                            session.setAttribute("partner_token", partnerToken);

                            if (StringUtils.isEmpty(user.getOrgCode())) {
                                // 进入绑定乡村页面
                                setForward(request, response, PAGE_PATH_BING_REGION);
                            } else {
                                // 党员认证
                                if (!checkIsPM(request, response, certificatePM, redirect, userTel, second)) {
                                    // 重定向到目标地址
                                    preHandleRedirect(request, response, redirect, (String) map.get("token"));
                                }
                            }
                        } else {
                            renderString(response, "用户信息转换失败");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        renderString(response, "encryptParam解析失败");
                    }
                }
            } else {
                renderString(response, "登录小翼管家失败，code:" + errorCode + "，原因:" + json.getString("error_msg"));
            }
        } else {
            renderString(response, "请求无返回结果");
        }
    }

    /**
     * 中转站-对接小翼管家
     * http://my.v6.aishequ.org:8990/dcl/oauth/channel/smarthome/transferStation.jhtml
     *
     * @param redirect      重定向地址
     * @param certificatePM 是否需要认证党员，传任意值进行认证
     * @param second        是否为再次触发认证
     * @Author Create by zheng on 2021-09-30 16:31
     */
    @RequestMapping("/channel/smarthome/transferStation")
    public void smartHomeTransferStation(HttpServletRequest request, HttpServletResponse response,
                                         String redirect, String certificatePM, String second) throws Exception {
        HttpSession session = request.getSession();
        // 塞入通用参数
        session.setAttribute("defaultPageAction", request.getParameter("defaultPageAction"));
        session.setAttribute("ANOLE_COMPONENT_URL", funConfigurationService.getAppDomain("$SYSTEM_DOMAIN", null, null));
        session.setAttribute("SQ_ZZGRID_URL", funConfigurationService.getAppDomain("$ZZGRID_DOMAIN", null, null));
        session.setAttribute("uiDomain", funConfigurationService.getAppDomain("$APP_UI_DOMAIN", null, null));
        session.setAttribute("imgDomain", funConfigurationService.getAppDomain("$APP_IMG_DOMAIN", null, null));
        session.setAttribute("fileDomain", funConfigurationService.getAppDomain("$SQ_FILE_DOMAIN", null, null));
        session.setAttribute("skyDomain", funConfigurationService.getAppDomain("$SKY_DOMAIN", null, null));
        session.setAttribute("componentsDomain", funConfigurationService.getAppDomain("$COMPONENTS_DOMAIN", null, null));
        session.setAttribute("sysDomain", funConfigurationService.getAppDomain("$SYSTEM_DOMAIN", null, null));

        String partnerToken = request.getParameter("partner_token");
        System.out.println("method: request.getRequestURI()---" + request.getRequestURI());
        System.out.println("method: request.getParameterMap()---" + JSON.toJSON(request.getParameterMap()));
//        preHandleRedirect(request, response, redirect, "this-is-token");

        String userAgent = request.getHeader("user-agent").toLowerCase();
        if (userAgent.contains("micromessenger") && !userAgent.contains("miniprogram")) {
            // 来自公众号的直接重定向到目标地址
            request.getParameter("token");
            preHandleRedirect(request, response, redirect, request.getParameter("token"));
        } else {
            User zoneUser = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);

            if (StringUtils.isEmpty(partnerToken) && zoneUser == null) {
                renderString(response, "【error, the param of partner_token is undefined】");
            } else {
                System.out.println("zoneUser====" + JSON.toJSON(zoneUser));
                // session中有用户信息、不需要重新登录
                if (zoneUser != null) {

                    String sessionPartnerToken = (String) session.getAttribute("partner_token");
                    System.out.println("sessionPartnerToken====" + sessionPartnerToken);
                    if (!StringUtils.isEmpty(sessionPartnerToken) && !StringUtils.isEmpty(partnerToken)
                            && !sessionPartnerToken.equals(partnerToken.replaceAll(" ", "+"))) {
                        // 如果缓存中的partner_token与参数中传递的不同，重新获取用户信息
                        getSmartHomeInfoAndCheckZoneUser(partnerToken, request, response, session, redirect, certificatePM, second);
                    } else {
                        if (StringUtils.isEmpty(zoneUser.getOrgCode())) {
                            // 进入绑定乡村页面
                            setForward(request, response, PAGE_PATH_BING_REGION);
                        } else {
                            // 重定向到目标地址
                            String token = (String) session.getAttribute("token");
                            boolean isValid = tokenService.isTokenInvalid(token);
                            if (!isValid) {
                                Map<String, Object> map = tokenService.getUserInfoAsMap(zoneUser.getAccount(), Md5Util.toMD5(DEFAULT_PW).toLowerCase(), null);
                                System.out.println("line:260 tokenService.getUserInfoAsMap---------------------" + map);

                                token = (String) map.get("token");
                                session.setAttribute("token", token);
                            }

                            System.out.println("zone token---" + request.getRequestURI());
                            // 党员认证
                            if (!checkIsPM(request, response, certificatePM, redirect, zoneUser.getMobile(), second)) {
                                preHandleRedirect(request, response, redirect, token);
                            }
                        }
                    }
                } else {
                    getSmartHomeInfoAndCheckZoneUser(partnerToken, request, response, session, redirect, certificatePM, second);
                }
            }
        }
    }

    /**
     * 生成序列，格式yyyyMMddHHmmss + 4位数字
     *
     * @Author Create by zheng on 2021-09-29 15:22
     */
    private String getNextSequence() {
        String date = DateUtils.getToday("yyyyMMddHHmmss");
        SMART_HOME_ORDER++;
        if (SMART_HOME_ORDER > 9999) {
            SMART_HOME_ORDER = 1;
        }
        if (SMART_HOME_ORDER < 10) {
            return date + "000" + SMART_HOME_ORDER;
        } else if (SMART_HOME_ORDER < 100) {
            return date + "00" + SMART_HOME_ORDER;
        } else if (SMART_HOME_ORDER < 1000) {
            return date + "0" + SMART_HOME_ORDER;
        }
        return date + SMART_HOME_ORDER;
    }

    /**
     * 浏览器重定向，重定向前的预处理
     *
     * @param url 目标路径
     * @Author Create by zheng on 2021-09-30 16:56
     */
    private void preHandleRedirect(HttpServletRequest request, HttpServletResponse response, String url, String token) throws IOException {
        System.out.println("method: preHandleRedirect, param: url---" + url);
        System.out.println("method: preHandleRedirect, param: token---" + token);
        if (url.contains("prj_gbp")) {
            url = url.replace("prj_gbp", funConfigurationService.getAppDomain("$GBP_DOMAIN", null, null));
        } else if (url.contains("prj_dcl")) {
            url = url.replace("prj_dcl", funConfigurationService.getAppDomain("$DCL_DOMAIN", null, null));
        } else if (url.contains("prj_wechat")) {
            url = url.replace("prj_wechat", funConfigurationService.getAppDomain("$WECHAT_DOMAIN", null, null));
        } else if (url.contains("prj_dj")) {
            url = url.replace("prj_dj", funConfigurationService.getAppDomain("$DJ_DOMAIN", null, null));
        }
        if (!url.contains("http://")) {
            url = "http://" + url;
        }
        url = url + (url.contains("?") ? "&app=app" : "?app=app") + "&token=" + token;

        Map params = request.getParameterMap();
        Set keySet = params.keySet();
        for (Object obj : keySet) {
            if ("redirect".equals(obj) || "partner_token".equals(obj)
                    || ("app".equals(obj) && url.contains("app=app"))
                    || ("token".equals(obj) && url.contains("token="))
            ) {
                continue;
            }
            url = url + "&" + JSONObject.toJSON(obj) + "=" + JSONObject.toJSON(params.get(obj)).toString().replace("[\"", "").replace("\"]", "");
            System.out.println("for (Object obj : keySet) --- " + url);
        }

        String userAgent = request.getHeader("user-agent").toLowerCase();
        if (userAgent.contains("micromessenger") && !userAgent.contains("miniprogram")) {
            // 来自公众号的不需要app=app
            url = url.replace("app=app", "");
        }
        System.out.println("method: preHandleRedirect, final url---" + url);
        response.sendRedirect(url);
    }

    /**
     * 发送HTTP请求
     *
     * @param params 提请参数
     * @return String 返回结果
     * @Author Create by zheng on 2020-07-03 16:56
     */
    private Object sendHttpRequest(JSONObject params, String url) throws IOException {
        if (StringUtils.isEmpty(url)) {
            return null;
        }
        SSLContext sslContext = null;
        try {
            sslContext = SSLContexts.custom().loadTrustMaterial(null, (x509Certificates, s) -> true).build();
        } catch (NoSuchAlgorithmException | KeyManagementException | KeyStoreException e) {
            e.printStackTrace();
        }

        CloseableHttpClient client = HttpClients.custom().setSslcontext(sslContext).setSSLHostnameVerifier(new NoopHostnameVerifier()).build();
        HttpPost post = new HttpPost(url);
        post.setConfig(RequestConfig.custom().setSocketTimeout(60000).setConnectionRequestTimeout(60000).setConnectTimeout(60000).build());
        // 设置参数
        StringEntity formEntity = new StringEntity(params.toString(), CHARSETS_UTF_8);// 处理中文乱码
        formEntity.setContentType(CONTENT_TYPE);
        post.setEntity(formEntity);
        // 获取返回值
        HttpEntity returnEntity = client.execute(post).getEntity();
        if (returnEntity != null) {
            String responseStr = EntityUtils.toString(returnEntity, CHARSETS_UTF_8);
            return JSON.parseObject(responseStr);
        }
        return null;
    }

    /**
     * 向客户端输出错误提示信息
     *
     * @param string 输出错误提示信息
     * @Author Create by zheng on 2021-09-29 15:23
     */
    private void renderString(HttpServletResponse response, String string) {
        try {
            response.setStatus(RESPONSE_STATUS_SUCCESS);
            response.setContentType(CONTENT_TYPE);
            response.setCharacterEncoding(CHARSETS_UTF_8);
            response.getWriter().print(string);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 绑定所属区域
     */
    @ResponseBody
    @RequestMapping("/rebind")
    public Object bindRegion(HttpSession session, User params) throws Exception {
        if (params != null) {
            User zoneUser = (User) session.getAttribute(ConstantValue.ZONE_USER_SESSION);
            // 绑定乡村
            if (!StringUtils.isEmpty(params.getOrgCode())) {
                if (StringUtils.isEmpty(zoneUser.getOrgCode())) {
                    try {
                        // 1、账号绑定。（绑定手机、邮箱或常用通讯平台后，获取 20 积分）
                        integralService.addPoints(zoneUser.getUserId(), "F-OA004Z001001", "账号绑定", zoneUser.getUserId(), params.getOrgCode());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                zoneUser.setOrgCode(params.getOrgCode());
                zoneUser.setOrgName(params.getOrgName());
                session.setAttribute("userOrgCode", params.getOrgCode());
            }
            // 党员认证
            if (!StringUtils.isEmpty(params.getMobile())) {
                zoneUser.setMobile(params.getMobile());
                zoneUser.setUserName(params.getUserName());
            }

            userService.updateUser(zoneUser);
            session.setAttribute(ConstantValue.ZONE_USER_SESSION, zoneUser);

            Map<String, Object> map = tokenService.getUserInfoAsMap(zoneUser.getAccount(), Md5Util.toMD5(DEFAULT_PW).toLowerCase(), null);
            System.out.println("line:416 tokenService.getUserInfoAsMap---------------------" + map);
            if (map != null && map.containsKey("token")) {
                session.setAttribute("token", map.get("token"));
            }
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", "success");
        return resultMap;
    }

}