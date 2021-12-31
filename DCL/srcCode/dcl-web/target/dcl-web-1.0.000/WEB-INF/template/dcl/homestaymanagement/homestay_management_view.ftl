<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>民宿管理-详情</title>
	<#include "/component/layuiCommonHead.ftl" />
	<#include "/component/uploadFileCommon.ftl" />

	<!-- swiper样式 -->
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css" />

	<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
	<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>

	<!-- 新地图标注js start -->
	<script type="text/javascript" src="${GIS_URL}/js/gis/base/mapMarker.js"></script>

	<!-- 地图标注点样式 start -->
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/normal.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/easyuiExtend.css" />
	<script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${uiDomain!''}/js/jquery.easyui.patch.js"></script><!--用于修复easyui-1.4中easyui-numberbox失去焦点后不能输入小数点的问题-->
	<script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<!-- 新地图标注js end -->

	<script src="${rc.getContextPath()}/js/html5media.min.js"></script>
</head>

<body class="scroll">
	<div class="bs h100 layui-form padding-ext1 layui-form">
		<div class="layer-title-ext1 clearfix">
			<div class="layer-title-ext1-left clearfix fl">
				<p class="text-lh1 font-size-14 fl font-bold">民宿详情</p>
			</div>
			<a href="javascript:void(0);" class="layer-close-ext1 fr">
				<i class="layui-icon layui-icon-close"></i>
			</a>
		</div>
		<div class="layer-content-ext1 layer-box-bg-ext1 padding-ext2">
			<div class="h100 scroll padding-ext3">
				<div class="xc-details-top clearfix">
					<!-- 轮播图 -->
					<div class="xc-dt-left fl clearfix">
						<div class=" gallery-left fl">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<#if fileList?? && (fileList?size > 0) >
										<#list fileList as item>
											<#if item.picUrl?? && item.fileType == 'img'>
												<div class="swiper-slide img100">
													<img src="${imgDomain}${item.picUrl}">
												</div>
											</#if>
											<#if item.picUrl?? && item.fileType == 'video'>
												<div class="swiper-slide img100">
													<video src="${imgDomain}${item.picUrl}" type="application/x-shockwave-flash" style="width: 100%;height: 100%;" controls="controls" autostart="false" loop="true" />
												</div>
											</#if>
										</#list>
									<#else>
										<div class="swiper-slide img100">
											<div class="standard-default-pic-ext1"></div>
										</div>
									</#if>
								</div>
							</div>
						</div>
						<div class="gallery-right fl">
							<a href="javascript:void(0);" class="gallery-right-pre text-align-c">
								<i class="layui-icon layui-icon-up cor-fff font-size-24"></i>
							</a>
							<a href="javascript:void(0);" class="gallery-right-next text-align-c">
								<i class="layui-icon layui-icon-down cor-fff font-size-24"></i>
							</a>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<#if fileList?? && (fileList?size > 0) >
										<#list fileList as item>
											<#if item.picUrl?? && item.fileType == 'img'>
												<div class="swiper-slide img100">
													<img src="${imgDomain}${item.picUrl}">
												</div>
											</#if>
											<#if  item.picUrl?? && item.fileType == 'video'>
												<div class="swiper-slide img100">
													<video src="${imgDomain}${item.picUrl}" style="width:100%; height:100%;" autostart="false" />
												</div>
											</#if>
										</#list>
									<#else>
										<div class="swiper-slide img100">
											<div class="standard-default-pic-ext1"></div>
										</div>
									</#if>
								</div>
							</div>
						</div>
					</div>
					<div class="xc-dt-right fr">
						<p class="xc-dtr-title font-size-28 cor-333 font-bold ">${(bo.homestayName)!''}</p>
						<div class="clearfix mt15 xc-dtr-box1">
							<p class="font-size-16 cor-3d7be6 line-height-26 fl">【${(bo.accommodationName)!''}】</p>
							<#if (bo.issuStatusName)=='已发布'>
								<i class="fl xc-dtrb1-icon xc-dtrb1-sj font-bold font-size-14 cor-fff line-height-26 text-align-c">${(bo.issuStatusName)!''}</i>
							</#if >
							<#if (bo.issuStatusName)=='未发布'>
								<i class="fl xc-dtrb1-icon xc-dtrb1-bsj font-bold font-size-14 cor-fff line-height-26 text-align-c">${(bo.issuStatusName)!''}</i>
							</#if >
						</div>
						<div class="xc-dtr-box2 flex mt40">
							<p class="font-size-14 cor-333 line-height-20">详细地址</p>
							<p class="flex1 ml20 font-size-14 cor-999 line-height-20">${(bo.address)!''}</p>
							<a href="javascript:void(0);" class="xc-dtr-adress line-height-20 font-size-14 cor-3d7be6 ml15">
								<p id='map'></p>
							</a>
						</div>
					</div>
				</div>
                <div class="standard-details-title-ext1 mt15 clearfix">
                    <i class="fl"></i>
                    <p class="font-size-18 cor-3d7be6 text-lh1 fl font-bold">基本信息</p>
                </div>
                <div class="mt15 check-table">
                    <table class="layui-table layui-table-nohover">
                        <colgroup>
                            <col width="180px">
                            <col width="auto">
                        </colgroup>
                        <tbody>
                            <tr>
								<td>所属区域</td>
								<td>${(bo.orgName)!''}</td>
                                <td>经营人</td>
                                <td>${(bo.operator)!''}</td>
                                <td>联系方式</td>
                                <td>${(bo.tel)!''}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				<div class="standard-details-title-ext1 clearfix mt35">
					<i class="fl"></i>
					<p class="font-size-18 cor-3d7be6 text-lh1 fl font-bold">民宿介绍</p>
				</div>
				<div id="attractionsDesc"  class="jd-introduce">
					${(bo.homestayDesc)!''}
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	var gridId = "${gridId}";
	var markerOperation ='${(markerOperation)!}';
	var module = '${(module)!}';

	var mapMarker = new MapMarker({
		el: "map",//div挂载点
		context: '${GIS_URL}',//gis域名
		width: 650,//弹框宽度，可以不传，默认480px
		height: 500,//弹框高度，可以不传，默认360px
		data: { //业务数据
			id: "${(bo.uuid)!}",
			//	name : $("#name").val(),//业务名称，地图定位显示时的标题
			markerType: module,//模块类型
			markerOperation: markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
			gridId: gridId,//网格标识，用于打开地图初始的默认位置
			type: "UUID"//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
		}, done:function(data) {//弹框确认回调，已回填了xyz到页面元素

		}
	});
</script>

<script>
	$(function() {
		// 滚动条美化
		$('.scroll').niceScroll({
			cursorcolor: "#000", //滚动条的颜色
			cursoropacitymax: 0.12, //滚动条的透明度，从0-1
			cursorwidth: "4px", //滚动条的宽度  单位默认px
			cursorborderradius: "2px", //滚动条两头的圆角
			autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
			zindex: 8, //给滚动条设置z-index值
		});
		// 轮播图
		var galleryThumbs = new Swiper('.gallery-right .swiper-container', {
			spaceBetween: 3,
			slidesPerView: 4,
			direction: 'vertical',
			// freeMode: true,
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
		});
		var galleryTop = new Swiper('.gallery-left .swiper-container', {
			spaceBetween: 3,
			allowTouchMove: false,
			direction: 'vertical',
			navigation: {
				nextEl: '.gallery-right-next',
				prevEl: '.gallery-right-pre',
				disabledClass: 'gallery-right-disabled',
			},
			thumbs: {
				swiper: galleryThumbs
			}
		});

		// 内容切换
		$('.sd-title-ext3').on('click', 'i', function() {
			$(this).addClass('active').siblings().removeClass('active');
			var iIndex = $(this).index();
			$('.jd-pl-content').children('.jd-plc-box').eq(iIndex).removeClass('hide').siblings().addClass('hide');
			$('.scroll').getNiceScroll().resize();
		});

		// 关闭弹窗
		$('.layui-icon-close').click(function() {
			var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
			parent.layer.close(index);  //再执行关闭
		})
	})
</script>
</body>
</html>