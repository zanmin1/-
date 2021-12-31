<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>党员认证</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
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
</head>
<body class="bg-cor-f5">
<div class="bd-container02 height-p100 bs pl35 pr35 pt87">
    <div class="rz-div height-44 flex flex-ac">
        <i class="rz-div-h">
            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/rz-icon01.png">
        </i>
        <input type="text" class="rz-div-input ml5" placeholder="请输入姓名" id="userName"
               maxcodelength="50" appValidation isNotEmpty="请输入姓名">
    </div>
    <div class="rz-div height-44 flex flex-ac mt25">
        <i class="rz-div-h">
            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/rz-icon02.png">
        </i>
        <input type="text" class="rz-div-input ml5" placeholder="请输入手机号" id="phone"
               maxcodelength="11" appValidation isNotEmpty="请输入手机号" isPhone="请输入正确的手机号">
    </div>
    <a href="javascript: void(0);" class="rz-c-btn mt75" id="btn" onclick="toCertificate()">
        <p class="font-size-16 cor-blue3 text-align-c">认证</p>
    </a>
</div>
</body>
<script src="<%=path%>/js/jquery-9-3-2-0.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/layer/layer.js" type="text/javascript"></script>
<script src="<%=path%>/js/layer/layer_wap.js" type="text/javascript"></script>
<script src="<%=path%>/js/uitl/common.js"></script>
<script>
    function toCertificate() {
        // _reload();
        if (formValidation()) {
            var loader = layer.load();
            $.ajax({
                type: "POST",
                url: "<%=path%>/oauth/rebind.json",
                data: {
                    mobile: $('#phone').val(),
                    userName: $('#userName').val(),
                },
                dataType: 'json',
                success: function (data) {
                    if (data.result == 'success') {
                        setTimeout('_reload()', 2000);
                    } else {
                        layer.close(loader);
                    }
                },
            });
        }
    }

    function _reload() {
        var urlArr = window.location.href.split('?');
        var url = '';
        for (var i = 0; i < urlArr.length; i++) {
            if (i === 0) {
                url += urlArr[i];
            } else if (i === 1) {
                url += ('?second=yes&' + urlArr[i]);
            } else {
                url += ('?' + urlArr[i]);
            }
        }
        window.location.replace(url);
    }
</script>
</html>