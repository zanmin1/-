﻿<!DOCTYPE html>
<html>
<head>
	<title>列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
	<#include "/component/maxJqueryEasyUIWin.ftl" />
	<#include "/component/listSet.ftl" />
	<#include "/component/AnoleDate.ftl" />
	<#include "/component/customJqueryEasyUIWin.ftl" />

	<style type="text/css">
		.inp1 {width:100px;}
	</style>
</head>
<body class="easyui-layout">
	<div id="_DivCenter" region="center" >
	   <table id="list"></table>
	</div>
	<div id="jqueryToolbar">
		<div class="ConSearch">
			<form id="searchForm">
			<div class="fl">
				<ul>
					<li>所属区域：</li><li>
						<input id="orgCode" name="orgCode"  type="hidden" value="${orgCode}">
						<input type="text" class="inp1" placeholder="请选择所属区域"  name="orgName" id="orgName" autocomplete="off" value="${orgName}" class="inp1">
					</li>
					<li>资产名称：</li><li><input class="inp1" type="text" id="assetName" name="assetName" /></li>
					<li>资产分类：</li><li>
						<input id="assetType" name="assetType" type="hidden" >
						<input type="text" id="typeStr" name="typeStr" style="width: 110px;" class="inp1 "   /></li>

				</ul>
			</div>
	        <div class="btns">
				<ul>
					<li><a href="javascript:;" class="chaxun" title="查询数据" onclick="searchData()">查询</a></li>
		            <li><a href="javascript:;" class="chongzhi" title="重置查询条件" onclick="resetCondition()">重置</a></li>
				</ul>
	        </div>
			</form>
		</div>
		<div class="h_10" id="TenLineHeight1"></div>
		<div class="ToolBar">
			<div class="tool fr">
				<@actionCheck></@actionCheck>
<#--				<a href="javascript:void(0)" class="NorToolBtn DelBtn" onclick="del();">删除</a>-->
<#--				<a href="javascript:void(0)" class="NorToolBtn EditBtn" onclick="edit();">编辑</a>-->
<#--				<a href="javascript:void(0)" class="NorToolBtn AddBtn" onclick="add();">新增</a>-->
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		//资产类型
		AnoleApi.initListComboBox("typeStr", "assetType", "${DICT_ASSET_TYPE!}", null, null, {ShowOptions: {EnableToolbar: true}});

		AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
			$("#orgCode").val(items[0].orgCode);
		},{
			ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
		});

		loadList(); //加载列表

	});
	
	//加载列表
	function loadList() {
		$('#list').datagrid({
			rownumbers: true, //行号
			fitColumns: true, //自适应宽度
			nowrap: true,
			striped: true,
			singleSelect: true,
			fit: true,
			queryParams: $('#searchForm').serializeJson(),
			url: '${rc.getContextPath()}/dcl/assetManagement/listData.jhtml',
			//queryParams: $('#searchForm').serializeJson(),
			columns: [[
				{field:'orgName', title:'所属区域', align:'center', width:100},
				{field:'assetName', title:'资产名称', align:'center', width:100,
					formatter : function(value, rec, index) {
						var ret = '<a href="javascript:void(0)" onclick="detail(\''+rec.uuid+'\')">'+value+'</a>';
						return ret;
					}},
				{field:'typeName', title:'资产分类', align:'center', width:100},
				{field:'checkInTime', title:'登记时间', align:'center', width:100},
				{field:'usageName', title:'使用情况', align:'center', width:100}
			]],
			pagination: true,
			pageSize: 10,
			toolbar: '#jqueryToolbar',
			onLoadSuccess: function(data) {
				listSuccess(data); //暂无数据提示
			},
			onLoadError: function() {
				listError();
			}
		});
	}
	
	//新增
	function add() {
		var url = '${rc.getContextPath()}/dcl/assetManagement/form.jhtml';
		showMaxJqueryWindow('新增', url, 1000, 500);
	}
	
	//编辑
	function edit() {
		var rows = $('#list').datagrid('getSelections');
		if (rows.length != 1) {
			$.messager.alert('提示', '请选择一条记录!', 'warning');
		} else {
			var url = '${rc.getContextPath()}/dcl/assetManagement/form.jhtml?id=' + rows[0].uuid;
			showMaxJqueryWindow('编辑', url, 1000, 500);
		}
	}
	
	//详情
	function detail(id) {
		var url = "${rc.getContextPath()}/dcl/assetManagement/view.jhtml?id=" + id;
		showMaxJqueryWindow('详情', url, 1000, 500);
	}
	
	//删除
	function del() {
		var rows = $('#list').datagrid('getSelections');
		if (rows.length != 1) {
			$.messager.alert('提示', '请选择一条记录!', 'warning');
		} else {
			$.messager.confirm('提示', '您确定删除选中的信息吗?', function(r) {
				if (r) {
					modleopen(); //打开遮罩层
					$.ajax({
						type: 'POST',
						url: '${rc.getContextPath()}/dcl/assetManagement/del.json',
						data: {
							uuid: rows[0].uuid
						},
						dataType: 'json',
						success: function(data) {
							if (data.result == 'fail') {
								$.messager.alert('错误', '删除失败！', 'error');
							} else {
								$.messager.alert('提示', '删除成功！', 'info');
								searchData();
							}
						},
						error: function(data) {
							$.messager.alert('错误', '连接超时！', 'error');
						},
						complete : function() {
							modleclose(); //关闭遮罩层
						}
					});
				}
			});
		}
	}

	//查询
	function searchData() {
		$('#list').datagrid('reload', $('#searchForm').serializeJson());
	}

	//重置
	function resetCondition() {
		$('#searchForm').form('clear');
		$('#orgCode').val('${orgCode}');
		$('#orgName').val('${orgName}');
		searchData();
	}


</script>
</html>
