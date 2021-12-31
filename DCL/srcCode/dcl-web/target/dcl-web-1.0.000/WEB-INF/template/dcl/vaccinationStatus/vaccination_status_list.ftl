<!DOCTYPE html>
<html>
<head>
	<title>列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
	<#include "/component/maxJqueryEasyUIWin.ftl" />
	<#include "/component/listSet.ftl" />
	<style type="text/css">
		.inp1 {width:100px;}
	</style>
</head>
<body class="easyui-layout">
	<div id="_DivCenter" region="center" >
	   <table id="list"></table>
	</div>
	<div id="jqueryToolbar">
		<div class="ConSearch" style="height:0px;padding-top:0px;">
			<form id="searchForm">
			<div class="fl">
				<ul>

				</ul>
			</div>
	        <div class="btns">
				<ul>
<#--					<li><a href="javascript:;" class="chaxun" title="查询数据" onclick="searchData()">查询</a></li>-->
<#--		            <li><a href="javascript:;" class="chongzhi" title="重置查询条件" onclick="resetCondition()">重置</a></li>-->
				</ul>
	        </div>
			</form>
		</div>
		<div class="h_10" id="TenLineHeight1" style="height: 0px;"></div>
		<div class="ToolBar">
			<div class="tool fr">
<#--				<a href="javascript:void(0)" class="NorToolBtn DelBtn" onclick="del();">删除</a>-->
<#--				<a href="javascript:void(0)" class="NorToolBtn AddBtn" onclick="add();">新增</a>-->
				<#if bo??>
					<a href="javascript:void(0)" class="NorToolBtn EditBtn" onclick="edit();">编辑</a>
				<#else>
					<a href="javascript:void(0)" class="NorToolBtn AddBtn" onclick="add();">新增</a>
				</#if>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
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
			url: '${rc.getContextPath()}/dcl/vaccinationStatus/listData.jhtml',
			//queryParams: $('#searchForm').serializeJson(),
			columns: [[
				{field:'nonvaccinationpersonsNumber', title:'未接种人数', align:'center', width:100,
					formatter: function (value, rec, index){
						var ret = '<a href="javascript:void(0)" onclick="detail(\''+rec.uuid+'\')">'+value+'</a>';
						return ret;
					}
				},
				// {field:'vaccinationpersonsNumber', title:'已接种人数', align:'center', width:100},
				{field:'firstvaccinationNumber', title:'完成第一针接种人数', align:'center', width:100},
				{field:'secondvaccinationNumber', title:'完成第二针接种人', align:'center', width:100},
				{field:'thirdvaccinationNumber', title:'完成第三针接种人', align:'center', width:100},
				{field:'regionName', title:'所属区域', align:'center', width:100}
			]],
			pagination: true,
			pageSize: 20,
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
		var url = '${rc.getContextPath()}/dcl/vaccinationStatus/form.jhtml';
		showMaxJqueryWindow('全村疫苗接种情况', url, 500, 300);
	}
	
	//编辑
	function edit() {
		var rows = $('#list').datagrid('getSelections');
		if (rows.length != 1) {
			$.messager.alert('提示', '请选择一条记录!', 'warning');
		} else {
			var url = '${rc.getContextPath()}/dcl/vaccinationStatus/form.jhtml?id=' + rows[0].uuid;
			showMaxJqueryWindow('全村疫苗接种情况', url, 500, 300);
		}
	}
	
	//详情
	function detail(id) {
		var url = "${rc.getContextPath()}/dcl/vaccinationStatus/view.jhtml?id=" + id;
		showMaxJqueryWindow('全村疫苗接种情况', url, 500, 300);
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
						url: '${rc.getContextPath()}/dcl/vaccinationStatus/del.json',
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
		searchData();
	}
</script>
</html>
