<!DOCTYPE html>
<html>
<head>
	<title>详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/component/commonFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
</head>
<body>
	<div id="content-d" class="MC_con content light">
		<div name="tab" id="div0" class="NorForm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<label class="LabName"><span>序号：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.serial)!}</span>
					</td>
				</tr>
<#--				<tr>-->
<#--					<td>-->
<#--						<label class="LabName"><span>发送时间：</span></label>-->
<#--						<span class="Check_Radio FontDarkBlue">${bo.sendtime?string("yyyy-MM-dd HH:mm:ss")}</span>-->
<#--					</td>-->
<#--				</tr>-->
				<tr>
					<td>
						<label class="LabName"><span>人员类型：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.type)!}</span>
					</td>
				</tr>
<#--				<tr>-->
<#--					<td>-->
<#--						<label class="LabName"><span>发送人：</span></label>-->
<#--						<span class="Check_Radio FontDarkBlue">${(bo.sendpeople)!}</span>-->
<#--					</td>-->
<#--				</tr>-->
				<tr>
					<td>
						<label class="LabName"><span>收信人：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.recipient)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>接受类型：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.reciveType)!}</span>
					</td>
				</tr>
<#--				<tr>-->
<#--					<td>-->
<#--						<label class="LabName"><span>数据有效性：</span></label>-->
<#--						<span class="Check_Radio FontDarkBlue">${(bo.isValid)!}</span>-->
<#--					</td>-->
<#--				</tr>-->
				<tr>
					<td>
						<label class="LabName"><span>创建人ID：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.creator)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>创建人姓名：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.creatorName)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>创建时间：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.createTime)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>修改人ID：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.updator)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>修改人姓名：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.updatorName)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>修改时间：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.updateTime)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>详情id：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.detailId)!}</span>
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
