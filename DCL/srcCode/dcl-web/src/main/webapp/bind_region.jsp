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
    <title>绑定乡村</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/search.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css?v=1.0"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css?v=1.0"/>
</head>
<body class="bg-cor-f5">
<div class="bd-container height-p100 bs">
    <div class="bd-contnet width-p100 flex flex-clm flex-jc flex-ac posi-abso">
        <i class="bd-c-icon"></i>
        <p class="bd-c-text font-size-15 cor-fff">很抱歉，您目前尚未绑定乡村</p>
        <a href="javascript:void(0);" class="bd-c-btn" id="btn">
            <p class="font-size-16 cor-fff text-align-c">立即绑定</p>
        </a>
    </div>
</div>
</body>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/js/layer/layer.js"></script>
<script src="${uiDomain}/app-assets/extend/wap-group-select/js/ffcs.select.group.js"></script>
<script src="${uiDomain}/web-assets/extend/person-select/v1.0.0/js/custom_msgClient.js "></script>
<script>

    $("#btn").initSelect(function (res) {
        if (res == undefined || res.orgCode == undefined || res.orgCode == '') {
            return;
        }
        // 询问是否进行绑定
        var confirm = layer.confirm("您选择绑定的乡村为【" + res.orgName + "】，绑定后不可修改，请确认?", {
            btn: ['确定', '取消'],
            shade: [0.3],
            area: ['80%'],
        }, function () {
            layer.close(confirm);

            var loader = layer.load();
            $.ajax({
                type: "POST",
                url: "<%=path%>/oauth/rebind.json",
                data: {
                    orgCode: res.orgCode,
                    orgName: res.orgEntityPath,
                },
                dataType: 'json',
                success: function (data) {
                    layer.close(loader);
                    layer.msg(data.result == 'success' ? '绑定成功' : '绑定失败');
                    setTimeout('window.location.reload()', 2000);
                },
            });

        });
    }, {
        layer:{
            area: ['100%', '100%'], //宽高
        },
        postParam:{
            orgCode : 45
        },
        url:'/common/wapSelectOrg/index.jhtml?t=',
        context: '${componentsDomain}'
    });
</script>
</html>