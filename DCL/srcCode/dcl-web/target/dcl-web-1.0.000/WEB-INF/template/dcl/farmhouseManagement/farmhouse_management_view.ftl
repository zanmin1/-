<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>全屏弹窗-农家乐详情</title>
<#include "/component/layuiCommonHead.ftl" />
<#include "/component/uploadFileCommon.ftl" />

    <!-- swiper样式 -->
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css" />
    <!--本部样式-->

    <script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>

    <!-- 新地图标注js start -->
<#--    <script type="text/javascript" src="${uiDomain}/js/global.js"></script>-->
<#--    <script type="text/javascript" src="${GIS_URL}/js/gis/map/gisMap.js"></script>-->
    <script type="text/javascript" src="${GIS_URL}/js/gis/base/mapMarker.js"></script>

    <!-- 地图标注点样式 start -->
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/normal.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/easyuiExtend.css" />
    <script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${uiDomain!''}/js/jquery.easyui.patch.js"></script><!--用于修复easyui-1.4中easyui-numberbox失去焦点后不能输入小数点的问题-->
    <script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
    <!-- 新地图标注js end -->
    <script src="${rc.getContextPath()}/js/html5media.min.js"></script>
</head>
<body class="scroll">
<div class="bs h100 layui-form padding-ext1 layui-form">
    <div class="layer-title-ext1 clearfix">
        <div class="layer-title-ext1-left clearfix fl">
            <p class="text-lh1 font-size-14 fl font-bold">农家乐详情</p>
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
                                    <#if  item.picUrl?? && item.img=='img'>
                                        <div class="swiper-slide img100">
                                            <img src="${imgDomain}${item.picUrl}">
                                        </div>
                                    </#if>
                                    <#if  item.picUrl?? && item.img=='video'>
                                        <div class="swiper-slide img100">
                                            <video src="${imgDomain}${item.picUrl}"  type="application/x-shockwave-flash"  style="width: 100%;height: 100%;" controls="controls"   autostart="false" loop="true" />
                                        </div>
                                    </#if>

                                </#list>
                            <#else>
                                <div class="swiper-slide img100">
                                    <div class="standard-default-pic-ext1"></div>
                                </div>
                            </#if>

                            <#--                                    <div class="swiper-slide img100">-->
                            <#--                                        <img src="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/images/details-pic2.png">-->
                            <#--                                    </div>-->
                            <#--                                    <div class="swiper-slide img100">-->
                            <#--                                        <img src="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/images/details-pic3.png">-->
                            <#--                                    </div>-->
                            <#--                                    <div class="swiper-slide img100">-->
                            <#--                                        <img src="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/images/details-pic4.png">-->
                            <#--                                    </div>-->
                            <#--                                    <div class="swiper-slide img100">-->
                            <#--                                        <img src="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/images/details-pic5.png">-->
                            <#--                                    </div>-->
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
                                    <#if  item.picUrl?? && item.img=='img'>
                                        <div class="swiper-slide img100">
                                            <img src="${imgDomain}${item.picUrl}">
                                        </div>
                                    </#if>
                                    <#if  item.picUrl?? && item.img=='video'>
                                        <div class="swiper-slide img100">
                                            <video src="${imgDomain}${item.picUrl}" style="width: 100%;height: 100%;"   autostart="false"  />
                                        </div>
                                    </#if>

                                </#list>
                            <#else>
                                <div class="swiper-slide img100">
                                    <div class="standard-default-pic-ext1"></div>
                                </div>
                            </#if>
                            </div>
                        </div>
                    </div>
                </div>
                <#--<div class="xc-dt-right fr">
                    <p class="xc-dtr-title text-line-c1 font-size-28 cor-333 font-bold ">${(bo.farmhouseName)!''}</p>
                    <div class="clearfix mt15 xc-dtr-box1">
                        <p class="font-size-16 cor-3d7be6 line-height-26 fl">人均消费：【${(bo.perCapitaConsum)!''}】</p>
                    <#if (bo.issuStatus)=='01'>
                        <i class="fl xc-dtrb1-icon xc-dtrb1-sj font-bold font-size-14 cor-fff line-height-26 text-align-c">已发布</i>

                    </#if >
                    <#if (bo.issuStatus)=='02'>
                        <i class="fl xc-dtrb1-icon xc-dtrb1-bsj font-bold font-size-14 cor-fff line-height-26 text-align-c">未发布</i>
                    </#if >
                    </div>
                    <div class="xc-dtr-box2 flex" style="min-height: 30px">
                        <p class="font-size-14 cor-333 line-height-20">经营人：</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20" style="margin-left: 0">${(bo.operator)!''}</p>
                        <p class="font-size-14 cor-333 line-height-20">联系方式：</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20" style="margin-left: 0">${(bo.tel)!''}</p>
                    </div>
                    <div class="xc-dtr-box2 flex" style="min-height: 30px">
                        <p class="font-size-14 cor-333 line-height-20">所属区域：</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20" style="margin-left: 0">${(bo.orgName)!''}</p>
                        <br />
                        <p class="font-size-14 cor-333 line-height-20">地址：</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20" style="margin-left: 0">${(bo.address)!''}</p>
                    </div>
                    <a href="javascript:void(0);" class="xc-dtr-adress line-height-20 font-size-14 cor-3d7be6 ml15">
                        <p id='a'></p>
                    </a>
                </div>-->
                <div class="xc-dt-right fr">
                    <p class="xc-dtr-title font-size-28 cor-333 font-bold "title="${(bo.farmhouseName)!''}">${(bo.farmhouseName)!''}</p>
                    <div class="clearfix mt15 xc-dtr-box1">
                        <p class="font-size-16 cor-3d7be6 line-height-26 fl">【农家乐】</p>
                        <i class="fl xc-dtrb1-icon xc-dtrb1-sj font-bold font-size-14 cor-fff line-height-26 text-align-c">${(bo.issuStatusStr)!''}</i>
                        <!-- <i class="fl xc-dtrb1-icon xc-dtrb1-bsj font-bold font-size-14 cor-fff line-height-26 text-align-c">不上架</i> -->
                    </div>
                    <div class="xc-dtr-box2 xc-sp-box1 flex mt40">
                        <p class="font-size-14 cor-333 line-height-20">地址</p>
                        <p class="flex1 ml20 font-size-14 cor-999 line-height-20" title="${(bo.address)!''}">${(bo.address)!''}</p>
                        <a href="javascript:void(0);" class="xc-dtr-adress line-height-20 font-size-14 cor-3d7be6 ml15">
                            <p id='a'></p>
                        </a>
                    </div>
                    <p  class="mt20 sc-sp-price text-lh1 cor-333 font-size-37" style="margin-top: 40px;"><span class="cor-ff6666 font-size-34 mr10">${(bo.perCapitaConsum)!''}</span></p>

                </div>
            </div>
            <div class="layer-content-ext1 layer-box-bg-ext1 padding-ext2" style="height: 26%">
                <div class="h100 scroll pl15 pr15">
                    <div class="standard-table-ext1 mt20 layui-table-td-blue">
                        <table class="layui-table  layui-table-th-c layui-table-td-c layui-th-bold layui-table-nohover">
                            <colgroup>
                                <col width="30%">
                                <col width="30%">
                                <col width="30%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>所属区域</th>
                                <th>经营人</th>
                                <th>联系方式</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${(bo.orgName)!''}</td>
                                <td>${(bo.operator)!''}</td>
                                <td>${(bo.tel)!''}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <div class="standard-details-title-ext1 clearfix mt35">
                <i class="fl"></i>
                <p class="font-size-18 cor-3d7be6 text-lh1 fl font-bold">农家乐介绍</p>
            </div>
            <div id="serviceDesc"  class="jd-introduce">
            ${(bo.serviceDesc)!''}
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    var gridId = "${gridId}";
    var markerOperation ='${(markerOperation)!}';
    var module = '${(markerType)!}';
    var mapMarker= new MapMarker({
        el:"a",//div挂载点
        context:'${GIS_URL}',//gis域名
        width:650,//弹框宽度，可以不传，默认480px
        height:500,//弹框高度，可以不传，默认360px
        data:{ //业务数据
            id:"${(bo.uuid)!}",
            //	name : $("#name").val(),//业务名称，地图定位显示时的标题
            markerType :module,//模块类型
            markerOperation :markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
            gridId : gridId,//网格标识，用于打开地图初始的默认位置
            type: "UUID",//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
        },
        done:function (data) {//弹框确认回调，已回填了xyz到页面元素
            if(data){
                // $("#t_x").val(data.x);
                // $("#t_y").val(data.y);
                // $("#t_z").val(data.z);
            }
        }
    });
</script>

<script>
    $(function(){

        var aaa =

                // 滚动条美化
                $('.scroll').niceScroll({
                    cursorcolor: "#000", //滚动条的颜色
                    cursoropacitymax: 0.12, //滚动条的透明度，从0-1
                    cursorwidth: "4px", //滚动条的宽度  单位默认px
                    cursorborderradius: "2px", //滚动条两头的圆角
                    autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
                    zindex: 8, //给滚动条设置z-index值
                });
        // $('.scroll').scrollTop( $('.scroll')[0].scrollHeight);
        // 轮播图
        var galleryThumbs = new Swiper('.gallery-right .swiper-container', {
            spaceBetween: 3,
            slidesPerView: 4,
            direction : 'vertical',
            // freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
        });
        var galleryTop = new Swiper('.gallery-left .swiper-container', {
            spaceBetween: 3,
            allowTouchMove: false,
            direction : 'vertical',
            navigation: {
                nextEl: '.gallery-right-next',
                prevEl: '.gallery-right-pre',
                disabledClass: 'gallery-right-disabled',
            },
            thumbs: {
                swiper: galleryThumbs
            }
        });

        // 内容切换
        $('.sd-title-ext3').on('click','i',function(){
            $(this).addClass('active').siblings().removeClass('active');
            var iIndex = $(this).index();
            $('.jd-pl-content').children('.jd-plc-box').eq(iIndex).removeClass('hide').siblings().addClass('hide');
            $('.scroll').getNiceScroll().resize();
        })

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer'], function () {
            var form = layui.form,
                    table = layui.table,
                    laydate = layui.laydate,
                    laytpl = layui.laytpl,
                    element = layui.element,
                    layer = layui.layer;


            // 关闭弹窗
            $('.layui-icon-close').click(function(){
                var  index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
                parent.layer.close(index);  //再执行关闭
            })
        })
    })
</script>
</body>
</html>