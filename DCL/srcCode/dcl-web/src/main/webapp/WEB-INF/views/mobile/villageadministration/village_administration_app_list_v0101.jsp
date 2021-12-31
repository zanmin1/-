<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>

<!doctype html>
<html>
<head>
    <title>村务政务</title>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/search.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css?v=1"/>

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <style>
        .noDataTop{
            margin-top: 0px;
        }
    </style>
</head>

<body class="bg-cor-f5">
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
        <div class="layui-col-xs12 pl10 pr10 mt10">
            <div class="cwzw-xuanchuan bg-fff border-radius-4 height-64 flex flex-ac">
                <i class="cwzw-xc-text"></i>
                <i class="cwzw-xc-line ml10 mr10"></i>

                <div class="flex1 flex flex-ac pr10 overflow-h">
                    <div class="flex1 cwzw-content height-64 overflow-h">
                        <!-- 暂无数据 -->
                        <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc hide" id="zcxcZwsj">
                            <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                        </div>
                        <div class="swiper-container width-p100 height-p100" id="zcxcSj">
                            <div class="swiper-wrapper" id="zcxc">

                            </div>
                        </div>
                    </div>
                    <i class="cwzw-right" id="cwzw-right"></i>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 mt10">
            <div class="cwzw-box1 bg-fff">
                <%--					<div class="cwzw-box1-top height-44 bor-btm-f0 pl15 flex">--%>
                <%--						<a href="javascript:void(0);" class="cor-80 font-size-15 line-height-44 active">美丽乡村</a>--%>
                <%--						<a href="javascript:void(0);" class="cor-80 font-size-15 line-height-44 ml30">乡村法治</a>--%>
                <%--					</div>--%>
                <div class="cwzw-box1-content">
                    <div class="cwzw-b1c-item cwzw-b1c-item1 height-p100">
                        <div class="swiper-container ">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide layui-row pl15 pr15 pt15 bs"  id="buttonDiv">
<%--                                    <a href="Javascript:;" class="layui-col-xs3 pt5 mb5"--%>
<%--                                       onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=cwgk&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--                                        <!-- img -->--%>
<%--                                        <div class="index-ann-box-icon img100">--%>
<%--                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon33.png"--%>
<%--                                                 alt="">--%>
<%--                                        </div>--%>
<%--                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村务公开</p>--%>
<%--                                    </a>--%>
<%--                                    <a href="Javascript:;" class="layui-col-xs3 pt5 mb5"--%>
<%--                                       onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=caiwgk&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--                                        <!-- img -->--%>
<%--                                        <div class="index-ann-box-icon img100">--%>
<%--                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon34.png"--%>
<%--                                                 alt="">--%>
<%--                                        </div>--%>
<%--                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">财务公开</p>--%>
<%--                                    </a>--%>
<%--                                    <a href="Javascript:;" class="layui-col-xs3 pt5 mb5"--%>
<%--                                       onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=cqjs&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--                                        <!-- img -->--%>
<%--                                        <div class="index-ann-box-icon img100">--%>
<%--                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon35.png"--%>
<%--                                                 alt="">--%>
<%--                                        </div>--%>
<%--                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村情介绍</p>--%>
<%--                                    </a>--%>
<%--                                    <a href="Javascript:;" class="layui-col-xs3 pt5 mb5"--%>
<%--                                       onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--                                        <!-- img -->--%>
<%--                                        <div class="index-ann-box-icon img100">--%>
<%--                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon36.png"--%>
<%--                                                 alt="">--%>
<%--                                        </div>--%>
<%--                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">政策宣传</p>--%>
<%--                                    </a>--%>
<%--                                    <a href="Javascript:;" class="layui-col-xs3 pt5 mb5">--%>
<%--                                        <!-- img -->--%>
<%--                                        <div class="index-ann-box-icon img100"--%>
<%--                                             onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=cgmy&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon37.png"--%>
<%--                                                 alt="">--%>
<%--                                        </div>--%>
<%--                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村规民约</p>--%>
<%--                                    </a>--%>
<%--                                    <a href="Javascript:;" class="layui-col-xs3 pt5 mb5">--%>
<%--                                        <!-- img -->--%>
<%--                                        <div class="index-ann-box-icon img100"--%>
<%--                                             onclick="jump('<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml')">--%>
<%--                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon14.png"--%>
<%--                                                 alt="">--%>
<%--                                        </div>--%>
<%--                                        <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">全部</p>--%>
<%--                                    </a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cwzw-box2">
                <div class="flex flex-ac height-44 pl15">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>信息公开</p>
                </div>
                <div class="cwzw-box2-content layui-row">
                    <div class="layui-col-xs12">
                        <div class="swiper-container nav-ext1 nav-ext1-blue1 j-nav bg-fff bor-btm-f0">

                            <ul class="swiper-wrapper">
                                <div class="swiper-slide selected" style="width: 50%">
                                    <button class="btn-nav-ext1 layui-btn height-44 font-size-15">村务公开</button>
                                </div>
                                <div class="swiper-slide" style="width: 50%">
                                    <button class="btn-nav-ext1 layui-btn height-44 font-size-15">财务公开</button>
                                </div>
                            </ul>
                        </div>
                    </div>
                    <div class="layui-col-xs12">
                        <div class="swiper-container j-nav-chidren">
                            <div class="swiper-wrapper">
                                <!-- 村务公开 -->
                                <div class="swiper-slide nav-chidren-h1">
                                    <!-- 暂无数据 -->
                                    <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50"
                                         id="cunwgkZwsj">
                                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                                    </div>
                                    <div class="layui-row bg-fff" id="cunwgkSj">
                                        <div class="layui-col-xs12 pl15 pr15 pb10" id="cunwgk">

                                        </div>
                                    </div>
                                </div>

                                <!-- 财务公开 -->
                                <div class="swiper-slide nav-chidren-h1">
                                    <!-- 暂无数据 -->
                                    <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50"
                                         id="caiwgkZwsj">
                                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                                    </div>
                                    <div class="layui-row bg-fff" id="caiwgkSj">
                                        <div class="layui-col-xs12 pl15 pr15 pb10" id="caiwgk">

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $.fn.extend({
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
                slidesPerView: num,
                paginationClickable: true,//此参数设置为true时，点击分页器的指示点分页器会控制Swiper切换。
                freeMode: false,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
                loop: false,//是否可循环
                autoHeight: true, //高度随内容变化
                observer: true,
                observeParents: true,
                slideToClickedSlide: true//设置为true则点击slide会过渡到这个slide。
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
                autoHeight: true//自动高度。设置为true时，wrapper和container会随着当前slide的高度而发生变化。
            });
        },
    });

    $(function () {
        initTopPicDiv()

        var mySwiper2 = new Swiper('.swiper02', {
            observer: true,
            observeParents: true,
            pagination: {
                el: '.cwzw-b1c-item2 .swiper-pagination',
                clickable: true
            }
        });
        $('.cwzw-box1-top').on('click', 'a', function () {
            $(this).addClass('active').siblings().removeClass('active');
            var aIndex = $(this).index();
            $('.cwzw-box1-content').children('.cwzw-b1c-item').eq(aIndex).removeClass('hide').siblings().addClass('hide');
        })
    });


    findNoticeList('10000006');   // 政策宣传。
    // findNoticeList('10000007');   // 党务公开。
    findNoticeList('10000003');   // 村务公开。
    findNoticeList('10000008');   // 财务公开。
    getButtonDiv()
    function findNoticeList(catalogId) {
        var map = {
            orgCode: '${orgCode}',
            page: 1,
            rows: 10
        };
        map.catalogId = catalogId;
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        map.status = 2;
        map.noTop = 1;
        var url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            success: function (data) {
                if (data.total > 0) {
                    var str = '';
                    var list = data.rows;

                    // 政策宣传。
                    if (catalogId === '10000006') {
                        if (list.length > 0) {
                            for (let i = 0; i < list.length; i++) {
                                // 点击数据，查看详情。
                                str += '<div class="swiper-slide flex flex-clm flex-jc" onclick="openPage(\'/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + list[i].infoOpenId + '&tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}' + '\')">' +
                                    '<p class="font-size-13 cor-4d text-lh1 text-line-c1">' + list[i].title + '</p>' +
                                    '<p class="font-size-12 cor-a8 text-lh1 cwzw-c-text2">' + list[i].pubDate + '</p>' +
                                    '</div>';
                            }

                            $('#zcxc').html(str);

                            // 点击">"，查看列表。
                            $('#cwzw-right').attr("onclick", "openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')");

                            // 循环轮播。
                            if (list.length > 1) {
                                // 放在外面轮播会失效。
                                var mySwiper_1 = new Swiper('.cwzw-content .swiper-container', {
                                    direction: 'vertical',
                                    autoplay: {
                                        delay: 3000,
                                        stopOnLastSlide: false,
                                        disableOnInteraction: false
                                    },
                                    loop: true,//是否可循环
                                    observer: true,
                                    observeParents: true,
                                    observeSlideChildren: true
                                });

                                // 循环。
                            } else {
                                // 放在外面轮播会失效。
                                var mySwiper_2 = new Swiper('.cwzw-content .swiper-container', {
                                    direction: 'vertical',
                                    loop: true,//是否可循环
                                    observer: true,
                                    observeParents: true,
                                    observeSlideChildren: true
                                });
                            }

                            // 暂无数据。
                        } else {
                            $('#zcxcZwsj').removeClass('hide');
                            $('#zcxcSj').hide();
                        }

                        // 党务公开，村务公开，财务公开。
                    } else if (catalogId === '10000007' || catalogId === '10000003' || catalogId === '10000008') {
                        if (list.length > 0) {
                            var tKey;

                            // 党务公开。
                            if (catalogId === '10000007') {
                                tKey = "dwgk";

                                // 村务公开。
                            } else if (catalogId === '10000003') {
                                tKey = "cwgk";

                                // 财务公开。
                            } else if (catalogId === '10000008') {
                                tKey = "caiwgk";
                            }

                            for (let i = 0; i < list.length; i++) {
                                if (list[i].fileName == null || list[i].fileName === "") {
                                    str += '<div class="layui-col-xs12 bor-btm-f0 pt10 pb10" onclick="openPage(\'/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + list[i].infoOpenId + '&tKey=' + tKey + '&isTop=yes&isPic=yes&mode=view&openNewPager=true\')">' +
                                        '<p class="font-size-14 cor-4d" style="word-break: break-all">' + list[i].title + '</p>' +
                                        '<p class="font-size-12 cor-999 mt5">' + list[i].pubOrg + '<em class="ml15">' + list[i].pubDate + '</em> </p>' +
                                        '</div>';
                                } else {
                                    str += '<div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10" onclick="openPage(\'/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + list[i].infoOpenId + '&tKey=' + tKey + '&isTop=yes&isPic=yes&mode=view&openNewPager=true\')">' +
                                        '<div class="pic-wrap-ext1 notice-s1">' +
                                        '<div class="pic-wrap-c">' +
                                        '<div class="pic-wrap-i border-radius-4">' +
                                        '<img src="${imgDomain}' + list[i].fileName + '">' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '<div class="flex1 ml10">' +
                                        '<p class="font-size-14 cor-4d height-3em text-line-c2" style="word-break: break-all">' + list[i].title + '</p>' +
                                        '<p class="font-size-12 cor-999 mt10">' + list[i].pubOrg + '<em class="ml15">' + list[i].pubDate + '</em> </p>' +
                                        '</div>' +
                                        '</div>';
                                }

                                // 党务公开。
                                if (catalogId === '10000007') {
                                    $('#dwgk').html(str);

                                    // 村务公开。
                                } else if (catalogId === '10000003') {
                                    $('#cunwgk').html(str);

                                    // 财务公开。
                                } else if (catalogId === '10000008') {
                                    $('#caiwgk').html(str);
                                }
                            }

                            // 暂无数据。
                        } else {
                            // 党务公开。
                            if (catalogId === '10000007') {
                                $('#dwgkZwsj').removeClass('hide');
                                $('#dwgkSj').hide();

                                // 村务公开。
                            } else if (catalogId === '10000003') {
                                $('#cunwgkZwsj').removeClass('hide');
                                $('#cunwgkSj').hide();

                                // 财务公开。
                            } else if (catalogId === '10000008') {
                                $('#caiwgkZwsj').removeClass('hide');
                                $('#caiwgkSj').hide();
                            }
                        }
                    }

                    // 暂无数据。
                } else {
                    // 政策宣传。
                    if (catalogId === '10000006') {
                        $('#zcxcZwsj').removeClass('hide');
                        $('#zcxcSj').hide();

                        // 党务公开。
                    } else if (catalogId === '10000007') {
                        $('#dwgkZwsj').removeClass('hide');
                        $('#dwgkSj').hide();

                        // 村务公开。
                    } else if (catalogId === '10000003') {
                        $('#cunwgkZwsj').removeClass('hide');
                        $('#cunwgkSj').hide();

                        // 财务公开。
                    } else if (catalogId === '10000008') {
                        $('#caiwgkZwsj').removeClass('hide');
                        $('#caiwgkSj').hide();
                    }
                }

                // nav
                $('.j-nav').navExt1(2); // 函数参数为默认展示个数
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    // 页面跳转。
    function openPage(url) {
        location.href = '${gbpDomain}' + url;
    }

    function jump(url) {
        console.log(url)
        if (url == 'null' || url == '' || url == null) {
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }
        var flag = isWeChat()
        var isapp = ''
        if (flag == 'xygj') {
            isapp = 'token=${token}&app=app'
        }
        if (url.indexOf("?") == -1) {   //链接没有带参数
            location.href = url + '?' + isapp
        } else {
            location.href = url + '&' + isapp
        }
    }

    // 头部背景。
    // getTbbjData();
    function getTbbjData() {
        var platform = isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                regionCode: '${orgCode}',   // 区域编码。
                useType: "cwzw",   // 村务政务。
                type: "3",   // 轮播图。
                platform: platform
            },
            success: function (data) {
                // 一个主题。
                if (data != null) {
                    var str = '';
                    var dvModular = data.dvModulars;   // 多个模块，只取第一个。

                    if (dvModular != null) {
                        dvModular = dvModular[0];
                        var imgNum = 0;
                        var modularContents = dvModular.modularContents;   // 多个模块内容。

                        if (modularContents != null) {
                            for (let i = 0; i < modularContents.length; i++) {
                                var attList = modularContents[i].attList;   // 多个附件，只取第一个。

                                if (attList != null) {
                                    attList = attList[0];
                                    str += '<div class="swiper-slide">' +
                                        '<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
                                        '<img src="' + '${imgDomain}' + attList.filePath + '" onerror="javascript:this.src=\'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png\';">' +
                                        '</div>' +
                                        ' </div>';

                                    imgNum++;
                                }
                            }
                        }

                        $('#tbbj').html(str);

                        // 循环轮播。
                        if (imgNum > 1) {
                            // 放在外面轮播会失效。
                            var swiperList1_1 = new Swiper('.swiper-list-ext2', {
                                spaceBetween: 5,
                                pagination: {
                                    el: '.swiper-pagination'
                                },
                                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                                autoplay: {
                                    delay: 3000,
                                    stopOnLastSlide: false,
                                    disableOnInteraction: false
                                },
                                loop: true,//是否可循环
                                observer: true,
                                observeParents: true,
                                observeSlideChildren: true
                            });

                            // 循环。
                        } else if (imgNum === 1) {
                            // 放在外面轮播会失效。
                            var swiperList1_2 = new Swiper('.swiper-list-ext2', {
                                spaceBetween: 5,
                                pagination: {
                                    el: '.swiper-pagination'
                                },
                                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                                loop: true,//是否可循环
                                observer: true,
                                observeParents: true,
                                observeSlideChildren: true
                            });

                            // 暂无数据。
                        } else {
                            $('#tbbj').html('<div class="swiper-slide">' +
                                '<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
                                '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                                '</div>' +
                                ' </div>');
                        }
                    } else {
                        $('#tbbj').html('<div class="swiper-slide">' +
                            '<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
                            '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                            '</div>' +
                            ' </div>');
                    }
                } else {
                    $('#tbbj').html('<div class="swiper-slide">' +
                        '<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
                        '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                        '</div>' +
                        ' </div>');
                }
            },
            error: function (data) {
                console.log("获取头部背景数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var type = ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type) {
            return 'spt'
        } else {
            return 'xygj'
        }
    }

    //初始化最上方轮播图片
    function initTopPicDiv() {
        var platform = isWeChat()
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
                useType: 'cwzw',
                orgCode: '${orgCode}',
                type: '3',
                platform: platform
            },
            success: function (data) {

                //存放图片的list
                var attList = [];


                if (data != null) {
                    var dvModulars = data.dvModulars
                    if (dvModulars != null) {
                        for (var j = 0; j < dvModulars.length; j++) {
                            var modularContents = dvModulars[j].modularContents
                            if (modularContents != null) {
                                for (var z = 0; z < modularContents.length; z++) {
                                    attList = attList.concat(modularContents[z].attList)
                                }
                            }
                        }
                    }
                }

                $('#topPicDiv').empty();
                if (attList != null && attList.length > 0) {
                    var html = '';
                    for (let i = 0; i < attList.length; i++) {
                        var value = '${imgDomain}' + attList[i].filePath;

                        html += ' <div class="swiper-slide">\n' +
                            '                            <li class="bs w100 img100" style="-webkit-border-radius:15px;">\n' +
                            '                                <img  src="' + value + '" alt="">\n' +
                            '                            </li>\n' +
                            '                        </div>\n';
                    }
                    $('#topPicDiv').append(html);
                } else {
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
            error: function (data) {

            },
            complete: function () {
            }
        });
    }

    // 按钮渲染
    function getButtonDiv() {
        var platform = isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType: 'cwzw',
                orgCode: '${orgCode}',
                type: '7',  //导航栏
                platform: platform,
            },
            success: function (data) {
                var html = ''
                $('#buttonDiv').html("");
                var showFlag = false
                if (data != null) {
                    var dvModulars = data.dvModulars
                    if (dvModulars != null) {
                        for (var j = 0; j < dvModulars.length; j++) {
                            if (j == 0) {
                                var modularContents = dvModulars[j].modularContents

                                for (var z = 0; modularContents && z < modularContents.length && z < 7; z++) {

                                    showFlag = true

                                    var picUrl = modularContents[z] && modularContents[z].attList ? '${imgDomain}' + modularContents[z].attList[0].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png'
                                    var url = modularContents[z].url
                                    var name = modularContents[z].name
                                    html +=
                                        '<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="jump(\'' + url + '\')">' +
                                        '<div class="index-ann-box-icon img100" >' +
                                        '<img src="' + picUrl + '" alt="">' +
                                        '</div>' +
                                        '<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">' + name + '</p>' +
                                        '</a>'
                                }
                            }
                        }
                            html +=
                                '<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="toAllMenu()">' +
                                '<div class="index-ann-box-icon img100" >' +
                                '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon14.png" alt="">' +
                                '</div>' +
                                '<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">全部</p>' +
                                '</a>'
                        // alert(html)
                            $('#buttonDiv').html(html);
                    }
                }
                if (!showFlag) {
                    $('#buttonDiv').addClass('noDataTop')
                } else {
                    $('#buttonDiv').removeClass('noDataTop')
                }
            },
            error: function (data) {

            },
            complete: function () {
            }
        });
    }
</script>
</body>
</html>