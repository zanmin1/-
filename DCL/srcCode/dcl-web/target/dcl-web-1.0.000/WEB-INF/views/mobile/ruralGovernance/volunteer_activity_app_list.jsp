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
    <title>活动列表</title>

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
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index2.css"/>

    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=3.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP"></script>

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
<%--    <div class="layui-row layer-hd posi-fixed posi-left-0 posi-top-0 posi-right-0 bg-fff">--%>
<%--        <div class="layui-col-xs12">--%>
<%--            <div class="j-search-cont layui-col-xs12 bor-btm-f0">--%>
<%--                <div class="layui-col-xs12 pl15 pt10 pr15 pb10">--%>
<%--                    <div class="layui-row border-radius-16 bor-blue1 flex flex-ac">--%>
<%--                        <button class="layui-btn layui-btn-ext1 notice-bor-ext1 flex flex-ac">--%>
<%--                            <p id="orgName" class="font-size-13 cor-blue3 ml15"></p>--%>
<%--                            <i hidden id="orgSelectReport"--%>
<%--                               class="layui-icon layui-icon-down cor-blue3 font-size-12 ml5"></i>--%>
<%--                        </button>--%>
<%--                        <div class="layui-col-xs12 posi-rela flex1">--%>
<%--                            <i class="layui-icon search-icon-ext1 posi-abso search-pos2"></i>--%>
<%--                            <input type="search" id="title" placeholder="请输入标题"--%>
<%--                                   class="layui-input font-size-14 border-radius-16 bor-unset height-32 pl35">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="layui-row">
        <div class="xczl-box1 layui-row bg-fff">
            <div class="layui-row bg-fff">
                <div class="layui-col-xs12 pl15 pr15" id="dataList">

                </div>
                <!-- 暂无数据 -->
                <div class="height-p85 flex flex-clm flex-jc flex-ac" id="noDataList" style="display:none;">
                    <div class="data-none-ext1 img-p100">
                        <img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">
                    </div>
                    <p class="font-size-17 cor-999 mt35">暂无数据</p>
                </div>
                <div class="layui-col-xs12 pl10 pr10" id="getMoreList" style="display:none;">
                    <button class="layui-btn border-radius-4 font-size-12 bg-fff width-p100 cor-80"
                            onclick="getList();">点击加载更多
                    </button>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- 弹窗 -->
<div class="div-tc hide">
    <div class="div-tc-box">
        <i class="div-tc-box-i layui-icon layui-icon-close font-bold"></i>
        <p class="font-size-18 cor-4d font-bold text-align-c text-lh1">很遗憾</p>
        <p class="text-lh1 font-size-16 cor-4d text-align-c mt30 mb15">非志愿者无法参与积分活动！</p>
        <div class="text-align-c" id="zyzzc">
            <button class="text-lh1 layui-btn xczl-buttoms font-size-14 layui-this pt10 pb10">前往注册志愿者</button>
        </div>
    </div>
</div>
</body>

<script>
    var page = 1;
    var pageSize = 6;
    var lastpage = 1
    //树相关
    var initJSONArr = [];//初始化数据
    var orgCode = $("#orgCode").val();//组织编码

    $.fn.extend({
        // 页面高度计算
        heightC: function () {
            var _this = this;
            var paddingT = $('.layer-hd').outerHeight();
            var navCH = $(window).outerHeight() - paddingT;
            $(_this).css({'paddingTop': paddingT + 'px'});
            $('.nav-chidren-h1').css({'height': navCH + 'px'});
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
        getUrl()
        getList();

        // 计算页面高度，没有头部菜单时可不执行
        $('.layui-contain').heightC();
        // 关闭弹窗
        $('.j-close-layer').closeL();


    });
    layui.use('layer', function () {
        var layer = layui.layer;
    });
    $(".layui-icon-close").on("click", function () {
        $(".div-tc").addClass('hide');
        console.log("back")
    })

    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var type = ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type) {
            return 'spt'
        } else {
            return 'xygj'
        }
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

    //查询
    function search() {
        page = 1;
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
    function getUrl() {
        var platform = isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType: 'xczl',
                orgCode: "${orgCode}",
                type: '7',  //导航栏
                platform: platform,
            },
            success: function (data) {
                var html = ''
                var myRegionCode = '${orgCode}'
                if(myRegionCode.length > 10){
                    myRegionCode = myRegionCode.substring(0,9)
                }
                if (data != null) {
                    var dvModulars = data.dvModulars
                    if (dvModulars != null) {
                        for (var j = 0; j < dvModulars.length; j++) {
                            if (j === 0) {
                                var modularContents = dvModulars[j].modularContents
                                //0志愿者注册，1通知公告，2三务公开,3随手拍,4积分活动,5积分商城
                                var url = [null, null, null, null, null, null]
                                for (var l = 0; modularContents && l < modularContents.length && l <= 5; l++)
                                    if (modularContents[l]) {
                                        url[l] = modularContents[l].url
                                    }
                                var zyzzc = ''
                                zyzzc += `<button class="text-lh1 layui-btn xczl-buttoms font-size-14 layui-this pt10 pb10" onclick="jump('` + url[0] + `&fromRegionCode=`+myRegionCode+`')">前往注册志愿者</button>`
                                $("#zyzzc").html(zyzzc)
                            }
                        }
                    }
                }
            },
            error: function (data) {

            },
            complete: function () {
            }
        });
    }

    // 列表
    function getList() {
        $("#getMoreList").hide();
        // var gmisDomain = 'http://my.v6.aishequ.org:8130'
        // var url = gmisDomain + '/gmis/techBenefitsFarmersApp/getExpertsForJsonp.json'
        var url = '${$WECHAT_DOMAIN}/public/wap/ruralGovernanceControllerApp/listDataForJsonp.json';

        var map = {
            page: page,
            rows: pageSize,
            title: $("#title").val(),
            regionCode: "${orgCode}",
        };
        $.ajax({
            type: "GET",
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data != null) {
                    if (data.rows) {
                        var dataLength = data.rows.length;
                        var count = data.total
                        if (page == 1) {
                            lastpage = parseInt((count - 1) / pageSize) + 1;
                            if (dataLength == 0) {
                                $("#getMoreList").hide();
                                $("#noDataList").show();
                                $("#dataList").html("");
                            }
                        }
                        if (dataLength > 0) {
                            $("#noDataList").hide();
                            // 解析数组
                            $.each(data.rows, function (i, val) {
                                var str = '';
                                var photo = val.attPath == null ? '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext2.png' : '${$IMG_DOMAIN}' + val.attPath
                                var signTimeStartStr = val.signTimeStartStr.substring(0, 10);
                                var signTimeEndStr = val.signTimeEndStr.substring(0, 10);
                                var content = val.content == null ? ' ' : val.content
                                var title = val.title == null ? ' ' : val.title
                                var serviceTypeCN = val.serviceTypeCN == null ? ' ' : val.serviceTypeCN
                                var limitPartiCount = val.limitPartiCount == null ? '0' : val.limitPartiCount
                                var currentPartiCount = val.currentPartiCount == null ? '0' : val.currentPartiCount

                                var now = new Date();
                                var signStatus = '';
                                if (new Date(val.signTimeStart) > now) {
                                    signStatus =
                                        `<i class="xczl-apply-type xczl-wbm text-align-c line-height-19 cor-fff border-radius-4">未开始</i>`
                                } else if (new Date(val.signTimeEnd) > now) {
                                    signStatus =
                                        `<i class="xczl-apply-type xczl-ybm text-align-c line-height-19 cor-fff border-radius-4">报名中</i>`
                                }
                                if (new Date(val.signTimeEnd) < now) {
                                    signStatus =
                                        `<i class="xczl-apply-type xczl-ygq text-align-c line-height-19 cor-fff border-radius-4" style="background-color: grey">已结束</i>`
                                }

                                if (limitPartiCount == currentPartiCount) {
                                    signStatus =
                                        `<i class="xczl-apply-type xczl-ybm text-align-c line-height-19 cor-fff border-radius-4" style="background-color: grey">已结束</i>`
                                }

                                str +=
                                    `
                            <div class="layui-col-xs12 bg-fff border-radius-4 flex mt15" onclick="activityDetail(` + val.id + `)">
                            <div class="width-120">
                                <div class="pic-wrap-ext1 notice-s7">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-2">
                                            <img src="` + photo + `">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex1 flex flex-clm flex-jc ml15 mr10 overflow-h">
                                <div class="flex">
                                    <p class="flex1 mr5 line-height-19 cor-4d font-size-14 text-line-c1">` + title + `</p>
                                ` + signStatus + `
                                </div>
                                <p class="font-size-12 cor-blue3 text-line-c1 mt5">服务类型: <span>` + serviceTypeCN + `</span></p>
                                <p class="font-size-12 cor-4d text-line-c2 mt10">` + content + `</p>
                                <p class="font-size-12 cor-4d text-line-c2 mt10">招募人数: ` + limitPartiCount + `
                                <span class="font-size-12 cor-4d mt10"> &nbsp;&nbsp;已招募人数: <span style='color: red'>` + currentPartiCount + `</span></span></p>
                                <p class="font-size-12 cor-999 text-line-c1 mt10">时间: ` + signTimeStartStr + ` — ` + signTimeEndStr + `</p>
                            </div>
                        </div>
                            `

                                $("#dataList").append(str);
                            });
                            if (lastpage > page) {
                                page = page + 1;
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
            }
        });
    }

    function activityDetail(id) {
        var url = '${$WECHAT_DOMAIN}/wap/volunteer/activity/signUp/detail.mhtml?id=' + id;
        $.ajax({
            type: 'post',
            url: '${$WECHAT_DOMAIN}/wap/volunteer/user/isVolunteer.mhtml?jsonpcallback=""',
            data: {
                token:'${token}'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                if(data && (data.volunteer == null || data.volunteer == 'null')){
                    $(".div-tc").removeClass('hide');
                }else {
                    jump(url);
                }

            },
            error: function(data) {
                console.log('获取志愿者信息数据连接超时！');
            },
            complete: function() {
            }
        });
    }
</script>
</html>