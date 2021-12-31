
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>智慧党建</title>
	<!-------预定义css样式------->
	<link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index-dj.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css" />

</head>

<body>
	<!--内容 start-->
	<section class="p-b-48">
		<div class="container">
			<div class="layui-row">
				<div class="layui-col-xs12 pt20 index-bg-ext1">
					<div class="pic-wrap-ext1 banner-ext1 notice-s4 ml15 mr15">
						<div class="pic-wrap-c">
							<div class="pic-wrap-i border-radius-10">
								<img class="img-auto-c" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index-dj/ui-banner-1.png" />
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--菜单-->
			<ul class="menu-ext1 flex mt20" id="buttonDiv">
				<li>
					<a href="javascript: void(0)" class="menu-ext1-item">
						<i class="menu-ext1-icon">
							<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/djyl-hdxc.png">
						</i>
						<p class="font-size-12 cor-4d text-align-c mt8">活动相册</p>
					</a>
				</li>
				<li>
					<a href="javascript: void(0)" class="menu-ext1-item">
						<i class="menu-ext1-icon">
							<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/djyl-djxw.png">
						</i>
						<p class="font-size-12 cor-4d text-align-c mt8">党建资讯</p>
					</a>
				</li>
				<li>
					<a href="javascript: void(0)" class="menu-ext1-item" onclick="toMofang()">
						<i class="menu-ext1-icon">
							<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/djyl-xfmf.png">
						</i>
						<p class="font-size-12 cor-4d text-align-c mt8">先锋模范</p>
					</a>
				</li>
				<li>
					<a href="javascript: void(0)" class="menu-ext1-item" onclick="moreVideo()">
						<i class="menu-ext1-icon">
							<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/djyl-wdk.png">
						</i>
						<p class="font-size-12 cor-4d text-align-c mt8">微党课</p>
					</a>
				</li>
			</ul>

			<div class="layui-row bg-fff">
				<div class="layui-col-xs12 flex flex-ac bor-btm-f0 pt10 pb10">
					<i class="icon-title-ext1 font-size-12 ml15"></i>
					<p class="font-size-16 font-bold line-height-24 cor-4d ml8">微党课</p>
				</div>
				<div class="layui-col-xs12 pt15 pl15 pr15">
					<ul class="section-con flex flex-wrap flex-jb" id="experts">
<%--						<li>--%>
<%--							<a href="javascript: void(0)">--%>
<%--								<p class="new-ext1">必修</p>--%>
<%--								<div class="section-con-pic"><img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index-dj/ui-banner-4.png"></div>--%>
<%--								<div class="section-con-det">--%>
<%--									<p class="font-size-14 cor-4d text-line-c1 mt10">2019两会精神解读系列解读系列</p>--%>
<%--									<p class="read-ext1">1000</p>--%>
<%--								</div>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="javascript: void(0)">--%>
<%--								<div class="section-con-pic"><img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index-dj/ui-banner-2.png"></div>--%>
<%--								<div class="section-con-det">--%>
<%--									<p class="font-size-14 cor-4d text-line-c1 mt10">2019两会精神解读系列解读系列</p>--%>
<%--									<p class="read-ext1">1000</p>--%>
<%--								</div>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="javascript: void(0)">--%>
<%--								<div class="section-con-pic"><img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index-dj/ui-banner-4.png"></div>--%>
<%--								<div class="section-con-det">--%>
<%--									<p class="font-size-14 cor-4d text-line-c1 mt10">2019两会精神解读系列解读系列</p>--%>
<%--									<p class="read-ext1">1000</p>--%>
<%--								</div>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="javascript: void(0)">--%>
<%--								<p class="new-ext1">必修</p>--%>
<%--								<div class="section-con-pic"><img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index-dj/ui-banner-2.png"></div>--%>
<%--								<div class="section-con-det">--%>
<%--									<p class="font-size-14 cor-4d text-line-c1 mt10">2019两会精神解读系列解读系列</p>--%>
<%--									<p class="read-ext1">1000</p>--%>
<%--								</div>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--						<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50 hide" id="expertsZwsj">--%>
<%--							<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--						</div>--%>
					</ul>
				</div>
				<div class="layui-col-xs12 flex flex-ac bor-btm-f0 pt10 pb10">
					<i class="icon-title-ext1 font-size-12 ml15"></i>
					<p class="font-size-16 font-bold line-height-24 cor-4d ml8">党建资讯</p>
				</div>
				<div class="layui-col-xs12 flex flex-ac bor-btm-f0 pb10">
					<div class="layui-col-xs12 pl15 pr15 pb10" id="NewsDiv">

					</div>

				</div>
			</div>
		</div>
	</section>
	<!--内容 end-->
</body>
<script src="${uiDomain}/app-assets/common/js/jqry-9-1-7-2.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
<%--<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.6.0.js" charset="utf-8"></script>--%>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"> </script>
<script type="text/javascript">

	var form,table,layer,tableSelect
	$(function () {



		getNews()

		loadExperts()
		getButtonDiv()

	});


	<%--function getNews(){--%>
	<%--	$.ajax({--%>
	<%--		type: 'post',--%>
	<%--		dataType: 'json',--%>
	<%--		url: '<%=path%>/public/wap/PartyLeadingController/getNews.jhtml',--%>
	<%--		data: {--%>
	<%--		},--%>
	<%--		success: function(data) {--%>
	<%--			var dataList= data.rows;--%>
	<%--			var divStr='';--%>
	<%--			for( var i=0;i<dataList.length;i++){--%>
	<%--				if (dataList[i].coverPath!=null){--%>
	<%--					divStr+=	'<div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10">'+--%>
	<%--						'<div class="flex1">'+--%>
	<%--							'<p class="font-size-15 cor-4d font-bold height-3em text-line-c2">'+dataList[i].content +'</p>'+--%>
	<%--							'<div class="flex flex-jb flex-ac mt5">'+--%>
	<%--								'<p class="font-size-12 cor-999 flex mt5"><em class="width-10em text-line-c1">'+dataList[i].orgName+'</em><em class="ml15">'+dataList[i].createDate.substring(0,10)+'</em> </p>'+--%>
	<%--							'</div>'+--%>
	<%--						'</div>'+--%>
	<%--						'<div class="pic-wrap-ext1 notice-s1 ml10">'+--%>
	<%--							'<div class="pic-wrap-c">'+--%>
	<%--								'<div class="pic-wrap-i border-radius-4">'+--%>
	<%--									'<img src="${imgDomain}'+dataList[i].coverPath +'">'+--%>
	<%--								'</div>'+--%>
	<%--							'</div>'+--%>
	<%--						'</div>'+--%>
	<%--					'</div>'--%>
	<%--				}else {--%>
	<%--					divStr+= '<div class="layui-col-xs12 bor-btm-f0 pt15 pb10">'+--%>
	<%--							'<p class="font-size-15 cor-4d font-bold text-line-c3">'+dataList[i].content+'</p>'+--%>
	<%--							'<div class="flex flex-jb flex-ac mt5">'+--%>
	<%--							'<p class="font-size-12 cor-999 flex mt5"><em class="width-10em text-line-c1">'+dataList[i].orgName+'</em><em class="ml15">'+dataList[i].createDate.substring(0,10)+'</em> </p>'+--%>
	<%--							'</div>'+--%>
	<%--							'</div>'--%>
	<%--				}--%>
	<%--				if (i==4){  //最多四条--%>
	<%--					break;--%>
	<%--				}--%>
	<%--			}--%>
	<%--			$("#NewsDiv").html(divStr)--%>

	<%--		},--%>
	<%--		error: function(data) {--%>
	<%--		},--%>
	<%--		complete : function() {--%>
	<%--		}--%>
	<%--	});--%>
	<%--}--%>


	function getNews(){
		var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
		var map = {
			orgCode: "${orgCode}",
			page: 1,
			rows: 4
		};
		map.catalogId = '10000120';
		map.isEndPubDate = 'no';
		map.isPic = 'yes';
		map.isPubOrg = 'no';
		map.isTop = 'yes';
		map.noTop = 1 ;
		$.ajax({
			type: 'GET',
			url: url,
			data: map,
			success: function(data) {
				if (data.total > 0) {
					var rows = data.rows
					var divStr = ''
					for (let i = 0; i < rows.length; i++) {
						if (rows[i].fileName!=null){
							divStr+=	'<div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10"  onclick="newsDetail(' + rows[i].infoOpenId + ')">'+
									'<div class="flex1">'+
									'<p class="font-size-15 cor-4d font-bold height-3em text-line-c2">'+rows[i].title +'</p>'+
									'<div class="flex flex-jb flex-ac mt5">'+
									'<p class="font-size-12 cor-999 flex mt5"><em class="width-10em text-line-c1">'+rows[i].pubOrg+'</em><em class="ml15">'+rows[i].pubDate.substring(0,10)+'</em> </p>'+
									'</div>'+
									'</div>'+
									'<div class="pic-wrap-ext1 notice-s1 ml10">'+
									'<div class="pic-wrap-c">'+
									'<div class="pic-wrap-i border-radius-4">'+
									'<img src="${imgDomain}'+rows[i].fileName +'">'+
									'</div>'+
									'</div>'+
									'</div>'+
									'</div>'
						}else if(rows[i].staticUrl!=null&&rows[i].staticUrl!=''){
							divStr+=	'<div class="layui-col-xs12 bor-btm-f0 pt10 pb10">'+
								'<p class="font-size-15 cor-4d font-bold">'+rows[i].title +'</p>'+
								'<div class="pic-wrap-ext1 notice-s2 mt5">'+
									'<div class="pic-wrap-c">'+
										'<div class="pic-wrap-i border-radius-4">'+
											'<video  controls="{{false}}" style="width: 100%;height: 100%;" webkit-playsinline="true" initial-time="0.01" autostart="false" loop="true" src="' + rows[i].staticUrl + '#t=1">'+
										'</div>'+
										// '<button class="layui-btn layui-btn-ext1 posi-md-ext1"></button>'+
									'</div>'+
								'</div>'+
								'<div class="flex flex-jb flex-ac mt5">'+
									'<p class="font-size-12 cor-999 flex mt5"><em class="width-10em text-line-c1">'+rows[i].pubOrg+'</em><em class="ml15">'+rows[i].pubDate.substring(0,10)+'</em> </p>'+
								'</div>'+
							'</div>'

						}
						else {
							divStr+= '<div class="layui-col-xs12 bor-btm-f0 pt15 pb10" onclick="newsDetail(' + rows[i].infoOpenId + ')">'+
									'<p class="font-size-15 cor-4d font-bold text-line-c3">'+rows[i].title+'</p>'+
									'<div class="flex flex-jb flex-ac mt5">'+
									'<p class="font-size-12 cor-999 flex mt5"><em class="width-10em text-line-c1">'+rows[i].pubOrg+'</em><em class="ml15">'+rows[i].pubDate.substring(0,10)+'</em> </p>'+
									'</div>'+
									'</div>'
						}
					}
					$("#NewsDiv").html(divStr)

				}else {

					$("#NewsDiv").html('<div class="height-p85 flex flex-clm flex-jc flex-ac" >' +
							'<div class="data-none-ext1 img-p100">' +
							'<img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">' +
							'</div>' +
							'<p class="font-size-17 cor-999 mt35">暂无数据</p>' +
							'</div>')
				}
			},
			error: function(data) {
				alert("错误")
			},
			complete : function() {
			}
		});
	}




	//农业视频
	function loadExperts() {
		var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
		var map = {
			orgCode: "${orgCode}",
			page: 1,
			rows: 4
		};
		map.catalogId = '10000119';
		map.isEndPubDate = 'no';
		map.isPic = 'yes';
		map.isPubOrg = 'no';
		map.isTop = 'yes';
		map.noTop = 1 ;
		$.ajax({
			type: 'GET',
			url: url,
			data: map,
			success: function (data) {
				// alert(data.rows)
				if (data.total > 0) {
					var rows = data.rows
					var trainings = ''
					for (let i = 0; i < rows.length; i++) {
						var comp = '';

						comp = `<video id="video_`+i+`"  style="width: 100%;height: 100%;" preload="metadata" controls  x5-video-player-fullscreen="true"  x5-playsinline    src="` + rows[i].staticUrl + `#t=1">`;
						if(rows[i].staticUrl==null||rows[i].staticUrl==''){
							comp= `<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">`
						}
						trainings+=			'<li>'+
													'<a href="javascript: void(0)">'+

														'<div class="section-con-pic">' +
														comp +
														'</div>'+
														'<div class="section-con-det">'+
															'<p class="font-size-14 cor-4d text-line-c1 mt10">'+rows[i].title+'</p>'+
															// '<p class="read-ext1">1000</p>'+
														'</div>'+
													'</a>'+
												'</li>'
					}
					$("#experts").html(trainings)
					for (let i = 0; i < rows.length; i++) {
						const IS_IOS = !/(Android)/i.test(navigator.userAgent); //ios终端
						if (IS_IOS) {
							wx.config({
								// 配置信息, 即使不正确也能使用 wx.ready
								debug: false,
								appId: '',
								timestamp: 1,
								nonceStr: '',
								signature: '',
								jsApiList: []
							});
							wx.ready(function() {
								$("#video_"+ i)[0].load();
							});

						}
					}
				} else {
					// $('#expertsZwsj').removeClass('hide');
					// $('#experts').hide();
					$("#experts").html('<div class="height-p85 flex flex-clm flex-jc flex-ac" style="width:100%;">' +
							'<div class="data-none-ext1 img-p100">' +
							'<img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">' +
							'</div>' +
							'<p class="font-size-17 cor-999 mt35">暂无数据</p>' +
							'</div>')
				}
			},
			error: function (data) {
				console.log("获取列表数据连接超时！");
			},
			complete: function () {
			}
		})
	}


	function  toMofang(){
		location.href = '<%=path%>/public/wap/PartyLeadingController/toMOfang.jhtml';
	}


	// 页面跳转。
	function openView(infoOpenId) {
		var url = '${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + infoOpenId + '&tKey=wdk&isTop=yes&isPic=yes&mode=view&openNewPager=true';
		jump(url);
	}


	//跳转至微党课视频列表
	function moreVideo() {
		location.href='${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=wdk&isTop=yes&isPic=yes&mode=view&openNewPager=true'
	}



	//跳转至党建资讯列表
	function moreNews() {
		location.href='${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=djxw&isTop=yes&isPic=yes&mode=view&openNewPager=true'
	}
	//  进入党建资讯详情
	function  newsDetail(infoOpenId){
		var url = '${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + infoOpenId + '&tKey=djxw&isTop=yes&isPic=yes&mode=view&openNewPager=true';
		// jump(url);
		location.href=url
	}







	function getButtonDiv(){

		var  platform =isWeChat()

		$.ajax({
			type: 'POST',
			url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
			data: {
				orgCode:"${orgCode}",
				type:'7',  //导航栏
				useType:'djyl',
				platform:'spt'
			},
			success: function(data) {
				var html =''
				$('#buttonDiv').html("");
				var showFlag= false
				if(data!=null){
					var dvModulars= data.dvModulars
					if (dvModulars!=null){
						for(var j=0;j<dvModulars.length;j++){
							var  modularContents =dvModulars[j].modularContents
							for(var z=0;z<modularContents.length;z++){
								showFlag =true

								var picUrl=modularContents[z].attList.length>0? '${imgDomain}'+ modularContents[z].attList[0].filePath:'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png'
								var url= modularContents[z].url
								html+=
										// '<a href="Javascript:;" style="padding-right: 4.2px">'+
										// '<div class="index-ann-box-icon img100" onclick="jump(\'' + url + '\')">'+
										// '<img src="'+picUrl+'" alt="">'+
										// '</div>'+
										// '<p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">'+modularContents[z].name+'</p>'+
										// '</a>'

										'<li>'+
											'<a href="javascript: void(0)" class="menu-ext1-item" onclick="jump(\'' + url + '\')">'+
											'<i class="menu-ext1-icon">'+
											'<img src="'+picUrl+'">'+
											'</i>'+
										'<p class="font-size-12 cor-4d text-align-c mt8">'+modularContents[z].name+'</p>'+
									'</a>'+
									'</li>'


							}
							$('#buttonDiv').html(html);

						}
					}
				}
			},
			error: function(data) {

			},
			complete : function() {
			}
		});
	}



	/**
	 * 判断是不是微信浏览器
	 * @return {Boolean}
	 */
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


		// if (url=='null'){
		// 	layer.msg('暂未开放 敬请期待', {
		// 		time: 0, //20s后自动关闭
		// 		btn: ['关闭']
		// 	});
		// 	return
		// }
		location.href = url

	}



</script>

</html>