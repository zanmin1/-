<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">
    <title>三务公开</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/layer.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css"/>
</head>

<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="cwzw-box2-content layui-row">
        <div class="layui-col-xs12">
            <div class="swiper-container nav-ext1 nav-ext1-blue1 j-nav bg-fff bor-btm-f0">
                <div class="swiper-wrapper">
                    <div class="swiper-slide selected"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">党务公开</button></div>
                    <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">村务公开</button></div>
                    <div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">财务公开</button></div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12">
            <div class="swiper-container j-nav-chidren">
                <div class="swiper-wrapper">
                    <!-- 党务公开 -->
                    <div class="swiper-slide nav-chidren-h1">
                        <!-- 暂无数据 -->
                        <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50" id="dwgkZwsj">
                            <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                        </div>
                        <div class="layui-row bg-fff" id="dwgkSj">
                            <div class="layui-col-xs12 pl15 pr15 pb10" id="dwgk">

                            </div>
                        </div>
                    </div>

                    <!-- 村务公开 -->
                    <div class="swiper-slide nav-chidren-h1">
                        <!-- 暂无数据 -->
                        <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50" id="cunwgkZwsj">
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
                        <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50" id="caiwgkZwsj">
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
<!--代码结束-->
</body>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>
    $.fn.extend({
        // 页面高度计算
        heightC: function () {
            var _this = this;
            var paddingT = $('.layer-hd').outerHeight();
            var navCH = $(window).outerHeight() - paddingT;
            $(_this).css({'paddingTop': paddingT + 'px'});
            $('.nav-chidren-h1').css({'height': navCH + 'px'});
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
                slidesPerView: num,
                paginationClickable: true,//此参数设置为true时，点击分页器的指示点分页器会控制Swiper切换。
                spaceBetween: 5,//slide之间的距离（单位px）。
                freeMode: false,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
                loop: false,//是否可循环
                autoHeight: true, //高度随内容变化

                observer: true,
                observeParents: true,
                slideToClickedSlide: true,//设置为true则点击slide会过渡到这个slide。

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
            $(_this).on('click', '.btn-tabs-ext4-item', function () {
                $(this).addClass('layui-this').parent().siblings().children().removeClass('layui-this');
            });
        },
    });

    $(function () {
        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();

        // nav
        $('.j-nav').navExt1(3);//函数参数为默认展示个数

        // 二级菜单
        $('.j-nav-ext1').navExt2();

    });

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
        var mySwiper1 = new Swiper('.swiper01', {
            observer: true,
            observeParents: true,
            pagination: {
                el: '.cwzw-b1c-item1 .swiper-pagination',
                clickable: true
            }
        });
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


    // findNoticeList('10000006');   // 政策宣传。
    findNoticeList('10000007');   // 党务公开。
    findNoticeList('10000003');   // 村务公开。
    findNoticeList('10000008');   // 财务公开。
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
        map.status = 2 ;
        map.noTop = 1 ;
        var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            success: function(data) {
                if (data.total > 0) {
                    var str = '';
                    var list = data.rows;

                    // 政策宣传。
                    if (catalogId === '10000006') {
                        if (list.length > 0) {
                            for(let i = 0; i < list.length; i++) {
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
                                        '<img src="${$IMG_DOMAIN}' + list[i].fileName + '">' +
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
                $('.j-nav').navExt1(3); // 函数参数为默认展示个数
            },
            error: function(data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function() {
            }
        });
    }


    // 页面跳转。
    function openPage(url) {
        jump('${gbpDomain}' + url);
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

    function jump(url){
        console.log(url)
        if (url=='null'){
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }
        var flag =  isWeChat()
        var isapp=''
        if (flag =='xygj'){
            isapp='token=${token}&app=app'
        }
        if (url.indexOf("?")==-1){   //链接没有带参数
            location.href = url+'?'+isapp
        }else {
            location.href = url+'&'+isapp
        }
    }

</script>

</html>