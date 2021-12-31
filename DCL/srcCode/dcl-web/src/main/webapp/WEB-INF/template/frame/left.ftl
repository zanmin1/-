<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>综治信息管理</title>
<LINK rel=stylesheet type=text/css href="${rc.getContextPath()}/theme/frame/css/public.css">
<LINK rel=stylesheet type=text/css href="${rc.getContextPath()}/theme/frame/css/frame.css">
<script type=text/javascript src="${rc.getContextPath()}/theme/frame/js/outlook.js"></script>
<style type=text/css>
    body { BACKGROUND: #eef4fa }
</style>
</head>

<body>
<div style="DISPLAY: none" id="left_main_nav">
        </div>
        <div id="right_main_nav">
        </div>
        <script type=text/javascript>
            var outlookbar = new outlook();
            var t;
        </script>
        <!-- 管理员菜单 -->
        <!-- 日常管理员菜单 -->
        <!-- CP菜单 -->
        <script type=text/javascript>
        	window.onload = function() {
		        initinav('应急指挥后台菜单');//首个加载的页签菜单
		        try {
		            setInterval(function(){document.getElementById("right_main_nav").style.height = (parent.document.body.clientHeight -135) + "px"},300);
		        } catch(e) {}
		    }
        	//-- tab 1
        	t = outlookbar.addtitle('后台首页', '应急指挥后台菜单', 1)
        	outlookbar.additem('后台首页(无)', t, '${rc.getContextPath()}');
        	t = outlookbar.addtitle('指挥中心', '应急指挥后台菜单', 1)
        	outlookbar.additem('人员监控(无)', t, '${rc.getContextPath()}');
            outlookbar.additem('资金管理', t, '${rc.getContextPath()}/dcl/fundManagement/index.jhtml');
            outlookbar.additem('资产管理', t, '${rc.getContextPath()}/dcl/assetManagement/index.jhtml');
            outlookbar.additem('资源管理', t, '${rc.getContextPath()}/dcl/resourceManagement/index.jhtml');
            outlookbar.additem('景点管理', t, '${rc.getContextPath()}/dcl/attractionsManagement/index.jhtml');
            outlookbar.additem('民宿管理', t, '${rc.getContextPath()}/dcl/homestayManagementPc/index.jhtml');
            outlookbar.additem('农家乐', t, '${rc.getContextPath()}/dcl/farmhouseManagement/index.jhtml');
            outlookbar.additem('主题管理', t, '${rc.getContextPath()}/dcl/dvTheme/index.jhtml');
            outlookbar.additem('模块管理', t, '${rc.getContextPath()}/dcl/dvModular/index.jhtml');
            outlookbar.additem('模块内容管理', t, '${rc.getContextPath()}/dcl/modularContent/index.jhtml');
            outlookbar.additem('书记信箱', t, '${rc.getContextPath()}/dcl/secretaryMailboxPc/index.jhtml');
            outlookbar.additem('历史语音推送', t, '${rc.getContextPath()}/dcl/historyDetail/index.jhtml');
            outlookbar.additem('历史播报', t, '${rc.getContextPath()}/dcl/historyBroadcastpush/index.jhtml');
            outlookbar.additem('村小组管理', t, '${rc.getContextPath()}/dcl/villageGroup/index.jhtml');
            outlookbar.additem('语音播报', t, '${rc.getContextPath()}/dcl/voicePeople/index.jhtml');
            t = outlookbar.addtitle('人员管理', '应急指挥后台菜单', 1)
        	outlookbar.additem('定位轨迹(无)', t, '${rc.getContextPath()}');
        </script>
        <!-- CP_check菜单 -->
</body>
</html>
