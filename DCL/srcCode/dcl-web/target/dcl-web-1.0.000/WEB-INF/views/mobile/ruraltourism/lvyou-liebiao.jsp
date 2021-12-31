<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!doctype html>
<html>
<head>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">

    <title>乡村旅游-景点列表</title>
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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP"></script>

</head>

<body class="bg-cor-f5">
<input type="hidden" id="orgCode" name="orgCode" value="${orgCode}">
    <div class="layui-contain">
        <div class="layui-row layer-hd posi-fixed posi-left-0 posi-top-0 posi-right-0 bg-fff">
            <div class="layui-col-xs12">
                <div class="j-search-cont layui-col-xs12 bor-btm-f0">
                    <div class="layui-col-xs12 pl15 pt10 pr15 pb10">
                        <div class="layui-row border-radius-16 bor-blue1 flex flex-ac">
                            <button class="layui-btn layui-btn-ext1 notice-bor-ext1 flex flex-ac">
                                <p  id="defaultName1"  class="font-size-13 cor-blue3 ml15"></p>
                                <i hidden   id="orgSelectReport"  class="layui-icon layui-icon-down cor-blue3 font-size-12 ml5"></i>
                            </button>
                            <div class="layui-col-xs12 posi-rela flex1">
                                <i class="layui-icon search-icon-ext1 posi-abso search-pos2"></i>
                                <input  id="attractionsName" type="search"  placeholder="请输入搜索内容" class="layui-input font-size-14 border-radius-16 bor-unset height-32 pl35">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="j-open-layer layui-col-xs12 tab-btn-ext1">--%>
<%--                <div class="layui-col-xs4">--%>
<%--                    <button class="layui-btn width-p100 bg-unset cor-80">全部景点<i class="btn-arrow-ext1 ml10"></i></button>--%>
<%--                </div>--%>
<%--                <div class="layui-col-xs4">--%>
<%--                    <button class="layui-btn width-p100 bg-unset cor-80">附近<i class="btn-arrow-ext1 ml10"></i></button>--%>
<%--                </div>--%>
<%--                <div class="layui-col-xs4">--%>
<%--                    <button class="layui-btn width-p100 bg-unset cor-80">筛选<i class="btn-arrow-ext1 ml10"></i></button>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs12 pl15 pr15 pb10 mt10">
                <div class="layui-col-xs12 pt15">
                    <div  id="listPath" class="layui-row layui-col-space15">
                    </div>
                    <!-- 暂无数据 -->
                    <div class="height-p85 flex flex-clm flex-jc flex-ac hide" id="noListPath">
                        <div class="data-none-ext1 img-p100">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                        </div>
                        <p class="font-size-17 cor-999 mt15">暂无数据</p>
                    </div>

                    <div class="layui-col-xs12 pl10 pr10" id="getMore" style="display:none;">
                        <button class="layui-btn border-radius-4 font-size-12 bg-fff width-p100 cor-80" onclick="getList();">点击加载更多</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--代码结束-->
</body>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${uiDomain}/app-assets/extend/wap-person-select/js/jquery.ffcs.personselect.js?v=1.0.007"></script>
<script src="${uiDomain}/app-assets/extend/wap-person-select/js/custom_msgClient.js"></script>
<script>

    var pageNum = 1;
    var lastPage = 1;
    var pageSize =16;

    //树插件
    var regSelectReport;

    //树相关
    var initJSONArr = [];//初始化数据
    // var orgId = $('#orgId').val();
    // var regionId = $('#regionId').val();
    var orgCode =$("#orgCode").val();//组织编码
    $("#defaultName1").html('${orgName}');

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

        layui.use(['jquery', 'element', 'table'], function () {
            var $ = layui.$,
                element = layui.element,
                table = layui.table;
        });

        //初始获取经纬度并查询一次
        mathDis();
        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();
        // 关闭弹窗
        $('.j-close-layer').closeL();

        var swiperList1 = new Swiper('.swiper-list-ext2', {
            pagination: {
                el: '.swiper-pagination',
            },
        });

        $("#attractionsName").on('keypress', function(e) {
            var keycode = e.keyCode;
            //获取搜索框的值
            var searchContent = $(this).val();
            if (keycode == '13') {
                e.preventDefault();
                //请求搜索接口
                search();
            }
        });

    });

    //查询
    function search(){
        pageNum = 1;
        lastpage = 1;
        $("#noListPath").addClass("hide");
        // $("#noListPath").removeClass("show")
        $("#getMore").hide();
        $("#listPath").empty();
        getList();

    }

    //获取更多数据
    function getMore(){
        getList();
    }
    
    function getList() {
        $("#getMore").hide();
     //   $.post('<%=path%>/dcl/attractionsManagement/listData.jhtml', {
        $.post('<%=path%>/public/wap/article/listData.jhtml', {
            page:pageNum,
            rows:pageSize,
            attractionsName: $("#attractionsName").val(),
            orgCode: orgCode,
            chargeType: $("#chargeType").val(),
            issuStatus:"1",
        }, function(data) {
            if (data != null) {
                if(data.rows){
                    var rows = data.rows.length;
                    if (pageNum == 1) {
                        var total = data.total;
                        lastpage = parseInt((total - 1) / pageSize) + 1;
                        if (total == 0 || rows == 0) {
                            $("#getMore").hide();

                            // $("#noListPath").addClass("show");
                            $("#noListPath").removeClass("hide")
                        }
                        $("#listPath").html("");
                    }
                    if (rows > 0) {
                        $("#noListPath").addClass("hide");
                        // $("#noListPath").removeClass("show")
                        // 解析数组
                        $.each(data.rows, function(i, val) {
                            var str ='';

                            var  picUrl =val.picUrl==undefined||val.picUrl==null?"${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png":'${imgDomain}'+val.picUrl;
                            var  attractionsName =  val.attractionsName ==undefined?"\t\n":val.attractionsName;
                            var  attractionsTypeName =  val.attractionsTypeName ==undefined?"":val.attractionsTypeName;
                            var  attractionsTime =  val.attractionsTime ==undefined?"":val.attractionsTime;
                            var  address =  val.address ==undefined?"":val.address;
                            var  regPath =  val.regPath ==undefined?"":val.regPath;
                            var  uuid =  val.uuid ==undefined?"":val.uuid;
                            var  x =  val.x ==undefined?"":val.x;
                            var  y =  val.y ==undefined?"":val.y;

                            // var  dis ='';
                            //
                            // if(lat==null||lat==''){
                            //     dis ="未获取位置";
                            // }else if(x==''||x==null){
                            //       dis ='未定位';
                            // }else{
                            //       dis =getDistance(y,x);
                            // }

                            var chargeTypeName ="";

                            switch (val.chargeType) {

                                case '1': chargeTypeName= ' <p class="list-tag-ext5 list-tag-ext5-bg3">免费</p>';  break;
                                case '2': chargeTypeName= ' <p class="list-tag-ext5 list-tag-ext5-bg2">部分收费</p>';  break;
                                case '3':chargeTypeName= ' <p class="list-tag-ext5 list-tag-ext5-bg1">收费</p>';  break;
                            }
                            str +=          "                        <div onclick='getDetail(\""+uuid+"\")'      class=\"layui-col-xs6\">\n" +
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



                            $("#listPath").append(str);
                        });
                        if (lastpage > pageNum) {
                            pageNum = pageNum + 1;
                            $("#getMore").show();
                        } else {
                            $("#getMore").hide();
                        }
                    }
                }else{
                    $("#getMore").hide();
                    // $("#noListPath").addClass("show");
                    $("#noListPath").removeClass("hide")
                    $("#listPath").html("");
                }
            }
        }, 'json');
    }
    
    function getDetail (uuid) {
            location.href ='<%=path%>/public/wap/article/mobileView.jhtml?id='+uuid;
    }

    var lat =null;
    var lon =null;

    var isLocation = true;

    function mathDis() {

        //改为保存到 cookie 或session  不每次获取地理位置弹窗
        // if(sessionStorage.getItem('currentLocPoint') == null){
        //
        //     var geolocation = new BMap.Geolocation();
        //
        //     //仅限 WebView  无用
        //     // geolocation.enableSDKLocation();
        //
        //     geolocation.getCurrentPosition(function(r){
        //         if(this.getStatus() == BMAP_STATUS_SUCCESS){
        //             //  console.log('您的位置：'+r.point.lng+','+r.point.lat)
        //             lat=r.point.lat;
        //             lon =r.point.lng;
        //             var currentLocPoint = {
        //                 lon:lon,
        //                 lat:lat
        //             };
        //
        //             sessionStorage.setItem('currentLocPoint',JSON.stringify(currentLocPoint));//这里不能直接写pointB因为sessionStorage里面只能存放字符串
        //
        //             getList();
        //         } else {
        //             console.log('failed'+this.getStatus())
        //             getList();
        //         }
        //     });
        //
        //  }else {
        //     var ponit = sessionStorage.getItem('currentLocPoint');
        //
        //     lat =JSON.parse(ponit).lat;
        //     lon = JSON.parse(ponit).lon;
        //
        //     getList();
        //
        // }
        getList();
    }

    function rad(d) {
        return d * Math.PI / 180.0;
    }

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
    
</script>

</html>