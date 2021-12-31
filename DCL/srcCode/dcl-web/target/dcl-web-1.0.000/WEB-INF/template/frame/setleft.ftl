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
        	t = outlookbar.addtitle('党员情况', '应急指挥后台菜单', 1)
            outlookbar.additem('党员信息管理', t, '${djDomain!''}/dj/partymember/pmInfo/indexNew.jhtml?prjType=wg');
        	t = outlookbar.addtitle('图文统计情况', '应急指挥后台菜单', 1)
            outlookbar.additem('先锋模范', t, '${djDomain!''}/dj/unitHonor/index.jhtml');
            outlookbar.additem('党务公开', t, '${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000002');
            outlookbar.additem('组织生活会', t, '${djDomain!''}/dj/bizMeeting/index.jhtml');
            outlookbar.additem('党建新闻', t, '${djDomain!''}/dj/news/index.jhtml');
        	outlookbar.additem('党建新闻审核', t, '${djDomain!''}/dj/forCheck/index.jhtml');
        	t = outlookbar.addtitle('基本情况', '应急指挥后台菜单', 1)
            outlookbar.additem('党员信息管理', t, '${djDomain!''}/dj/partymember/pmInfo/indexNew.jhtml?prjType=wg');
            outlookbar.additem('流动人口', t, '${rsDomain!''}/flow/listFlowInfo.jhtml?system_privilege_code=9x_ldrk');
            outlookbar.additem('人口管理', t, '${rsDomain!''}/cirs/listResident.jhtml?menu=1&system_privilege_code=rkgl');
        	t = outlookbar.addtitle('领导班子', '应急指挥后台菜单', 1)
            outlookbar.additem('党组织信息管理', t, '${djDomain!''}/dj/partybranch/index.jhtml?prjType=wg');
        	t = outlookbar.addtitle('党建新闻', '应急指挥后台菜单', 1)
            outlookbar.additem('党建新闻', t, '${djDomain!''}/dj/news/index.jhtml');
        	outlookbar.additem('党建新闻审核', t, '${djDomain!''}/dj/forCheck/index.jhtml');
        </script>
        <!-- CP_check菜单 -->
</body>
</html>
