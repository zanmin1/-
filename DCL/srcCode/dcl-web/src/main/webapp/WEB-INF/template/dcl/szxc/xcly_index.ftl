<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/css/djyl.css"/>
    <style>
        .article-content {
            font-size: 20px !important;
        }

        .article-content div {
            font-size: 20px !important;
        }

        .article-content h1 {
            font-size: 20px !important;
        }

        .article-content h2 {
            font-size: 20px !important;
        }

        .article-content h3 {
            font-size: 20px !important;
        }

        .article-content h4 {
            font-size: 20px !important;
        }

        .article-content h5 {
            font-size: 20px !important;
        }

        .article-content span {
            font-size: 20px !important;
        }

        .article-content p {
            font-size: 20px !important;
        }

        .article-content h6 {
            font-size: 20px !important;
        }
    </style>
    <script>
        var winW, whdef, rem;

        function fullPage() { //将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef; // 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }

        fullPage();
        window.onresize = fullPage;
    </script>
</head>
<body>
<div class="h100 djyl-bj djyl-bj-padd bs">
    <div class="h100 prr20">
        <!-- 左右结构 -->
        <div class="xq-nr-box mtr10 clearfix">
            <!-- 详情内容 -->
            <div class="djyl-100-w554 h100 ptr30 pbr30 prr10 plr50 bs xq-bj-box fl" id="contentP">
                <div class="h100">
                    <!-- 标题 -->
                    <div class="pbr20 djyl-zwgk-bottom-bor mrr50">
                        <p class="font-size-r24 cor-333 font-bold text-line-c1" id="title"></p>
                        <p class="mtr15 font-size-r12 cor-999 text-line-c1" id="source"></p>
                    </div>
                    <!-- 内容 -->
                    <div class="xq-neir-hei prr40 h-x mtr20 article-content" id="content"></div>
                </div>
            </div>
            <!-- 专题推荐 -->
            <div class="djyl-w534 h100 ptr25 pbr25 prr30 plr30 bs xq-bj-box fr">
                <!-- 标题 -->
                <p class="font-size-r18 cor-333 font-bold">${title}</p>
                <!-- 轮播 -->
                <div class="djyl-h204 mtr15 xq-lunbo-box">
                    <div class="swiper-container swiper01 w100 h100">
                        <div class="swiper-wrapper" id="imgList"></div>
                    </div>
                    <!-- 左右切换 -->
                    <div class="xq-lunbo-qh xq-lunbo-qh-le page-help">
                        <i></i>
                    </div>
                    <div class="xq-lunbo-qh xq-lunbo-qh-ri page-help">
                        <i></i>
                    </div>
                </div>
                <!-- 列表 -->
                <ul class="djyl-100-h275 mtr20 h-x" id="parentList">
                    <div class="swiper-container swiper02 w100 h100">
                        <div class="swiper-wrapper" id="list"></div>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="${UI_DOMAIN!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${UI_DOMAIN!''}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${UI_DOMAIN!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${uiDomain!''}/js/layer/layer.js" type="text/javascript"></script>
<script>
    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true,
    });
    $('.jindu').each(function (index, el) {
        $(el).css('width', '0');
        setTimeout(function () {
            $(el).animate({
                width: $(el).data('per') + '%',
            }, 1500)
        }, 1500)
    });
    <#--alert("/dcl/szxc/module_${module}.ftl")-->
</script>
<#include "/dcl/szxc/module_${module}.ftl" />
</body>
</html>