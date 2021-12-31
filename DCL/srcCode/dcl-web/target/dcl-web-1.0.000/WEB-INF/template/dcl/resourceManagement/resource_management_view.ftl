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
						<label class="LabName"><span><font color="red">*</font>资源名称：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.resourceName)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>资源分类：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.typeName)!}</span>
					</td>
				</tr>

				<tr>
					<td width="50%">
						<label class="LabName"><span><font color="red">*</font>所属区域：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.orgName)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>所有权归属：</span></label>
						<span style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.ownership)!}</span>
					</td>
				</tr>

				<tr>
					<td width="50%">
						<label class="LabName"><span>数量：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.number)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>单位：</span></label>
						<span  style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.unit)!}</span>
					</td>
				</tr>

				<tr>
					<td width="50%">
						<label class="LabName"><span>利用情况：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.utilization)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>承包期限：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.contractPeriod)!}</span>
					</td>
				</tr>

				<tr>
					<td width="50%">
						<label class="LabName"><span>承包人：</span></label>
						<span  style="width: 60%" class="Check_Radio FontDarkBlue">${(bo.contractor)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>承包人联系方式：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.contractorTel)!}</span>
					</td>

				</tr>

				<tr>
					<td width="50%">
						<label class="LabName"><span>承包金额：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.contractAmount)!} <#if bo.contractAmount??>元</#if></span>
					</td>
					<td width="50%">
						<label class="LabName"><span>承包金交纳方式：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.contractPayMethod)!}</span>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<label class="LabName"><span>登记人：</span></label>
						<span style="width: 60%"  class="Check_Radio FontDarkBlue">${(bo.checkInPerson)!}</span>
					</td>
					<td width="50%">
						<label class="LabName"><span>登记时间：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.checkInTime)!}</span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<label class="LabName"><span>资源描述：</span></label>
						<span style="width: 80%"  class="Check_Radio FontDarkBlue">${(bo.resourceDesc)!}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="LabName"><span>备注：</span></label>
						<span  style="width: 80%" class="Check_Radio FontDarkBlue">${(bo.remark)!}</span>
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
