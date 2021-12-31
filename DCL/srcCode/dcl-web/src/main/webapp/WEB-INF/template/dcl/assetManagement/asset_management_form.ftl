<!DOCTYPE html>
<html>
<head>
	<title>新增/编辑</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />

	<style type="text/css">
		.inp1 {width:220px;}
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
							<label class="LabName"><span><font color="red">*</font>资产名称</span></label>
							<input type="text" id="assetName" name="assetName" value="${(bo.assetName)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom',required:true"  />
						</td>
						<td>
							<label class="LabName"><span><font color="red">*</font>资产分类</span></label>

							<input type="text" value="${(bo.assetType)!}"  hidden class="easyui-validatebox" id="assetType" name="assetType"  data-options="tipPosition:'bottom',required:true">
							<input  type="text" id="typeName" name="typeName"   value="${(bo.typeName)!}"   class="inp1 easyui-validatebox"  data-options="tipPosition:'bottom',required:true" />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span><font color="red">*</font>所属区域</span></label>
							<input id="orgCode" name="orgCode"  type="hidden" value="${(bo.orgCode)!}">
							<input type="text"    name="orgName" id="orgName" autocomplete="off" value="${(bo.orgName)!}" data-options="tipPosition:'bottom',required:true"  class="inp1 easyui-validatebox">
						</td>
						<td>
							<label class="LabName"><span>登记时间</span></label>
							<input type="text" id="checkInTime" name="checkInTime" value="${(bo.checkInTime)!}" class="inp1 Wdate" data-options="tipPosition:'bottom'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span>使用情况</span></label>
							<input type="text" value="${(bo.usage)!}"  hidden class="easyui-validatebox" id="usage" name="usage"  >
							<input  type="text" id="usageName" name="usageName"   value="${(bo.usageName)!}"   class="inp1 easyui-validatebox"   />
						</td>
						<td>
							<label class="LabName"><span>购置时间</span></label>
							<input type="text" id="purchaseTime" name="purchaseTime" value="${(bo.purchaseTime)!}" class="inp1 Wdate" data-options="tipPosition:'bottom'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span>数量</span></label>
							<input type="text" id="numberr" name="numberr" value="${(bo.numberr)!}" class="inp1 easyui-numberbox" data-options="min:0, max:9999999999, tipPosition:'bottom'" style="height:30px;" />
						</td>
						<td>
							<label class="LabName"><span>单位</span></label>
							<input type="text" id="unit" name="unit" value="${(bo.unit)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />
						</td>

					</tr>
					<tr>
						<td>
							<label class="LabName"><span>资产价值</span></label>
							<input type="text" id="assetValue" name="assetValue" value="${(bo.assetValue)!}" class="inp1 easyui-numberbox" data-options="min:0, max:9999999.99, precision:2, tipPosition:'bottom'" style="height:30px;" />
							<font style="margin-left: 5px">元</font>
						</td>
						<td>
							<label class="LabName"><span>评估价值</span></label>
							<input type="text" id="evaluation" name="evaluation" value="${(bo.evaluation)!}" class="inp1 easyui-numberbox" data-options="min:0, max:9999999.99, precision:2, tipPosition:'bottom'" style="height:30px;" />
							<font style="margin-left: 5px">元</font>
						</td>
					</tr>

					<tr>
						<td>
							<label class="LabName"><span>登记人</span></label>
							<input type="text" id="checkInPerson" name="checkInPerson" value="${(bo.checkInPerson)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />
						</td>
						<td>
							<label class="LabName"><span>所有权归属</span></label>
							<input type="text" id="ownership" name="ownership" value="${(bo.ownership)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="LabName"><span>存放地点</span></label>
							<input type="text" style="width: 72.5%"  id="storageLocation" name="storageLocation" value="${(bo.storageLocation)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="LabName"><span>备注</span></label>
							<textarea class="inp1 easyui-validatebox textarea1" id="remark" name="remark" style="width: 72%;height: 90px;padding: 2px 5px;"	  data-options="validType:'maxLength[200]', tipPosition:'bottom'">${(bo.remark)!}</textarea>
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

	$(function (){

		AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
			$("#orgCode").val(items[0].orgCode);
		},{
			ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
		});

		//资产
		AnoleApi.initListComboBox("typeName", "assetType", "${DICT_ASSET_TYPE!}", null, null, {ShowOptions: {EnableToolbar: false}});
		//使用情况
		AnoleApi.initListComboBox("usageName", "usage", "${DICT_USAGE!}", null, null, {ShowOptions: {EnableToolbar: true}});

		var uuid ='${(bo.uuid)!''}';

		if(uuid==null || uuid==''){
			//新增
			$("#checkInPerson").val('${userName}');

		}

	})

	//保存
	function save() {
		var isValid = $('#submitForm').form('validate');
		if (isValid) {
			modleopen(); //打开遮罩层
			$.ajax({
				type: 'POST',
				url: '${rc.getContextPath()}/dcl/assetManagement/save.json',
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
	
	//取消
	function cancel() {
		parent.closeMaxJqueryWindow();
	}
</script>
</html>
