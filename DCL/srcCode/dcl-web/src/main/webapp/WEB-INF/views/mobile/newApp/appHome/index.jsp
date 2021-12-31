<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 不缓存 -->
    <META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="0">

    <title>首页</title>
    <!-- 网格选择插件 -->
<%--    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css" />--%>

<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index1.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/search.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />--%>
<%--    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css" />--%>

    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index1.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />
    <style>
        .noDataTop{
            margin-top: 0px;
        }

        .index-qh-btn{
            width: 40px;
            height: 20px;
            background-image: linear-gradient(0deg, #ffab18 0%, #ffdb40 100%);
            border-radius: 10px;
        }
        .index-qh-btn>p{
            font-size: 12px;
            text-align: center;
            line-height: 20px;
            letter-spacing: 1px;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 pt15 index-top">
            <div class="layui-col-xs12 h-28 pl15 pr15 bs mb10">
                <div class="layui-col-xs8">
                    <button class="layui-btn layui-btn-ext1 flex flex-ac ovh bor1 but-p max-w" style="border: 1px solid rgba(250,250,245,0.5)!important;" id="orgDiv">
                        <i class="index-jiedao-dw mr5"></i>
                        <span class="index-jiedao-dw-text font-size-14 cor-fff text-line-c1" id="orgDivText"></span>
                        <i class="index-jiedao-dw2 ml5"></i>
                    </button>
                </div>
                <div class="layui-col-xs4">
                    <%--                    <button class="layui-btn layui-btn-ext1 fr bor1 but-p">--%>
                    <%--                        <em><img class="img-12-9" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-gzh-xh.png" alt=""></em>--%>
                    <%--                        <em class="cor-fff font-size-15 em-span">公众端</em>--%>
                    <%--                    </button>--%>
                    <div class="flex flex-ac flex-je ml10">
                        <!-- 天气 -->
                        <!-- 多云：icon-wea-dy；晴天：icon-wea-qt；雨天：icon-wea-yt; -->
                        <i class="index-icon03 mr5" id="wea-icon"></i>
                        <%--                        <span class="font-size-13 cor-fff" id="tq">多云<em class="ml10" id="wd">30℃</em></span>--%>
                        <span class="font-size-13 cor-fff" id="tqText"></span>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs12 pl15 pr15 bs">
                <!-- 轮播 -->
                <ul class="index-lunbo-box posi-rela  box-radius10 ">
                    <div class="swiper-container swiper01 banner-ext1 w100 h-160 h-o">
                        <div class="swiper-wrapper" id="swipe-pic">
                            <%--                            <div class="swiper-slide">--%>
                            <%--                                <li class="bs w100 img100">--%>
                            <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/bj01.png" alt="">--%>
                            <%--                                </li>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="swiper-slide">--%>
                            <%--                                <li class="bs w100 img100">--%>
                            <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj02.jpg" alt="">--%>
                            <%--                                </li>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="swiper-slide">--%>
                            <%--                                <li class="bs w100 img100">--%>
                            <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj03.jpg" alt="">--%>
                            <%--                                </li>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="swiper-slide">--%>
                            <%--                                <li class="bs w100 img100">--%>
                            <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj04.jpg" alt="">--%>
                            <%--                                </li>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="swiper-slide">--%>
                            <%--                                <li class="bs w100 img100">--%>
                            <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj05.jpg" alt="">--%>
                            <%--                                </li>--%>
                            <%--                            </div>--%>
                        </div>
                    </div>
                    <div class="fyq-lunbo swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->

                </ul>
            </div>

        </div>
        <!-- 内容 -->
        <div class="layui-col-xs12 pt15 pl15 pr15 pb5">
            <!-- 按钮 -->
            <div class=" layui-col-xs12  flex flex-ac flex-jr " id="menu-btn-01">
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('ssp')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/xczl-ssp.png" alt="">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">随手拍</p>--%>
                <%--                </a>--%>
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('xcvr')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/whly-xcvr.png" alt="">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">乡村VR</p>--%>
                <%--                </a>--%>
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('cwgk')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/xczl-cwgk.png" alt="">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村务公开</p>--%>
                <%--                </a>--%>
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('nybk')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/snfw-nybk.png" alt="">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">农业百科</p>--%>
                <%--                </a>--%>
            </div>
            <div class=" layui-col-xs12 mt20 flex flex-ac flex-jr" id="menu-btn-02">
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('xcjj')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/whly-xcjj.png">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">乡村简介</p>--%>
                <%--                </a>--%>
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('ycyp')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/whly-ycyp.png">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">一村一品</p>--%>
                <%--                </a>--%>
                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('bszn')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/snfw-bszn.png" alt="">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">办事指南</p>--%>
                <%--                </a>--%>

                <%--                <a href="Javascript:;">--%>
                <%--                    <div class="index-ann-box-icon img100">--%>
                <%--                        <img onclick="jumpPage('all')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/quanbu.png" alt="">--%>
                <%--                    </div>--%>
                <%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">全部</p>--%>
                <%--                </a>--%>
            </div>

            <!-- 公告 -->
            <div class="index-gonggao layui-col-xs12  mt15 bs flex flex-ac flex-jb ggClass" >
                <div class="mar-auto" onclick="openGg('1')">
                    <p class="text-align-c">
                        <i class="index-gonggao-logo img100">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-cunwugg.png" alt="">
                        </i>
                    </p>
                    <p class="font-size-12 cor-999 text-align-c">
                        查看更多
                    </p>
                </div>
                <div class="index-gonggao-text  bor1-left flex flex-jc  flex-clm" id="notices">
                    <%--                    <p class="flex flex-ac flex-js mb5">--%>
                    <%--                            <span class="fl font-size-12 mr5"><i class="indexs-icon01 img100">--%>
                    <%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon01.png" alt="">--%>
                    <%--                            </i></span>--%>
                    <%--                        <span class="text-line-c1 fl">某村村委会举办第10届优秀表某村村委会举办第10届优秀表...</span>--%>
                    <%--                        <span class="fl ml5 mt5">--%>
                    <%--                                <i class="index-gonggao-icon02 img100 mr10">--%>
                    <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon02.png" alt="">--%>
                    <%--                                </i>--%>
                    <%--                            </span>--%>
                    <%--                    </p>--%>
                    <%--                    <p class="flex flex-ac flex-js mb5">--%>
                    <%--                            <span class="fl font-size-12 mr5"><i class="indexs-icon01 img100">--%>
                    <%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon01.png" alt="">--%>
                    <%--                            </i></span>--%>
                    <%--                        <span class="text-line-c1 fl">某村村委会举办第10届优秀表某村村委会举办第10届优秀表...</span>--%>
                    <%--                        <span class="fl ml5 mt5">--%>
                    <%--                                <i class="index-gonggao-icon img100 mr10">--%>
                    <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-new.png" alt="">--%>
                    <%--                                </i>--%>
                    <%--                            </span>--%>
                    <%--                        <span class="fl ml5 mt5">--%>
                    <%--                                <i class="index-gonggao-icon02 img100 mr10">--%>
                    <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon02.png" alt="">--%>
                    <%--                                </i>--%>
                    <%--                            </span>--%>
                    <%--                    </p>--%>
                    <%--                    <p class="flex flex-ac flex-js mb5">--%>
                    <%--                            <span class="fl font-size-12 mr5"><i class="indexs-icon01 img100">--%>
                    <%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon01.png" alt="">--%>
                    <%--                            </i></span>--%>
                    <%--                        <span class="text-line-c1 fl">某村村委会举办第10届优秀表某村村委会举办第10届优秀表...</span>--%>
                    <%--                        <span class="fl ml5 mt5">--%>
                    <%--                                <i class="index-gonggao-icon02 img100 mr10">--%>
                    <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon02.png" alt="">--%>
                    <%--                                </i>--%>
                    <%--                            </span>--%>
                    <%--                    </p>--%>
                </div>

            </div>

            <!-- 返乡人员登记 -->
            <div class="index-vr-box img100 layui-col-xs12 mt15 vr-class " id="show-img">
                <%--                <img onclick="jumpPage('fxdj')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon15.png" alt="">--%>
            </div>
            <!-- 豆腐块 -->
<%--            <div class="layui-col-xs12 mt20" id="bean-old">--%>
<%--                <!-- 党建引领 -->--%>
<%--                <div class="layui-col-xs4  pr5 mb10">--%>
<%--                    <a href="Javascript:;" onclick="toNewHtml('djyl')" class="display-inline width-p100 index-hei110 index-dfk-bj01 pl10 pr10 bs">--%>
<%--                        <p class="font-size-16 color-red01 font-bold text-line-c1 pt15">智慧党建</p>--%>
<%--                        <p class="font-size-12 color-red02 text-line-c1 pt5">推动乡村振新</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <!-- 文化旅游 -->--%>
<%--                &lt;%&ndash;                <div class="layui-col-xs8  pl5 mb10">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    <a href="Javascript:;" onclick="toNewHtml('whly')" class="display-inline width-p100 index-hei110 index-dfk-bj02 pl10 pr10 bs">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <p class="font-size-16 color-lv01 font-bold text-line-c1 pt15">文化旅游</p>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <p class="font-size-12 color-lv02 text-line-c1 pt5">展现美丽乡村 </p>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--                <div class="layui-col-xs8  pl5 mb10">--%>
<%--                    <a href="Javascript:;" onclick="toNewHtml('whly')" class="display-inline width-p100 index-hei110 index-dfk-bj02 pl10 pr10 bs">--%>
<%--                        <p class="font-size-16 color-lv01 font-bold text-line-c1 pt15">乡村特色</p>--%>
<%--                        <p class="font-size-12 color-lv02 text-line-c1 pt5">展现美丽乡村 </p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <!-- 乡村治理 -->--%>
<%--                <div class="layui-col-xs6  pr5 mb10">--%>
<%--                    <a href="Javascript:;" onclick="toNewHtml('xczl')" class="display-inline width-p100 index-hei110 index-dfk-bj03 pl10 pr10 bs">--%>
<%--                        <p class="font-size-16 color-blue02 font-bold text-line-c1 pt15">村务政务</p>--%>
<%--                        <p class="font-size-12 color-blue03 text-line-c1 pt5">共建和谐乡村</p>--%>
<%--                    </a>--%>
<%--                </div>--%>

<%--                <!-- 三农服务 -->--%>
<%--                <div class="layui-col-xs6 pl5  mb10">--%>
<%--                    <a href="Javascript:;" onclick="toNewHtml('snfw')" class="display-inline width-p100 index-hei110 index-dfk-bj05 pl10 pr10 bs">--%>
<%--                        <p class="font-size-16 color-zi01 font-bold text-line-c1 pt15">三农服务</p>--%>
<%--                        <p class="font-size-12 color-zi02 text-line-c1 pt5">普及农业知识</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>

            <!-- 豆腐块 副标题：subtitleName type:6 showBean()-->
            <div class="layui-col-xs12 mt20 hide" id="bean-four">
                <!-- 党建引领 -->
                <div class="layui-col-xs4  pr5 mb10" id="zhdj">
                </div>
                <div class="layui-col-xs8  pl5 mb10" id="xcts">
                </div>
                <!-- 乡村治理 -->
                <div class="layui-col-xs6  pr5 mb10" id="cwzw">
                </div>
                <!-- 三农服务 -->
                <div class="layui-col-xs6 pl5  mb10" id="snfw">
                </div>
                <div class="layui-col-xs4 pl3 pr3 mb10 hide" id="five">
                </div>
            </div>

        </div>
    </div>

</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>

<script src="${uiDomain}/js/layer/layer.js"></script>
<script src="${uiDomain}/app-assets/extend/wap-group-select/js/ffcs.select.group.js"></script>
<script src="${uiDomain}/web-assets/extend/person-select/v1.0.0/js/custom_msgClient.js "></script>
<script>
    var mySwiper = new Swiper('.swiper01', {
        slidesPerView: 1,
        spaceBetween: 10,
        centeredSlides: true,
        grabCursor: true,
        autoplay: {
            delay: 3000,
            stopOnLastSlide: false,
            disableOnInteraction: false,
        },

        loop: true,//是否可循环
        observer: true,
        observeParents: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    })
    var mySwiper02 = new Swiper('.swiper02', {
        direction : 'vertical',
        slidesPerView: 1,
        spaceBetween: 5,
        autoplay: {
            delay: 3000,
            stopOnLastSlide: false,
            disableOnInteraction: false,
        },
        //freeMode: true,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
        loop: true,//是否可循环
        observer: true,
        observeParents: true,
    })

    //小翼管家url
    <%--var urlJson = {--%>
    <%--    &lt;%&ndash;'ccjd':'<%=path%>/public/wap/article/mobileIndex.jhtml',&ndash;%&gt;--%>
    <%--    &lt;%&ndash;'ycyp':'<%=path%>/public/wap/villageProductApp/index.jhtml',&ndash;%&gt;--%>
    <%--    'ccts':'http://dcl.zhxc.fzyzxxjs.cn/dcl/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_dcl/public/wap/article/mobileIndex.jhtml',--%>
    <%--    'cwzw': '<%=path%>/public/wap/villageAdministrationApp/index.jhtml',--%>
    <%--    'kjhn': '<%=path%>/public/wap/techBenefitsFarmersApp/index.jhtml',--%>
    <%--    'djyl': 'http://dcl.zhxc.fzyzxxjs.cn/dcl/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_dj/wap/news/index.jhtml',--%>
    <%--    'xczl': '<%=path%>/public/wap/ruralGovernanceControllerApp/index.jhtml',--%>
    <%--    --%>

    <%--}--%>
    var urlJson = {
        <%--'ccjd':'<%=path%>/public/wap/article/mobileIndex.jhtml',--%>
        <%--'ycyp':'<%=path%>/public/wap/villageProductApp/index.jhtml',--%>
        'whly': '<%=path%>/public/wap/culturalTourismControllerApp/index.jhtml',
        'xczl': '<%=path%>/public/wap/ruralGovernanceNewApp/index.jhtml',
        'snfw': '<%=path%>/public/wap/threeAffairPublicApp/index.jhtml',
        'djyl': '<%=path%>/public/wap/PartyLeadingController/index.jhtml'


    }
    // 省公司 （微信公众号） //后洋村公众号个性化地址
    var urlJson2_spt = {
        <%--'ccjd':'<%=path%>/public/wap/article/mobileIndex.jhtml',--%>
        <%--'ycyp':'<%=path%>/public/wap/villageProductApp/index.jhtml',--%>
        'ccts':'http://qchyc.dcl.zhxc.fzyzxxjs.cn/dcl/public/wap/xczxAppHome/index.jhtml',
        'cwzw': 'http://qchyc.dcl.zhxc.fzyzxxjs.cn/dcl/public/wap/villageAdministrationApp/index.jhtml',
        'kjhn': 'http://qchyc.dcl.zhxc.fzyzxxjs.cn/dcl/public/wap/techBenefitsFarmersApp/index.jhtml',
        <%--'djyl': '<%=path%>/public/wap/szshAppHome/djylIndex.jhtml',   // 主题配置。--%>
        'whly': '<%=path%>/public/wap/culturalTourismControllerApp/index.jhtml',
        'xczl': '<%=path%>/public/wap/ruralGovernanceNewApp/index.jhtml',
        'snfw': '<%=path%>/public/wap/agriculturalServices/index.jhtml',
        'djyl': '<%=path%>/public/wap/PartyLeadingController/index.jhtml',
        'all': '<%=path%>/public/wap/appHome/all.jhtml',
    }

    var orgCode;

    var defaultOrgCode;
    var orgName;
    var orgText;
    $(function () {
        orgCode = "${orgCode}"
        defaultOrgCode = "${orgCode}";
        orgText = "${orgEntityPath}";
        localStorage.setItem("orgText", orgText);
        if (orgCode == 35 || Number(orgCode) == 35){
            orgName = '福州市';
        } else {
            orgName = "${orgName}";
        }
        init();
    })

    function init(){
        // 初始化轮播图
        initSwiperPic();
        // 按钮渲染
        getButtonDiv();
        // 公告
        initGgDiv();
        // 公告下图片
        getPicDiv();

        // 城市切换
        initComponent();
        // 天气
        initWeatherAndVillagers();
        var storageOrgText = localStorage.getItem("orgText");
        if (storageOrgText == null || storageOrgText == '' || storageOrgText == undefined || storageOrgText == 'null'){
            $('#orgDivText').text(orgText);
        } else {
            $('#orgDivText').text(storageOrgText);
        }
        // 豆腐块渲染
        showBean();

    }

    var wapSelect1 ;
    function initComponent(){

        cancelBindEvent();

        var initJSONArr = [];  //初始化数据
        var opt = {
            layer:{
                area: ['100%', '100%'], //宽高
            },
            postParam:{
                orgCode :  orgCode
            },
            url:'/common/wapSelectOrg/index.jhtml?t=',
            context:'${$COMPONENTS_DOMAIN}'
        }
        wapSelect1 = $('#orgDiv').initSelect(function (data) {
            orgCode = data.orgCode;
            orgText = data.orgEntityPath;
            localStorage.setItem("orgText", orgText);
            $('#orgDivText').text(data.orgEntityPath)
            init();
            // isShow()
            //  更新用户的orgCode 和 orgEntityPath   同时将更新后的信息同步到session中
            $.ajax({
                type: "POST",
                url: "<%=path%>/oauth/rebind.json",
                data: {
                    orgCode: data.orgCode,
                    orgName: data.orgEntityPath,
                },
                dataType: 'json',
                success: function (data) {

                    if (data.result == 'success') {
                        // layer.msg('切换成功');
                        // setTimeout('window.location.reload()', 2000);
                        layer.msg("切换成功",{
                            time: 1000,
                        }, function () {
                            window.location.reload();
                        })
                    }
                },
            });


        },opt)
    }

    //取消绑定的选择事件
    function cancelBindEvent(){
        if(wapSelect1 != null){
            wapSelect1.wapSelectEvent('cancelEvent');
        }
    }

    //初始化轮播图片下方天气村民情况
    function initWeatherAndVillagers(){
        if(orgName == '鼓楼区' && Number(orgCode.substr(0,2)) == 35){
            orgName = '福州市';
        }
        $.ajax({
            type: 'GET',
            url: 'http://wthrcdn.etouch.cn/weather_mini',
            data: {
                city:orgName
            },
            dataType: 'json',
            success: function (data) {
                <!-- 多云：icon-wea-dy；晴天：icon-wea-qt；雨天：icon-wea-yt; -->
                $('#tq').empty();
                $('#wd').empty();
                if (data.data != null && data.data.forecast != null && data.data.forecast != undefined && data.data.forecast.length > 0 && data.data.wendu != null){
                    var tq = data.data.forecast[0].type;
                    var wd = data.data.wendu != undefined ? data.data.wendu : "";
                    $('#tqText').html(tq + '<em class="ml10" >' + wd + '℃</em>');
                    if (tq.indexOf('云') != -1 || tq.indexOf('阴') != -1){
                        $('#wea-icon').addClass('icon-wea-dy');
                    } else if (tq.indexOf('晴') != -1){
                        $('#wea-icon').addClass('icon-wea-qt');
                    } else if (tq.indexOf('雨') != -1 || tq.indexOf('雷') != -1){
                        $('#wea-icon').addClass('icon-wea-yt');
                    } else {
                        // $('#wea-icon').addClass('icon-wea-yt');
                    }
                }
            },
            error: function (data) {

            },
            complete: function () {
                // modleclose(); //关闭遮罩层
            }
        });
    }

    function isShow(){
        <%--var flag=isWeChat()--%>


        <%--if (flag=='spt'&&"${orgCode}"=="350925103212"){--%>
        <%--    $('#orgDiv').addClass('hide')--%>
        <%--}--%>
    }

    // 初始化轮播图
    function initSwiperPic(){
        var platform = isWeChat();
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType:'index',
                orgCode:orgCode,
                type:'3',
                platform:platform
            },
            success: function(data) {
                if (data==null){
                    var html = '';
                    var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                    html += ' <div class="swiper-slide">\n' +
                        '                            <li class="bs w100 img100" style="-webkit-border-radius:15px;">\n' +
                        '                                <img src="' + value + '" alt="">\n' +
                        '                            </li>\n' +
                        '                        </div>\n';
                    $('#swipe-pic').append(html);
                }

                //存放图片的list
                var attList =[];


                var dvModulars= data.dvModulars
                if (dvModulars!=null){
                    for(var j=0;j<dvModulars.length;j++){
                        var  modularContents =dvModulars[j].modularContents
                        if(modularContents!=null){
                            for(var z=0;z<modularContents.length;z++){
                                attList =attList.concat(modularContents[z].attList)
                            }
                        }
                    }
                }

                $('#swipe-pic').empty();
                if (attList != null && attList.length > 0){
                    var html = '';
                    for (let i = 0; i < attList.length; i++) {
                        var value =   '${imgDomain}' + attList[i].filePath;

                        html += `<div class="swiper-slide">
                                <li class="bs w100 img100">
                                    <img src="`+value+`" alt="">
                                </li>
                            </div>`;
                    }
                    $('#swipe-pic').append(html);
                }else {
                    var html = '';
                    var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                    html += ' <div class="swiper-slide">\n' +
                        '                            <li class="bs w100 img100">\n' +
                        '                                <img src="' + value + '" alt="">\n' +
                        '                            </li>\n' +
                        '                        </div>\n';
                    $('#swipe-pic').append(html);
                }


                //重新加载样式
                var mySwiper = new Swiper('.swiper01', {
                    slidesPerView: 1,
                    spaceBetween: 10,
                    centeredSlides: true,
                    grabCursor: true,
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: false,
                        disableOnInteraction: false,
                    },

                    //   freeMode: true,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
                    loop: true,//是否可循环
                    observer: true,
                    observeParents: true,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true,
                    },
                })
            },
            error: function(data) {
                var html = '';
                var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                html += ' <div class="swiper-slide">\n' +
                    '                            <li class="bs w100 img100">\n' +
                    '                                <img src="' + value + '" alt="">\n' +
                    '                            </li>\n' +
                    '                        </div>\n';
                $('#swipe-pic').append(html);
            },
            complete : function() {
            }
        });
    }

    // 按钮渲染
    function  getButtonDiv(){
        var  platform =isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType:'index',
                orgCode:orgCode,
                type:'7',  //导航栏
                platform:platform,
            },
            success: function(data) {
                var html =''
                $('#menu-btn-01').html("");
                $('#menu-btn-02').html('');
                var showFlag= false
                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){

                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents

                            let menuNum = modularContents.length;
                            // 计算是否两行
                            if (menuNum <= 4){
                                // 1 行展示
                                showFlag = true;
                                $('#menu-btn-01').html(buildMenu(modularContents,0, menuNum-1, true ));
                            } else {
                                // 两行展示
                                let middleCount;
                                if ((menuNum+1)%2 == 0){
                                    // 偶数
                                    middleCount = ((menuNum+1)/2)-1;
                                } else {
                                    // 奇数 第一行显示多一个
                                    middleCount = (menuNum/2);
                                }
                                $('#menu-btn-01').html(buildMenu(modularContents,0, middleCount, false ));
                                $('#menu-btn-02').html(buildMenu(modularContents,middleCount+1, menuNum-1, true ));
                                showFlag = true;
                            }
                        }
                    }
                }
                if (!showFlag){
                    $('#menu-btn-01').addClass('noDataTop')
                    $('#menu-btn-02').addClass('noDataTop')
                }else {
                    $('#menu-btn-01').removeClass('noDataTop')
                    $('#menu-btn-02').removeClass('noDataTop')
                }

            },
            error: function(data) {

            },
            complete : function() {
            }
        });
    }

    function buildMenu(modularContents, start, end,need_all){
        let html = '';
        for(var z=start;z<=end;z++){
            var picUrl=modularContents[z].attList!=null? '${imgDomain}'+ modularContents[z].attList[0].filePath:'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png'
            var url= modularContents[z].url

            url =    getCountUrl(url);


            html+= `<a href="Javascript:;">
                                        <div class="index-ann-box-icon img100">
                                            <img onclick="jump('`+ url +`')" src="`+picUrl+`" alt="">
                                        </div>
                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1" style='min-width:48px!important;'>`+modularContents[z].name+`</p>
                                        </a>`;
        }
        if (need_all){
            // 补上全部
            html += `     <a href="Javascript:;">
                                                <div class="index-ann-box-icon img100">
                                                    <img onclick="toNewHtml('all')" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/quanbu.png" alt="">
                                                </div>
                                                <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5" style='min-width:48px!important;'>全部</p>
                                            </a>`;
        }
        return html;
    }


    // 传入 地域  url ,判断是否修改域名
    function getCountUrl(str){

        var	nowDomain =	'${mainTit}';

        if(str == null || ""==str|| str.indexOf("cn")==-1 ){
            return str;
        }

        //截取域名部门
        var  domain =	str.substring(7,str.indexOf("cn"));

        var count = 0;
        var index = 0;
        while((index=domain.indexOf(".",index))!=-1){
            index = index+".".length;
            count++;
        }
        //有公众号域名头
        if(count==3){
            //无公众号域名头
        }else if(count==2){
            //只改gbp
            //       if(domain.indexOf("gbp")!=-1){
            //尝试从当前地域中获取 域名
            if(nowDomain!=null&&nowDomain!=''){
                return  "http://" + nowDomain +"."+ str.substring(7);
            }
            //     }

        }

        return str;
    }


    // 公告
    function initGgDiv(){
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getPzListData.jhtml',
            data: {
                page:1,
                rows:3,
                catalogId:'10000020',
                orgCode:orgCode,
                // isEndPubDate:'no',
                // isPic:'yes',
                // isPubOrg:'yes',
                // isTop:'yes',
                // tKey:'bannerManage',
            },
            success: function(data) {
                $('#notices').empty();
                if (data != null && data.total > 0){
                    ggJson = {};
                    var html = '';
                    for (let i = 0; i < data.rows.length; i++) {
                        var value = data.rows[i].title;
                        var infoOpenId = data.rows[i].infoOpenId;
                        ggJson[i] = value;
                        html += `<p class="flex flex-ac flex-js mb5" onclick="noticeDetail('`+infoOpenId+`')">
                                    <span class="fl font-size-12 mr5"><i class="indexs-icon01 img100">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon01.png" alt="">
                                    </i></span>
                                <span class="text-line-c1 fl">`+value+`</span>
                                <span class="fl ml5 mt5">
                                        <i class="index-gonggao-icon02 img100 mr10">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/index-icon02.png" alt="">
                                        </i>
                                    </span>
                                </p>`;
                    }
                    $('#notices').append(html);
                    $('.ggClass').removeClass('hide')
                }else{
                    $('.ggClass').addClass('hide')
                }
            },
            error: function(data) {
                $('.ggClass').addClass('hide')
            },
            complete : function() {
            }
        });
    }

    // 公告下图片
    function  getPicDiv(){
        var  platform =isWeChat()

        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType:'index',
                orgCode:orgCode,
                type:'1',  //普通图文
                platform:platform
            },
            success: function(data) {
                var html =''
                $('#PicDiv').html("");

                var showflag= false
                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){
                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents
                            if (modularContents.length>0&&modularContents[0].attList.length>0){
                                var picUrl= '${imgDomain}'+ modularContents[0].attList[0].filePath
                                var url= modularContents[0].url
                                // $('#PicDiv').html('<img src="'+picUrl+'"  onclick="jump(\'' + url + '\')" alt="">');
                                $('#show-img').html(
                                    `<img onclick="jump('`+url+`')" src="`+picUrl+`" alt="">`
                                )
                                showflag =true
                            }


                        }
                    }
                }

                if (showflag){
                    $('.vr-class').removeClass('hide')
                }else {
                    $('.vr-class').addClass('hide')
                }

            },
            error: function(data) {
                $('.vr-class').addClass('hide')
            },
            complete : function() {
            }
        });
    }

    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type){
            return 'spt'
        }else {
            return 'xygj'
        }
    }

    function jump(url){
        console.log(url)
        if (url=='null'){
            layer.msg('暂未开放 敬请期待', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }



        if (url.indexOf("?")==-1){   //链接没有带参数
            location.href = url+'?token=${token}'
        }else {
            location.href = url+'&token=${token}'

        }
    }

    // 豆腐块展示
    function showBean() {
        // $('#bean-old').addClass("hide");
        var platform = isWeChat();
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType:'index',
                orgCode:orgCode,
                type:'6',  //豆腐块
                platform:platform,
            },
            success: function(data) {
                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){
                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents
                            for(var z=0;z<modularContents.length;z++){
                                var url= modularContents[z].url

                                url = getCountUrl(url);

                                var subtitleName = modularContents[z].subtitleName;
                                var name = modularContents[z].name;
                                // if(name == '智慧党建'){
                                if (z == 0){
                                    $('#zhdj').html(
                                        `<a href="Javascript:;" onclick="jump('`+url+`')" class="display-inline width-p100 index-hei110 index-dfk-bj01 pl10 pr10 bs">
                                            <p class="font-size-16 color-red01 font-bold text-line-c1 pt15">`+name+`</p>
                                            <p class="font-size-12 color-red02 text-line-c1 pt5">`+subtitleName+`</p>
                                        </a>`
                                    );
                                // } else if (name == '乡村特色'){
                                } else if (z == 1){
                                    $('#xcts').html(
                                        `<a href="Javascript:;" onclick="jump('`+url+`')" class="display-inline width-p100 index-hei110 index-dfk-bj02 pl10 pr10 bs">
                                            <p class="font-size-16 color-lv01 font-bold text-line-c1 pt15">`+name+`</p>
                                            <p class="font-size-12 color-lv02 text-line-c1 pt5">`+subtitleName+` </p>
                                        </a>`
                                    )

                                // } else if (name == '村务政务'){
                                } else if (z == 2){
                                    $('#cwzw').html(
                                        `<a href="Javascript:;" onclick="jump('`+url+`')" class="display-inline width-p100 index-hei110 index-dfk-bj03 pl10 pr10 bs">
                                            <p class="font-size-16 color-blue02 font-bold text-line-c1 pt15">`+name+`</p>
                                            <p class="font-size-12 color-blue03 text-line-c1 pt5">`+subtitleName+`</p>
                                        </a>`
                                    )

                                // } else if (name == '三农服务'){
                                } else if (z == 3){
                                    $('#snfw').html(
                                        `<a href="Javascript:;" onclick="jump('`+url+`')" class="display-inline width-p100 index-hei110 index-dfk-bj05 pl10 pr10 bs">
                                            <p class="font-size-16 color-zi01 font-bold text-line-c1 pt15">`+name+`</p>
                                            <p class="font-size-12 color-zi02 text-line-c1 pt5">`+subtitleName+`</p>
                                        </a>`
                                    )
                                } else {
                                    $('#five').html(
                                        `<a href="Javascript:;" onclick="jump('`+url+`')" class="display-inline width-p100 index-hei110 index-dfk-bj06 pl10 pr10 bs">
                                            <p class="font-size-16 color-huang01 font-bold text-line-c1 pt15">`+name+`</p>
                                            <p class="font-size-12 color-huang02 text-line-c1 pt5">`+subtitleName+`</p>
                                        </a>`
                                    )
                                }

                            }
                            if (modularContents.length != 4){
                                $('#cwzw').removeClass('layui-col-xs6');
                                $('#snfw').removeClass('layui-col-xs6');
                                $('#five').removeClass('hide');
                                $('#cwzw').addClass('layui-col-xs4');
                                $('#snfw').addClass('layui-col-xs4');

                                $('#zhdj').removeClass("pr5");
                                $('#zhdj').addClass("pr3");

                                $('#xcts').removeClass('pl5');
                                $('#xcts').addClass('pl3');

                                $('#cwzw').removeClass('pr5');
                                $('#cwzw').addClass('pr3');

                                // pl3 pr3
                                $('#snfw').removeClass('pl5');
                                $('#snfw').addClass('pr3');
                                $('#snfw').addClass('pl3');


                            }
                            $('#bean-four').removeClass('hide');
                        }
                    }
                }
            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }

    // 公告
    function openGg(e){
        var flag =isWeChat();
        var url =null
        if (flag=="spt"){
            url ="${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true";
        }else{
            url ="<%=path%>/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_gbp/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true";

        }
        location.href = url;
    }
    // 公告详情
    function noticeDetail(infoOpenId){
        var flag =isWeChat();
        var url =null
        if (flag=="spt"){
            url = "${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId="+infoOpenId+"&tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true&token=${token}&H5=";
            // url ="https://gbp.zgdxxczx.cn/gbp/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true";
        }else{
            url = "${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId="+infoOpenId+"&tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true&token=${token}&H5=";
            // url ="https://dcl.zgdxxczx.cn/dcl/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_gbp/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true";

        }
        location.href = url;
    }

    // 页面跳转
    function toNewHtml(type){
        var url =''
        var flag =isWeChat();
        if ('spt'==flag){
            url =urlJson2_spt[type]
        }else {
            url = urlJson[type];
        }
        location.href = url;
    }

</script>
</body>
</html>