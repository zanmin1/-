<!DOCTYPE html>
<html>
<head>
	<title>模块内容-详情</title>
	<#include "/component/layuiCommonHead.ftl" />
	<!-- 附件 -->
	<#include "/component/uploadFileCommon.ftl" />
	<style>

		.mark {
			color: #ff4e4e;
			margin-right: 3px;
		}

	</style>
</head>
<body>
<!-- 详情的弹窗 -->
<div class="layui-row layui-form sm-mask height-100 student-details-mask">
	<div class="pl10 pr10 pt10 pb10 bs height-100">
		<div class="sm-content height-100">
			<div class="student-details-content">
				<!-- 详情信息 -->
				<div class="sdc-item sdc-item1" style="padding-top:0px;">
					<p class="font-size-14 font-bold sdc-title pl10 mt25">基础信息</p>
					<div class="sdc-box pl10 mt15 flex">
						<div class="flex1">
							<div class="layui-form check-table">
								<table class="layui-table layui-table-nohover">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tbody>
									<tr>
										<td><span class="mark">*</span>主题名称</td>
										<td>${bo.themeName!}</td>
										<td><span class="mark">*</span>模块名称</td>
										<td >${bo.modularName!}</td>
									</tr>
									<tr>
										<td><span class="mark">*</span>模块内容名称</td>
										<td>${bo.name!}</td>
										<td>副标题</td>
										<td >${bo.subtitleName!}</td>
									</tr>
									<tr>
										<td><span class="mark">*</span>是否启用</td>
										<td>${bo.isEnableName!}</td>
										<td>排序</td>
										<td>${bo.seq!}</td>
									</tr>
									<tr>
										<td>url</td>
										<td colspan="5">${bo.url!}</td>
									</tr>

									<tr>
										<td>照片</td>
										<td colspan="5">
											<div class="attachment-box flex flex-wrap parent_div" id="uploadPhoto"></div>
										</td>
									</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
				<div class="sn-btn text-align-c">
					<button type="button" class="layui-btn layui-btn-ext1" onclick="cancel()">关闭</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	//关闭
	function cancel() {
		parent.layer.closeAll(); //关闭弹窗
	}

	//附件处理
	function bigUpload(labName, bizType, styleType) {
		var uploadButton$ = $("#" + labName);
		var fileExt = '.pdf,.text,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,.zip';
		if (labName == 'uploadPhoto') {
			fileExt = '.bmp,.jpg,.png,.gif,.jpeg';
		}
		uploadButton$.bigfileUpload({
			useType: 'view',//附件上传的使用类型，add,edit,view，（默认edit）;
			componentsDomain: '${componentsDomain!''}',//公共组件域名
			useDomainCache: true,
			fileExt: fileExt,//允许上传的附件类型
			appcode: "tpr",//文件所属的应用代码（默认值components）
			module: bizType,//文件所属的模块代码（默认值bigfile）
			attachmentData: {bizId: '<#if '1' != opt>${bo.uuid!''}</#if>', attachmentType: bizType},
			isDelDbData: false,
			isDelDiscData: false,
			showTip: false,
			useUUIDTable: "yes",
			styleType: styleType,
			maxSingleFileSize: 20,
			uploadSuccessCallback: function (file, response) {
				$('.scroll').niceScroll().resize();
			},
			uploadErrorCallback: function (file, reason) {
				$('.scroll').niceScroll().resize();
			},
			deleteCallback: function (obj) {
				$('.scroll').niceScroll().resize();
			},
			finishEleRander: function () {
				$('.scroll').niceScroll().resize();
			}
		});
	}
	bigUpload('uploadPhoto','${bizTypePhoto!''}','box')

</script>
</html>
