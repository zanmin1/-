<!DOCTYPE html>
<html>
<head>
	<title>新增/编辑</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
	<style type="text/css">
		.inp1 {width:220px;}
		.LabName{
			width: 110px !important;
		}
	</style>
</head>
<body>
	<form id="submitForm">
		<input type="hidden" id="uuid" name="uuid" value="${(bo.uuid)!}" />
		<div id="content-d" class="MC_con content light">
			<div name="tab" class="NorForm">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>事项说明</span></label>
							<input type="text"   id="itemDescription" name="itemDescription" value="${(bo.itemDescription)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom',required:true"  />
						</td>
						<td>
							<label class="LabName"><span><font color="red">*</font>发生日期</span></label>
							<input type="text"  id="dateOfOccur" name="dateOfOccur" value="${(bo.dateOfOccur)!}" class="inp1 Wdate easyui-validatebox" data-options="tipPosition:'bottom',required:true" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>收支类型（一级）</span></label>
							<input type="text" value="${(bo.inAndExTypeP)!}"  hidden class="easyui-validatebox" id="inAndExTypeP" name="inAndExTypeP" style="height: 0;width: 0;float: left " data-options="tipPosition:'bottom',required:true">
							<input  type="text" id="typePName" name="typePName"   value="${(bo.typePName)!}"   class="inp1 easyui-validatebox"  data-options="tipPosition:'bottom',required:true" />
						</td>

						<td id="defaultType">
							<label class="LabName"><span><font color="red">*</font>收支类型（二级）</span></label>
							<input    class="inp1 easyui-validatebox" disabled placeholder="请先选择一级类型" >
						</td>
						<td class="hide" id="visType">
							<label class="LabName"><span><font color="red">*</font>收支类型（二级）</span></label>
							<input  value="${(bo.inAndExTypeC)!}" hidden  class="easyui-validatebox" id="inAndExTypeC" name="inAndExTypeC" style="height: 0;width: 0;float: left " data-options="tipPosition:'bottom',required:true" >
							<input type="text" id="typeCName" name="typeCName" value="${(bo.typeCName)!}" class="inp1 easyui-validatebox" data-options="tipPosition:'bottom',required:true"   />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>所属区域</span></label>
							<input id="orgCode" name="orgCode"  type="hidden" value="${(bo.orgCode)!}">
							<input type="text"    name="orgName" id="orgName" autocomplete="off" value="${(bo.orgName)!}" data-options="tipPosition:'bottom',required:true"  class="inp1 easyui-validatebox">
						</td>
						<td>
							<label class="LabName"><span><font color="red">*</font>发生金额</span></label>
							<input type="text" id="amountIncurred" name="amountIncurred" value="${(bo.amountIncurred)!}" class="inp1 easyui-numberbox" data-options="min:0, max:999999999.99, precision:2, tipPosition:'bottom',required:true" style="height:30px;" />
							<font style="margin-left: 5px">元</font>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="LabName"><span>备注：</span></label>
							<textarea class="inp1 easyui-validatebox textarea1" id="remark" name="remark" style="width: 72%;height: 90px;padding: 2px 5px;"  data-options="validType:'maxLength[200]', tipPosition:'bottom'">${(bo.remark)!}</textarea>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="BigTool">
	    	<div class="BtnList">
	    		<a href="javascript:;" class="BigNorToolBtn SaveBtn" onClick="save();">保存</a>
	    		<a href="javascript:;" class="BigNorToolBtn CancelBtn" onClick="cancel();">取消</a>
	        </div>
	    </div>
	</form>
</body>
<script type="text/javascript">
	$(function() {

		var uuid ='${(bo.uuid)!''}';
		var inAndExTypeP ='${(bo.inAndExTypeP)!''}';

		if(uuid!=null && uuid!=''){
			//编辑
			if(inAndExTypeP!=null && inAndExTypeP!=''){
				typePchange(inAndExTypeP);
			}
		}



		//收支类型 一级
		AnoleApi.initListComboBox("typePName", "inAndExTypeP", "${DICT_TYPE_P!}", function (grid,item) {

			//动态二级菜单
			$("#inAndExTypeC").val(null);
			$("#typeCName").val(null);
			typePchange(grid);

		}, null, {ShowOptions: {EnableToolbar: false}});


		AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
			$("#orgCode").val(items[0].orgCode);
		},{
			ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
		});
	});



	//保存
	function save() {

		var isValid = $('#submitForm').form('validate');

		if (isValid) {

			modleopen(); //打开遮罩层
			$.ajax({
				type: 'POST',
				url: '${rc.getContextPath()}/dcl/fundManagement/save.json',
				data: $('#submitForm').serializeArray(),
				dataType: 'json',
				success: function(data) {

					if (data.result == 'fail') {
						$.messager.alert('错误', '保存失败！', 'error');
					} else {
						$.messager.alert('提示', '保存成功！', 'info', function() {
							parent.closeMaxJqueryWindow();
						});
						parent.searchData();
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
	}
	
	
	function typePchange(value) {

		if(value=='1'){

			$("#defaultType").addClass("hide")
			$("#visType").removeClass("hide")

			//收入出类型
			AnoleApi.initListComboBox("typeCName", "inAndExTypeC", "${DICT_TYPE_C_S!}", null, null, {ShowOptions: {EnableToolbar: false}});

			//支出
		}else if (value=='2'){
			$("#defaultType").addClass("hide")
			$("#visType").removeClass("hide")

			//支出类型
			AnoleApi.initListComboBox("typeCName", "inAndExTypeC", "${DICT_TYPE_C_Z!}", null, null, {ShowOptions: {EnableToolbar: false}});

		}else{
			$("#visType").addClass("hide")
			$("#defaultType").addClass("show")
			$("#defaultType").removeClass("hide")
		}


	}
	
	//取消
	function cancel() {
		parent.closeMaxJqueryWindow();

	}
</script>
</html>
