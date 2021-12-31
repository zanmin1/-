<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>

<!doctype html>
<html>
<head>
	<title>村务政务</title>
	<meta charset="utf-8">
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="white">
	<meta name="format-detection" content="telephone=no">

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
	<link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css" />

	<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
	<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
</head>

<body class="bg-cor-f5">
	<div class="layui-contain">
		<div class="layui-row">
			<div class="layui-col-xs12">
				<div class="pic-wrap-ext1 notice-s4">
					<div class="pic-wrap-c">
<%--						<div class="width-p100 posi-abso posi-top-10 bs pl15 pr15">--%>
<%--							<div class="search-ext2 flex flex-ac">--%>
<%--								<div class="search-ext2-left bs pl10 pr10 bor-right-e6">--%>
<%--									<p class="font-size-13 cor-333 text-lh1 text-align-c">龙江村</p>--%>
<%--								</div>--%>
<%--								<div class="flex1 bs flex flex-ac">--%>
<%--									<i class="search-icon-ext2"></i>--%>
<%--									<input type="text" placeholder="搜索内容" class="layui-input font-size-13 bor-unset height-30 pd-ltrb-0 flex1">--%>
<%--									<i class="search-empty-ext1 ml5 mr10 layui-icon layui-icon-close font-size-14 cor-ccc"></i>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
						<div class="width-p100 height-p100 posi-abso posi-top-0 czzw-swiper">
							<div class="swiper-container swiper-list-ext2 height-p100">
								<div class="swiper-wrapper" id="tbbj">

								</div>
								<!-- Add Pagination -->
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-xs12 pl10 pr10 mt10">
				<div class="cwzw-xuanchuan bg-fff border-radius-4 height-64 flex flex-ac">
					<i class="cwzw-xc-text"></i>
					<i class="cwzw-xc-line ml10 mr10"></i>

					<div class="flex1 flex flex-ac pr10 overflow-h">
						<div class="flex1 cwzw-content height-64 overflow-h">
							<!-- 暂无数据 -->
							<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc hide" id="zcxcZwsj">
								<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
							</div>
							<div class="swiper-container width-p100 height-p100" id="zcxcSj">
								<div class="swiper-wrapper" id="zcxc">

								</div>
							</div>
						</div>
						<i class="cwzw-right" id="cwzw-right"></i>
					</div>
				</div>
			</div>
			<div class="layui-col-xs12 mt10">
				<div class="cwzw-box1 bg-fff">
<%--					<div class="cwzw-box1-top height-44 bor-btm-f0 pl15 flex">--%>
<%--						<a href="javascript:void(0);" class="cor-80 font-size-15 line-height-44 active">美丽乡村</a>--%>
<%--						<a href="javascript:void(0);" class="cor-80 font-size-15 line-height-44 ml30">乡村法治</a>--%>
<%--					</div>--%>
					<div class="cwzw-box1-content">
						<div class="cwzw-b1c-item cwzw-b1c-item1 height-p100">
							<div class="swiper-container ">
								<div class="swiper-wrapper">
									<div class="swiper-slide layui-row pl15 pr15 pt15 bs">
										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=dwgk&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">
											<!-- img -->
											<div class="index-ann-box-icon img100">
												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon32.png" alt="">
											</div>
											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">党务公开</p>
										</a>
										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=cwgk&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">
											<!-- img -->
											<div class="index-ann-box-icon img100">
												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon33.png" alt="">
											</div>
											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村务公开</p>
										</a>
										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=caiwgk&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">
											<!-- img -->
											<div class="index-ann-box-icon img100">
												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon34.png" alt="">
											</div>
											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">财务公开</p>
										</a>
										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=cqjs&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">
											<!-- img -->
											<div class="index-ann-box-icon img100">
												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon35.png" alt="">
											</div>
											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村情介绍</p>
										</a>
										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">
											<!-- img -->
											<div class="index-ann-box-icon img100">
												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon36.png" alt="">
											</div>
											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">政策宣传</p>
										</a>
										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5">
											<!-- img -->
											<div class="index-ann-box-icon img100" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=cgmy&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">
												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon37.png" alt="">
											</div>
											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">村规民约</p>
										</a>
<%--										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=jfjx&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--											<!-- img -->--%>
<%--											<div class="index-ann-box-icon img100">--%>
<%--												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon38.png" alt="">--%>
<%--											</div>--%>
<%--											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">家风家训</p>--%>
<%--										</a>--%>
<%--										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=yfys&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--											<!-- img -->--%>
<%--											<div class="index-ann-box-icon img100">--%>
<%--												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon39.png" alt="">--%>
<%--											</div>--%>
<%--											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">移风易俗</p>--%>
<%--										</a>--%>
									</div>
								</div>
							</div>
							<div class="fyq-lunbo swiper-pagination"></div>
						</div>
<%--						<div class="cwzw-b1c-item cwzw-b1c-item2 height-p100 hide">--%>
<%--							<div class="swiper-container swiper02">--%>
<%--								<div class="swiper-wrapper">--%>
<%--									<div class="swiper-slide layui-row pl15 pr15 pt15 bs">--%>
<%--										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=yasf&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--											<!-- img -->--%>
<%--											<div class="index-ann-box-icon img100">--%>
<%--												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon40.png" alt="">--%>
<%--											</div>--%>
<%--											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">以案释法</p>--%>
<%--										</a>--%>
<%--										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=pfjy&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--											<!-- img -->--%>
<%--											<div class="index-ann-box-icon img100">--%>
<%--												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon41.png" alt="">--%>
<%--											</div>--%>
<%--											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">普法教育</p>--%>
<%--										</a>--%>
<%--										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=flwd&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--											<!-- img -->--%>
<%--											<div class="index-ann-box-icon img100">--%>
<%--												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png" alt="">--%>
<%--											</div>--%>
<%--											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">法律问答</p>--%>
<%--										</a>--%>
<%--										<a href="Javascript:;" class="layui-col-xs3 pt5 mb5" onclick="openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=gzfw&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')">--%>
<%--											<!-- img -->--%>
<%--											<div class="index-ann-box-icon img100">--%>
<%--												<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon43.png" alt="">--%>
<%--											</div>--%>
<%--											<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">公证服务</p>--%>
<%--										</a>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--							<div class="fyq-lunbo swiper-pagination"></div>--%>
<%--						</div>--%>
					</div>
				</div>
				<div class="cwzw-box2">
					<div class="flex flex-ac height-44 pl15">
						<p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>三务公开</p>
					</div>
					<div class="cwzw-box2-content layui-row">
						<div class="layui-col-xs12">
							<div class="swiper-container nav-ext1 nav-ext1-blue1 j-nav bg-fff bor-btm-f0">
								<div class="swiper-wrapper">
									<div class="swiper-slide selected"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">党务公开</button></div>
									<div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">村务公开</button></div>
									<div class="swiper-slide"><button class="btn-nav-ext1 layui-btn height-44 font-size-15">财务公开</button></div>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12">
							<div class="swiper-container j-nav-chidren">
								<div class="swiper-wrapper">
									<!-- 党务公开 -->
									<div class="swiper-slide nav-chidren-h1">
										<!-- 暂无数据 -->
										<div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50" id="dwgkZwsj">
											<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
										</div>
										<div class="layui-row bg-fff" id="dwgkSj">
											<div class="layui-col-xs12 pl15 pr15 pb10" id="dwgk">

											</div>
										</div>
									</div>

									<!-- 村务公开 -->
									<div class="swiper-slide nav-chidren-h1">
										<!-- 暂无数据 -->
										<div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50" id="cunwgkZwsj">
											<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
										</div>
										<div class="layui-row bg-fff" id="cunwgkSj">
											<div class="layui-col-xs12 pl15 pr15 pb10" id="cunwgk">

											</div>
										</div>
									</div>

									<!-- 财务公开 -->
									<div class="swiper-slide nav-chidren-h1">
										<!-- 暂无数据 -->
										<div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50" id="caiwgkZwsj">
											<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
										</div>
										<div class="layui-row bg-fff" id="caiwgkSj">
											<div class="layui-col-xs12 pl15 pr15 pb10" id="caiwgk">

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	$.fn.extend({
		// swiper
		navExt1: function (num) {
			var _this = this;
			var navEl = navEl1 = $(_this).selector.substr(1);
			var navEl2 = '' + navEl1 + '-chidren';
			function setCurrentSlide(ele, index) {
				$("." + navEl + " .swiper-slide").removeClass("selected");
				ele.addClass("selected");
			}
			navEl1 = new Swiper('.' + navEl1 + '', {
				slidesPerView: num,
				paginationClickable: true,//此参数设置为true时，点击分页器的指示点分页器会控制Swiper切换。
				freeMode: false,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
				loop: false,//是否可循环
				autoHeight: true, //高度随内容变化
				observer: true,
				observeParents: true,
				slideToClickedSlide: true//设置为true则点击slide会过渡到这个slide。
			});
			navEl1.slides.each(function (index, val) {
				var ele = $(this);
				ele.on("click", function () {
					$('.j-nav-arrow').attr('data-navindex', $(this).index());
					setCurrentSlide(ele, index);
					navEl2.slideTo(index, 500, false);
					// 获取点击后的index
				});
			});
			navEl2 = new Swiper('.' + navEl2 + '', {
				direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
				loop: false,
				touchRatio: 0,
				autoHeight: true//自动高度。设置为true时，wrapper和container会随着当前slide的高度而发生变化。
			});
		},
	});

	$(function () {
		var mySwiper1 = new Swiper('.swiper01', {
			observer: true,
			observeParents: true,
			pagination: {
				el: '.cwzw-b1c-item1 .swiper-pagination',
				clickable: true
			}
		});
		var mySwiper2 = new Swiper('.swiper02', {
			observer: true,
			observeParents: true,
			pagination: {
				el: '.cwzw-b1c-item2 .swiper-pagination',
				clickable: true
			}
		});
		$('.cwzw-box1-top').on('click', 'a', function() {
			$(this).addClass('active').siblings().removeClass('active');
			var aIndex = $(this).index();
			$('.cwzw-box1-content').children('.cwzw-b1c-item').eq(aIndex).removeClass('hide').siblings().addClass('hide');
		})
	});



	findNoticeList('10000006');   // 政策宣传。
	findNoticeList('10000007');   // 党务公开。
	findNoticeList('10000003');   // 村务公开。
	findNoticeList('10000008');   // 财务公开。
	function findNoticeList(catalogId) {
		var map = {
			orgCode: '${orgCode}',
			page: 1,
			rows: 10
		};
		map.catalogId = catalogId;
		map.isEndPubDate = 'no';
		map.isPic = 'yes';
		map.isPubOrg = 'no';
		map.isTop = 'yes';
		map.status = 2 ;
		map.noTop = 1 ;
		var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
		$.ajax({
			type: 'POST',
			url: url,
			data: map,
			success: function(data) {
				if (data.total > 0) {
					var str = '';
					var list = data.rows;

					// 政策宣传。
					if (catalogId === '10000006') {
						if (list.length > 0) {
							for(let i = 0; i < list.length; i++) {
								// 点击数据，查看详情。
								str += '<div class="swiper-slide flex flex-clm flex-jc" onclick="openPage(\'/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + list[i].infoOpenId + '&tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}' + '\')">' +
										'<p class="font-size-13 cor-4d text-lh1 text-line-c1">' + list[i].title + '</p>' +
										'<p class="font-size-12 cor-a8 text-lh1 cwzw-c-text2">' + list[i].pubDate + '</p>' +
										'</div>';
							}

							$('#zcxc').html(str);

							// 点击">"，查看列表。
							$('#cwzw-right').attr("onclick", "openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')");

							// 循环轮播。
							if (list.length > 1) {
								// 放在外面轮播会失效。
								var mySwiper_1 = new Swiper('.cwzw-content .swiper-container', {
									direction: 'vertical',
									autoplay: {
										delay: 3000,
										stopOnLastSlide: false,
										disableOnInteraction: false
									},
									loop: true,//是否可循环
									observer: true,
									observeParents: true,
									observeSlideChildren: true
								});

							// 循环。
							} else {
								// 放在外面轮播会失效。
								var mySwiper_2 = new Swiper('.cwzw-content .swiper-container', {
									direction: 'vertical',
									loop: true,//是否可循环
									observer: true,
									observeParents: true,
									observeSlideChildren: true
								});
							}

						// 暂无数据。
						} else {
							$('#zcxcZwsj').removeClass('hide');
							$('#zcxcSj').hide();
						}

					// 党务公开，村务公开，财务公开。
					} else if (catalogId === '10000007' || catalogId === '10000003' || catalogId === '10000008') {
						if (list.length > 0) {
							var tKey;

							// 党务公开。
							if (catalogId === '10000007') {
								tKey = "dwgk";

							// 村务公开。
							} else if (catalogId === '10000003') {
								tKey = "cwgk";

							// 财务公开。
							} else if (catalogId === '10000008') {
								tKey = "caiwgk";
							}

							for (let i = 0; i < list.length; i++) {
								if (list[i].fileName == null || list[i].fileName === "") {
									str += '<div class="layui-col-xs12 bor-btm-f0 pt10 pb10" onclick="openPage(\'/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + list[i].infoOpenId + '&tKey=' + tKey + '&isTop=yes&isPic=yes&mode=view&openNewPager=true\')">' +
											'<p class="font-size-14 cor-4d" style="word-break: break-all">' + list[i].title + '</p>' +
											'<p class="font-size-12 cor-999 mt5">' + list[i].pubOrg + '<em class="ml15">' + list[i].pubDate + '</em> </p>' +
											'</div>';
								} else {
									str += '<div class="layui-col-xs12 bor-btm-f0 flex pt10 pb10" onclick="openPage(\'/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + list[i].infoOpenId + '&tKey=' + tKey + '&isTop=yes&isPic=yes&mode=view&openNewPager=true\')">' +
											'<div class="pic-wrap-ext1 notice-s1">' +
											'<div class="pic-wrap-c">' +
											'<div class="pic-wrap-i border-radius-4">' +
											'<img src="${imgDomain}' + list[i].fileName + '">' +
											'</div>' +
											'</div>' +
											'</div>' +
											'<div class="flex1 ml10">' +
											'<p class="font-size-14 cor-4d height-3em text-line-c2" style="word-break: break-all">' + list[i].title + '</p>' +
											'<p class="font-size-12 cor-999 mt10">' + list[i].pubOrg + '<em class="ml15">' + list[i].pubDate + '</em> </p>' +
											'</div>' +
											'</div>';
								}

								// 党务公开。
								if (catalogId === '10000007') {
									$('#dwgk').html(str);

								// 村务公开。
								} else if (catalogId === '10000003') {
									$('#cunwgk').html(str);

								// 财务公开。
								} else if (catalogId === '10000008') {
									$('#caiwgk').html(str);
								}
							}

						// 暂无数据。
						} else {
							// 党务公开。
							if (catalogId === '10000007') {
								$('#dwgkZwsj').removeClass('hide');
								$('#dwgkSj').hide();

							// 村务公开。
							} else if (catalogId === '10000003') {
								$('#cunwgkZwsj').removeClass('hide');
								$('#cunwgkSj').hide();

							// 财务公开。
							} else if (catalogId === '10000008') {
								$('#caiwgkZwsj').removeClass('hide');
								$('#caiwgkSj').hide();
							}
						}
					}

				// 暂无数据。
				} else {
					// 政策宣传。
					if (catalogId === '10000006') {
						$('#zcxcZwsj').removeClass('hide');
						$('#zcxcSj').hide();

					// 党务公开。
					} else if (catalogId === '10000007') {
						$('#dwgkZwsj').removeClass('hide');
						$('#dwgkSj').hide();

					// 村务公开。
					} else if (catalogId === '10000003') {
						$('#cunwgkZwsj').removeClass('hide');
						$('#cunwgkSj').hide();

					// 财务公开。
					} else if (catalogId === '10000008') {
						$('#caiwgkZwsj').removeClass('hide');
						$('#caiwgkSj').hide();
					}
				}

				// nav
				$('.j-nav').navExt1(3); // 函数参数为默认展示个数
			},
			error: function(data) {
				console.log("获取列表数据连接超时！");
			},
			complete: function() {
			}
		});
	}

	// 页面跳转。
	function openPage(url) {
		location.href = '${gbpDomain}' + url;
	}

	// 头部背景。
	getTbbjData();
	function getTbbjData() {
		var  platform =isWeChat()
		$.ajax({
			type: 'POST',
			url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
			data: {
				regionCode: '${orgCode}',   // 区域编码。
				useType: "cwzw",   // 村务政务。
				type: "3",   // 轮播图。
				platform:platform
			},
			success: function(data) {
				// 一个主题。
				if (data != null) {
					var str = '';
					var dvModular = data.dvModulars;   // 多个模块，只取第一个。

					if (dvModular != null) {
						dvModular = dvModular[0];
						var imgNum = 0;
						var modularContents = dvModular.modularContents;   // 多个模块内容。

						if (modularContents != null) {
							for (let i = 0; i < modularContents.length; i++) {
								var attList = modularContents[i].attList;   // 多个附件，只取第一个。

								if (attList != null) {
									attList = attList[0];
									str += '<div class="swiper-slide">' +
											'<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
											'<img src="' + '${imgDomain}' + attList.filePath + '" onerror="javascript:this.src=\'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png\';">' +
											'</div>' +
											' </div>';

									imgNum++;
								}
							}
						}

						$('#tbbj').html(str);

						// 循环轮播。
						if (imgNum > 1) {
							// 放在外面轮播会失效。
							var swiperList1_1 = new Swiper('.swiper-list-ext2', {
								spaceBetween : 5,
								pagination: {
									el: '.swiper-pagination'
								},
								direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
								autoplay: {
									delay: 3000,
									stopOnLastSlide: false,
									disableOnInteraction: false
								},
								loop: true,//是否可循环
								observer: true,
								observeParents: true,
								observeSlideChildren: true
							});

						// 循环。
						} else if (imgNum === 1) {
							// 放在外面轮播会失效。
							var swiperList1_2 = new Swiper('.swiper-list-ext2', {
								spaceBetween: 5,
								pagination: {
									el: '.swiper-pagination'
								},
								direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
								loop: true,//是否可循环
								observer: true,
								observeParents: true,
								observeSlideChildren: true
							});

						// 暂无数据。
						} else {
							$('#tbbj').html('<div class="swiper-slide">' +
									'<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
									'<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
									'</div>' +
									' </div>');
						}
					} else {
						$('#tbbj').html('<div class="swiper-slide">' +
								'<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
								'<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
								'</div>' +
								' </div>');
					}
				} else {
					$('#tbbj').html('<div class="swiper-slide">' +
							'<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
							'<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
							'</div>' +
							' </div>');
				}
			},
			error: function(data) {
				console.log("获取头部背景数据连接超时！");
			},
			complete: function() {
			}
		});
	}

	function isWeChat() {
		var ua = navigator.userAgent.toLowerCase();

		var  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
		if (type){
			return 'spt'
		}else {
			return 'xygj'
		}
	}
</script>
</body>
</html>