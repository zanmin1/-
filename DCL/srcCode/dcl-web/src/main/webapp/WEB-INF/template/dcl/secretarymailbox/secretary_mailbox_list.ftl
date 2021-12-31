<!DOCTYPE html>
<html>
<head>
	<title>书记信箱-pc列表</title>

	<#include "/component/layuiCommonHead.ftl" />
</head>

<body class="tbale-container">
	<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
	<!--[if lt IE 9]>
	<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	<input type="hidden" id="regionCode" name="regionCode" value="${regionCode!''}"/>

	<div class="layui-row">
		<div class="bg-fff">
			<div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
				<div class="layui-row layui-form layui-sch-g mt15">
					<div class="student-criteria flex">
						<div class="flex">
							<div class="layui-form-item">
								<label class="layui-form-label">提交人</label>
								<div class="layui-input-block w160">
									<input type="text" placeholder="请输入提交人姓名" class="layui-input" id="claimant">
								</div>
							</div>
							<div class="layui-form-item w300">
								<label class="layui-form-label">回复状态</label>
								<div class="layui-input-block w160">
									<input type="hidden" id="replyStatusName">

									<select id="replyStatus"></select>
								</div>
							</div>
							<div class="layui-form-item w300">
								<label class="layui-form-label">是否公开</label>
								<div class="layui-input-block w160">
									<input type="hidden" id="replyVisibleName">

									<select id="replyVisible"></select>
								</div>
							</div>
						</div>
						<div class="ml20 mr10">
							<button type="button" class="layui-btn layui-btn-normal" id="searchBtn">查询</button>
							<button type="button" class="layui-btn layui-btn-ext1" id="resetBtn">重置</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="layui-row">
		<div>
			<div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
				<div class="layui-fluid">
					<!-- 表格 -->
					<div class="layui-col-xs12 kq-table-box1 ">
						<table class="layui-hide" id="tableId" lay-filter="tableId"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- 表格头部工具栏 -->
<script type="text/html" id="tbTollsBar">
	<div class="layui-col-xs12">
		<p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>信箱列表</p>
		<div id="roleBtn" class="crudbox fr">
			<@actionCheck2></@actionCheck2>
<#--			<button type="button" class="layui-btn sch-btn layui-btn-normal students-edit" onclick="reply()">回复</button>-->
<#--			<button type="button" class="layui-btn layui-btn-ext4 jyj-mb-del" onclick="del()">删除</button>-->
		</div>
	</div>
</script>

<script>
	// 弹窗宽高
	var openWidth = '1022px', openHeight = '640px';

	var selectItem = null;

	$(function () {
		calcLayBdH(openWidth, openHeight);

		// 回复状态。
		LayuiComp.SingleSelect('replyStatus', {
			selectValue: '', // 默认值
			pCode: '${REPLY_STATUS}', // 字典编码
			selectedCallback: function(data) {
				$("#replyStatusName").val(data.name);   // 回复状态名称。
			},
			context: '${sysDomain}'
		});

		// 是否公开。
		LayuiComp.SingleSelect('replyVisible', {
			selectValue: '', // 默认值
			pCode: '${VISIBLE}', // 字典编码
			selectedCallback: function(data) {
				$("#replyVisibleName").val(data.name);   // 是否公开名称。
			},
			context: '${sysDomain}'
		});

		layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer', 'tree'], function () {
			form = layui.form,
			table = layui.table,
			laydate = layui.laydate,
			laytpl = layui.laytpl,
			element = layui.element,
			util = layui.util,
			layer = layui.layer,
			tree = layui.tree;

			table.render({
				elem: '#tableId'
				, url: '${rc.getContextPath()}/dcl/secretaryMailboxPc/listData.json'
				, height: tbH + 'px'
				, toolbar: '#tbTollsBar' //开启头部工具栏，并为其绑定左侧模板
				, defaultToolbar: ['']
				, request: {
					pageName: 'currentPage' //页码的参数名称，默认：page
					, limitName: 'pageSize' //每页数据量的参数名，默认：limit
				}
				, limit: 10
				, where: {
					regionCode: $('#regionCode').val()
				}
				, cols: [[
					{ type: 'numbers'},
					{ field: 'claimant', title: '提交人', align:'center', minWidth: 140, event:'viewDetails', style:'color:#3d80f4; cursor:pointer;'},
					{ field: 'tel', title: '联系电话', align:'center', minWidth: 140},
					{ field: 'appealTime', title: '提交时间', align:'center', minWidth: 140},
					{ field: 'replyStatusName', title: '回复状态', align:'center', minWidth: 140},
					{ field: 'replyVisibleName', title: '是否公开', align:'center', minWidth: 140}
				]]
				, page: true
				, text: {none: listNoDataHtml}
				, id: 'tableDataId'
				, done: function () {

				}
			});

			// 表格列表事件
			table.on('tool(tableId)', function (obj) {
				// 详情事件
				if (obj.event === 'viewDetails') {
					var index = layer.open({
						skin: 'layer-ext-sch',
						title: obj.data.claimant + "的留言",
						type: 2,
						btnAlign: 'c',
						area: ['90%', '90%'],
						content:'${rc.getContextPath()}/dcl/secretaryMailboxPc/view.jhtml?uuid=' + obj.data.uuid
					});
				}
			});

			// 监听行单击事件
			table.on('row(tableId)', function (obj) {
				$(obj.tr).toggleClass('md-table-click').siblings('tr').removeClass('md-table-click');

				if($($(obj.tr)[0]).hasClass('md-table-click')) {
					selectItem = obj.data;
				} else {
					selectItem = null;
				}
			});

			// 屏幕变化table重载
			$(window).on('resize', function () {
				calcLayBdH(openWidth, openHeight);

				table.reload('tableDataId', {
					height: tbH
				});
			});

			// 监听查询按钮
			$("#searchBtn").on('click', function () {
				searchData();
			});

			// 监听重置按钮
			$("#resetBtn").on('click', function () {
				resetSearch();
			});
		});
	});

	// 重置
	function resetSearch() {
		$("#claimant").val('');
		$("#replyStatus").val('');
		$("#replyStatusName").val('');
		$("#replyVisible").val('');
		$("#replyVisibleName").val('');

		form.render();

		searchData();
	}

	// 查询
	function searchData() {
		table.reload('tableDataId', {
			where: {
				claimant: $("#claimant").val(),
				replyStatus: $("#replyStatus").val(),
				replyStatusName: $("#replyStatusName").val(),
				replyVisible: $("#replyVisible").val(),
				replyVisibleName: $("#replyVisibleName").val(),
				regionCode: $('#regionCode').val()
			}, page: {
				curr: 1
			}
		});

		selectItem = null;
	}

	// 回复
	function reply() {
		if (selectItem == null) {
			layer.msg("请选择一条记录！", {skin: 'layui-layer-hui'});
		} else {
			// 回复判断。
			if (selectItem.replyStatusName === "已回复") {
				return layer.msg("一个问题只能回复一次！", {skin: 'layui-layer-hui'});
			}

			var index = layer.open({
				skin: 'layer-ext-sch',
				title: '回复 ' + selectItem.claimant + " 的留言",
				type: 2,
				area: ['70%', '90%'],
				content: '${rc.getContextPath()}/dcl/secretaryMailboxPc/form.jhtml?uuid=' + selectItem.uuid
			});
		}
	}

	// 删除
	function del() {
		if (selectItem == null) {
			layer.msg("请选择一条记录！", {skin: 'layui-layer-hui'});
		} else {
			var opts = {
				msg1: "是否确定要删除？",
				icon: 1,
				callBack: delConfirm,
				callBackParam: selectItem
			};
			commonShowDialog(opts);
		}
	}

	// 删除确认回调函数
	function delConfirm() {
		$.ajax({
			type: 'POST',
			url: '${rc.getContextPath()}/dcl/secretaryMailboxPc/del.jhtml',
			data: {
				uuid: selectItem.uuid
			},
			dataType: 'json',
			success: function (data) {
				if (!data.success) {
					var opts = {
						msg1 : data.tipMsg,
						icon : 3,
						btn : []
					};
					commonShowDialog(opts);
				} else {
					var opts = {
						msg1 : data.tipMsg,
						icon : 2,
						btn : []
					};
					commonShowDialog(opts);
					searchData();
				}
			},
			error: function (data) {
			}
		});
	}
</script>
</html>