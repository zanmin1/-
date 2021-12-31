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
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">
    <title>农家乐-列表</title>
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
    <script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP"></script>
    <script src="<%=path%>/js/uitl/common.js"></script>
</head>

<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row layer-hd posi-fixed posi-left-0 posi-top-0 posi-right-0 bg-fff">
        <div class="layui-col-xs12">
            <div class="j-search-cont layui-col-xs12 bor-btm-f0">
                <div class="layui-col-xs12 pl15 pt10 pr15 pb10">
                    <div class="layui-row border-radius-16 bor-blue1 flex flex-ac">
                        <button class="layui-btn layui-btn-ext1 notice-bor-ext1 flex flex-ac">
                            <p class="font-size-13 cor-blue3 ml15">${orgName}</p>
<%--                            <i class="layui-icon layui-icon-down cor-blue3 font-size-12 ml5"></i>--%>
                        </button>
                        <div class="layui-col-xs12 posi-rela flex1">
                            <i class="layui-icon search-icon-ext1 posi-abso search-pos2" onclick="search()"></i>
                            <input type="text" id="farmhouseName" name="farmhouseName" placeholder="请输入搜索内容" class="layui-input font-size-14 border-radius-16 bor-unset height-32 pl35">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-row">
        <div class="layui-col-xs12 pl15 pr15 pb10">
<%--            <div class="layui-col-xs12 flex flex-jb flex-ac">--%>
<%--                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农家乐</p>--%>
<%--                <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>--%>
<%--            </div>--%>
            <div class="layui-col-xs12">
                <div class="layui-row" id="tableList">

                </div>
                <div id="njlzw" class="layui-col-xs12 flex flex-clm flex-jc flex-ac">
                    <div class="data-none-ext1 img-p100">
                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                    </div>
                    <p class="font-size-17 cor-999 mt15">暂无数据</p>
                </div>
            </div>

        </div>
        <div class="drag_hide">
            <span id="loading"><i class="icon-load"></i>加载中</span>
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

    var currPage = 1;
    var pageSize = 10;

    var lastPage = 1;

    function search(){
        currPage = 1;
        lastPage = 1;
        $('#njlzw').hide()
        getList();
    }

    // 加载数据
    $(window).scroll(function(){
        var totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
        if($(document).height() <= totalheight){
            if(stop == true){
                stop = false;
                $("#mores").html('<a href="javascript:void(0);" onclick="getData();">加载更多..</a>');
                $("#loading").html('<i class="icon-load"></i>加载中');
                winHide();
                getList()
                // getTeamList();
            }
        }
    });

    $(function () {
        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();

        // 关闭弹窗
        $('.j-close-layer').closeL();

        var swiperList1 = new Swiper('.swiper-list-ext2', {
            pagination: {
                el: '.swiper-pagination',
            },
        });

        $("#farmhouseName").on('keypress', function(e) {
            var keycode = e.keyCode;
            //获取搜索框的值
            var searchContent = $(this).val();
            if (keycode == '13') {
                e.preventDefault();
                //请求搜索接口
                search();
            }
        });

        orgCode = "${orgCode}";
        $('#njlzw').hide()

        mathDis();

    });

    var orgCode;

    function getList() {
        $("#loading").html('<i class="loading_icon"></i>加载中');
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/agritainment/listData.jhtml',
            data: {
                page:currPage,
                rows:pageSize,
                farmhouseName: $("#farmhouseName").val(),
                issuStatus:'01',
                orgCode: orgCode,
                // chargeType: $("#chargeType").val(),
                // issuStatus:"1",
            },
            success: function(data) {
                if (lastPage == 1) {
                    $("#tableList").empty();
                }
                if (data != null && data.total > 0) {
                    $('#njlzw').hide()
                    var html = '';

                    // if(totalCount==0){
                    //     $("#tableList").html(html);
                    //     return;
                    // }

                    if (currPage == 1) {
                        var total = data.total;
                        var rows = data.rows.length;
                        // $("#total").html(total);
                        // $("#lala").height(25);
                        // showcounld();
                        lastPage = parseInt((total - 1) / rows) + 1;

                        // if(total == 0 || rows == 0){
                        //     $("#mores").html("");
                        //     $("#total").html(0);
                        //     $("#infonull").show();
                        // }
                        // $("#infolist").html("");
                    }

                    $.each(data.rows, function (i, val) {

                        var picUrl = val.picUrl == undefined || val.picUrl == null ? "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png" : '${imgDomain}' + val.picUrl;
                        var farmhouseName = val.farmhouseName == undefined ? "" : val.farmhouseName;
                        var serviceDesc = val.serviceDesc == undefined ? "" : removeTAG(val.serviceDesc);
                        // serviceDesc = removeTAG(serviceDesc)
                        var perCapitaConsum = val.perCapitaConsum == undefined ? "" : val.perCapitaConsum;
                        var uuid = val.uuid == undefined ? "" : val.uuid;

                        // var x = val.x == undefined ? "" : val.x;
                        // var y = val.y == undefined ? "" : val.y;
                        // if (x == '' || x == null) {
                        //     var dis = '未定位';
                        // } else {
                        //     var dis = getDistance(y, x);
                        // }

                        html +=
                            '<div onclick="detail(\'' + uuid + '\')" ' +
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
                            // '                                <p class="font-size-12 cor-999 flex flex-ac pt3"><i class="icon-pos-ext3 mr5"></i>' + dis + '</p>\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '                    </div>'


                    })
                    //关闭遮罩
                    // layer.close(submitLoad);

                    $("#tableList").append(html);
                    if (lastPage > currPage) {
                        currPage = currPage + 1;
                        stop = true;
                    } else {
                        // $("#mores").html('');
                        stop = false;
                    }
                }else {
                    $('#njlzw').show()
                }
            },
            error: function(data) {

            },
            complete : function() {
                // calcLayBdH();
                $("#loading").html('');
            }
        });


    }

    function detail(uuid){
        var options = {};
        var url = '<%=path%>/public/wap/agritainment/view.json?uuId='+ uuid;
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

        getList()
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

</script>

</html>