<!DOCTYPE html>
<html>
<head>
	<title>详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
	<style>
		.LabName{
			width: 150px;
		}
	</style>
</head>
<body>
	<div id="content-d" class="MC_con content light">
		<div name="tab" id="div0" class="NorForm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<label class="LabName"><span><font color="red">*</font>未接种人数：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.nonvaccinationpersonsNumber)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span><font color="red">*</font>完成第一针接种人数：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.firstvaccinationNumber)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span><font color="red">*</font>完成第二针接种人：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.secondvaccinationNumber)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span><font color="red">*</font>完成第三针接种人：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.thirdvaccinationNumber)!}</span>
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
