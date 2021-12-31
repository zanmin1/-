<!DOCTYPE html>
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


<#--	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css/jingzfp_xinj/jingzfp.css" />-->


	<style type="text/css">
		.swiper-slide {
			 position: relative;
			 text-align: center;
			 font-size: 18px;
			 display: -webkit-box;
			display: -ms-flexbox;
			 display: -webkit-flex;
			 display: flex;
			 -webkit-box-pack: center;
			-ms-flex-pack: center;
			 -webkit-justify-content: center;
			 justify-content: center;
			 -webkit-box-align: center;
			-ms-flex-align: center;
			 -webkit-align-items: center;
			 align-items: center;
		}
		.data-art > p > i {
			font-size: 12px;
			margin-left: 2px;
		}
		.wrap-data-con > li > h5 {
			position: absolute;
			bottom: 10px;
			font-size: 12px;
			color: #6c758a;
			left: 15px;
			right: 10px;
			max-height: 3em;
			overflow: hidden;
			line-height: 1.5em;
			text-align: left;
		}

		.inp1 {width:100px;}

		.bfcx-wrapper-data {
			position: relative;
			overflow: hidden;
			color: #454e63;
			font: 16px/1 arial, "Microsoft YaHei","微软雅黑", sans-serif;
		}
		.w100 {
			width: 100%;
			padding: 15px 20px;
		}

		.wrap-data-con, .wrap-data-con > li, .data-art {
			display: -webkit-box;
			display: -moz-box;
			display: -ms-flexbox;
			display: -webkit-flex;
			display: flex;
		}
		.wrap-data-con.col-3 > li {
			width: 32.66%;
		}
		.data-art {
			align-items: center;
			justify-content: center;
			flex-flow: wrap;
		}
		.data-art > .data-t1 {
			text-align: center;
			padding: 0 15px;
			font-size: 22px;
			color: #454e63;
			line-height: 25px;
		}

		.wrap-data-con > li {
			position: relative;
			width: 24.25%;
			margin-right: 1%;
			height: 85px;
			border: 1px solid #fff;
			cursor: pointer;
			-webkit-justify-content: space-between;
			justify-content: space-between;
			padding: 15px 0;
			box-sizing: border-box;
			border-radius: 2px;
		}
		.wrap-data-con > li {
			-webkit-box-orient: vertical;
			-webkit-box-direction: normal;
			-moz-box-orient: vertical;
			-moz-box-direction: normal;
			flex-direction: column;
			-webkit-flex-direction: column;
		}

		.data-bg2 {
			cursor: default !important;
			 background-color: #e3f6ec;
		}
		.data-bg3 {
			cursor: default !important;
			background-color: #e3f0f6;
		}
		.data-bg4 {
			cursor: default !important;
			background-color: #d8f3f3;
		}

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
					<li>事项说明：</li><li><input class="inp1" type="text" id="itemDescription" name="itemDescription" /></li>
					<li>收支类型：</li><li>
						<input id="inAndExTypeP" name="inAndExTypeP" type="hidden" >
						<input type="text" id="typeStr" name="typeStr" style="width: 80px;" class="inp1 easyui-validatebox" data-options="   tipPosition:'bottom'"  /></li>
					<li>发生日期：</li><li>
						<input id="date1" type="text" class="inp1" style="width: 220px;" value=""/>
						<input type="hidden" id="startTime" name="startTime" value = ""/>
						<input type="hidden" id="endTime" name="endTime" value = ""/>
					</li>

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

		<div  class="bfcx-wrapper-data">
			<div class="swiper-wrapper">
				<!-- 第一页 -->
				<div class="wrap-data swiper-slide">
					<ul class="wrap-data-con w100 col-3">
						<li  class="data-bg2">
							<div class="data-art">
								<p class="data-t1">
									<span id="sumPay"></span><i>元</i>
								</p>

							</div> <!--<div class="data-art" style="margin-bottom:15px;">--> <!--</div>-->
							<h5>总支出</h5> <i class="cur-tick"></i>
						</li>
						<li  class="data-bg3">
							<div class="data-art">
								<p class="data-t1">
									<span id="sumIncome"></span><i>元</i>
								</p>

							</div> <!--<div class="data-art" style="margin-bottom:15px;">--> <!--</div>-->
							<h5>总收入</h5> <i class="cur-tick"></i>
						</li>
						<li  class="data-bg4">
							<div class="data-art">
								<p class="data-t1">
									<span id="sumSurplus"></span><i>元</i>
								</p>


							</div> <!--<div class="data-art" style="margin-bottom:15px;">--> <!--</div>-->
							<h5>总结余</h5> <i class="cur-tick"></i>
						</li>
					</ul>
				</div>

			</div>
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
		loadList(); //加载列表
		sumData();


		//组织树
		AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
			$("#orgCode").val(items[0].orgCode);
		},{
			ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
		});
		//日期范围选择组件
		var dateApi = $("#date1").anoleDateRender({
			ShowOptions : {
				TabItems : [ "常用", "年","季","月", "清空" ],
				CommUsed : [ "本周", "本月", "今天", "确定" ]
			},
			BackEvents : {
				OnSelected : function(api, type) {
					$("#startTime").val(api.getStartDate());
					$("#endTime").val(api.getEndDate());
				},
				OnCleared : function(){
					$("#startTime").val(null);
					$("#endTime").val(null);
				}
			}
		}).anoleDateApi();

		//支出类型
		AnoleApi.initListComboBox("typeStr", "inAndExTypeP", "${DICT_TYPE_P!}", null, null, {ShowOptions: {EnableToolbar: true}});


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
			url: '${rc.getContextPath()}/dcl/fundManagement/listData.jhtml',
			//queryParams: $('#searchForm').serializeJson(),
			columns: [[
				{field:'orgName', title:'所属区域', align:'center', width:100},
				{field:'itemDescription', title:'事项说明', align:'center', width:100,
					formatter : function(value, rec, index) {
						var ret = '<a title="'+value+'" href="javascript:void(0)" onclick="detail(\''+rec.uuid+'\')">'+value+'</a>';
						return ret;
					}
				},
				{field:'dateOfOccur', title:'发生日期', align:'center', width:100},
				{field:'typePName', title:'收支类型（一级）', align:'center', width:100},
				{field:'typeCName', title:'收支类型（二级）', align:'center', width:100},
				{field:'amountIncurred', title:'发生金额（元）', align:'center', width:100,
					formatter : function(value, rec, index) {
						var ret =fmoney(value);
						return ret;
					}}

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
		var url = '${rc.getContextPath()}/dcl/fundManagement/form.jhtml';
		showMaxJqueryWindow('新增', url, 1000, 400);
	}
	
	//编辑
	function edit() {
		var rows = $('#list').datagrid('getSelections');
		if (rows.length != 1) {
			$.messager.alert('提示', '请选择一条记录!', 'warning');
		} else {
			var url = '${rc.getContextPath()}/dcl/fundManagement/form.jhtml?id=' + rows[0].uuid;
			showMaxJqueryWindow('编辑', url, 1000, 400);
		}
	}
	
	//详情
	function detail(id) {
		var url = "${rc.getContextPath()}/dcl/fundManagement/view.jhtml?id=" + id;
		showMaxJqueryWindow('详情', url, 1000, 400);
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
						url: '${rc.getContextPath()}/dcl/fundManagement/del.json',
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
		//更新表头统计
		sumData();

	}


	function sumData() {

		$.ajax({
			type: 'POST',
			url: '${rc.getContextPath()}/dcl/fundManagement/sumData.json',
			data: {
				orgCode: $("#orgCode").val()
			},
			dataType: 'json',
			success: function(data) {

				console.log(data)
				if(data!=null){
					$("#sumPay").html(fmoney(data.data.sumPay));
					$("#sumIncome").html(fmoney(data.data.sumIncome));



					var value = Number(data.data.sumSurplus)

					if(Number(value)>0){
						var ret =fmoney(value);
					}else if(Number(value)<0){
						var ret =fmoney(Math.abs(value));
						ret = '-'+ret
					}else{
						var ret =fmoney(0);
					}


					$("#sumSurplus").html(ret);
				}else{
					$("#sumPay").html(0.00);
					$("#sumIncome").html(0.00);
					$("#sumSurplus").html(0.00);
				}

			},
			error: function(data) {
				$.messager.alert('错误', '连接超时！', 'error');
			},
			complete : function() {

			}
		});

	}
	
	//重置
	function resetCondition() {
		$('#searchForm').form('clear');
		$("#orgCode").val('${orgCode}');
		$("#orgName").val('${orgName}');
		searchData();
	}

	function fmoney(s) {
		s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(2) + "";
		var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
		t = "";
		for (i = 0; i < l.length; i++) {
			t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
		}
		return t.split("").reverse().join("") + "." + r;
	}

</script>
</html>
