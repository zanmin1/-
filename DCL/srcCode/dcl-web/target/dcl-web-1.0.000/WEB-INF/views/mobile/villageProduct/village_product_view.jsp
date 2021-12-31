<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
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
    <title>详情</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css"/>
    <style>
        .img100 > img {
            max-height: 210px;
            min-height: 210px;
        }
    </style>
</head>
<body>
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 posi-rela">
            <div class="pic-wrap-ext1 notice-s4">
                <div class="pic-wrap-c">
                    <div class="pic-wrap-i border-radius-2">
                        <div class="swiper-container swiper01 width-p100 height-p100">
                            <div id="swiperList" class="swiper-wrapper">
                                <c:choose>
                                    <c:when test="${fileList != null}">
                                        <c:forEach var="item" items="${fileList}" varStatus="status">
                                            <div class="swiper-slide img100">
                                                <c:choose>
                                                    <c:when test="${item.type == 'video'}">
                                                        <video poster="${imgDomain}${item.cover}"
                                                               src="${imgDomain}${item.url}"
                                                               style="width: 100%; height: 165px; background-color: black;"
                                                               controls="controls" autostart="false" loop="true"/>
                                                    </c:when>
                                                    <c:otherwise><img src="${imgDomain}${item.url}"></c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="swiper-slide img100">
                                            <img src="${uiDomain}/web-assets/_jzfp/shandong/pages/blue/images/sd-zwtp.png">
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posi-abso posi-right-0 posi-bottom-60 flex pr15 z-index">
                <a href="javascript:;"
                   class="display-inline layui-btn btn-bg-gray2 height-20 line-height-20 border-radius-20 font-size-12 cor-fff flex flex-ac ml10">
                    <i class="btn-icon-ext1 btn-icon-ext1-vedio mr2"></i>
                    <i class="btn-icon-ext1 btn-icon-ext1-picture mr8"></i>
                    <span class="sw-mun swiper-pagination-fraction">
                        <span class="swiper-pagination-current">1</span>/<span
                            class="swiper-pagination-total">${fn:length(fileList)}</span>
                    </span>
                </a>
            </div>
        </div>
        <div class="layui-col-xs12 pl15 pr15 posi-rela z-index">
            <div class="layui-col-xs12 border-radius-4 box-shadow-ext1 bg-fff notice-margin-ext1 pl15 pt10 pr15 pb15">
                <p class="font-size-16 cor-333">${bo.goodsName}</p>
                <div class="flex flex-ac flex-jb mt5">
                    <p class="list-tag-ext4 font-size-12 cor-fff">${bo.goodsTypeName}</p>
                </div>
                <p class="font-size-12 text-lh1 cor-999 mt12"><em class="font-size-16 cor-red5 mr10">¥
                    <fmt:formatNumber value="${bo.marketPriceLow}" pattern="#,###.##"/>-
                    <fmt:formatNumber value="${bo.marketPriceHigh}" pattern="#,###.##"/></em>元/${bo.goodsUnitName}
                </p>
                <div class="flex flex-jb flex-ac">
                    <p class="font-size-12 cor-666 flex1 mt12">产地详址：${bo.address}</p>
                </div>

            </div>
            <div class="layui-col-xs12 height-44 bg-cor-org1 bor-org3 border-radius-4 mt10">
                <button class="layui-btn btn-pd-0 btn-bg-none width-p100 height-44 flex flex-jb flex-ac"
                        onclick="toShopping('${bo.goodsUrl}')">
                    <p class="font-size-14 cor-4d ml15">购买 <em class="cor-red5 ml15">跳转至购买商城</em></p>
                    <i class="layui-icon layui-icon-right font-size-16 cor-org4 mr10"></i>
                </button>
            </div>
            <div class="layui-col-xs12 pb25" id="descArea">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15 mt20 mb10"><i class="notic-bar-ext1"></i>产品介绍
                </p>
                ${bo.goodsDesc}
            </div>
        </div>
    </div>
</div>
<!--代码结束-->
</body>
<script src="${uiDomain}/app-assets/extend/app-bridge/app-common-bridge.js"></script>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="<%=path%>/js/html5media.min.js?1=1"></script>
<script>
    var swiper = new Swiper('.swiper01', {
        spaceBetween: 5,
        loop: true,//是否可循环
        pagination: {
            el: '.sw-mun',
            type: 'fraction',
        },
        observer: true, //修改swiper自己或子元素时，自动初始化swiper
        observeParents: true, //修改swiper的父元素时，自动初始化swiper
    });

    // 处理图片
    var imgList = $('#descArea').find('img');
    if (imgList != undefined && imgList.length > 0) {
        for (var i = 0; i < imgList.length; i++) {
            var width = $(imgList[i]).width();
            var height = $(imgList[i]).height();
            var maxWidth = document.body.clientWidth - 30;
            if (width > maxWidth) {
                $(imgList[i]).css("width", maxWidth);
                $(imgList[i]).css("height", height * (maxWidth / width));
            }
        }
    }

    function toShopping(url) {
        window.location.href = url;
    }
</script>
</html>