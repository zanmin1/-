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
		<input type="hidden" id="pushId" name="pushId" value="${(bo.pushId)!}" />
		<div id="content-d" class="MC_con content light">
			<div name="tab" class="NorForm">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				
					<tr>
						<td>
							<label class="LabName"><span>序号</span></label>
							<input type="text" id="serial" name="serial" value="${(bo.serial)!}" class="inp1 easyui-numberbox" data-options="min:0, max:999999999, tipPosition:'bottom'" style="height:30px;" />
						</td>
					</tr>
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>发送时间</span></label>-->
<#--							<input type="text" id="sendtime" name="sendtime" value="${(bo.sendtime)!}" class="inp1 Wdate" data-options="tipPosition:'bottom'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly />-->
<#--						</td>-->
<#--					</tr>-->
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>人员类型</span></label>-->
<#--							<input type="text" id="type" name="type" value="${(bo.type)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />-->
<#--						</td>-->
<#--					</tr>-->
<#--					可能后续会用到 写demo先注释-->
					<tr>
						<td>
							<label class="LabName"><span>发送人</span></label>
							<input type="text" id="sendpeople" name="sendpeople" value="${(bo.sendpeople)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span>收信人</span></label>
							<input type="text" id="recipient" name="recipient" value="${(bo.recipient)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[200]', tipPosition:'bottom'"  />
						</td>
					</tr>
					<tr>
						<td>
							<label class="LabName"><span>接受类型</span></label>
							<input type="text" id="reciveType" name="reciveType" value="${(bo.reciveType)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[20]', tipPosition:'bottom'"  />
						</td>
					</tr>
<#--					使用的到此位置 必要多选了-->
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
<#--					<tr>-->
<#--						<td>-->
<#--							<label class="LabName"><span>详情id</span></label>-->
<#--							<input type="text" id="detailId" name="detailId" value="${(bo.detailId)!}" class="inp1 easyui-validatebox" data-options="validType:'maxLength[32]', tipPosition:'bottom'"  />-->
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
				url: '${rc.getContextPath()}/dcl/historyBroadcastpush/save.json',
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
