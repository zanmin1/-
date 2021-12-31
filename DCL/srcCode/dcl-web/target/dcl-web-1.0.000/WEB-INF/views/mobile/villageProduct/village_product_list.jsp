<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>一村一品</title>
    <!-- 网格选择插件 -->
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
    <style>
        .border-radius-4 {
            min-height: 215px;
            max-height: 215px;
        }
    </style>
</head>
<body class="bg-cor-f5">
<div class="layui-contain">
    <!--查询条件-->
    <div class="layui-row layer-hd posi-fixed posi-left-0 posi-top-0 posi-right-0 bg-fff">
        <div class="layui-col-xs12">
            <div class="j-search-cont layui-col-xs12 bor-btm-f0">
                <div class="layui-col-xs12 pl15 pt10 pr15 pb10">
                    <div class="layui-row border-radius-16 bor-blue1 flex flex-ac">
<%--                        <button class="layui-btn layui-btn-ext1 notice-bor-ext1 flex flex-ac" id="infoOrgCodeCtr">--%>
<%--                            <input type="hidden" name="regionCode" id="regionCode" value="${regionCode}">--%>
<%--                            <p class="font-size-13 cor-blue3 ml15" id="regionName">${regionName}</p>--%>
<%--                            <i class="layui-icon layui-icon-down cor-blue3 font-size-12 ml5"></i>--%>
<%--                        </button>--%>
                        <div class="layui-col-xs12 posi-rela flex1">
                            <i class="layui-icon search-icon-ext1 posi-abso search-pos2" onclick="search()"></i>
                            <input type="text" placeholder="请输入商品名称" name="goodsName" id="goodsName" onchange="search()"
                                   class="layui-input font-size-14 border-radius-16 bor-unset height-32 pl35">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-row">
        <div class="layui-col-xs12 pl15 pr15 pb10 pt50">
            <div class="layui-col-xs12 pt15">
                <div class="layui-row layui-col-space15" id="infoList"></div>
            </div>
            <div class="layui-col-xs12 flex flex-clm flex-jc flex-ac" style="display: none" id="infoNull">
                <div class="data-none-ext1 img-p100">
                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                </div>
                <p class="font-size-17 cor-999 mt15">暂无数据</p>
            </div>
        </div>
    </div>
</div>
<!--代码结束-->
</body>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/extend/wxjsapi/js/layer/layer.js" type="text/javascript"></script>
<script src="${uiDomain}/app-assets/extend/wxjsapi/js/layer/layer_wap.js" type="text/javascript"></script>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
<%--<script src="${uiDomain}/app-assets/extend/app-address/geo_address_plugin.js"></script>--%>
<%--<script src="${uiDomain}/app-assets/extend/wap-person-select/js/custom_msgClient.js"></script>--%>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>
    var page = 1, limit = 10, lastPage = 1;
    function number_format(number, decimals, dec_point, thousands_sep) {
        number = (number + '').replace(/[^0-9+-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point;

        var s = ('' + n).split('.');
        var re = /(-?\d+)(\d{3})/;
        while (re.test(s[0])) {
            s[0] = s[0].replace(re, "$1" + sep + "$2");
        }

        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('');
        }

        if ((s[1] || '').length == 0) {
            return s.join('');
        } else {
            return s.join(dec);
        }
    }

    function search() {
        $("#infoList").empty();
        page = 1;
        lastPage = 1;
        getList();
    }

    function bodyScroll(event){
        event.preventDefault();
    }

    function scrControl(t) {
        if (t == 0) { //禁止滚动
            document.body.addEventListener('touchmove', this.bodyScroll, {passive: false});
        } else if (t == 1) { //开启滚动
            document.body.removeEventListener('touchmove', this.bodyScroll, {passive: false});
        }
    }

    function getList() {
        var idx = layer.load(1);
        var loadW = (document.body.clientWidth - 32) / 2;
        $(".layui-layer-loading").css("left", loadW);
        scrControl(0);
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/villageProductApp/listData.json',
            data: {
                <%--userOrgCode: '${userOrgCode}',--%>
                <%--tokenKey: '${tokenKey}',--%>
                shelf: 1,
                goodsName: $("#goodsName").val(),
                // regionCode: $("#regionCode").val(),
                page: page,
                limit: limit,
            },
            success: function (data) {
                layer.close(idx);// 关闭遮罩
                scrControl(1);
                if (data != null && data.data) {
                    if (page == 1) {
                        lastPage = parseInt((data.count - 1) / limit) + 1;
                        if (data.count == 0) {
                            $("#infoNull").show();
                        }
                    }
                    if (data.data.length > 0) {
                        $("#infoNull").hide();
                        for (var i = 0; i < data.data.length; i++) {
                            var item = data.data[i];
                            $('#infoList').append(
                                '<div class="layui-col-xs6" onclick="showDetail(\'' + item.uuid + '\')">' +
                                '   <div class="layui-col-xs12 bg-fff border-radius-4">' +
                                '       <div class="pic-wrap-ext1 notice-s3">' +
                                '           <div class="pic-wrap-c">' +
                                '               <div class="pic-wrap-i border-radius-2">' +
                                '                   <img src="${imgDomain}' + item.picUrl + '">' +
                                '               </div>' +
                                '           </div>' +
                                '           <p class="font-size-14 cor-4d text-line-c1 pl10 pr10 mt5">' + item.goodsName + '</p>' +
                                '           <p class="font-size-12 cor-b3 pl10 pr10 mt5"><em class="cor-red5 mr8">¥' + number_format(item.marketPriceLow, 2, ".", ",") + '</em>元/' + item.goodsUnitName + '</p>' +
                                '           <div class="flex flex-ac flex-jb pl10 pr10 mt5 mb10">' +
                                '               <p class="font-size-12 cor-blue3 flex flex1 flex-ac pt3 overflow-h">' +
                                '                   <i class="icon-pos-ext1 mr10"></i>' +
                                '                   <em class="flex1 text-line-c1">' + item.address + '</em>' +
                                '               </p>' +
                                '               <p class="list-tag-ext3 font-size-12 cor-green3">' + item.goodsTypeName + '</p>' +
                                '           </div>' +
                                '       </div>' +
                                '   </div>' +
                                '</div>'
                            );
                        }
                    }
                } else {
                    $("#infoNull").show();
                }
            },
        });
    }

    $(window).scroll(function () {
        var totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
        if (Math.ceil($(document).height()) <= Math.ceil(totalheight)) {
            if (lastPage > page) {
                page = page + 1;
                getList();
            }
        }
    });

    getList();

    // 网格选择器
    <%--$("#infoOrgCodeCtr").geoAddressPlugin({--%>
    <%--    userOrgCode: '${regionCode}',--%>
    <%--    startCode: '${regionCode}',--%>
    <%--    domain: '${componentsDomain}',// 公共组件 domain, 必填--%>
    <%--    address_type: "GRID",--%>
    <%--    show_searchBar: "false",--%>
    <%--}, function (res) {// 回调--%>
    <%--    if (res) {--%>
    <%--        $("#regionCode").val(res.code);--%>
    <%--        $("#regionName").text(res.name);--%>
    <%--        search();--%>
    <%--    }--%>
    <%--});--%>

    function showDetail(uuid) {
        window.location.href = '<%=path%>/public/wap/villageProductApp/view.jhtml?uuid=' + uuid;
            <%--+ 'openNewPager=true&tokenKey=${tokenKey}&userOrgCode=${userOrgCode}&--%>
    }
</script>
</html>