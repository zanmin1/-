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
							<label class="LabName"><span><font color="red">*</font>资源名称</span></label>
							<input type="text" id="resourceName" name="resourceName" value="${(bo.resourceName)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom',required:true"  />
						</td>
						<td>
							<label class="LabName"><span><font color="red">*</font>资源分类</span></label>
							<input type="text" value="${(bo.resourceType)!}"  hidden class="easyui-validatebox" id="resourceType" name="resourceType" style="height: 0;width: 0;float: left " data-options="tipPosition:'bottom',required:true">
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
							<label class="LabName"><span>所有权归属</span></label>
							<input type="text" id="ownership" name="ownership" value="${(bo.ownership)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />
						</td>
					</tr>

					<tr>
						<td>
							<label class="LabName"><span>数量</span></label>
							<input type="text" id="number" name="number" value="${(bo.number)!}" class="inp1 easyui-numberbox" data-options="min:0, max:9999999999, tipPosition:'bottom'" style="height:30px;" />
						</td>
						<td>
							<label class="LabName"><span>单位</span></label>
							<input type="text" id="unit" name="unit" value="${(bo.unit)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />
						</td>
					</tr>

					<tr>
						<td>
							<label class="LabName"><span>利用情况</span></label>
							<input type="text" id="utilization" name="utilization" value="${(bo.utilization)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />
						</td>
						<td>
							<label class="LabName"><span>承包期限</span></label>
							<input type="text" id="contractPeriod" name="contractPeriod" value="${(bo.contractPeriod)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />
						</td>

					</tr>

					<tr>
						<td>
							<label class="LabName"><span>承包人</span></label>
							<input type="text" id="contractor" name="contractor" value="${(bo.contractor)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />
						</td>
						<td>
							<label class="LabName"><span>承包人联系方式</span></label>
							<input type="text" id="contractorTel" name="contractorTel" value="${(bo.contractorTel)!}" class="inp1 easyui-validatebox" data-options="validType:'phoneAndMobile', tipPosition:'bottom'"  />
						</td>

					</tr>
					<tr>
						<td>
							<label class="LabName"><span>承包金额</span></label>
							<input type="text" id="contractAmount" name="contractAmount" value="${(bo.contractAmount)!}" class="inp1 easyui-numberbox" data-options="min:0, max:99999999.99, precision:2, tipPosition:'bottom'" style="height:30px;" />
							<font style="margin-left: 5px">元</font>
						</td>
						<td>
							<label class="LabName"><span>承包金交纳方式</span></label>
							<input type="text" id="contractPayMethod" name="contractPayMethod" value="${(bo.contractPayMethod)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span>登记人</span></label>
							<input type="text" id="checkInPerson" name="checkInPerson" value="${(bo.checkInPerson)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[50]', tipPosition:'bottom'"  />
						</td>
						<td>
							<label class="LabName"><span>登记时间</span></label>
							<input type="text" id="checkInTime" name="checkInTime" value="${(bo.checkInTime)!}" class="inp1 Wdate" data-options="tipPosition:'bottom'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="LabName"><span>资源描述</span></label>
							<textarea class="inp1 easyui-validatebox textarea1" id="resourceDesc" name="resourceDesc"
									  style="width: 72%;height: 90px;padding: 2px 5px;"	  data-options="validType:'maxLength[500]', tipPosition:'bottom'"
							>${(bo.resourceDesc)!}</textarea>

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
		//资源类型
		AnoleApi.initListComboBox("typeName", "resourceType", "${DICT_RESOURCE!}", null, null, {ShowOptions: {EnableToolbar: false}});

		AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
			$("#orgCode").val(items[0].orgCode);
		},{
			ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
		});

		$.extend($.fn.validatebox.defaults.rules,
				{
			         phoneAndMobile : {// 电话号码或手机号码
		                validator : function(value) {
			            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value) || /^(13|15|18|19|17|14)\d{9}$/i.test(value);
				           },
			         message : '电话号码或手机号码格式不正确'
			     }
				})
	})

	//保存
	function save() {
		var isValid = $('#submitForm').form('validate');
		if (isValid) {
			modleopen(); //打开遮罩层
			$.ajax({
				type: 'POST',
				url: '${rc.getContextPath()}/dcl/resourceManagement/save.json',
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
