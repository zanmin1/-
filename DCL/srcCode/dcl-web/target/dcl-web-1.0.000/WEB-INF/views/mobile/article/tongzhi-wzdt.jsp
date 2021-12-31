<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String uiDomain = request.getAttribute("uiDomain").toString();
    String ANOLE_COMPONENT_URL = request.getAttribute("ANOLE_COMPONENT_URL").toString();
%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">
    <title>通知公告-文章动态</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />
</head>

<body class="bg-cor-f5">
    <!-- 添加被申请人-个人 -->
    <div class="layui-contain">
        <div class="layui-row layer-hd posi-fixed posi-left-0 posi-top-0 posi-right-0 bg-fff">
            <div class="layui-col-xs12">
                <div class="layui-col-xs11">
                    <div class="swiper-container nav-ext1 nav-ext1-blue1 j-nav bg-fff">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide selected"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">类型1</button></div>
                            <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">类型2</button></div>
                            <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">类型3</button></div>
                            <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">类型4</button></div>
                            <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">类型5</button></div>
                            <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">类型6</button></div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs1">
                    <button class="j-nav-arrow layui-btn layui-btn-ext1 nav-ext1-more" data-navindex="0"></button>
                </div>
            </div>
            <div class="layui-col-xs12">
                <div class="swiper-container j-nav-ext1 nav-ext3 bg-cor-f5 pt10 pb10">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide selected"><button class="layui-btn btn-tabs-ext4-item font-size-12 layui-this">全部</button></div>
                        <div class="swiper-slide"><button class="layui-btn btn-tabs-ext4-item font-size-12">专班建设</button></div>
                        <div class="swiper-slide"><button class="layui-btn btn-tabs-ext4-item font-size-12">综治中心</button></div>
                        <div class="swiper-slide"><button class="layui-btn btn-tabs-ext4-item font-size-12">网格员</button></div>
                        <div class="swiper-slide"><button class="layui-btn btn-tabs-ext4-item font-size-12">社会组织</button></div>
                        <div class="swiper-slide"><button class="layui-btn btn-tabs-ext4-item font-size-12">社会组织</button></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="swiper-container j-nav-chidren">
            <div class="swiper-wrapper">
                <!-- 类型1 -->
                <div class="swiper-slide nav-chidren-h1">
                    <div class="layui-row bg-fff">
                        <div class="layui-col-xs12 pl15 pr15 pb10">
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：深入学习贯彻党的十九届五中全会精神，在更高起点开创政法工作新局面</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">开设赌楼 收取“保护费” 南昌一黑社会组织主犯获死列</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">玉山县法治政府建设全面发力</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：咬定目标任务，扛起使命担当，在决胜全面建成小康社会中彰显更大作为</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 类型2 -->
                <div class="swiper-slide nav-chidren-h1">
                    <div class="layui-row bg-fff">
                        <div class="layui-col-xs12 pl15 pr15 pb10">
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：深入学习贯彻党的十九届五中全会精神，在更高起点开创政法工作新局面</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">开设赌楼 收取“保护费” 南昌一黑社会组织主犯获死列</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">玉山县法治政府建设全面发力</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：咬定目标任务，扛起使命担当，在决胜全面建成小康社会中彰显更大作为</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 类型3 -->
                <div class="swiper-slide nav-chidren-h1">
                    <div class="layui-row bg-fff">
                        <div class="layui-col-xs12 pl15 pr15 pb10">
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：深入学习贯彻党的十九届五中全会精神，在更高起点开创政法工作新局面</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">开设赌楼 收取“保护费” 南昌一黑社会组织主犯获死列</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">玉山县法治政府建设全面发力</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：咬定目标任务，扛起使命担当，在决胜全面建成小康社会中彰显更大作为</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 类型4 -->
                <div class="swiper-slide nav-chidren-h1">
                    <div class="layui-row bg-fff">
                        <div class="layui-col-xs12 pl15 pr15 pb10">
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：深入学习贯彻党的十九届五中全会精神，在更高起点开创政法工作新局面</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">开设赌楼 收取“保护费” 南昌一黑社会组织主犯获死列</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">玉山县法治政府建设全面发力</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：咬定目标任务，扛起使命担当，在决胜全面建成小康社会中彰显更大作为</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 类型5 -->
                <div class="swiper-slide nav-chidren-h1">
                    <div class="layui-row bg-fff">
                        <div class="layui-col-xs12 pl15 pr15 pb10">
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：深入学习贯彻党的十九届五中全会精神，在更高起点开创政法工作新局面</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">开设赌楼 收取“保护费” 南昌一黑社会组织主犯获死列</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">玉山县法治政府建设全面发力</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：咬定目标任务，扛起使命担当，在决胜全面建成小康社会中彰显更大作为</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 类型6 -->
                <div class="swiper-slide nav-chidren-h1">
                    <div class="layui-row bg-fff">
                        <div class="layui-col-xs12 pl15 pr15 pb10">
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：深入学习贯彻党的十九届五中全会精神，在更高起点开创政法工作新局面</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <p class="font-size-12 cor-999 mt5">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">开设赌楼 收取“保护费” 南昌一黑社会组织主犯获死列</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">
                                <div class="pic-wrap-ext1 notice-s1">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="flex1 ml10">
                                    <p class="font-size-14 cor-4d height-3em text-line-c2">玉山县法治政府建设全面发力</p>
                                    <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                                </div>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">全省行政复议和行政应诉工作培训班开班</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                            <div class="layui-col-xs12 bor-btm-f0 pt10 pb10">
                                <p class="font-size-14 cor-4d">尹建业：咬定目标任务，扛起使命担当，在决胜全面建成小康社会中彰显更大作为</p>
                                <div class="pic-wrap-ext1 notice-s2 mt5">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-4">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-2.png">
                                        </div>
                                    </div>
                                </div>
                                <p class="font-size-12 cor-999 mt10">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 全屏弹窗需要盖住顶部按钮需要调整弹窗层级，加类zindex-50 -->
        <div class="layui-row layer-bd zindex-50 hide">
            <div class="layer-bd-cont layer-cont-ext1 notice-border-radius-ext1 bg-fff hide">
                <div class="layui-row bor-btm-f0 pl25 pt15 pr15 pb10">
                    <div class="layui-col-xs12 flex flex-jb flex-ac">
                        <p class="font-size-16 cor-333">事件类型<em class="font-size-12 cor-999 ml10">点击进入该事件</em></p>
                        <button class="layui-btn layui-btn-ext1"><i class="layui-icon layui-icon-close j-close-layer font-size-18 font-bold cor-999 pl5 pr5"></i></button>
                    </div>
                </div>
                <div class="layui-row layer-bd-item btn-tabs-ext1 pl15 pt15 pr15 pb90 layui-col-space10">
                    <div class="layui-col-xs4">
                        <button type="button" class="layui-btn btn-tabs-ext1-item layui-this font-size-12 width-p100 border-radius-4">类型1</button>
                    </div>
                    <div class="layui-col-xs4">
                        <button type="button" class="layui-btn btn-tabs-ext1-item font-size-12 width-p100 border-radius-4">类型2</button>
                    </div>
                    <div class="layui-col-xs4">
                        <button type="button" class="layui-btn btn-tabs-ext1-item font-size-12 width-p100 border-radius-4">类型3</button>
                    </div>
                    <div class="layui-col-xs4">
                        <button type="button" class="layui-btn btn-tabs-ext1-item font-size-12 width-p100 border-radius-4">类型4</button>
                    </div>
                    <div class="layui-col-xs4">
                        <button type="button" class="layui-btn btn-tabs-ext1-item font-size-12 width-p100 border-radius-4">类型5</button>
                    </div>
                    <div class="layui-col-xs4">
                        <button type="button" class="layui-btn btn-tabs-ext1-item font-size-12 width-p100 border-radius-4">类型6</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--代码结束-->
</body>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>
    $.fn.extend({
        // 页面高度计算
        heightC: function(){
            var _this = this;
            var paddingT = $('.layer-hd').outerHeight();
            var navCH = $(window).outerHeight() - paddingT;
            $(_this).css({'paddingTop': paddingT+'px'});
            $('.nav-chidren-h1').css({'height': navCH+'px'});
        },
        // swiper
        navExt1: function (num) {
            var _this = this;
            var navEl = navEl1 = $(_this).selector.substr(1);
            var navEl2 = '' + navEl1 + '-chidren';
            function setCurrentSlide(ele, index) {
                $("." + navEl + " .swiper-slide").removeClass("selected");
                ele.addClass("selected");
            }
            navEl1 = new Swiper('.' + navEl1 + '', {
                slidesPerView: 4,
                paginationClickable: true,//此参数设置为true时，点击分页器的指示点分页器会控制Swiper切换。
                spaceBetween: 5,//slide之间的距离（单位px）。
                freeMode: false,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
                loop: false,//是否可循环
                autoHeight: true, //高度随内容变化
                observer: true,
                observeParents: true,
                slideToClickedSlide: true,//设置为true则点击slide会过渡到这个slide。
                centeredSlides: true,//设定为true时，active slide会居中，而不是默认状态下的居左。
                on: {
                    transitionStart() {  //开始translate之前
                        var index = this.activeIndex;
                        //第一张
                        if (this.activeIndex == 0) {
                            this.setTranslate(4)
                            $(".swiper-button-prev").addClass('swiper-button-disabled')
                        } else {
                            $(".swiper-button-prev").removeClass('swiper-button-disabled')
                        }
                        if (this.activeIndex == 1) {
                            this.setTranslate(4)
                        }
                        //最后一张 和 最后 两张
                        if (this.activeIndex == this.slides.length - 1 || this.activeIndex == this.slides.length - 2) {
                            var w = this.width //容器的宽度
                            var slideW = (this.width / 3.5).toFixed(3.5) //每个slide的宽度
                            var keepW = slideW * (this.slides.length - 3.5) //需要设置translate的宽度
                            this.setTranslate(-keepW);
                            $(".swiper-button-next").addClass('swiper-button-disabled')
                        } else {
                            $(".swiper-button-next").removeClass('swiper-button-disabled')
                        }
                    }
                }
            });
            navEl1.slides.each(function (index, val) {
                var ele = $(this);
                ele.on("click", function () {
                    $('.j-nav-arrow').attr('data-navindex', $(this).index());
                    setCurrentSlide(ele, index);
                    navEl2.slideTo(index, 500, false);
                    // 获取点击后的index
                });
            });
            navEl2 = new Swiper('.' + navEl2 + '', {
                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                loop: false,
                touchRatio: 0,
                autoHeight: true,//自动高度。设置为true时，wrapper和container会随着当前slide的高度而发生变化。
            });

            // 下拉菜单选项选择
            $('.btn-tabs-ext1').on('click', '.btn-tabs-ext1-item', function () {
                if (!$(this).hasClass('layui-this')) {
                    $(this).addClass('layui-this').parent().siblings().children().removeClass('layui-this');
                    $('.layer-bd').addClass('hide');
                    $('.layer-bd-cont').slideUp(300);
                    var thisindex = $(this).parent().index();
                    navEl1.slideTo(thisindex, 500, false);
                    $('.j-nav .swiper-slide').eq(thisindex).click();
                }
            });
        },
        closeL: function () {
            $(this).on('click', function () {
                $('.layer-bd-cont').slideUp(300).siblings().fadeOut(300)
                setTimeout(function () {
                    $('.layer-bd').addClass('hide')
                }, 300);
            });
        },
        navArrowD: function () {
            // 弹窗
            $(this).on('click', function () {
                $('.layer-bd').removeClass('hide');
                $('.layer-bd-cont').slideDown(300);
                var thisindex = $(this).attr('data-navindex');
                $('.btn-tabs-ext1>div').eq(thisindex).children().addClass('layui-this').parent().siblings().children().removeClass('layui-this');
            });
        },
        navExt2: function () {
            var _this = this;
            var navCEl = navCEl1 = $(_this).selector.substr(1);
            swiperList1 = new Swiper('.' + navCEl1 + '', {
                slidesPerView: 'auto',
                spaceBetween: 0,
            });
            $(_this).on('click', '.btn-tabs-ext4-item', function(){
                $(this).addClass('layui-this').parent().siblings().children().removeClass('layui-this');
            });
        },
    });

    $(function () {
        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();

        // nav
        $('.j-nav').navExt1(4);//函数参数为默认展示个数

        // 菜单下拉
        $('.j-nav-arrow').navArrowD();

        // 关闭弹窗
        $('.j-close-layer').closeL();

        // 二级菜单
        $('.j-nav-ext1').navExt2();

    });
</script>

</html>