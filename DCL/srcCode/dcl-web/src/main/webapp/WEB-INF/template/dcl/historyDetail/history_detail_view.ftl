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
						<label class="LabName"><span>姓名：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.name)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>身份证号：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.idcard)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>性别：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.sex)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>所属党支部：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.party)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>人员类型：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.type)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>手机号：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.phone)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>民族：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.nation)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>地域：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.orgcode)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>所属区域：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.regionCode)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>所属区域名称：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.regionName)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>地址：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.addr)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>推送状态：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.status)!}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="LabName"><span>数据有效性：</span></label>
						<span class="Check_Radio FontDarkBlue">${(bo.isValid)!}</span>
					</td>
				</tr>
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
