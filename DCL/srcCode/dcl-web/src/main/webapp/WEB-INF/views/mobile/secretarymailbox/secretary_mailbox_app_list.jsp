<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>

<!doctype html>
<html>
<head>
	<title>信箱列表</title>
	<meta charset="utf-8">
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="white">
	<meta name="format-detection" content="telephone=no">

	<link href="<%=path%>/css/app/css/box.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/reset.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/global.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/event.css" rel="stylesheet"/>
	<link href="<%=path%>/css/event.css" rel="stylesheet"/>

	<script src="<%=path%>/js/jquery-9-3-2-0.min.js"></script>
	<script src="<%=path%>/js/uitl/common.js"></script>
	<script src="<%=path%>/js/layer/layernew/layer.js" type="text/javascript"></script>
	<script src="<%=path%>/js/layer/layer_wap.js" type="text/javascript"></script>
	<script src="${uiDomain}/web-assets/plugins/layui-v2.4.5/layui/layui.all.js"></script>
	<script src="${uiDomain}/app-assets/extend/app-address/geo_address_plugin.js"></script>
	<script src="${uiDomain}/app-assets/extend/wap-person-select/js/custom_msgClient.js"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/date-time-appcomponent.1.0.2.js" type="text/javascript" charset="utf-8"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/mobiscroll/v3/js/mobiscroll.custom-3.0.0-beta4.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/swiper-4.1.6/swiper.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/common/xdate.js" type="text/javascript" charset="utf-8"></script>

	<!-- H5时间范围选择器。 -->
	<script src="${uiDomain}/app-assets/extend/appDateTime/date-time-appcomponent.1.0.4.js" type="text/javascript" charset="utf-8"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/mobiscroll/v3/js/mobiscroll.custom-3.0.0-beta4.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/swiper-4.1.6/swiper.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${uiDomain}/app-assets/extend/appDateTime/common/xdate.js" type="text/javascript" charset="utf-8"></script>

	<style type="text/css">
		.sm-sl {
			position: unset;
			top: unset;
			right: unset;
		}
		.lr-line-r {
			height: 20px;
		}
		.go-cleanserch::after, .go-dict::after {
			content: "";
			position: absolute;
			width: 0px;
			height: 18px;
			top: 9px;
			left: 0px;
			border-left: 1px solid #ebebeb;
		}
		.go-dict {
			position: absolute;
			height: 40px;
			line-height: 40px;
			right: 0px;
			width: 50px;
			text-align: center;
			color: #008fdd;
			background: url(<%=path%>/css/app/img/right-icon-b.png) center center no-repeat;
			background-size: 10px;
		}
		.go-cleanserch::after, .go-dict::after {
			content: "";
			position: absolute;
			width: 0px;
			height: 18px;
			top: 9px;
			left: 0px;
			border-left: 1px solid #ebebeb;
		}
		.tab-nav ul li {
			width: 50%;
		}
		.data-nor > p.active, .data-nor > p:hover {
			background-color: rgb(102, 179, 255) !important;
			color: #fff !important;;
		}
		#appdlayer {
			top: 0 !important;
		}

		#body {
			margin-bottom: 0;
			margin-top: 90px;
		}
		.fixed-btn a.add-oper {
			background: url(<%=path%>/css/app/img/icon-add-fix.png) no-repeat;
			background-size: 100%;
			margin-bottom: 80px;
			border: 1px solid rgb(15, 138, 221);
		}
	</style>
</head>

<body id="body">
	<div class="tab-nav clearfix">
		<input type="hidden" name="status" id="status" value="00,01">
		<ul>
			<li id="all"><a onclick="resetStatus('all');">所有信箱</a></li>
			<li id="my"><a onclick="resetStatus('my');">我的信箱</a></li>
			<li class="sideline"></li>
		</ul>
	</div>
	
	<div class="fix-hd p-t-45">
		<ul>
			<li class="w-50" id="time">
				<input type="hidden" id="appealStartTime" name="appealStartTime" />
				<input type="hidden" id="appealEndTime" name="appealEndTime" />

				<a>
					<span id="selectTime">时间</span>
					<i class="icon-arrow"></i>
				</a>
			</li>

			<li class="w-50">
				<input type="hidden" name="replyStatus" id="replyStatus">

				<a onclick="selectDict('<%=path%>', 'ops_replyStatus', 'replyStatus', 'replyStatusName', 'replyStatusCallback')">
					<span id="replyStatusName">回复状态</span><i class="icon-arrow"></i>
				</a>
				<options hidden id="ops_replyStatus">
					<c:forEach items="${REPLY_STATUS}" var="item">
						<option value="${item.value}">${item.name }</option>
					</c:forEach>
				</options>
			</li>
		</ul>
	</div>

	<div class="wrap-box db-list" id="info" style="margin-bottom: 0;">
		<ul id="dataList"></ul>
	</div>

	<div class="fixed-btn">
		<a onclick="add();" class="add-oper"></a>
	</div>

	<div class="drag_hide">
		<a id="getMore" onclick="getData()" style="display:none;">点击加载更多</a>
		<span id="loading"><i class="loading_icon"></i>加载中</span>
	</div>

	<div id="noDataList" class="default_wrap" style="display: none;">
		<img src="<%=path%>/images/icon_default.png"/>
		<div class="text_infor">暂无数据</div>
	</div>

	<div class="fixed_data">共<span id="total"></span>条数据</div>

	<a href="#body" class="back_top"></a>

<script type="text/javascript">
	var appViewType = "all";

	// 处理字符串
	function strInfo(str, str1) {
		if (str != null && str != 'null' && typeof (str) != 'undefined') {
			return str;
		} else {
			if (str1 != null && str1 != undefined) {
				return str1;
			} else {
				return "";
			}
		}
	}

	// H5时间范围选择器。
	$("#time").dateTime({
		format: "yyyy-MM-dd",
		setTop: false,//是否顶部显示控件
		ShowOptions: {
			TabItems: ["常用","年","季","月"],
			CommUsed: [ "上周", "本周", "上月", "本月", "昨天", "今天"]
		},
		themeColor: "#bcbcbc",//选中及按钮颜色
		StartDateId: 'startTime',
		EndDateId:'endTime',
		BackEvents: {
			OnSelected: function(stateDate, endDate) {
				$('#selectTime').html(stateDate + " - " + endDate);

				$('#appealStartTime').val(stateDate);
				$('#appealEndTime').val(endDate);

				searchInfo();
			}
		}
	});

	var scrollEnable = function (event) {
		event.preventDefault(); //不产生作用
	};

	function replyStatusCallback(name) {
		if (strInfo(name) == '') {
			$("#replyStatusName").text("回复状态");
		}

		$("#replyStatusName").val(name);

		searchInfo();
	}

	let navW, navL;
	let currentPage = 1;
	let lastPage = 1;

	// tab切换
	function nav() {
		navW = $('.find-nav-cur').find('a').width();
		navL = $('.find-nav-cur').find('a').position().left;
		$('.sideline').width(navW).css('left', navL);
	}

	//获取列表数据
	function getData() {
		$("#loading").html('<i class="loading_icon"></i>加载中');
		$("#noDataList").hide();
		$.post("<%=path%>/public/wap/secretaryMailboxApp/listData.json", {
			currentPage: currentPage,
			pageSize: 20,

			appViewType: appViewType,
			appealStartTime: $("#appealStartTime").val(),
			appealEndTime: $("#appealEndTime").val(),
			replyStatus: $("#replyStatus").val(),
			replyStatusName: $("#replyStatusName").val(),
			regionCode: '${userOrgCode}'
		}, function (data) {
			if (data != null) {
				var dataLength = data.data.length;
				if (currentPage == 1) {
					var count = data.count;
					$("#total").html(count);
					lastPage = parseInt((count - 1) / dataLength) + 1;
					if (count == 0 || dataLength == 0) {
						$("#getMore").hide();
						$("#total").html(0);
						$("#noDataList").show();
					}
					$("#dataList").html("");
				}
				if (dataLength > 0) {
					$("#noDataList").hide();
					//解析数组
					$.each(data.data, function (i, item) {
						var replyStatusName = strInfo(item.replyStatusName);

						var replyStatusNameColor;
						if (replyStatusName == "已回复") {
							replyStatusNameColor = "green";
						} else {
							replyStatusNameColor = "orange";
						}

						$("#dataList").append(
								'<li>' +
								'   <a href="<%=path%>/public/wap/secretaryMailboxApp/view.jhtml?uuid=' + item.uuid + '" class="db-detail-a">' +
								'       <div class="db-tit-line">' +
								'           <div style="width: 90%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">' + strInfo(item.appealContent) + '</div>' +
								'       </div>' +
								'       <div class="lr-line" style="height: 40px">' +
								'           <div class="lr-line-l" style="width: 90%">留言人：' + strInfo(item.claimant) + '</div>' +
								'           <div class="lr-line-r txt-' + replyStatusNameColor + '">' + strInfo(item.replyStatusName) + '</div>' +
								'           <div class="lr-line-l">留言时间：' + strInfo(item.appealTime) + '</div>' +
								'       </div>' +
								'   </a>' +
								'</li>'
						);
					});
					if (lastPage > currentPage) {
						currentPage = currentPage + 1;
						$("#getMore").show();
					} else {
						$("#getMore").hide();
					}
				}
				$("#loading").html('');
			}
		}, 'json');
	}

	//返回顶部
	$(window).scroll(function () {
		if ($(window).scrollTop() <= 400) {
			$(".back_top").fadeOut();
		} else {
			$(".back_top").fadeIn();
		}
	});

	function resetStatus(value) {
		appViewType = value;
		searchInfo();
	}

	//查询
	function searchInfo() {
		currentPage = 1;
		lastPage = 1;
		$("#getMore").hide();
		$("#dataList").empty();
		$("#total").html("");
		$("#loading").html('<i class="loading_icon"></i>加载中');
		getData();
	}

	$(function () {
		// tab切换
		$('.tab-nav ul').on('click', 'li', function () {
			$(this).addClass('find-nav-cur').siblings().removeClass('find-nav-cur');
			nav();
		});
		$("#all").find('a').click();
		$("#all").click();
	});

	function add() {
		location.href = '<%=path%>/public/wap/secretaryMailboxApp/form.json';
	}
</script>
</body>
</html>