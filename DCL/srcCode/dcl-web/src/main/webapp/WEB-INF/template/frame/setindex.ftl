<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<title>${title}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${UI_DOMAIN}/web-assets/plugins/ace/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${UI_DOMAIN}/web-assets/plugins/ace/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${UI_DOMAIN}/web-assets/plugins/ace/css/ace.min.css" />
	<link rel="stylesheet" href="${UI_DOMAIN}/web-assets/common/css/reset.css" />
    <!-- 标准版的蓝色版css -->
    <link rel="stylesheet" href="${UI_DOMAIN}/web-assets/layui-guanlihotai-biaozhun/frame/blue/css/index.css">
	<!-- 乡村振兴平台的蓝色版css -->
    <link rel="stylesheet" href="${UI_DOMAIN}/web-assets/_jzfp/fujian-xczx/frame/blue/css/index-xczx.css">
</head>
<body>
    <!-- 头部 start -->
    <div class="navbar navbar-default" id="navbar">
		<div class="navbar-container flex" id="navbar-container">

			<div class="navbar-header change-logo pull-left flex flex-ac">
                <p>
                    <a class="img100">
                        <img src="${UI_DOMAIN}/web-assets/_jzfp/fujian-xczx/frame/blue/images/logo-bg.png" />
                    </a>
                </p>
			</div>
			<div id="logo" class="navbar-header">
				<p class="ml20">
					<a href="javascript:void(0);" class="change-title font-bold cor-fff" style="line-height: 70px;">
							数字乡村云平台
					</a>
				</p>
			</div>
           
            <ul class="change-ul j-click-li flex flex1 ">
				<!-- data-iframe 初始内容 -->
				<#if type lt 230 && type gt 220>
                <li onclick="changeFrame(1115130,'村务财务','nav0','');" class="fl sd-demo active" data-name="" data-iframe=''>
                    <span>村务政务</span>
					<i></i>
                </li>
                <li onclick="changeFrame(1115131,'积分银行','nav1','');" class="fl sd-demo" data-name="1115131" data-iframe="">
		            <span>积分银行</span>
					<i></i>
				</li>
				<li onclick="changeFrame(1115139,'乡村三资','nav2','');" class="fl sd-demo" data-name="1115139" data-iframe="">
		            <span>乡村三资</span>
					<i></i>
				</li>
				<#else>
                <li class="fl sd-demo active" data-name="" data-iframe=''>
                    <span>${topName}</span>
					<i></i>
                </li>
				</#if>
            </ul>
			
		</div>
	</div>
    <!-- 头部 end -->
    <!-- 内容 start -->
    <div class="main-container yp_container" id="main-container">
        <div class="main-container-inner">
            <!-- 左侧内容 start -->
            <div class="sidebar" id="sidebar">
				 <!-- 基础数据 start -->
				 <div class="page-jcsj height-100">
					<div class="change-title-div flex flex-ac flex-jc">
						<i></i>
						<span>${title}</span>
					</div>
					
					<ul class="nav nav-list nav-list-active" id="nav0">
						<#if type lt 230 && type gt 220>
						<li class="haschild">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type221">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">三务公开</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="2211" title="党务公开 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000007&amp;system_privilege_action=5655" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										党务公开
									</a>
								</li>
								<li class="Fmenu" id="1115111" title="村务公开 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000003&amp;system_privilege_action=5656" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										村务公开
									</a>
								</li>
								<li class="Fmenu" id="1115112" title="财务公开 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000008&amp;system_privilege_action=5658" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										财务公开
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村文化</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu" id="1115114" title="政策宣传 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000006&amp;system_privilege_action=5660" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										政策宣传
									</a>
								</li>
								<li class="Fmenu" id="1115115" title="村情介绍 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000005&amp;system_privilege_action=5659" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										村情介绍
									</a>
								</li>
								<li class="Fmenu" id="1115116" title="村规民约 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000009&amp;system_privilege_action=5661" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										村规民约
									</a>
								</li>
								<li class="Fmenu" id="1115117" title="乡贤榜 " link="${gmisDomain}/gmis/teamMembers/index.jhtml?bizType=23&amp;type=experts&amp;system_privilege_action=13682" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										乡贤榜
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">人口管理</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu" id="1115119" title="人口管理 " link="${rsDomain!''}/cirs/listResident.jhtml?menu=1&amp;system_privilege_action=13412" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										人口管理
									</a>
								</li>
								<li class="Fmenu" id="1115120" title="老年人管理 " link="${rsDomain!''}/old/listOld.jhtml?menu=15&amp;system_privilege_action=13401" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										老年人管理
									</a>
								</li>
								<li class="Fmenu" id="1115121" title="妇女管理 " link="${rsDomain!''}/rsfp/listFp.jhtml?menu=2&amp;system_privilege_action=13397" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										妇女管理
									</a>
								</li>
								<li class="Fmenu" id="1115122" title="幼儿管理 " link="${rsDomain!''}/rsfp/listChild.jhtml?menu=3&amp;system_privilege_action=13398" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										幼儿管理
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">事件管理</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu" id="1115124" title="采集事件 " link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=draft&amp;model=l&amp;system_privilege_action=13285" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										采集事件
									</a>
								</li>
								<li class="Fmenu" id="1115125" title="待办事件 " link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=todo&amp;amp;model=l&amp;system_privilege_action=13286" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										待办事件
									</a>
								</li>
								<li class="Fmenu" id="1115126" title="经办事件 " link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=done&amp;model=l&amp;system_privilege_action=13287" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										经办事件
									</a>
								</li>
								<li class="Fmenu" id="1115127" title="归档事件 " link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=history&amp;model=l&amp;system_privilege_action=13288" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										归档事件
									</a>
								</li>
								<li class="Fmenu" id="1115128" title="辖区事件 " link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=all&amp;model=l&amp;system_privilege_action=13289" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										辖区事件
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">办事指南</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu" id="1115130" title="办事指南 " link="${WECHAT_DOMAIN!''}/cct/handlingMatters/index.mhtml?system_privilege_action=5684" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										办事指南
									</a>
								</li>
							</ul>
						</li>
						</#if>
						<#if type lt 220 && type gt 210>
						<li class="haschild">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type211">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">平安乡村</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="2111" title="视频设备管理 " link="${gbpDomain!''}/gbp/globalEyes/index.jhtml?system_privilege_action=5740" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										视频设备管理
									</a>
								</li>
								<li class="Fmenu" id="1115106" title="视频播放 " link="${gbpDomain!''}/gbp/globalEyes/globalEyesBigScreen/sudokuPlay.jhtml" ismenu="003">
									<a href="javascript:void(0);" data-name="">
										视频播放
									</a>
								</li>
							</ul>
						</li>
						</#if>
						<#if type lt 210 && type gt 200>
						<li class="haschild">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type201">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">村务通知</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="2011" title="通知公告 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000020&amp;system_privilege_action=5720" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										通知公告
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">语音通知</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="1115098" title="语音群发 " link="https://dcl.zgdxxczx.cn/dcl/dcl/voicePeople/index.jhtml" ismenu="003">
									<a href="javascript:void(0);" data-name="">
										语音群发
									</a>
								</li>
								<li class="Fmenu" id="1115099" title="历史推送记录 " link="${rc.getContextPath()}//dcl/historyBroadcastpush/index.jhtml?system_privilege_action=13760" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										历史推送记录
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">智能音箱</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu" id="1115101" title="智能音箱 " link="http://117.27.128.121:18081/zhyx-portal-test/#/ssologin?token=UvA77ZX3dlL05hi9QnKFDcXm" ismenu="003">
									<a href="javascript:void(0);" data-name="">
										智能音箱
									</a>
								</li>
							</ul>
						</li>
						</#if>
						<#if type lt 200 && type gt 190>
						<li class="haschild">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type191">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">疫情防控</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="1911" title="返乡人员管理 " link="${WECHAT_DOMAIN!''}/web/common/epidemic/return/index.mhtml?system_privilege_action=13700" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										返乡人员管理
									</a>
								</li>
								<li class="Fmenu" id="1115090" title="防疫播报管理 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000030&amp;system_privilege_action=13699" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										防疫播报管理
									</a>
								</li>
								<li class="Fmenu" id="1115091" title="疫苗接种点 " link="${rc.getContextPath()}//dcl/vaccinationSite/index.jhtml?system_privilege_action=13739" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										疫苗接种点
									</a>
								</li>
								<li class="Fmenu" id="1115092" title="疫苗接种情况 " link="${rc.getContextPath()}//dcl/vaccinationStatus/index.jhtml?system_privilege_action=13740" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										疫苗接种情况
									</a>
								</li>
							</ul>
						</li>
						</#if>
						<#if type lt 190 && type gt 180>
							<li class="haschild">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type181">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">智慧党建</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="1811" title="党组织信息 " link="${djDomain!''}/dj/partybranch/index.jhtml?prjType=wg&amp;system_privilege_action=5355" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										党组织信息
									</a>
								</li>
								<li class="Fmenu" id="1115076" title="党员信息 " link="${djDomain!''}/dj/partymember/pmInfo/indexNew.jhtml?prjType=wg&amp;system_privilege_action=5356" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										党员信息
									</a>
								</li>
								<li class="Fmenu" id="1115077" title="工作手册 " link="${djDomain!''}/dj/article/index/7.jhtml?system_privilege_action=5644" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										工作手册
									</a>
								</li>
								<li class="Fmenu" id="1115078" title="组织生活 " link="${djDomain!''}/dj/bizMeeting/index.jhtml?system_privilege_action=3902&amp;system_privilege_action=5361" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										组织生活
									</a>
								</li>
								<li class="Fmenu" id="1115079" title="活动相册 " link="${djDomain!''}/dj/activityAlbumn/index.jhtml?system_privilege_action=4120&amp;system_privilege_action=5362" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										活动相册
									</a>
								</li>
								<li class="Fmenu" id="1115080" title="党建资讯 " link="${djDomain!''}/dj/news/index.jhtml?system_privilege_action=4040&amp;system_privilege_action=5359" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										党建资讯
									</a>
								</li>
								<li class="Fmenu" id="1115081" title="民主评议 " link="${djDomain!''}/dj/orgDemocraticReview/index.jhtml?system_privilege_action=5642" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										民主评议
									</a>
								</li>
								<li class="Fmenu" id="1115082" title="先锋模范 " link="${gmisDomain}/gmis/teamMembers/index.jhtml?bizType=25&amp;type=experts&amp;system_privilege_action=13738" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										先锋模范
									</a>
								</li>
								<li class="Fmenu" id="1115083" title="三会一课 " link="${djDomain!''}/dj/bizMeeting/index.jhtml?system_privilege_action=5641" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										三会一课
									</a>
								</li>
								<li class="Fmenu" id="1115084" title="微党课 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?tKey=wdk&amp;catalogId=10000119&amp;system_privilege_action=13742" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										微党课
									</a>
								</li>
								<li class="Fmenu" id="1115085" title="信息审核 " link="${djDomain!''}/dj/forCheck/index.jhtml?system_privilege_action=5360" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										信息审核
									</a>
								</li>
							</ul>
						</li>
						</#if>
						<#if type lt 160 && type gt 150>
							<li class="">
								<a href="javascript:void(0);" class="dropdown-toggle" id="type151">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
									<span class="menu-text">农村电商 </span>

									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="Fmenu" id="1511"   title="一村一品 " link="${rc.getContextPath()}/dcl/villageProductPc/index.jhtml?system_privilege_code=dcl_ycyp" isMenu="002">
										<a href="javascript:void(0);" data-name=''>
											一村一品
										</a>
									</li>
								</ul>
							</li>
						</#if>
					<#if type lt 150 && type gt 140>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type141">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">疫情防控大屏 </span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1411"   title="疫苗接种情况 " link="${rc.getContextPath()}/dcl/vaccinationStatus/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										疫苗接种情况 
									</a>
								</li>
								<li class="Fmenu" id="1421"   title="疫苗接种情况 " link="${rc.getContextPath()}/dcl/vaccinationSite/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										疫苗接种点
									</a>
								</li>
								<li class="Fmenu" id="1431"   title="疫情播报" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000030" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										疫情播报 
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 140 && type gt 130>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type138">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">大屏图片配置</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1381"   title="大屏图片配置" link="${rc.getContextPath()}/dcl/indexContent/form.jhtml?code=index" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										大屏图片配置
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type131">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">村情介绍</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1311"   title="村情介绍" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000005" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村情介绍
									</a>
								</li>
								<li class="Fmenu" id="1321"   title="乡贤榜" link="${gmisDomain}/gmis/teamMembers/index.jhtml?bizType=23&type=experts&system_privilege_code=experts" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										乡贤榜 
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type133">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村治理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1331"   title="事件列表" link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=all&model=l&system_privilege_code=zhsq_event_jurisdiction" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										事件列表
									</a>
								</li>
								<li class="Fmenu" id="1341"   title="村务公开" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000003" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村务公开
									</a>
								</li>
								<li class="Fmenu" id="a1341"   title="党务公开 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000007" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党务公开
									</a>
								</li>
								<li class="Fmenu" id="b1341"   title="财务公开" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000008" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										财务公开
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type135">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村特色</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1351"   title="特色商品" link="${rc.getContextPath()}/dcl/villageProductPc/index.jhtml?system_privilege_code=dcl_ycyp" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										特色商品
									</a>
								</li>
								<li class="Fmenu" id="1361"   title="乡村景点" link="${rc.getContextPath()}/dcl/attractionsManagement/index.jhtml?system_privilege_code=attractionsManagement" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										乡村景点
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type137">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">平安综治</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1371"   title="监控列表" link="${gbpDomain!''}/gbp/globalEyes/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										监控列表
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 120 && type gt 110>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type111">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">政务大屏</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1111"   title="村情风采" link="${rc.getContextPath()}/dcl/indexContent/form.jhtml?code=cqfc" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村情风采
									</a>
								</li>
								<li class="Fmenu" id="1121"   title="村情介绍" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000005" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村情介绍
									</a>
								</li>
								<li class="Fmenu" id="1131"   title="村务公开" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000003" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村务公开
									</a>
								</li>
								<li class="Fmenu" id="1141"   title="政策宣传" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000006" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										政策宣传
									</a>
								</li>
								<li class="Fmenu" id="1151"   title="通知公告" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000020" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										通知公告
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 110 && type gt 100>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type101">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">便民服务</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1011"   title="便民查询" link="${rc.getContextPath()}/dcl/modularContent/index.jhtml?system_privilege_code=DCL_MODULARCONTENT&modularName=办事分类" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										便民查询
									</a>
								</li>
								<li class="Fmenu" id="1021"   title="办事指南" link="${WECHAT_DOMAIN!''}/cct/handlingMatters/index.mhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										办事指南
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type103">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">农业知识库</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1031"   title="农业知识库" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?tKey=encyclopedias&catalogId=10000114" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										农业知识库
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type104">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">农业视频</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1041"   title="农业视频" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?tKey=agriculturalVideo&catalogId=10000029" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										农业视频
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type105">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">农技专家</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1051"   title="专家库管理" link="${gmisDomain!''}/gmis/teamMembers/index.jhtml?bizType=20&type=experts&system_privilege_action=5689" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										专家库管理
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 100 && type gt 90>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type60">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">文化旅游</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="611"   title="网格管理" link="${ZZGRID_DOMAIN!''}/zzgl/grid/mixedGrid/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										网格管理
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 90 && type gt 80>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type81">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村文化</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="811"   title="村规民约" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000009" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村规民约
									</a>
								</li>
								<li class="Fmenu" id="821"   title="乡贤榜" link="${gmisDomain}/gmis/teamMembers/index.jhtml?bizType=23&type=experts&system_privilege_code=experts" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										乡贤榜
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type83">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村旅游</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="831"   title="乡村旅游" link="${rc.getContextPath()}/dcl/attractionsManagement/index.jhtml?system_privilege_code=attractionsManagement" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										乡村旅游
									</a>
								</li>
								<li class="Fmenu" id="841"   title="乡村民宿" link="${rc.getContextPath()}/dcl/homestayManagementPc/index.jhtml?system_privilege_code=homestayManagement_pc" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										乡村民宿
									</a>
								</li>
								<li class="Fmenu" id="851"   title="农家乐" link="${rc.getContextPath()}/dcl/farmhouseManagement/index.jhtml?system_privilege_code=njl" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										农家乐
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 80 && type gt 70>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type70">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">生态宜居</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="711"   title="智能监测" link="${gmisDomain!''}/gmis/deviceInfo/index.jhtml?newPage=1&system_privilege_code=deviceList" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										智能监测
									</a>
								</li>
								<li class="Fmenu" id="731"   title="厕所革命" link="${WECHAT_DOMAIN!''}/web/toiletCollect/index.mhtml?system_privilege_code=HCGL" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										厕所革命
									</a>
								</li>
								<li class="Fmenu" id="741"   title="污水处置" link="${iotDomain!''}/iot/sewageManager/index.jhtml?type=2&system_privilege_code=sewageManager2" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										网污水处置
									</a>
								</li>
								<li class="Fmenu" id="751"   title="大屏图片配置" link="${rc.getContextPath()}/dcl/indexContent/form.jhtml?code=styj" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										大屏图片配置
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 70 && type gt 60>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type60">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">网格管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="611"   title="网格管理" link="${ZZGRID_DOMAIN!''}/zzgl/grid/mixedGrid/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										网格管理
									</a>
								</li>
								<li class="Fmenu" id="631"   title="网格员列表" link="${ZZGRID_DOMAIN!''}/zzgl/grid/gridAdmin/index.jhtml?system_privilege_code=grid_gridAdmin" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										网格员列表
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type64">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">事件管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="641"   title="采集事件" link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=draft&model=l&system_privilege_code=zhsq_event_draft" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										采集事件
									</a>
								</li>
								<li class="Fmenu" id="651"   title="待办事件" link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=todo&model=l&system_privilege_code=zhsq_event_todo" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										待办事件
									</a>
								</li>
								<li class="Fmenu" id="661"   title="经办事件" link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=done&model=l&system_privilege_code=zhsq_event_handled" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										经办事件
									</a>
								</li>
								<li class="Fmenu" id="671"   title="归档事件" link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=history&model=l&extraParams=%7B%22isEnableDefaultCreatTime%22:true%7D&system_privilege_code=zhsq_event_archived" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										归档事件
									</a>
								</li>
								<li class="Fmenu" id="681"   title="辖区事件" link="${eventDomain!''}/zhsq/event/eventDisposalController/listEvent.jhtml?t=all&model=l&extraParams=%7BisEnableDefaultCreatTime:true%7D&system_privilege_code=zhsq_event_jurisdiction_default_createTime" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										辖区事件
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 60 && type gt 50>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type52">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村法治</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="531"   title="普法教育" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000013" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										普法教育
									</a>
								</li>
								<li class="Fmenu" id="521"   title="以案释法" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000012" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										以案释法
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type54">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">法律顾问</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="541"   title="法律顾问" link="${gmisDomain!''}/gmis/teamMembers/index.jhtml?bizType=22&type=experts&system_privilege_code=flgw" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										法律顾问
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type51">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">法律法规</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="511"   title="法律法规" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000026" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										法律法规
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 50 && type gt 40>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type41">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">资金管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="411"   title="村容村貌" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000116" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										 村容村貌
									</a>
								</li>
								<li class="Fmenu" id="421"   title="资金管理" link="${rc.getContextPath()}/dcl/fundManagement/index.jhtml?system_privilege_code=FundManagement  " isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										 资金管理
									</a>
								</li>
								<li class="Fmenu" id="431"   title="合同管理" link="${rc.getContextPath()}/dcl/dvContract/index.jhtml?system_privilege_code=dcl_htgl" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										 合同管理
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type44">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">资源管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="441"   title="资源管理" link="${rc.getContextPath()}/dcl/resourceManagement/index.jhtml?system_privilege_code=resourceManagement" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										资源管理
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type45">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">资产管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li class="Fmenu" id="451"   title="资产管理" link="${rc.getContextPath()}/dcl/assetManagement/index.jhtml?system_privilege_code=assetManagement" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										资产管理
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 40 && type gt 30>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type30">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党员情况</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="311"   title="村容村貌" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000116" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村容村貌
									</a>
								</li>
								<li class="Fmenu" id="321"   title="乡贤榜" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000022" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										 乡贤榜
									</a>
								</li>
								<li class="Fmenu" id="331"   title="乡村旅游" link="${rc.getContextPath()}/dcl/attractionsManagement/index.jhtml?system_privilege_code=attractionsManagement" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										 乡村旅游
									</a>
								</li>
								<li class="Fmenu" id="341"   title="一村一品" link="${rc.getContextPath()}/dcl/villageProductPc/index.jhtml?system_privilege_code=dcl_ycyp" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										 一村一品
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 30 && type gt 20>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type21">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">积分规则</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="211"   title="积分规则" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000016" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										积分规则
									</a>
								</li>
								<li class="Fmenu" id="221"   title="乡村活动" link="${WECHAT_DOMAIN!''}/web/volunteer/activity/volunteerIndex.mhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										乡村活动
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type23">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">积分商城</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="231"   title="积分商城" link="${gbpDomain!''}/admin/integralCommodity/index.jhtml?system_privilege_code=jfsc" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										积分商城
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 20 && type gt 10>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type11">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">办事指南</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="111"   title="办事指南" link="${WECHAT_DOMAIN!''}/cct/handlingMatters/index.mhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										办事指南
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type12">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">模块名称配置</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="121"   title="模块名称配置" link="${rc.getContextPath()}/dcl/modularContent/index.jhtml?system_privilege_code=DCL_MODULARCONTENT&modularName=办事分类" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										模块名称配置
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 6>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type1">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党员情况</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="11"   title="党员信息管理" link="${djDomain!''}/dj/partymember/pmInfo/indexNew.jhtml?prjType=wg" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党员信息管理
									</a>
								</li>
								<li class="Fmenu" id="12"   title="党员导入日志" link="${djDomain!''}dj/partymember/importInfo/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党员导入日志
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type2">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">图文统计情况</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="21"   title="先锋模范" link="${djDomain!''}/dj/unitHonor/index.jhtml?system_privilege_code=xfmf" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										先锋模范
									</a>
								</li>
								<li class="Fmenu" id="22"   title="党务公开 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000007" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党务公开
									</a>
								</li>
								<li class="Fmenu" id="23"   title="组织生活会 " link="${djDomain!''}/dj/bizMeeting/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										组织生活会
									</a>
								</li>
								<li class="Fmenu" id="24"   title="党建新闻" link="${djDomain!''}/dj/news/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党建新闻
									</a>
								</li>
								<li class="Fmenu" id="25"   title="党建新闻审核" link="${djDomain!''}/dj/forCheck/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党建新闻审核
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type3">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">基本情况</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li class="Fmenu" id="31"   title="人口管理" link="${rsDomain!''}/cirs/listResident.jhtml?menu=1&system_privilege_code=rkgl" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										人口管理
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type4">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">领导班子</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="41"   title="党组织信息管理" link="${djDomain!''}/dj/partybranch/index.jhtml?prjType=wg" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党组织信息管理
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type5">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党建新闻</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="51"   title="党建新闻" link="${djDomain!''}/dj/news/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党建新闻
									</a>
								</li>
								<li class="Fmenu" id="52"   title="党建新闻审核" link="${djDomain!''}/dj/forCheck/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党建新闻审核
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 11 && type gt 5>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type6">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">政务大屏</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="61"   title="村情风采" link="${iotDomain!''}/iot/xc/bigScreen/xcPicture.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村情风采
									</a>
								</li>
								<li class="Fmenu" id="71"   title="村情介绍" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000005" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村情介绍
									</a>
								</li>
								<li class="Fmenu" id="81"   title="村务公开" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000003" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村务公开
									</a>
								</li>
								<li class="Fmenu" id="91"   title="政策宣传" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000006" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										政策宣传
									</a>
								</li>
								<li class="Fmenu" id="101"   title="办事指南" link="${WECHAT_DOMAIN!''}/cct/handlingMatters/index.mhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										办事指南
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 170 && type gt 160>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type161">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党组织和委员</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1611"   title="党组织信息管理" link="${djDomain!''}/dj/partybranch/v2/index.jhtml?type=xczx&system_privilege_code=partybranchForxczx" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党组织信息管理
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type162">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党员管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1621"   title="党员信息管理" link="${djDomain!''}/dj/partymember/pmInfo/indexNew.jhtml?type=xczx&system_privilege_code=partymemberForxczx" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党员信息管理
									</a>
								</li>
								<li class="Fmenu" id="1622"   title="党员导入日志" link="${djDomain!''}dj/partymember/importInfo/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党员导入日志
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type163">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党务管理</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1631"   title="三会一课" link="${djDomain!''}/dj/bizMeeting/index.jhtml?type=xczx&system_privilege_code=bizMeetingForxczx" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										三会一课
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type164">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">党建新闻</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1641"   title="党建新闻" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000035" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										党建新闻
									</a>
								</li>
								<li class="Fmenu" id="1651"   title="两优一先" link="${gmisDomain!''}/gmis/teamMembers/index.jhtml?bizType=27&type=experts&system_privilege_code=flgw" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										两优一先
									</a>
								</li>
							</ul>
						</li>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type166">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">学习材料</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1661"   title="课件管理" link="${djDomain!''}/dj/courseware/index.jhtml?system_privilege_code=coursewareNew" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										课件管理
									</a>
								</li>
								<li class="Fmenu" id="1671"   title="课程管理" link="${djDomain!''}/dj/trainCourse/index.jhtml?system_privilege_code=trainCourseNew" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										课程管理
									</a>
								</li>
							</ul>
						</li>
					</#if>
					<#if type lt 180 && type gt 170>
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle" id="type171">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">村务政务大屏</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1721"   title="村情介绍" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000005" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村情介绍
									</a>
								</li>
								<li class="Fmenu" id="1711"   title="村基本信息" link="${ZZGRID_DOMAIN!''}/zzgl/grid/mixedGrid/index.jhtml" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村基本信息
									</a>
								</li>
								<li class="Fmenu" id="1731"   title="领导小组" link="${rc.getContextPath()}/dcl/villageGroup/index.jhtml?system_privilege_code=dcl_village_group" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										领导小组
									</a>
								</li>
								<li class="Fmenu" id="1741"   title="村务公开" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000003" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										村务公开
									</a>
								</li>
								<li class="Fmenu" id="1751"   title="政策宣传" link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000006" isMenu="002">
									<a href="javascript:void(0);" data-name=''>
										政策宣传
									</a>
								</li>
							</ul>
						</li>
					</#if>
					</ul>
					<#if type lt 230 && type gt 220>
					<ul class="nav nav-list nav-list-active" id="nav1" style="overflow: hidden; outline: none; display: none;" tabindex="5001">
						<li class="haschild">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">积分银行</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu" style="display: block;">
								<li class="Fmenu on" id="1115133" title="积分规则 " link="${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000016&amp;system_privilege_action=5678" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										积分规则
									</a>
								</li>
								<li class="Fmenu" id="1115134" title="积分设置 " link="http://oa.zgdxxczx.cn/sq-oa-web/web/integralRule/index.mhtml?system_privilege_action=5771" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										积分设置
									</a>
								</li>
								<li class="Fmenu" id="1115135" title="积分商城 " link="${gbpDomain!''}/admin/integralCommodity/index.jhtml?system_privilege_action=5688" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										积分商城
									</a>
								</li>
								<li class="Fmenu" id="1115136" title="积分活动 " link="${WECHAT_DOMAIN!''}/web/activityCenter/index.mhtml?system_privilege_action=5760" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										积分活动
									</a>
								</li>
								<li class="Fmenu" id="1115137" title="积分排行 " link="${rc.getContextPath()}//dcl/integral/index.jhtml?system_privilege_action=5681" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										积分排行
									</a>
								</li>
								<li class="Fmenu" id="1115138" title="积分活动 " link="${WECHAT_DOMAIN!''}/web/societies/activity/index.mhtml?system_privilege_action=5679" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										积分活动
									</a>
								</li>
							</ul>
						</li>
					</ul>
					<ul class="nav nav-list nav-list-active" id="nav2" style="display: none; overflow: hidden; outline: none;" tabindex="5002">
						<li class="">
							<a href="javascript:void(0);" class="dropdown-toggle">
								<span>
									<!-- <i class="i-team-work"></i> -->
									<i class="i1" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 0px;"></i>
									<i class="i2" style="background: url('${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/icon/qianshou.png') no-repeat; background-position: 0 -31px;"></i>
								</span>
								<span class="menu-text">乡村三资</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li class="Fmenu" id="1115141" title="资金管理 " link="${rc.getContextPath()}//dcl/fundManagement/index.jhtml?system_privilege_action=5674" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										资金管理
									</a>
								</li>
								<li class="Fmenu" id="1115142" title="资源管理 " link="${rc.getContextPath()}//dcl/resourceManagement/index.jhtml?system_privilege_action=5675" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										资源管理
									</a>
								</li>
								<li class="Fmenu" id="1115143" title="资产管理 " link="${rc.getContextPath()}//dcl/assetManagement/index.jhtml?system_privilege_action=5673" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										资产管理
									</a>
								</li>
								<li class="Fmenu" id="1115144" title="合同管理 " link="${rc.getContextPath()}//dcl/dvContract/index.jhtml?system_privilege_action=5676" ismenu="002">
									<a href="javascript:void(0);" data-name="">
										合同管理
									</a>
								</li>
							</ul>
						</li>
					</ul>
					</#if>
				</div>
				<!-- 基础数据 end -->
            </div>
            <!-- 左侧内容 end -->

            <!-- 右侧内容 start -->
            <div class="main-content">
				<div class="page-tab clearfix">
					<div class="flex fl pt-content h-o titleul">
						<!-- <div class="page-t-item active">
							<p>网格员列表</p>
							<a href="javascript:void(0);"></a>
						</div>
						<div class="page-t-item">
							<p>乡村详情</p>
							<a href="javascript:void(0);"></a>
						</div> -->
					</div>
					<a id="closeAll" style="display:none;" href="javascript:void(0);" class="pt-close-all ml10 fl flex flex-ac flex-jc">
						<i class="pt-ca-icon"></i>
						<p class="ml5">全部关闭</p>
					</a>
				</div>
                <!-- 收缩按钮 start -->
               <div class="change-icon" id="sidebar-collapse2">
                   <img src="${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/images/huishou.png" />
               </div>
               <!-- 收缩按钮 end -->
               <div class="wrap_iframe wrap_iframe1" >
                   <div class="iframe_box content_iframe" id="content_iframe">
                   </div>
               </div>
           </div>
            <!-- 右侧内容 end -->
        </div>
    </div>
    <!-- 内容 end -->

    <script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/ace/js/bootstrap.min.js"></script>
	<script src="${UI_DOMAIN}/web-assets/plugins/ace/js/ace.min.js"></script>
	<script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js" type="text/javascript" charset="utf-8"></script>
	<script src="${UI_DOMAIN}/web-assets/_jzfp/shandong/frame/blue/js/index.js"></script>
    <script>
    
        $(function () {
			$('.scroll').niceScroll({
				cursorcolor: "#2056b2", //滚动条的颜色
				cursoropacitymax: 0.3, //滚动条的透明度，从0-1  
				cursorwidth: "6px", //滚动条的宽度  单位默认px 
				cursorborderradius: "2px", //滚动条两头的圆角
				autohidemode: true, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条 
				zindex: 8, //给滚动条设置z-index值
			})
            $('.nav-list,.h-o').niceScroll({
                cursorcolor: "rgba(0,0,0,.2)", //#CC0071 光标颜色
                cursoropacitymax: 1, //改变不透明度非常光标处于活动状态（scrollabar“可见”状态），范围从1到0
                touchbehavior: false, //使光标拖动滚动像在台式电脑触摸设备
                cursorwidth: "5px", //像素光标的宽度
                cursorborder: "0", // 游标边框css定义
                cursorborderradius: "5px", //以像素为光标边界半径
                autohidemode: false //是否隐藏滚动条
            });
            // 点击事件
            $('.j-click-li>li').on('click',function(){
				if (!$(this).hasClass('active')) {
					$(this).addClass('active').siblings().removeClass('active')
					if($(this).hasClass('cu-item1')){//首页
						$('.page-tab').addClass('hide').siblings('.wrap_iframe').removeClass('wrap_iframe1');
						$('.change-icon').addClass('ci-sy').removeClass('hide');
						$('#sidebar').removeClass('sp-sidebar');
					}else if($(this).hasClass('cu-item3')){ //校园视频
						$('#sidebar').addClass('sp-sidebar');
						$('.change-icon').removeClass('ci-sy').addClass('hide');
						$('.page-tab').removeClass('hide').siblings('.wrap_iframe').addClass('wrap_iframe1');
					}else{
						$('#sidebar').removeClass('sp-sidebar');
						$('.page-tab').removeClass('hide').siblings('.wrap_iframe').addClass('wrap_iframe1');
						$('.change-icon').removeClass('ci-sy hide');
					}
					$('.h-o').getNiceScroll().resize(); 
                    var thisName = $(this).attr('data-name')
                    var thisIframe=$(this).attr('data-iframe')
                    if (thisIframe == '') {
						// $('.page-yw').find('.nav-list>li:not(.hide)').eq(0).addClass('open haschild');
                        // $('.page-yw').find('.nav-list>li:not(.hide)').eq(0).find('.submenu>li').eq(0).addClass('on');
                        // var thisFindLiIframe = $('.page-yw').find('.nav-list>li:not(.hide)').eq(0).find('.submenu>li').eq(0).children('a').attr('data-name');
                        // $('.iframe_box>iframe').attr('src','./pages/'+thisFindLiIframe+'.html');
                    }
                    $('.'+thisName+'').removeClass('hide').siblings().addClass('hide');
                   /*  if (!thisIframe) {
						return false;
                    }
                    $('.iframe_box>iframe').attr('src','./pages/'+thisIframe+'.html') */
                }
            })
            // 点击获取对应的iframe内容页  进行切换
            $('.submenu>li>a').on('click',function(){
              /*   if (!$(this).hasClass('on')) {
                    if (!$(this).attr('data-name')) {
                        return false;
                    }
                    var thisName = $(this).attr('data-name')
					if($('.change-ul>li.active').hasClass('cu-item-more')){
						$('.change-ul>li.active').find('.more-search-ul li.active').attr('data-iframe',thisName);
					}else{
						$('.change-ul>li.active').attr('data-iframe',thisName);
					}
                    $('.iframe_box>iframe').attr('src','./pages/'+thisName+'.html')
                } */
            })
			
			$('.j-click-more-nav').on('click', function (e) {
				e.stopPropagation()
				$('.more-search-ul').slideToggle(200,function(){
					$('.scroll').getNiceScroll().resize()
				});
				if ($('.more-search-ul-com>li').size() >= 5) {
					$('.i-xiala-img').removeClass('v-hide')
				} else {
					$('.i-xiala-img').addClass('v-hide')
				}

			})
			$('.i-xiala-img').on('click', function (e) {
				e.stopPropagation();
				$(".msl-box .scroll").animate({
					scrollTop: $(".msl-box .scroll").scrollTop() + "55" + "px"
				}, 500);

			})
			// 更多里面的点击切换页面
			$('.more-search-ul-com').on('click','li',function(){
				$(this).addClass('active').siblings().removeClass('active');
				$('#sidebar').removeClass('sp-sidebar');
				$('.page-tab').removeClass('hide').siblings('.wrap_iframe').addClass('wrap_iframe1');
				$('.change-icon').removeClass('ci-sy hide');
				/* var dataName = $(this).attr('data-name');
				var dataIframe=$(this).attr('data-iframe');
				if (dataName && dataIframe) {
					$('.'+dataName+'').removeClass('hide').siblings().addClass('hide');
                    $('.iframe_box>iframe').attr('src','./pages/'+dataIframe+'.html')
				} */
			})
			// 校园视频的在线、离线的选择
			$('.sp-c-state').on('click','a',function(){
				$(this).addClass('active').siblings().removeClass('active');
			});
			//debugger;
			var type='${type}';
			if('${typeNum}'==''){
				$('#type'+type).click();
				$('#'+type+'1').click();
	    	   	$('#'+type+'1').addClass("on");
	    	    $('#'+type+'1').parent().parent().addClass("haschild");
			}else if('${typeNum}'=='0'){
				$('#'+type+'1').click();
			}else{
				$('#type${typeNum}').click();
				$('#'+type+'1').click();
	    	   	$('#'+type+'1').addClass("on");
	    	    $('#'+type+'1').parent().parent().addClass("haschild");
			}
       	//changeFrame(111,' 党员信息管理','nav0','');
        });
        
        function logout(){
            if (confirm("确定退出？")) window.location.href = "../../admin/loginOut";
        };
        function changeorg(){
            if (confirm("您确定要切换组织吗？")) window.location.href = "../../admin/switchOrg";
        };

        function personalCenter(){
            pages=layer.open({
                type: 2, //page层
                area: ['820px', '520px'],
                title: false,
                closeBtn: false,
                shade: 0.6, //遮罩透明度
                shift: 2, //0-6的动画形式，-1不开启
                content: "/admin/personalCenterPage.jhtml?r="+Math.random(),
                cancel: function(){
                }
            });
        };

        function pagesclose(){
            layer.close(pages);
        }
        
        
        
        var flag="0";
        function changeFrame(menuId,menuName,index,menuUrl){
			$('.on').removeClass("on");
        	$("#changeMenuName").html(menuName);
        	$("ul[id^='nav']").hide();
        	$("ul[id='"+index+"']").show();
        	
        	$("ul[id^='"+index+"']>li>ul").show();
    		var id = $("ul[id^='"+index+"']>li>ul>li").attr("id");
    	    var url = $("ul[id^='"+index+"']>li>ul>li").attr("link");
    	    var title = $("ul[id^='"+index+"']>li>ul>li").attr("title");
    	    $("#"+id+"").addClass("on");
    	    console.log($("#"+id+"").parent().parent());
    	    $("#"+id+"").parent().parent().addClass("haschild");
    	   // $("ul[id^='"+index+"']>li").addClass('haschild');
    	    addTab(url, title, true,id);
    	    
        }        


        $('.Fmenu').on('click',function(){
        	var id = $(this).attr('id');
         	var url = $(this).attr('link');
        	    var title = $(this).attr('title');
             	var isMenu = $(this).attr('isMenu');
			if("003"==isMenu){
				window.open(url);
			}else{
	        	if(url!=''){
	                addTab(url, title, true,id);
	        	}
			}
        }); 


        	function showTitleLi(menuId){
        		if(flag=="0"){
        		$(".content_iframe .titleframe").hide();	 		
        		$(".content_iframe ."+menuId+"").show();
        		$('.titleli').removeClass('active');
        		$(".titleul ."+menuId+"").addClass('active');
        		}else{
        			flag="0";
        		}
        	}	 

        	function deleteTitleLi(menuId){
        		flag="1";
        		var thisObj = $(".titleul ."+menuId+"")[0];
        		var str = thisObj.className;
        		
        		if(str.indexOf("active")==-1){
        			$(".titleul ."+menuId+"").remove();
         		$(".content_iframe ."+menuId+"").remove();	
        		}else if($(".titleul ."+menuId+"").prev().length>0){
        			var obj=$(".titleul ."+menuId+"").prev()[0];
         		$(".titleul ."+menuId+"").remove();
         		$(".content_iframe ."+menuId+"").remove();
         		addTab(null,null,true,obj.id);
        		}else if($(".titleul ."+menuId+"").next().length>0){
        			var obj=$(".titleul ."+menuId+"").next()[0];
         		$(".titleul ."+menuId+"").remove();
         		$(".content_iframe ."+menuId+"").remove();
         		addTab(null,null,true,obj.id);
        		}else if(str.indexOf("active")>-1&&$(".titleul ."+menuId+"").prev().length&&$(".titleul ."+menuId+"").next().length){
         		$(".titleul ."+menuId+"").remove();
         		$(".content_iframe ."+menuId+"").remove();	 		
        		}else{
        			$(".titleul ."+menuId+"").remove();
         		$(".content_iframe ."+menuId+"").remove();	 	//不留一个	
        		}
        	} 

        function addTab(url, title, closable, id){
        	$('.titleli').removeClass('active');
        	var menuId = id;
        	if($(".titleul ."+menuId+"").length>0){
        		$(".titleul ."+menuId+"").addClass('active');
        	}else{
        		if(closable){
        			var html = "<div id='"+id+"' onclick='showTitleLi("+id+");' class='page-t-item titleli active "+id+"'><p>"+title+"</p><a class='icon-tabs-close' onclick='deleteTitleLi("+id+");'></a></div>"
        			$(".titleul").append(html);
        		}else{
        			var html = "<div id='"+id+"' onclick='showTitleLi("+id+");' class='page-t-item titleli active "+id+"'><p>"+title+"</p></div>"
        			$(".titleul").append(html);
        		}

        	}
        	$(".content_iframe .titleframe").hide();
        	if($(".content_iframe ."+menuId+"").length>0){
        		$(".content_iframe ."+menuId+"").show();
        	}else{
        		var html = "<iframe id='iframe"+id+"' class='titleframe  "+id+"'src='"+url+"' width='100%' height='100%'></iframe>"
        		$(".content_iframe").append(html);
        	}
        	
        	if($(".titleul").find(".titleli").length>10){
        		var obj=$(".titleul").find(".titleli")[0];
         		$(".titleul ."+obj.id+"").remove();
         		$(".content_iframe ."+obj.id+"").remove();
        	}
        	
        	$('[id="iframe'+id+'"]').load(function () {
                $(this).height($(this).height()-1);//可以解决新版谷歌浏览器第一次打开空白问题
            });
        	//setTimeout('refIframe('+menuId+',"'+url+'")',500)

        } 	

        function refIframe(id,url){
        	document.getElementById(id).src=url;
        	setTimeout('change_wh('+id+')',500)
        	
        }
        function change_wh(id){
        	$("#iframe"+id).css("width","99.9%");
        	$("#iframe"+id).css("height","100%"); 
        }
    </script>
</body>
</html>