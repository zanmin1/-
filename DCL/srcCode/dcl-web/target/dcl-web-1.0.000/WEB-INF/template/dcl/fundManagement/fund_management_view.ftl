<!DOCTYPE html>
<html>
<head>
	<title>详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
	<style>
		.inp1 {width:220px;}
		.LabName{
			width: 130px !important;
		}
	</style>
</head>
<body>
	<div id="content-d" class="MC_con content light" style="height: 400px;overflow :auto;overflow-x:hidden;">
		<div name="tab" id="div0" class="NorForm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>事项说明：</span></label>
						<span  style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.itemDescription)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>发生日期：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.dateOfOccur)!}</span>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>收支类型（一级）：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.typePName)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>收支类型（二级）：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.typeCName)!}</span>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>所属区域：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.orgName)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>发生金额：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.amountIncurred)!} <#if bo.amountIncurred??>元</#if></span>
					</td>

				</tr>
				<tr>
					<td colspan="2">
						<label class="LabName"><span>备注：</span></label>
						<span style="width: 80%"  class="Check_Radio FontDarkBlue">${(bo.remark)!}</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="BigTool">
    	<div class="BtnList">
    		<a href="javascript:;" class="BigNorToolBtn CancelBtn" onClick="cancel();">关闭</a>
        </div>
    </div>
</body>
<script type="text/javascript">
	//关闭
	function cancel() {
		parent.closeMaxJqueryWindow();
	}
</script>
</html>
