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
			width: 150px;
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
							<label class="LabName"><span><font color="red">*</font>未接种人数</span></label>
							<input type="text" autocomplete="off" id="nonvaccinationpersonsNumber" name="nonvaccinationpersonsNumber" value="${bo.nonvaccinationpersonsNumber!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[9]', tipPosition:'bottom',required:true" style="height:30px;" />
						</td>
					</tr>
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span><font color="red">*</font>已接种人数</span></label>-->
<#--							<input type="text" id="vaccinationpersonsNumber" name="vaccinationpersonsNumber" value="${(bo.vaccinationpersonsNumber)!}" class="inp1 easyui-numberbox" data-options="min:0, max:999999999, tipPosition:'bottom',required:true" style="height:30px;" />-->
<#--						</td>-->
<#--					</tr>-->
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>完成第一针接种人数：</span></label>
							<input type="text" autocomplete="off" id="firstvaccinationNumber" name="firstvaccinationNumber" value="${(bo.firstvaccinationNumber)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[9]', tipPosition:'bottom',required:true" style="height:30px;" />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>完成第二针接种人：</span></label>
							<input type="text"autocomplete="off" id="secondvaccinationNumber" name="secondvaccinationNumber" value="${(bo.secondvaccinationNumber)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[9]', tipPosition:'bottom',required:true" style="height:30px;" />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>完成第三针接种人：</span></label>
							<input type="text" autocomplete="off" id="thirdvaccinationNumber" name="thirdvaccinationNumber" value="${(bo.thirdvaccinationNumber)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[9]', tipPosition:'bottom',required:true" style="height:30px;" />
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

	//保存
	function save() {
		var isValid = $('#submitForm').form('validate');
		if (!isNumber($('#nonvaccinationpersonsNumber').val())
				|| !isNumber($('#firstvaccinationNumber').val())
				|| !isNumber($('#secondvaccinationNumber').val())
				|| !isNumber($('#thirdvaccinationNumber').val())){
			$.messager.alert('错误', '请输入正确的数字！', 'error');
			return;
		}
		if (isValid) {
			modleopen(); //打开遮罩层
			$.ajax({
				type: 'POST',
				url: '${rc.getContextPath()}/dcl/vaccinationStatus/save.json',
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

	function isNumber(value){
		var z_reg = /^[1-9]\d*$/;
		return z_reg.test(value);
	};
	
	//取消
	function cancel() {
		parent.closeMaxJqueryWindow();
	}
</script>
</html>
