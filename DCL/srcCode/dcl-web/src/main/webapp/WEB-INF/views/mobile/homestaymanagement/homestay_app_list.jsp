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
    <title>乡村旅游-民宿列表</title>
    
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

    <script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${uiDomain}/app-assets/extend/wap-person-select/js/jquery.ffcs.personselect.js?v=1.0.007"></script>
    <script src="${uiDomain}/app-assets/extend/wap-person-select/js/custom_msgClient.js"></script>
</head>

<body class="bg-cor-f5">
    <input type="hidden" id="orgId" name="orgId" value="${orgId}">
    <input type="hidden" id="orgCode" name="orgCode" value="${orgCode}">
    
    <div class="layui-contain">
        <div class="layui-row layer-hd posi-fixed posi-left-0 posi-top-0 posi-right-0 bg-fff">
            <div class="layui-col-xs12">
                <div class="j-search-cont layui-col-xs12 bor-btm-f0">
                    <div class="layui-col-xs12 pl15 pt10 pr15 pb10">
                        <div class="layui-row border-radius-16 bor-blue1 flex flex-ac">
                            <button class="layui-btn layui-btn-ext1 notice-bor-ext1 flex flex-ac">
                                <p id="orgName" class="font-size-13 cor-blue3 ml15"></p>
                                <i hidden id="orgSelectReport" class="layui-icon layui-icon-down cor-blue3 font-size-12 ml5"></i>
                            </button>
                            <div class="layui-col-xs12 posi-rela flex1">
                                <i class="layui-icon search-icon-ext1 posi-abso search-pos2"></i>
                                <input type="search" id="homestayName" placeholder="请输入民宿名称" class="layui-input font-size-14 border-radius-16 bor-unset height-32 pl35">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="layui-row">
<%--            <div class="layui-col-xs12 pl15 pr15 pb10">--%>
<%--                <div class="layui-col-xs12 pt15">--%>
<%--                    <div id="dataList" class="layui-row layui-col-space15">--%>
<%--                        --%>
<%--                    </div>--%>
<%--                    <!-- 暂无数据 -->--%>
<%--                    <div class="height-p85 flex flex-clm flex-jc flex-ac" id="noDataList" style="display:none;">--%>
<%--                        <div class="data-none-ext1 img-p100">--%>
<%--                            <img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">--%>
<%--                        </div>--%>
<%--                        <p class="font-size-17 cor-999 mt35">暂无数据</p>--%>
<%--                    </div>--%>
<%--                    <div class="layui-col-xs12 pl10 pr10" id="getMoreList" style="display:none;">--%>
<%--                        <button class="layui-btn border-radius-4 font-size-12 bg-fff width-p100 cor-80" onclick="getList();">点击加载更多</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="layui-col-xs12 pl15 pr15 pb10">
                <div class="layui-col-xs12 pt15">
                    <div class="layui-row" id="dataList">

                    </div>
                    <!-- 暂无数据 -->
                    <div class="height-p85 flex flex-clm flex-jc flex-ac" id="noDataList" style="display:none;">
                        <div class="data-none-ext1 img-p100">
                            <img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">
                        </div>
                        <p class="font-size-17 cor-999 mt35">暂无数据</p>
                    </div>
                    <div class="layui-col-xs12 pl10 pr10" id="getMoreList" style="display:none;">
                        <button class="layui-btn border-radius-4 font-size-12 bg-fff width-p100 cor-80" onclick="getList();">点击加载更多</button>
                    </div>
                </div>
            </div>

<%--            <div class="layui-col-xs12 pl15 pr15 pb10">--%>
<%--                <div class="layui-col-xs12 flex flex-jb flex-ac mt10">--%>
<%--                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>乡村全景VR</p>--%>
<%--                    <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>--%>
<%--                </div>--%>
<%--                <div class="layui-col-xs12">--%>
<%--                    <div class="layui-col-xs12 bg-fff border-radius-4 mt15">--%>
<%--                        <div class="pic-wrap-ext1 notice-s6">--%>
<%--                            <div class="pic-wrap-c">--%>
<%--                                <div class="pic-wrap-i">--%>
<%--                                    <img src="../../../../statics/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-20.png">--%>
<%--                                </div>--%>
<%--                                <button class="layui-btn layui-btn-ext1 posi-md-ext1"><i class="icon-play-ext3"></i></button>--%>
<%--                            </div>--%>
<%--                            <p class="posi-abso posi-left-0 posi-right-0 posi-bottom-0 bg-cor-black1 height-34 font-size-14 cor-fff line-height-34 pl10">带你逛遍螺洲古镇</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="layui-col-xs12 bg-fff border-radius-4 mt15">--%>
<%--                        <div class="pic-wrap-ext1 notice-s6">--%>
<%--                            <div class="pic-wrap-c">--%>
<%--                                <div class="pic-wrap-i">--%>
<%--                                    <img src="../../../../statics/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-20.png">--%>
<%--                                </div>--%>
<%--                                <button class="layui-btn layui-btn-ext1 posi-md-ext1"><i class="icon-play-ext3"></i></button>--%>
<%--                            </div>--%>
<%--                            <p class="posi-abso posi-left-0 posi-right-0 posi-bottom-0 bg-cor-black1 height-34 font-size-14 cor-fff line-height-34 pl10">带你逛遍螺洲古镇</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>

<%--            <div class="layui-col-xs12 pl15 pr15 pb10">--%>
<%--                <div class="layui-col-xs12 flex flex-jb flex-ac mt10">--%>
<%--                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>乡村全景VR</p>--%>
<%--                    <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>--%>
<%--                </div>--%>
<%--                <div class="layui-col-xs12 flex flex-clm flex-jc flex-ac">--%>
<%--                    <div class="data-none-ext1 img-p100">--%>
<%--                        <img src="../../../../statics/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">--%>
<%--                    </div>--%>
<%--                    <p class="font-size-17 cor-999 mt15">暂无数据</p>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</body>

<script>
    var currentPage = 1;
    var lastPage = 1;
    var pageSize = 16;

    //树相关
    var initJSONArr = [];//初始化数据
    var orgId = $('#orgId').val();
    $("#orgName").html('${orgName}');
    var orgCode = $("#orgCode").val();//组织编码

    var imgDomain = '${imgDomain}';
    var uiDomain = '${uiDomain}';

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
                $('.layer-bd-cont').slideUp(300).siblings().fadeOut(300);
                setTimeout(function () {
                    $('.layer-bd').addClass('hide')
                }, 300);
            });
        },
    });

    $(function () {
        $("#noDataList").hide();
        getList();
        
        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();
        // 关闭弹窗
        $('.j-close-layer').closeL();

        var swiperList1 = new Swiper('.swiper-list-ext2', {
            pagination: {
                el: '.swiper-pagination',
            },
        });

        $("#homestayName").on('keypress', function(e) {
            var keycode = e.keyCode;
            //获取搜索框的值
            var searchContent = $(this).val();
            if (keycode == '13') {
                e.preventDefault();
                //请求搜索接口
                search();
            }
        });

        //类型查询条件
        orgSelectReport = $('#orgSelectReport').wapSelect (orgId, function(res) {
            if(res != null) {
                for (var i = 0, l = res.length; i < l; i++) {
                    var val =res[i].orgCode;
                    $("#orgName").html(res[i].orgName);
                    orgCode = val;
                }
            }
            searchType = "org";
            search();
        }, {
            multi: false,
            //layer: {title:'请选择组织'},
            chooseType: ['organ'],
            //theme: 'red',
            context: '${componentsDomain}',
            postParam: {
                initValue: JSON.stringify(initJSONArr)
            },
        });
    });

    //查询
    function search() {
        currentPage = 1;
        lastpage = 1;
        $("#noDataList").hide();
        $("#getMoreList").hide();
        $("#dataList").empty();
        getList();
    }

    //获取更多数据
    function getMoreList() {
        getList();
    }

    // 列表
    function getList() {
        $("#getMoreList").hide();

        $.post('<%=path%>/public/wap/homestayManagementApp/listData.jhtml', {
            currentPage: currentPage,
            pageSize: pageSize,
            orgCode: orgCode,
            homestayName: $("#homestayName").val(),
            issuStatus: "01",
        }, function(data) {
            if (data != null) {
                if(data.data) {
                    var dataLength = data.data.length;
                    if (currentPage == 1) {
                        var count = data.count;
                        lastpage = parseInt((count - 1) / pageSize) + 1;
                        if (count == 0 || dataLength == 0) {
                            $("#getMoreList").hide();
                            $("#noDataList").show();
                        }
                        $("#dataList").html("");
                    }
                    if (dataLength > 0) {
                        $("#noDataList").hide();
                        // 解析数组
                        $.each(data.data, function(i, val) {
                            var str ='';

                            var imgList = val.imgList == undefined || val.imgList == null ? "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-11.png" : val.imgList;
                            var picUrl = val.picUrl == undefined || val.picUrl == null ? "${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png" : '${imgDomain}' + val.picUrl;

                            var homestayName = val.homestayName == undefined ? "\t\n" : val.homestayName;
                            var address = val.address == undefined ? "" : val.address;
                            var uuid = val.uuid == undefined ? "" : val.uuid;

                            var mt15 = "";
                            if (i > 0) {
                                mt15 = "mt15"
                            }

                            str += '<div class="layui-col-xs12 ' + mt15 + '" onclick="getDetail(\'' + uuid + '\')">\n' +
                                '                            <div class="layui-col-xs12 bg-fff border-radius-4">\n' +
                                '                                <div class="swiper-container swiper-list-ext2">\n' +
                                '                                    <div class="swiper-wrapper">';

                            <%--// 轮播图。--%>
                            <%--if (imgList.length == 0) {--%>
                            <%--    str += '<div class="swiper-slide">\n' +--%>
                            <%--        '                                            <div class="pic-wrap-ext1 notice-s6">\n' +--%>
                            <%--        '                                                <div class="pic-wrap-c">\n' +--%>
                            <%--        '                                                    <div class="pic-wrap-i">\n' +--%>
                            <%--        '                                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">\n' +--%>
                            <%--        '                                                    </div>\n' +--%>
                            <%--        '                                                </div>\n' +--%>
                            <%--        '                                            </div>\n' +--%>
                            <%--        '                                        </div>';--%>
                            <%--} else {--%>
                            <%--    for (let i = 0; i < imgList.length; i++) {--%>
                            <%--        if (imgList[i] !== "") {--%>
                            <%--            str += '<div class="swiper-slide">\n' +--%>
                            <%--                '                                            <div class="pic-wrap-ext1 notice-s6">\n' +--%>
                            <%--                '                                                <div class="pic-wrap-c">\n' +--%>
                            <%--                '                                                    <div class="pic-wrap-i">\n' +--%>
                            <%--                '                                                        <img src="' + imgDomain + imgList[i] + '">\n' +--%>
                            <%--                '                                                    </div>\n' +--%>
                            <%--                '                                                </div>\n' +--%>
                            <%--                '                                            </div>\n' +--%>
                            <%--                '                                        </div>';--%>
                            <%--        } else {--%>
                            <%--            str += '<div class="swiper-slide">\n' +--%>
                            <%--                '                                            <div class="pic-wrap-ext1 notice-s6">\n' +--%>
                            <%--                '                                                <div class="pic-wrap-c">\n' +--%>
                            <%--                '                                                    <div class="pic-wrap-i">\n' +--%>
                            <%--                '                                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">\n' +--%>
                            <%--                '                                                    </div>\n' +--%>
                            <%--                '                                                </div>\n' +--%>
                            <%--                '                                            </div>\n' +--%>
                            <%--                '                                        </div>';--%>
                            <%--        }--%>
                            <%--    }--%>
                            <%--}--%>

                            // 封面主图。
                            str += '<div class="swiper-slide">\n' +
                                '                                            <div class="pic-wrap-ext1 notice-s6">\n' +
                                '                                                <div class="pic-wrap-c">\n' +
                                '                                                    <div class="pic-wrap-i">\n' +
                                '                                                        <img src="' + picUrl + '">\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>';

                            str += '</div>\n' +
                                '                                    <div class="swiper-pagination"></div>\n' +
                                '                                </div>\n' +
                                '                                <div class="font-size-12">\n' +
                                '                                    <p class="font-size-14 cor-4d pl10 pr10 mt10">' + homestayName + '</p>\n' +
                                '                                    <p class="font-size-12 cor-999 flex flex-ac pl10 mt10"><i class="icon-pos-ext3 mr5"></i>' + address + '</p>\n' +
                                '                                    <div class="flex flex-ac flex-jb pl10 pr15 mt10 mb10">\n' +
                                // '                                        <p class="font-size-16 cor-red5">¥199</p>\n' +
                                // '                                        <p class="font-size-14 cor-blue3 flex flex-ac"><i class="icon-house-ext1 mr5"></i><em class="pt3">房源：7</em></p>\n' +
                                '                                    </div>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                        </div>';

                            $("#dataList").append(str);
                        });
                        if (lastpage > currentPage) {
                            currentPage = currentPage + 1;
                            $("#getMoreList").show();
                        } else {
                            $("#getMoreList").hide();
                        }
                    }
                } else {
                    $("#getMoreList").hide();
                    $("#noDataList").show();
                    $("#dataList").html("");
                }
            }
        }, 'json');
    }

    function getDetail(uuid) {
        location.href = '<%=path%>/public/wap/homestayManagementApp/appView.jhtml?uuid=' + uuid;
    }
</script>
</html>