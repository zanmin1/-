<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数字乡村</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css?v=1" />
<%--    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />--%>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

    <meta content="yes" name="apple-mobile-web-app-capable">

    <meta content="black" name="apple-mobile-web-app-status-bar-style">

    <meta content="telephone=no" name="format-detection">
</head>
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
<body>
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 pt15 pl15 pr15 bs index-top">
            <div class="pl5 pr5 bs">
            <!-- 轮播 -->
            <ul class="index-lunbo-box posi-rela">
                <div class="swiper-container swiper01 w100">
                    <div class="swiper-wrapper" id="topPicDiv">
<%--                        <div class="swiper-slide">--%>
<%--                            <li class="bs w100 img100">--%>
<%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/bj01.jpg" alt="">--%>
<%--                            </li>--%>
<%--                        </div>--%>
<%--                        <div class="swiper-slide">--%>
<%--                            <li class="bs w100 img100">--%>
<%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/bj02.jpg" alt="">--%>
<%--                            </li>--%>
<%--                        </div>--%>
<%--                        <div class="swiper-slide">--%>
<%--                            <li class="bs w100 img100">--%>
<%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/bj03.jpg" alt="">--%>
<%--                            </li>--%>
<%--                        </div>--%>
<%--                        <div class="swiper-slide">--%>
<%--                            <li class="bs w100 img100">--%>
<%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/bj04.jpg" alt="">--%>
<%--                            </li>--%>
<%--                        </div>--%>
<%--                        <div class="swiper-slide">--%>
<%--                            <li class="bs w100 img100">--%>
<%--                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/bj05.jpg" alt="">--%>
<%--                            </li>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="fyq-lunbo swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->

            </ul>
            </div>
        </div>
        <!-- 内容 -->
        <div class="layui-col-xs12 pt15 pl15 pr15 pb5">
<%--            <div class="index-jiedao layui-col-xs12 pl10 pr10 bs">--%>
<%--                <!-- 放大镜 -->--%>
<%--                <div class="index-jiedao-fdj-box">--%>
<%--                    <i></i>--%>
<%--                </div>--%>
<%--                <div id="orgDiv" class=" layui-col-xs12 flex flex-ac pt10">--%>
<%--                    <i class="index-jiedao-dw mr5"></i>--%>
<%--                    <span id="orgDivText" class="index-jiedao-dw-text font-size-14 color-blue01 text-line-c1">${orgEntityPath}</span>--%>
<%--                    <i class="index-jiedao-jt ml5"></i>--%>
<%--                </div>--%>
<%--                <!--  -->--%>
<%--                <div class=" layui-col-xs12 mt20">--%>

<%--                    <div class="layui-col-xs4  flex flex-ac">--%>
<%--                        <i class="index-icon03 mr5"></i>--%>
<%--                        <span class="font-size-13 color-blue01  index-icon-span  text-line-c1" id="tqText">--%>
<%--                        </span>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="index-jiedao layui-col-xs12 flex flex-ac bs ovh">
                <div  class="flex1 flex flex-ac ovh">
                    <i class="index-jiedao-dw mr5"></i>
                    <span  id="orgDivText" class="index-jiedao-dw-text font-size-14 color-blue01 text-line-c1">${orgEntityPath}</span>
                    <i class="index-qh-btn ml5"id="orgDiv">
                        <p>切换</p>
                    </i>
                </div>
                <!-- 天气 -->
                <div class="flex flex-ac ml10">
                    <i class="index-icon03 index-icon03-dy mr5"></i>
                    <span class="font-size-12 color-blue01  index-icon-span  text-line-c1" id="tqText"> </span>
                </div>
            </div>




            <!-- 公告 -->
            <div class="index-gonggao layui-col-xs12 pl10 pr10 mt15  bs flex flex-ac flex-jb ggClass" >
                <i class="index-gonggao-logo img100 mr10">
                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon08.png" alt="">
                </i>
                <span class="index-gonggao-new mr5">
                        最新
                    </span>
                <div class="index-gonggao-text  mr5">
                    <div class="swiper-container swiper02 w100">
                        <div class="swiper-wrapper" id="ggDiv">
<%--                            <div onclick="test(1)" class="swiper-slide flex flex-ac"><span class="text-line-c1">1某村村委会举办第10届优秀表某村村委会举办第10届优秀表...</span></div>--%>
<%--                            <div onclick="test(2)" class="swiper-slide flex flex-ac"><span class="text-line-c1">2某村村委会举办第10届优秀表某村村委会举办第10届优秀表...</span></div>--%>
<%--                            <div onclick="test(3)" class="swiper-slide flex flex-ac"><span class="text-line-c1">3某村村委会举办第10届优秀表某村村委会举办第10届优秀表...</span></div>--%>
                        </div>
                    </div>
                </div>
<%--                <i class="index-gonggao-icon img100 mr10">--%>
<%--                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon09.png" alt="">--%>
<%--                </i>--%>
            </div>
            <!-- 按钮 -->
            <div class="index-ann-box layui-col-xs12 mt20" id="buttonDiv">
<%--                <a href="Javascript:;">--%>
<%--                    <div class="index-ann-box-icon img100" onclick="toNewHtml('ccjd')">--%>
<%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon10.png" alt="">--%>
<%--                    </div>--%>
<%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">乡村景点</p>--%>
<%--                </a>--%>
<%--                <a href="Javascript:;">--%>
<%--                    <div class="index-ann-box-icon img100" onclick="toNewHtml('ycyp')">--%>
<%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon11.png" alt="">--%>
<%--                    </div>--%>
<%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">一村一品</p>--%>
<%--                </a>--%>
<%--                <a href="Javascript:;">--%>
<%--                    <div class="index-ann-box-icon img100">--%>
<%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon12.png" alt="">--%>
<%--                    </div>--%>
<%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">三务公开</p>--%>
<%--                </a>--%>
<%--                <a href="Javascript:;">--%>
<%--                    <div class="index-ann-box-icon img100">--%>
<%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon13.png" alt="">--%>
<%--                    </div>--%>
<%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">脱贫动态</p>--%>
<%--                </a>--%>
<%--                <a href="Javascript:;">--%>
<%--                    <div class="index-ann-box-icon img100">--%>
<%--                        <img onclick="toAllMenu()" src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon14.png" alt="">--%>
<%--                    </div>--%>
<%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">全部</p>--%>
<%--                </a>--%>
            </div>
            <!-- 乡村全景VR -->
            <div class="index-vr-box img100 layui-col-xs12 mt5 vr-class" id="PicDiv">
<%--                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon15.png" alt="">--%>
            </div>
            <!-- 豆腐块 -->
            <div class="layui-col-xs12 mt20">
                <!-- 党建引领 -->
                <div class="layui-col-xs4  pr3 mb10" onclick="toNewHtml('djyl')">
                    <a href="Javascript:;" class="display-inline width-p100 index-hei110 index-dfk-bj01 pl10 pr10 bs">
                        <p class="font-size-16 color-red01 font-bold text-line-c1 pt15">党建引领</p>
                        <p class="font-size-12 color-red02 text-line-c1 pt5">推动乡村振兴</p>
                    </a>
                </div>
                <!-- 乡村治理 -->
                <div class="layui-col-xs8  pl3 mb10" onclick="toNewHtml('xczl')">
<%--                    <div class="layui-col-xs8  pl3 mb10" >--%>
                    <a href="Javascript:;" class="display-inline width-p100 index-hei110 index-dfk-bj02 pl10 pr10 bs">
                        <p class="font-size-16 color-lv01 font-bold text-line-c1 pt15">乡村治理</p>
                        <p class="font-size-12 color-lv02 text-line-c1 pt5">全面参与乡村治理</p>
                    </a>
                </div>
                <!-- 乡村特色 -->
                <div class="layui-col-xs4  pr3 mb10" onclick="toNewHtml('ccts')">
                    <a href="Javascript:;" class="display-inline width-p100 index-hei110 index-dfk-bj03 pl10 pr10 bs">
                        <p class="font-size-16 color-blue02 font-bold text-line-c1 pt15">乡村特色</p>
                        <p class="font-size-12 color-blue03 text-line-c1 pt5">焕发乡村新活力</p>
                    </a>
                </div>
                <!-- 村务政务 -->
                <div class="layui-col-xs4 pl3 pr3 mb10" onclick="toNewHtml('cwzw')">
                    <a href="Javascript:;" class="display-inline width-p100 index-hei110 index-dfk-bj06 pl10 pr10 bs">
                        <p class="font-size-16 color-huang01 font-bold text-line-c1 pt15">村务政务</p>
                        <p class="font-size-12 color-huang02 text-line-c1 pt5">让”阳光“落地</p>
                    </a>
                </div>
                <!-- 科技惠农 -->
                <div class="layui-col-xs4 pl3 pr3 mb10" onclick="toNewHtml('kjhn')">
                    <a href="Javascript:;" class="display-inline width-p100 index-hei110 index-dfk-bj05 pl10 pr10 bs">
                        <p class="font-size-16 color-zi01 font-bold text-line-c1 pt15">科技惠农</p>
                        <p class="font-size-12 color-zi02 text-line-c1 pt5">科技赋能振兴</p>
                    </a>
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
    var urlJson = {
        <%--'ccjd':'<%=path%>/public/wap/article/mobileIndex.jhtml',--%>
        <%--'ycyp':'<%=path%>/public/wap/villageProductApp/index.jhtml',--%>
        'ccts':'http://dcl.zhxc.fzyzxxjs.cn/dcl/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_dcl/public/wap/article/mobileIndex.jhtml',
        'cwzw': '<%=path%>/public/wap/villageAdministrationApp/indexV0101.jhtml.jhtml',
        'kjhn': '<%=path%>/public/wap/techBenefitsFarmersApp/index.jhtml',
        'djyl': 'http://dcl.zhxc.fzyzxxjs.cn/dcl/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_dj/wap/news/index.jhtml',
        'xczl': '<%=path%>/public/wap/ruralGovernanceControllerApp/index.jhtml',
    }
    // 省公司 （微信公众号） //后洋村公众号个性化地址
    var urlJson2_spt = {
        <%--'ccjd':'<%=path%>/public/wap/article/mobileIndex.jhtml',--%>
        <%--'ycyp':'<%=path%>/public/wap/villageProductApp/index.jhtml',--%>
        'ccts':'<%=path%>/public/wap/xczxAppHome/index.jhtml',
        'cwzw': '<%=path%>/public/wap/villageAdministrationApp/index.jhtml',
        'kjhn': '<%=path%>/public/wap/techBenefitsFarmersApp/index.jhtml',
        // 'djyl': 'http://qchyc.dj.zhxc.fzyzxxjs.cn/wap/news/index.jhtml',   // 党建动态。
        'djyl': '<%=path%>/public/wap/szshAppHome/djylIndex.jhtml',   // 主题配置。
        'xczl': '<%=path%>/public/wap/ruralGovernanceControllerApp/index.jhtml',
    }

    function toNewHtml(type){
        var url =''
        var flag =isWeChat();
        if ('spt'==flag){
            url =urlJson2_spt[type]
        }else {
            url = urlJson[type];
        }



        <%--if (type == 'sjxx'){--%>
        <%--    url = '<%=path%>/public/wap/public/wap/secretaryMailboxApp/index.jhtml'--%>
        <%--}else if (type == 'ycyp'){--%>
        <%--    url = '<%=path%>/public/wap/public/wap/villageProductApp/index.jhtml'--%>
        <%--}else if (type == 'cwgk'){--%>
        <%--    url = '${gbpDomain}/public/wap/public/wap/villageProductApp/index.jhtml'--%>
        <%--}else if (type == 'bszn'){//?????--%>
        <%--    url = '${gbpDomain}/public/wap/public/wap/villageProductApp/index.jhtml'--%>
        <%--}else if (type == 'zcxc')--%>
        <%--url ="<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml?tokenKey=${tokenKey}&userOrgCode=${userOrgCode}&orgCode=${userOrgCode}&partyId=${info.partyId}";--%>
        <%--url ="<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml";--%>
        location.href = url;
    }

    function openGg(e){
        // var value = ggJson[e];
        // layer.msg(value, {
        //     time: 0, //20s后自动关闭
        //     btn: ['关闭']
        // });
        var flag =isWeChat();
        var url =null
        if (flag=="spt"){
            url ="http://qchyc.gbp.zgdxxczx.cn/gbp/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true";
        }else{
            url ="http://dcl.zgdxxczx.cn/dcl/oauth/channel/smarthome/transferStation.jhtml?redirect=prj_gbp/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true";

        }


        location.href = url;
        <%--layer.open({--%>
        <%--    type: 2,--%>
        <%--    title: '受访人员选择',--%>
        <%--    scrollbar: false,--%>
        <%--    shadeClose: true,--%>
        <%--    shade: 0.3,--%>
        <%--    area: ['60%', '50%'],--%>
        <%--    content: '<%=path%>/public/wap/szshAppHome/indexqbyy.json'--%>
        <%--});--%>
    }

    var orgCode;
    var defaultOrgCode;
    var orgName;

    $(function () {
        orgCode = "${orgCode}";
        defaultOrgCode = "${orgCode}";
        orgName = "${orgName}";
        <%--orgEntityPath = "${orgEntityPath}";--%>
        init()
    });

    function init(){
        isShow()

        //初始化最上方轮播图片
        initTopPicDiv();
        //初始化轮播图片下方天气村民情况
        initWeatherAndVillagers()
       //初始化中间公告
        initGgDiv()

        //初始化公告公告下面的按钮
        getButtonDiv()

        ///初始化按钮下面的图片
        getPicDiv()
        layui.use('layer', function(){
            var layer = layui.layer;
        });

        initComponent();
    }


    function isShow(){
        var flag=isWeChat()


        if (flag=='spt'&&"${orgCode}"=="350925103212"){
            $('#orgDiv').addClass('hide')
        }
    }

    var wapSelect1;

    //取消绑定的选择事件
    function cancelBindEvent(){
        if(wapSelect1 != null){
            wapSelect1.wapSelectEvent('cancelEvent');
        }
    }

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
            $('#orgDivText').text(data.orgEntityPath)
             init();
            isShow()
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
                        layer.msg('切换成功');
                        // setTimeout('window.location.reload()', 2000);
                    }
                },
            });


        },opt)
    }

    var ggJson = {};

    //公告
    function initGgDiv(){
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getPzListData.jhtml',
            data: {
                page:1,
                rows:20,
                catalogId:'10000020',
                orgCode:orgCode,
                // isEndPubDate:'no',
                // isPic:'yes',
                // isPubOrg:'yes',
                // isTop:'yes',
                // tKey:'bannerManage',
            },
            success: function(data) {
                $('#ggDiv').empty();
                if (data != null && data.total > 0){
                    ggJson = {};
                    var html = '';
                    for (let i = 0; i < data.rows.length; i++) {
                        var value = data.rows[i].title;
                        ggJson[i] = value;
                        html += '<div onclick="openGg(\'' + i + '\')" class="swiper-slide flex flex-ac"><span class="text-line-c1">' + value + '</span></div>';
                    }
                    $('#ggDiv').append(html);
                    $('.ggClass').removeClass('hide')
                }else{
                    $('.ggClass').addClass('hide')
                }
            },
            error: function(data) {

            },
            complete : function() {
            }
        });
    }


    <%--//公告--%>
    <%--function initGgDiv(){--%>
    <%--    $.ajax({--%>
    <%--        type: 'POST',--%>
    <%--        url: '<%=path%>/public/wap/szshAppHome/getModularContent.jhtml',--%>
    <%--        data: {--%>
    <%--            useType:'index',--%>
    <%--            orgCode:orgCode,--%>
    <%--            type:'4',--%>
    <%--        },--%>
    <%--        success: function(data) {--%>
    <%--            $('#ggDiv').empty();--%>
    <%--            var html=''--%>
    <%--            if (data!=null){--%>
    <%--                var dvModulars= data.dvModulars--%>
    <%--                if (dvModulars!=null){--%>
    <%--                    for(var j=0;j<dvModulars.length;j++){--%>
    <%--                        var  modularContents =dvModulars[j].modularContents--%>
    <%--                        if(modularContents!=null){--%>
    <%--                            for(var z=0;z<modularContents.length;z++){--%>
    <%--                                var value =modularContents[z].name--%>
    <%--                                ggJson[z] = value;--%>
    <%--                                html += '<div onclick="openGg(\'' + z + '\')" class="swiper-slide flex flex-ac"><span class="text-line-c1">' + value + '</span></div>';--%>

    <%--                            }--%>
    <%--                            $('#ggDiv').append(html);--%>
    <%--                        }--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            }--%>
    <%--        },--%>
    <%--        error: function(data) {--%>

    <%--        },--%>
    <%--        complete : function() {--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>

    //初始化最上方轮播图片
    function initTopPicDiv(){
        var  platform =isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                // page:1,
                // rows:20,
                // catalogId:'10000013',
                // isEndPubDate:'no',
                // isPic:'yes',
                // isPubOrg:'yes',
                // isTop:'yes',
                // tKey:'bannerManage',
                useType:'index',
                orgCode:orgCode,
                type:'3',
                platform:platform
            },
            success: function(data) {

                //存放图片的list
                var attList =[];


                if(data!=null){
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
                }

                $('#topPicDiv').empty();
                if (attList != null && attList.length > 0){
                    var html = '';
                    for (let i = 0; i < attList.length; i++) {
                        var value =   '${imgDomain}' + attList[i].filePath;

                        html += ' <div class="swiper-slide">\n' +
                            '                            <li class="bs w100 img100" style="-webkit-border-radius:15px;">\n' +
                            '                                <img  src="' + value + '" alt="">\n' +
                            '                            </li>\n' +
                            '                        </div>\n';
                    }
                    $('#topPicDiv').append(html);
                }else {
                    var html = '';
                    var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                    html += ' <div class="swiper-slide">\n' +
                        '                            <li class="bs w100 img100" style=" -webkit-border-radius:15px;">\n' +
                        '                                <img  src="' + value + '" alt="">\n' +
                        '                            </li>\n' +
                        '                        </div>\n';
                    $('#topPicDiv').append(html);
                }

                //   //   重新加载swiper 样式
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

            },
            complete : function() {
            }
        });
    }

    //初始化轮播图片下方天气村民情况
    function initWeatherAndVillagers(){
        // $('#cmCount').text('105')
        $.ajax({
            type: 'GET',
            url: 'http://wthrcdn.etouch.cn/weather_mini',
            data: {
                city:orgName
            },
            dataType: 'json',
            success: function (data) {
                $('#tqText').empty();
                if (data.data != null && data.data.forecast != null && data.data.forecast != undefined && data.data.forecast.length > 0 && data.data.wendu != null){
                    var tq = data.data.forecast[0].type;
                    var wd = data.data.wendu != undefined ? data.data.wendu : "";
                    // $('#tqText').html('多云<em class="cor-666 ml10" >30℃</em>');
                    $('#tqText').html(tq + '<em class="cor-666 ml10" >' + wd + '℃</em>');
                }
            },
            error: function (data) {

            },
            complete: function () {
                // modleclose(); //关闭遮罩层
            }
        });
    }

    function toAllMenu(){
        <%--url ="<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml?tokenKey=${tokenKey}&userOrgCode=${userOrgCode}&orgCode=${userOrgCode}&partyId=${info.partyId}";--%>
        url ="<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml";
        location.href = url;
    }

   // 公告下面的按钮
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
                $('#buttonDiv').html("");
                var showFlag= false
                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){
                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents
                            for(var z=0;z<modularContents.length;z++){
                                showFlag =true

                                var picUrl=modularContents[z].attList!=null? '${imgDomain}'+ modularContents[z].attList[0].filePath:'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png'
                                var url= modularContents[z].url
                                html+=
                                    '<a href="Javascript:;" style="padding-right: 4.2px">'+
                                        '<div class="index-ann-box-icon img100" onclick="jump(\'' + url + '\')">'+
                                            '<img src="'+picUrl+'" alt="">'+
                                        '</div>'+
                                        '<p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">'+modularContents[z].name+'</p>'+
                                    '</a>'
                                if(z==3){
                                    html+=
                                        '<a href="Javascript:;">'+
                                        '<div class="index-ann-box-icon img100" onclick="toAllMenu()">'+
                                        '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon14.png" alt="">'+
                                        '</div>'+
                                        '<p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">全部</p>'+
                                        '</a>'
                                    break;
                                }
                            }
                            $('#buttonDiv').html(html);

                        }
                    }
                }
                if (!showFlag){
                    $('#buttonDiv').addClass('noDataTop')
                }else {
                    $('#buttonDiv').removeClass('noDataTop')
                }

                //   //   重新加载swiper 样式
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

            },
            complete : function() {
            }
        });
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


    // 按钮下的图片
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
                // console.log(data)
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
                                $('#PicDiv').html('<img src="'+picUrl+'"  onclick="jump(\'' + url + '\')" alt="">');
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

            },
            complete : function() {
            }
        });
    }



    /**
     * 判断是不是微信浏览器
     * @return {Boolean}
     */
    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type){
            return 'spt'
        }else {
            return 'xygj'
        }
    }


</script>
</body>
</html>