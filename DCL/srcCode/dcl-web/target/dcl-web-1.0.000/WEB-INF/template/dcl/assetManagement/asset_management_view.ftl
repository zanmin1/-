<!DOCTYPE html>
<html>
<head>
	<title>详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
</head>
<style>
	.LabName{
		width: 110px !important;
	}
</style>
<body>
	<div id="content-d" class="MC_con content light">
		<div name="tab" id="div0" class="NorForm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>资产名称：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.assetName)!}</span>
					</td>
					<td>
						<label class="LabName"><span><font color="red">*</font>资产分类：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.typeName)!}</span>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>所属区域：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.orgName)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>登记时间：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.checkInTime)!}</span>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span>使用情况：</span></label>
						<span  style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.usageName)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>购置时间：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.purchaseTime)!}</span>
					</td>

				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span>数量：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.numberr)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>单位：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.unit)!}</span>
					</td>
				</tr>

				<tr>
					<td width="50%">
						<label class="LabName"><span>资产价值：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.assetValue)!} <#if bo.assetValue??>元</#if></span>
					</td>
					<td width="50%">
						<label class="LabName"><span>评估价值：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.evaluation)!} <#if bo.assetValue??>元</#if></span>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span>登记人：</span></label>
						<span style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.checkInPerson)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>所有权归属：</span></label>
						<span style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.ownership)!}</span>
					</td>
				</tr>
				<tr>

					<td colspan="2">
						<label class="LabName"><span>存放地点：</span></label>
						<span style="width: 80%"  class="Check_Radio FontDarkBlue">${(bo.storageLocation)!}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="LabName"><span>备注：</span></label>
						<span style="width: 80%" class="Check_Radio FontDarkBlue">${(bo.remark)!}</span>
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
