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
    <title>乡村特色</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/search.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP"></script>

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

    <meta content="yes" name="apple-mobile-web-app-capable">

    <meta content="black" name="apple-mobile-web-app-status-bar-style">

    <meta content="telephone=no" name="format-detection">
</head>
<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 pt15 pb15 ">
            <!-- 轮播 -->
            <ul class="index-lunbo-box ">
                <div class="swiper-container swiper01 w100">
                    <div class="swiper-wrapper" id="topLbDiv">

                    </div>
                </div>
                <div class="fyq-lunbo swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->

            </ul>
        </div>
        <!-- 内容 -->
        <div class="layui-col-xs12 pt15 pl15 pr15 pb5">
            <div class="layui-col-xs12 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>热门景点</p>
                    <a href="javascript:;" onclick="jumpPage('jd')" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>
                </div>
                <div class="layui-col-xs12 pt15">
                    <div class="layui-row layui-col-space15" id="jdDiv">

                    </div>
                    <div id="jdzw" class="layui-col-xs12 flex flex-clm flex-jc flex-ac hide">
                        <div class="data-none-ext1 img-p100">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                        </div>
                        <p class="font-size-17 cor-999 mt15">暂无数据</p>
                    </div>
                </div>

            </div>

            <div class="layui-col-xs12 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农家乐</p>
                    <a href="javascript:;" onclick="jumpPage('njl')" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>
                </div>
                <div class="layui-col-xs12">
                    <div class="layui-row" id="njlDiv">


                    </div>
                    <div id="njlzw" class="layui-col-xs12 flex flex-clm flex-jc flex-ac hide">
                        <div class="data-none-ext1 img-p100">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                        </div>
                        <p class="font-size-17 cor-999 mt15">暂无数据</p>
                    </div>
                </div>

            </div>

            <div class="layui-col-xs12 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac mt10">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>乡村民宿</p>
                    <a href="javascript:;" onclick="jumpPage('ms')" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>
                </div>
                <div class="layui-col-xs12 pt15">
                    <div class="layui-row" id="msDiv">

                    </div>
                    <div id="mszw" class="layui-col-xs12 flex flex-clm flex-jc flex-ac hide">
                        <div class="data-none-ext1 img-p100">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                        </div>
                        <p class="font-size-17 cor-999 mt15">暂无数据</p>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>

    $.fn.extend({
        // 页面高度计算
        heightC: function () {
            var _this = this;
            var paddingT = $('.layer-hd').outerHeight();
            var navCH = $(window).outerHeight() - paddingT;
            $(_this).css({ 'paddingTop': paddingT + 'px' });
            $('.nav-chidren-h1').css({ 'height': navCH + 'px' });
        },
        closeL: function () {
            $(this).on('click', function () {
                $('.layer-bd-cont').slideUp(300).siblings().fadeOut(300)
                setTimeout(function () {
                    $('.layer-bd').addClass('hide')
                }, 300);
            });
        },
    });
    $(function () {
        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();

        // 关闭弹窗
        $('.j-close-layer').closeL();
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
        var swiperList1 = new Swiper('.swiper-list-ext2', {
            pagination: {
                el: '.swiper-pagination',
            },
        });

        orgCode = "${orgCode}"

        $('#mszw').hide()
        $('#njlzw').hide()
        $('#jdzw').hide()

        mathDis();

    });

    var orgCode;

    function init(){
        //初始化顶部轮播图片
        initTopPic();
        //初始化景点图片
        initJdPic();
        //初始化农家乐图片
        initNjlPic();
        //初始化名宿图片
        initMsPic();

        //初始化乡村VR
        getPicDiv();
    }
    <%--//初始化顶部轮播图片--%>
    <%--function initTopPic(){--%>
    <%--    $.ajax({--%>
    <%--        type: 'POST',--%>
    <%--        url: '<%=path%>/public/wap/szshAppHome/getPzListData.jhtml',--%>
    <%--        data: {--%>
    <%--            page:1,--%>
    <%--            rows:20,--%>
    <%--            catalogId:'10000115',--%>
    <%--            isEndPubDate:'no',--%>
    <%--            isPic:'yes',--%>
    <%--            isPubOrg:'yes',--%>
    <%--            isTop:'yes',--%>
    <%--            tKey:'bannerManage',--%>
    <%--            orgCode:orgCode,--%>
    <%--        },--%>
    <%--        success: function(data) {--%>
    <%--            $('#topLbDiv').empty();--%>
    <%--            if (data != null && data.total > 0){--%>
    <%--                var html = '';--%>
    <%--                for (let i = 0; i < data.rows.length; i++) {--%>
    <%--                    var value = data.rows[i].fileName == undefined || data.rows[i].fileName == null ? "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png" : '${imgDomain}' + data.rows[i].fileName;--%>
    <%--                    html += '<div class="swiper-slide">\n' +--%>
    <%--                        '                            <li class="bs w100 img100">\n' +--%>
    <%--                        '                                <img src="' + value + '" alt="">\n' +--%>
    <%--                        '                            </li>\n' +--%>
    <%--                        '                        </div>';--%>
    <%--                }--%>
    <%--                $('#topLbDiv').append(html);--%>
    <%--            }else {--%>
    <%--                var html = '';--%>
    <%--                var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";--%>
    <%--                html += '<div class="swiper-slide">\n' +--%>
    <%--                    '                            <li class="bs w100 img100">\n' +--%>
    <%--                    '                                <img src="' + value + '" alt="">\n' +--%>
    <%--                    '                            </li>\n' +--%>
    <%--                    '                        </div>';--%>
    <%--                $('#topLbDiv').append(html);--%>
    <%--            }--%>
    <%--        },--%>
    <%--        error: function(data) {--%>

    <%--        },--%>
    <%--        complete : function() {--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>




    //初始化最上方轮播图片
    function initTopPic(){
        var  platform =isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType:'xcts',
                orgCode:orgCode,
                type:'3',
                platform:platform
            },
            success: function(data) {
                if (data==null){
                    var html = '';
                    var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                    html += ' <div class="swiper-slide">\n' +
                        '                            <li class="bs w100 img100">\n' +
                        '                                <img src="' + value + '" alt="">\n' +
                        '                            </li>\n' +
                        '                        </div>\n';
                    $('#topLbDiv').append(html);
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

                $('#topLbDiv').empty();
                if (attList != null && attList.length > 0){
                    var html = '';
                    for (let i = 0; i < attList.length; i++) {
                        var value =   '${imgDomain}' + attList[i].filePath;

                        html += ' <div class="swiper-slide">\n' +
                            '                            <li class="bs w100 img100">\n' +
                            '                                <img src="' + value + '" alt="">\n' +
                            '                            </li>\n' +
                            '                        </div>\n';
                    }
                    $('#topLbDiv').append(html);
                }else {
                    var html = '';
                    var value = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                    html += ' <div class="swiper-slide">\n' +
                        '                            <li class="bs w100 img100">\n' +
                        '                                <img src="' + value + '" alt="">\n' +
                        '                            </li>\n' +
                        '                        </div>\n';
                    $('#topLbDiv').append(html);
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

            },
            complete : function() {
            }
        });
    }

    // 乡村全景VR
    function  getPicDiv(){
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContent.jhtml',
            data: {
                useType:'xcts',
                orgCode:orgCode,
                type:'1',  //普通图文
            },
            success: function(data) {
                console.log(data)
                var html =''


                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){
                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents
                            if (modularContents.length>0&&modularContents[0].attList.length>0){
                                var picUrl= '${imgDomain}'+ modularContents[0].attList[0].filePath
                                var url= modularContents[0].url
                                // $('#PicDiv').html('<img src="'+picUrl+'"  onclick="jump(\'' + url + '\')" alt="">');

                                $('#PicDiv').html('<div class="bs w100 img100">'+
                                    '<img src="'+picUrl+'"    onclick="jump(\'' + url + '\')" >'+
                                    '</div>');

                            }
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

    function jump(url){
        console.log(url)
        if (url=='null'){
            layer.msg('暂未开放 敬请期待', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }

        location.href = '<%=path%>'+url;
    }



    //初始化景点图片
    function initJdPic(){
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/article/listData.jhtml',
            data: {
                page:1,
                rows:6,
                orgCode: orgCode,
                issuStatus:'1',
            },
            success: function(data) {
                $('#jdDiv').empty();
                if (data != null && data.total > 0){
                    $('#jdzw').hide()
                    var html = '';
                    for (let i = 0; i < data.rows.length; i++) {
                        var temData = data.rows[i];
                        var  picUrl = temData.picUrl==undefined||temData.picUrl==null?"${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png":'${imgDomain}'+temData.picUrl;
                        var  attractionsName =  temData.attractionsName ==undefined?"\t\n":temData.attractionsName;
                        var  attractionsTypeName =  temData.attractionsTypeName ==undefined?"":temData.attractionsTypeName;
                        var  attractionsTime =  temData.attractionsTime ==undefined?"":temData.attractionsTime;
                        var  address =  temData.address ==undefined?"":temData.address;
                        var  regPath =  temData.regPath ==undefined?"":temData.regPath;
                        var  uuid =  temData.uuid ==undefined?"":temData.uuid;

                        // var  x =  temData.x ==undefined?"":temData.x;
                        // var  y =  temData.y ==undefined?"":temData.y;
                        // if(x==''||x==null){
                        //     var  dis ='未定位';
                        // }else{
                        //     var  dis =getDistance(y,x);
                        // }

                        var chargeTypeName ="";

                        switch (temData.chargeType) {
                            case '1': chargeTypeName= ' <p class="list-tag-ext5 list-tag-ext5-bg3">免费</p>';  break;
                            case '2': chargeTypeName= ' <p class="list-tag-ext5 list-tag-ext5-bg2">部分收费</p>';  break;
                            case '3':chargeTypeName= ' <p class="list-tag-ext5 list-tag-ext5-bg1">收费</p>';  break;
                        }

                        html +=          "                        <div onclick='getDetail(\""+uuid+"\",1)'      class=\"layui-col-xs6\">\n" +
                            "                            <div class=\"layui-col-xs12 bg-fff border-radius-4\">\n" +
                            "                                <div class=\"pic-wrap-ext1 notice-s4\">\n" +
                            "                                    <div class=\"pic-wrap-c\">\n" +
                            "                                        <div class=\"pic-wrap-i border-radius-2\">\n" +
                            "                                            <img src=\""+picUrl+"\">\n" +
                            "                                        </div>\n" +
                            "                                    </div>\n" +
                            chargeTypeName+
                            "                                    <p class=\"font-size-14 cor-4d text-line-c1 pl10 pr10 mt5\">"+attractionsName+"</p>\n" +
                            "                                    <div class=\"flex flex-ac flex-jb pl10 pr10 mt5 mb10\">\n" +
                            "                                        <p class=\"font-size-12 cor-999 mt5\">"+attractionsTypeName+"</p>\n" +
                            // "                                        <p class=\"font-size-12 cor-999 flex flex-ac pt3\"><i class=\"icon-pos-ext3 mr5\"></i>"+dis+"</p>\n" +
                            "                                    </div>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                        </div>"
                    }
                    $('#jdDiv').append(html);
                    // var swiperList1 = new Swiper('.swiper-list-ext2', {
                    //     pagination: {
                    //         el: '.swiper-pagination',
                    //     },
                    // });
                }else {
                    $('#jdzw').show()
                }
            },
            error: function(data) {

            },
            complete : function() {
            }
        });
    }
    //初始化农家乐图片
    function initNjlPic(){
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/agritainment/listData.jhtml',
            data: {
                page:1,
                rows:3,
                orgCode: orgCode,
                issuStatus:'01',
            },
            success: function(data) {
                $("#njlDiv").empty();
                if (data != null && data.total > 0){
                    $('#njlzw').hide()
                    var html = '';
                    $.each(data.rows,function (i,val){
                        var  picUrl =val.picUrl==undefined||val.picUrl==null?"${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png":'${imgDomain}'+val.picUrl;
                        var  farmhouseName =  val.farmhouseName ==undefined?"":val.farmhouseName;
                        var  serviceDesc =  val.serviceDesc ==undefined?"":removeTAG(val.serviceDesc);
                        // serviceDesc = removeTAG(serviceDesc)
                        var  perCapitaConsum =  val.perCapitaConsum ==undefined?"":val.perCapitaConsum;
                        var  uuid =  val.uuid ==undefined?"":val.uuid;

                        // var  x =  val.x ==undefined?"":val.x;
                        // var  y =  val.y ==undefined?"":val.y;
                        // if(x==''||x==null){
                        //     var  dis ='未定位';
                        // }else{
                        //     var  dis =getDistance(y,x);
                        // }

                        html +=
                            '<div onclick="getDetail(\'' + uuid + '\',2)" ' +
                            'class="layui-col-xs12 bg-fff border-radius-4 flex mt15">\n' +
                            '                        <div class="width-120">\n' +
                            '                            <div class="pic-wrap-ext1 notice-s7">\n' +
                            '                                <div class="pic-wrap-c">\n' +
                            '                                    <div class="pic-wrap-i border-radius-2">\n' +
                            '                                        <img src="' + picUrl + '">\n' +
                            '                                    </div>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '                        <div class="flex1">\n' +
                            '                            <p class="font-size-14 cor-4d pl15 mt10">' + farmhouseName + '</p>\n' +
                            '                            <p class="font-size-12 cor-666 text-line-c2 pl15 pr10 mt10">' + serviceDesc + '</p>\n' +
                            '                            <div class="flex flex-ac flex-jb pl15 pr15 mt12">\n' +
                            '                                <p class="font-size-12 text-lh1 cor-b3"><em class="font-size-14 cor-red5 mr5">¥' + perCapitaConsum + '</em>/人</p>\n' +
                            // '                                <p class="font-size-12 cor-999 flex flex-ac pt3"><i class="icon-pos-ext3 mr5"></i>'+dis+'</p>\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '                    </div>'


                    })
                    $("#njlDiv").append(html);
                }else {
                    $('#njlzw').show()
                }
            },
            error: function(data) {

            },
            complete : function() {
            }
        });
    }
    //初始化名宿图片
    function initMsPic(){
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/homestayManagementApp/listData.jhtml',
            data: {
                currentPage:1,
                pageSize:2,
                orgCode: orgCode,
                issuStatus:'01',
            },
            success: function(data) {
                $("#msDiv").empty();
                if (data.data != null && data.count > 0){
                    $('#mszw').hide()
                    var html = '';
                    $.each(data.data,function (i,val){
                        var  homestayName =  val.homestayName ==undefined?"":val.homestayName;
                        var  address =  val.address ==undefined?"":val.address;
                        var  uuid =  val.uuid ==undefined?"":val.uuid;

                        var class1 = i == 0 ? 'layui-col-xs12' : 'layui-col-xs12 mt15';

                        html += '<div onclick="getDetail(\'' + uuid + '\',3)" class="' + class1 + '">\n' +
                            '                            <div class="layui-col-xs12 bg-fff border-radius-4">\n' +
                            '                                <div class="swiper-container swiper-list-ext2">\n' +
                            '                                    <div class="swiper-wrapper">\n';
                        for (let i = 0; i < val.imgList.length; i++) {
                            var value = val.imgList[i];
                            var picUrl =value==undefined||value==null?"${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png":'${imgDomain}'+value;
                            html += '<div class="swiper-slide">\n' +
                                '                                            <div class="pic-wrap-ext1 notice-s6">\n' +
                                '                                                <div class="pic-wrap-c">\n' +
                                '                                                    <div class="pic-wrap-i">\n' +
                                '                                                        <img src="' + picUrl + '">\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>\n'
                        }
                        if (val.imgList.length == 0){
                            var picUrl = "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png";
                            html += '<div class="swiper-slide">\n' +
                                '                                            <div class="pic-wrap-ext1 notice-s6">\n' +
                                '                                                <div class="pic-wrap-c">\n' +
                                '                                                    <div class="pic-wrap-i">\n' +
                                '                                                        <img src="' + picUrl + '">\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>\n'
                        }
                        html +=  '                                    </div>\n' +
                            '                                    <!-- Add Pagination -->\n' +
                            '                                    <div class="swiper-pagination"></div>\n' +
                            '                                </div>\n' +
                            '                                <div class="font-size-12">\n' +
                            '                                    <p class="font-size-14 cor-4d pl10 pr10 mt10">' + homestayName + '</p>\n' +
                            '                                    <p class="font-size-12 cor-999 flex flex-ac pl10 mt10"><i class="icon-pos-ext3 mr5"></i>' + address + '</p>\n' +
                            // '                                    <div class="flex flex-ac flex-jb pl10 pr15 mt10 mb10">\n' +
                            // '                                        <p class="font-size-16 cor-red5">¥199</p>\n' +
                            // '                                        <p class="font-size-14 cor-blue3 flex flex-ac"><i class="icon-house-ext1 mr5"></i><em class="pt3">房源：7</em></p>\n' +
                            // '                                    </div>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>'

                    })
                    $("#msDiv").append(html);
                    var swiperList1 = new Swiper('.swiper-list-ext2', {
                        pagination: {
                            el: '.swiper-pagination',
                        },
                    });

                }else {
                    $('#mszw').show()
                }
            },
            error: function(data) {

            },
            complete : function() {
            }
        });
    }

    function jumpPage(type){
        var url = '';
        if (type == 'jd'){//景点
            url ="<%=path%>/public/wap/article/mobileIndex.jhtml";
        }else if (type == 'njl'){//农家乐
            url ="<%=path%>/public/wap/agritainment/index.jhtml";
        }else if (type == 'ms'){//民宿
            url ="<%=path%>/public/wap/homestayManagementApp/appIndex.jhtml";
        }
        location.href = url;
    }


    function getDetail(uuid,type){
        // alert(uuid)
        // alert(type)
        var url = ""
        if(type==1){ //热门景点
            url ='<%=path%>/public/wap/article/mobileView.jhtml?id='+uuid;
        }if (type==2){   // 农家乐
            url = '<%=path%>/public/wap/agritainment/view.json?uuId='+ uuid;
        }if (type==3){ //乡村名宿
            url = '<%=path%>/public/wap/homestayManagementApp/appView.jhtml?uuid=' + uuid
        }



        // options.title = '房屋详情';
        // gmMsgClient.sent(parent, 'openWindow', options);
        location.href = url;
    }


    function removeTAG(str){
        // str = str.replace(/<img.*?(?:>|\/>)/gi, "");
        // str = str.replace(/<embed.*?(?:>|\/>)/gi, "");
        str = str.replace(/(\n)/g, "");
        str = str.replace(/(\t)/g, "");
        str = str.replace(/(\r)/g, "");
        str = str.replace(/<\/?[^>]*>/g, "");
        str = str.replace(/\s*/g, "");
        return str;
    }


    function mathDis() {

        // var geolocation = new BMap.Geolocation();
        // geolocation.enableSDKLocation();
        // geolocation.getCurrentPosition(function(r){
        //     if(this.getStatus() == BMAP_STATUS_SUCCESS){
        //         //  console.log('您的位置：'+r.point.lng+','+r.point.lat)
        //         lat=r.point.lat;
        //         lon =r.point.lng;
        //
        //     }
        //     else {
        //         console.log('failed'+this.getStatus())
        //     }
        //
        // });
        init();
    }


    var lat =null;
    var lon =null;

    // 根据经纬度计算距离，参数分别为第一点的纬度，经度；第二点的纬度，经度
    function getDistance(lat1, lng1) {

        var radLat1 = rad(lat1);
        var radLat2 = rad(lat);
        var a = radLat1 - radLat2;
        var b = rad(lng1) - rad(lon);
        var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
            Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * 6378.137; // EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000; //输出为公里

        var distance = s;
        var distance_str = "";

        if (parseInt(distance) >= 1) {
            distance_str = distance.toFixed(1) + "km";
        } else {
            distance_str = distance * 1000 + "m";
        }
        //       console.info('lyj 距离是', distance_str);
        return distance_str;
    }

    function rad(d) {
        return d * Math.PI / 180.0;
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

</script>
</body>
</html>