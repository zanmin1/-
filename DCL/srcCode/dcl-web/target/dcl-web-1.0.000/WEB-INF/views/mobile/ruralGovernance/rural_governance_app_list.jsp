<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>乡村治理</title>
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
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css"/>

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
</head>
<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 bg-fff pl15 pr15 pb15">
            <div class="xczl-search mt10">
            </div>
            <div class="mt15 flex xczl-btn-box" id="navs">
                <div class="xczl-bb-left">
                    <i class="xczl-bb-shadow xczl-bb-shadow1 posi-abso"></i>
                    <a href="javascript:void(0);"
                       onclick="jump('null')"
                       class="xczl-bb-bj1 height-p100 posi-rela flex flex-clm flex-ac flex-jc">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff mt15">随手拍</p>
                    </a>
                </div>
                <div class="xczl-bb-right flex1 ml15">
                    <div class="xczl-bbr-top">
                        <i class="xczl-bb-shadow xczl-bb-shadow2 posi-abso"></i>
                        <a href="javascript:void(0);"
                           onclick="jump('null')"
                           class="xczl-bb-bj2 height-p100 posi-rela flex flex-ac flex-jc">
                            <i></i>
                            <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">我的积分</p>
                        </a>
                    </div>
                    <div class="xczl-bbr-bottom mt15">
                        <i class="xczl-bb-shadow xczl-bb-shadow3 posi-abso"></i>
                        <a href="javascript:void(0);"
                           onclick="jump('null')"
                           class="xczl-bb-bj3 height-p100 posi-rela flex flex-ac flex-jc">
                            <i></i>
                            <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">书记信箱</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="mt15 xczl-zyz-box" id="register">
                <i class="xczl-bb-shadow xczl-bb-shadow4 posi-abso"></i>
                <a href="javascript:void(0);"
                   onclick="jump('null')"
                   class="height-p100 flex flex-ac xczl-bb-bj4">
                    <i></i>
                    <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff flex1 text-align-c">志愿者注册</p>
                </a>
            </div>
        </div>
        <div class="layui-col-xs12">
            <div class="flex flex-ac flex-jb height-44 pl15 pr15 bs">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>活动列表</p>
                <a href="javascript:void(0);" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"
                                                                                  onclick="moreActivity()"></i></a>
            </div>
            <div class="xczl-box1 layui-row bg-fff">
                <div class="layui-row bg-fff">
                    <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc posi-abso posi-top-0"
                         id="tbNone">
                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15" id="tbData">
                        <%--                <div class="layui-col-xs12 bor-btm-f0 bg-fff flex mt15 pb15">--%>
                        <%--                    <div class="width-120">--%>
                        <%--                        <div class="pic-wrap-ext1 notice-s7">--%>
                        <%--                            <div class="pic-wrap-c">--%>
                        <%--                                <div class="pic-wrap-i border-radius-2">--%>
                        <%--                                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext2.png">--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>
                        <%--                    <div class="flex1 ml15 overflow-h">--%>
                        <%--                        <div class="flex">--%>
                        <%--                            <p class="flex1 mr5 line-height-19 cor-4d font-size-14 text-line-c1">某某活动名称</p>--%>
                        <%--                            <i class="xczl-apply-type xczl-wbm text-align-c line-height-19 cor-fff border-radius-4">未报名</i>--%>
                        <%--                        </div>--%>
                        <%--                        <p class="font-size-12 cor-blue3 text-line-c1 mt5">活动积分: <span>12</span></p>--%>
                        <%--                        <p class="font-size-12 cor-4d text-line-c2 mt10">活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介</p>--%>
                        <%--                        <p class="font-size-12 cor-999 text-line-c1 mt10">时间: 2021-10-10 — 2021-10-12</p>--%>
                        <%--                    </div>--%>
                        <%--                </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>
    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type){
            return 'spt'
        }else {
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


    function activityDetail(id) {
        var url = '${$WECHAT_DOMAIN}/wap/volunteer/activity/signUp/detail.mhtml?id=' + id;
        jump(url)
    }

    function moreActivity() {
        var url = '<%=path%>/public/wap/ruralGovernanceControllerApp/moreIndex.json';
        <%--var url = '<%=path%>/public/wap/szshAppHome/indexV0101.json';--%>
        <%--var url = '<%=path%>/public/wap/villageAdministrationApp/indexV0101.json';--%>
        // location.href = url
        jump(url)
    }

    function loadActivity() {
        var map = {
            page: 1,
            rows: 3,
            regionCode: "${orgCode}"
            // regionCode:"660101001001"
        };
        var url = '${$WECHAT_DOMAIN}/public/wap/ruralGovernanceControllerApp/listDataForJsonp.json';
        $.ajax({
            type: 'GET',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data.total > 0) {
                    var rows = data.rows
                    var Activitys = ''

                    for (let i = 0; i < rows.length; i++) {
                        // 将职称名称根据;拆分成多个i标签显示

                        var photo = rows[i].attPath == null ? '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext2.png' : '${$IMG_DOMAIN}' + rows[i].attPath
                        var signTimeStartStr = rows[i].signTimeStartStr.substring(0, 10);
                        var signTimeEndStr = rows[i].signTimeEndStr.substring(0, 10);
                        var content = rows[i].content == null ? ' ' : rows[i].content
                        var title = rows[i].title == null ? ' ' : rows[i].title
                        var serviceTypeCN = rows[i].serviceTypeCN == null ? ' ' : rows[i].serviceTypeCN
                        var limitPartiCount = rows[i].limitPartiCount == null ? '0' : rows[i].limitPartiCount
                        var currentPartiCount = rows[i].currentPartiCount == null ? '0' : rows[i].currentPartiCount

                        var now = new Date();
                        var signStatus = '';
                        if (new Date(rows[i].signTimeStart) > now) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-wbm text-align-c line-height-19 cor-fff border-radius-4">未开始</i>`
                        } else if (new Date(rows[i].signTimeEnd) > now) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-ybm text-align-c line-height-19 cor-fff border-radius-4">报名中</i>`
                        }
                        if (new Date(rows[i].signTimeEnd) < now) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-ygq text-align-c line-height-19 cor-fff border-radius-4" style="background-color: grey">已结束</i>`
                        }
                        if (limitPartiCount == currentPartiCount) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-ybm text-align-c line-height-19 cor-fff border-radius-4" style="background-color: grey">已结束</i>`
                        }

                        Activitys +=
                            `
                            <div class="layui-col-xs12 bor-btm-f0 bg-fff flex mt15 pb15" onclick="activityDetail(` + rows[i].id + `)">
                            <div class="width-120">
                                <div class="pic-wrap-ext1 notice-s7">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-2">
                                            <img src="` + photo + `">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex1 ml15 overflow-h">
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
                    }
                    $("#tbData").html(Activitys)
                } else {
                    $('#tbNone').removeClass('hide');
                    $('#tbData').hide();
                }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        })
    }

    $(function () {
        loadActivity()
        getUrl()
    })
    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }

    // 公告下面的按钮
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
                if (data != null) {
                    var dvModulars = data.dvModulars
                    if (dvModulars != null) {
                        for (var j = 0; j < dvModulars.length; j++) {
                            if (j === 0) {
                                var modularContents = dvModulars[j].modularContents
                                var url0 = null,
                                    url1 = null,
                                    url2 = null,
                                    url3 = null
                                if (modularContents[0]) {
                                    url0 = modularContents[0].url
                                }
                                if (modularContents[1]) {
                                    url1 = modularContents[1].url
                                }
                                if (modularContents[2]) {
                                    url2 = modularContents[2].url
                                }
                                if (modularContents[3]) {
                                    url3 = modularContents[3].url
                                }
                                html +=
                                    `  <div class="xczl-bb-left">
                                            <i class="xczl-bb-shadow xczl-bb-shadow1 posi-abso"></i>
                                            <a href="javascript:void(0);" onclick="jump('` + url0 + `')"
                                               class="xczl-bb-bj1 height-p100 posi-rela flex flex-clm flex-ac flex-jc">
                                                <i></i>
                                                <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff mt15">随手拍</p>
                                            </a>
                                        </div>
                                        <div class="xczl-bb-right flex1 ml15">
                                            <div class="xczl-bbr-top">
                                                <i class="xczl-bb-shadow xczl-bb-shadow2 posi-abso"></i>
                                                <a href="javascript:void(0);" onclick="jump('` + url1 + `')"
                                                   class="xczl-bb-bj2 height-p100 posi-rela flex flex-ac flex-jc">
                                                    <i></i>
                                                    <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">我的积分</p>
                                                </a>
                                            </div>
                                            <div class="xczl-bbr-bottom mt15">
                                                <i class="xczl-bb-shadow xczl-bb-shadow3 posi-abso"></i>
                                                <a href="javascript:void(0);" onclick="jump('` + url2 + `')"
                                                   class="xczl-bb-bj3 height-p100 posi-rela flex flex-ac flex-jc">
                                                    <i></i>
                                                    <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">书记信箱</p>
                                                </a>
                                            </div>
                                        </div>`
                                $('#navs').html(html);
                                var str = ""
                                str += `
                                <i class="xczl-bb-shadow xczl-bb-shadow4 posi-abso"></i>
                <a href="javascript:void(0);" onclick="jump('` + url3 + `')"
                   class="height-p100 flex flex-ac xczl-bb-bj4">
                    <i></i>
                    <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff flex1 text-align-c">志愿者注册</p>
                </a>
                                `
                                $("#register").html(str)
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


</script>
</body>
</html>