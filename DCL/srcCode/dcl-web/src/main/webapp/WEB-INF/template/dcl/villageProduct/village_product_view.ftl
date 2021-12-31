<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>全屏弹窗-景点详情</title>
    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/uploadFileCommon.ftl" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css"/>
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/css/modify-index.css"/>
    <script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
</head>
<body class="scroll">
<div class="bs h100 layui-form padding-ext1 layui-form">
    <div class="layer-title-ext1 clearfix">
        <div class="layer-title-ext1-left clearfix fl">
            <p class="text-lh1 font-size-14 fl font-bold">商品详情</p>
        </div>
        <a href="javascript:void(0);" class="layer-close-ext1 fr">
            <i class="layui-icon layui-icon-close"></i>
        </a>
    </div>
    <div class="layer-content-ext1 layer-box-bg-ext1 padding-ext2">
        <div class="h100 scroll padding-ext3">
            <div class="xc-details-top clearfix">
                <!-- 轮播图 -->
                <div class="xc-dt-left fl clearfix">
                    <div class=" gallery-left fl">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <#if attList?? && (attList?size > 0) >
                                    <#list attList as item>
                                        <#if item.type == 'img'>
                                            <div class="swiper-slide img100">
                                                <img src="${imgDomain}${item.url}">
                                            </div>
                                        <#elseif item.type == 'video'>
                                            <div class="swiper-slide img100">
                                                <video src="${imgDomain}${item.url}" poster="${imgDomain}${item.cover}"
                                                       type="application/x-shockwave-flash"
                                                       style="width: 100%; height: 100%;" controls="controls"
                                                       autostart="false" loop="true"/>
                                            </div>
                                        </#if>
                                    </#list>
                                <#else>
                                    <div class="swiper-slide img100">
                                        <img src="${uiDomain}/web-assets/_jzfp/shandong/pages/blue/images/sd-zwtp.png">
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                    <div class="gallery-right fl">
                        <a href="javascript:void(0);" class="gallery-right-pre text-align-c">
                            <i class="layui-icon layui-icon-up cor-fff font-size-24"></i>
                        </a>
                        <a href="javascript:void(0);" class="gallery-right-next text-align-c">
                            <i class="layui-icon layui-icon-down cor-fff font-size-24"></i>
                        </a>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <#if attList?? && (attList?size > 0) >
                                    <#list attList as item>
                                        <#if item.type == 'img'>
                                            <div class="swiper-slide img100">
                                                <img src="${imgDomain}${item.url}">
                                            </div>
                                        <#elseif item.type == 'video'>
                                            <div class="swiper-slide img100">
                                                <img src="${imgDomain}${item.cover}">
                                            </div>
                                        </#if>
                                    </#list>
                                <#else>
                                    <div class="swiper-slide img100">
                                        <img src="${uiDomain}/web-assets/_jzfp/shandong/pages/blue/images/sd-zwtp.png">
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xc-dt-right fr">
                    <p class="xc-dtr-title text-line-c1 font-size-28 cor-333 font-bold ">${(bo.goodsName)!''}</p>
                    <div class="clearfix mt15 xc-dtr-box1">
                        <p class="font-size-16 cor-3d7be6 line-height-26 fl">【${(bo.goodsTypeName)!''}】</p>
                        <#if bo.shelf=='1'>
                            <i class="fl xc-dtrb1-icon xc-dtrb1-sj font-bold font-size-14 cor-fff line-height-26 text-align-c">上架</i>
                        <#elseif bo.shelf=='0'>
                            <i class="fl xc-dtrb1-icon xc-dtrb1-bsj font-bold font-size-14 cor-fff line-height-26 text-align-c">下架</i>
                        </#if>
                    </div>
                    <div class="flex mt40">
                        <p class="font-size-14 cor-333 line-height-20">产地详址</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20">${bo.address!''}</p>
                    </div>
                    <div class="flex mt20">
                        <p class="font-size-14 cor-333 line-height-20">购买链接</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20">${bo.goodsUrl!''}</p>
                    </div>
                    <p class="mt20 sc-sp-price text-lh1 cor-333 font-size-18"><span
                                class="cor-ff6666 font-size-34 mr10">${bo.marketPriceLow?string(',###.##')}-${bo.marketPriceHigh?string(',###.##')}</span>元/${bo.goodsUnitName!''}
                    </p>
<#--                    <a href="javascript: void(0)" class="sc-sp-link flex flex-ac flex-jc mt30"-->
<#--                       onclick="window.open('${bo.goodsUrl!''}')">-->
<#--                        <p class="cor-ff6666 font-size-16">跳转至购买商城</p>-->
<#--                        <i class="layui-icon layui-icon-right cor-ff6666 ml5"></i>-->
<#--                    </a>-->
                </div>
            </div>
            <div class="standard-details-title-ext1 mt15 clearfix">
                <i class="fl"></i>
                <p class="font-size-18 cor-3d7be6 text-lh1 fl font-bold">基本信息</p>
            </div>
            <div class="mt15 check-table">
                <table class="layui-table layui-table-nohover">
                    <colgroup>
                        <col width="180px">
                        <col width="auto">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>产地区域</td>
                        <td>${(bo.regionName)!''}</td>
                        <td>联系人</td>
                        <td>${(bo.operator)!''}</td>
                        <td>联系方式</td>
                        <td>${(bo.tel)!''}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="standard-details-title-ext1 clearfix mt35">
                <i class="fl"></i>
                <p class="font-size-18 cor-3d7be6 text-lh1 fl font-bold">产品介绍</p>
            </div>
            <div id="goodsDesc" class="jd-introduce">${bo.goodsDesc!''}</div>
        </div>
    </div>
</div>
<script>
    $(function () {
        // 滚动条美化
        $('.scroll').niceScroll({
            cursorcolor: "#000", //滚动条的颜色
            cursoropacitymax: 0.12, //滚动条的透明度，从0-1
            cursorwidth: "4px", //滚动条的宽度  单位默认px
            cursorborderradius: "2px", //滚动条两头的圆角
            autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
            zindex: 8, //给滚动条设置z-index值
        });
        // 轮播图
        var galleryThumbs = new Swiper('.gallery-right .swiper-container', {
            spaceBetween: 3,
            slidesPerView: 4,
            direction: 'vertical',
            // freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
        });
        new Swiper('.gallery-left .swiper-container', {
            spaceBetween: 3,
            allowTouchMove: false,
            direction: 'vertical',
            navigation: {
                nextEl: '.gallery-right-next',
                prevEl: '.gallery-right-pre',
                disabledClass: 'gallery-right-disabled',
            },
            thumbs: {
                swiper: galleryThumbs
            }
        });

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            $('.layui-icon-close').click(function () {
                var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
                parent.layer.close(index);  //再执行关闭
            });
        });
    })
</script>
</body>
</html>