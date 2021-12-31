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
		<input type="hidden" id="detailId" name="detailId" value="${(bo.detailId)!}" />
		<div id="content-d" class="MC_con content light">
			<div name="tab" class="NorForm">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				
					<tr>
						<td>
							<label class="LabName"><span>姓名</span></label>
							<input type="text" id="name" name="name" value="${(bo.name)!}" class="inp1 easyui-validatebox" data-options="min:0, max:9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999, tipPosition:'bottom'" style="height:30px;" />
						</td>
					</tr>
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>身份证号</span></label>-->
<#--							<input type="text" id="idcard" name="idcard" value="${(bo.idcard)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[18]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
					<tr>
						<td>
							<label class="LabName"><span>性别</span></label>
							<input type="text" id="sex" name="sex" value="${(bo.sex)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />
						</td>
					</tr>
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>所属党支部</span></label>-->
<#--							<input type="text" id="party" name="party" value="${(bo.party)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>人员类型</span></label>-->
<#--							<input type="text" id="type" name="type" value="${(bo.type)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>手机号</span></label>-->
<#--							<input type="text" id="number" name="number" value="${(bo.number)!}" class="inp1 easyui-numberbox" data-options="min:0, max:99999999999, tipPosition:'bottom'" style="height:30px;" />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>民族</span></label>-->
<#--							<input type="text" id="nation" name="nation" value="${(bo.nation)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>地域</span></label>-->
<#--							<input type="text" id="orgcode" name="orgcode" value="${(bo.orgcode)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>地址</span></label>-->
<#--							<input type="text" id="addr" name="addr" value="${(bo.addr)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>推送状态</span></label>-->
<#--							<input type="text" id="status" name="status" value="${(bo.status)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>数据有效性</span></label>-->
<#--							<input type="text" id="isValid" name="isValid" value="${(bo.isValid)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[1]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>创建人ID</span></label>-->
<#--							<input type="text" id="creator" name="creator" value="${(bo.creator)!}" class="inp1 easyui-numberbox" data-options="min:0, max:999999999, tipPosition:'bottom'" style="height:30px;" />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>创建人姓名</span></label>-->
<#--							<input type="text" id="creatorName" name="creatorName" value="${(bo.creatorName)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>创建时间</span></label>-->
<#--							<input type="text" id="createTime" name="createTime" value="${(bo.createTime)!}" class="inp1 Wdate" data-options="tipPosition:'bottom'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>修改人ID</span></label>-->
<#--							<input type="text" id="updator" name="updator" value="${(bo.updator)!}" class="inp1 easyui-numberbox" data-options="min:0, max:999999999, tipPosition:'bottom'" style="height:30px;" />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>修改人姓名</span></label>-->
<#--							<input type="text" id="updatorName" name="updatorName" value="${(bo.updatorName)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[100]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>修改时间</span></label>-->
<#--							<input type="text" id="updateTime" name="updateTime" value="${(bo.updateTime)!}" class="inp1 Wdate" data-options="tipPosition:'bottom'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />-->
<#--						</td>-->
<#--					</tr>-->
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
		if (isValid) {
			modleopen(); //打开遮罩层
			$.ajax({
				type: 'POST',
				url: '${rc.getContextPath()}/dcl/historyDetail/save.json',
				data: $('#submitForm').serializeArray(),
				dataType: 'json',
				success: function(data) {
					console.log("保存+++++++")
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
