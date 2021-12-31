<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>党建引领</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">

    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css" />

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>

    <script src="${uiDomain}/js/layer/layer.js"></script>
    <script src="${uiDomain}/app-assets/extend/wap-group-select/js/ffcs.select.group.js"></script>
    <script src="${uiDomain}/web-assets/extend/person-select/v1.0.0/js/custom_msgClient.js "></script>
</head>

<body class="bg-cor-f5">
    <div class="layui-contain">
        <div class="layui-row">
            <div class="layui-col-xs12 pt15 pb15 pl15 pr15 bs" id="djyl">

            </div>
        </div>
    </div>

<script>
    $(function () {
        orgCode = '${orgCode}';
        defaultOrgCode = '${orgCode}';
        getButtonDiv()
    });

    function getButtonDiv() {
        $('#djyl').empty();

        let platform = isWeChat();

        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType: 'djyl',
                orgCode: orgCode,
                type: '7',  //导航栏
                platform: platform
            },
            success: function(data) {
                if (data != null) {
                    let dvModulars = data.dvModulars;
                    if (dvModulars != null) {
                        for(let i = 0; i < dvModulars.length; i ++) {
                            let modularContents = dvModulars[i].modularContents;
                            let useType = dvModulars[i].useType;

                            if (useType === 'djyl') {
                                setDiv(modularContents, dvModulars[i].useType);
                            }
                        }
                    } else {
                        let zwsjHtml = '<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                            '<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>' +
                            '</div>';
                        $('#djyl').html(zwsjHtml);
                    }
                } else {
                    let zwsjHtml = '<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                        '<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>' +
                        '</div>';
                    $('#djyl').html(zwsjHtml);
                }
            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }

    function setDiv(modularContents, div) {
        let html = '<div class="layui-col-xs12 bg-fff border-radius-4 pt15 pb10 pl10 pr10 bs">';
        for(let j = 0; j < modularContents.length; j++) {
            let url = modularContents[j].url;
            let picUrl = modularContents[j].attList.length > 0 ? '${imgDomain}' + modularContents[j].attList[0].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png';
            let name = modularContents[j].name;

            html +=
                '<a href="Javascript:;" class="layui-col-xs3 pt5 mb5">'+
                '<div class="index-ann-box-icon img100" onclick="jump(\'' + url + '\')">'+
                '<img src="' + picUrl + '" alt="">' +
                '</div>'+
                '<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">' + name + '</p>' +
                '</a>'
        }

        html += '</div>';

        $('#' + div).html(html);
    }

    function isWeChat() {
        let ua = navigator.userAgent.toLowerCase();

        let  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram';
        if (type){
            return 'spt';
        } else {
            return 'xygj';
        }
    }

    function jump(url) {
        if (url == 'null') {
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return;
        }
        let flag =  isWeChat();
        let isapp = '';
        if (flag =='xygj') {
            isapp = 'token=${token}&app=app';
        }
        if (url.indexOf("?") == -1) {   //链接没有带参数
            location.href = url + '?' + isapp;
        } else {
            location.href = url + '&' + isapp;
        }
    }
</script>
</body>
</html>