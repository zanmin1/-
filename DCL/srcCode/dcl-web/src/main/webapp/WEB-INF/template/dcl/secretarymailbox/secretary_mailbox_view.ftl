<!DOCTYPE html>
<html>
<head>
	<title>书记信箱-详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<#include "/component/layuiCommonHead.ftl" />
	<!-- 附件上传。 -->
	<#include "/component/uploadFileCommon.ftl" />

	<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
	<style>
		body, html {
			width: 100%;
			height: 100%;
		}
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
					<div class="sdc-item sdc-item1">
						<p class="font-size-14 font-bold sdc-title pl10 mt25">群众信息</p>
						<div class="sdc-box pl10 mt15 flex">
							<div class="flex1">
								<div class="layui-form check-table">
									<table class="layui-table layui-table-nohover">
										<colgroup>
											<col width="13.3%">
											<col width="20%">
											<col width="13.3%">
											<col width="20%">
											<col width="13.3%">
											<col width="20%">
										</colgroup>
										<tbody>
											<tr>
												<td><span class="mark">*</span>提交人</td>
												<td>${bo.claimant!}</td>
												<td><span class="mark">*</span>联系电话</td>
												<td>${bo.tel!}</td>
												<td><span class="mark">*</span>提交时间</td>
												<td>${bo.appealTime?string("yyyy-MM-dd HH:mm:ss")}</td>
											</tr>
											<tr>
												<td><span class="mark">*</span>留言内容</td>
												<td colspan="5">${bo.appealContent!}</td>
											</tr>
											<tr>
												<td>留言附件</td>
												<td colspan="5">
													<div class="attachment-box flex flex-wrap parent_div" id="uploadFile"></div>
												</td>
											</tr>
											<#if bo.reply??>
												<tr>
													<td><span class="mark">*</span>回复内容</td>
													<td colspan="5">${bo.reply!}</td>
												</tr>
												<tr>
													<td><span class="mark">*</span>是否公开</td>
													<td colspan="5">${bo.replyVisibleName!}</td>
												</tr>
												<tr>
													<td>回复附件</td>
													<td colspan="5">
														<div class="attachment-box flex flex-wrap parent_div" id="replyUploadFile"></div>
													</td>
												</tr>
											</#if>
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
	// 上传附件。
	bigUpload("uploadFile", '${SECRETARY_MAILBOX_FILE}', '${bo.uuid!''}');   // 留言附件。
	bigUpload("replyUploadFile", '${MAILBOX_REPLY_FILE}', '${bo.replyUuid!''}');   // 回复附件。

	// 上传附件
	function bigUpload(eleId, bizType, uuid) {
		var uploadButton$ = $("#" + eleId);
		var fileExt = '.bmp,.jpg,.png,.gif,.pdf,.text,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,.zip';

		uploadButton$.bigfileUpload({
			useType: 'view',//附件上传的使用类型，add,edit,view，（默认edit）;
			componentsDomain: '${componentsDomain!''}',//公共组件域名
			useDomainCache: true,
			fileExt: fileExt,//允许上传的附件类型
			appcode: "dcl",//文件所属的应用代码（默认值components）
			module: bizType,//文件所属的模块代码（默认值bigfile）
			attachmentData: {bizId: uuid, attachmentType: bizType},
			isDelDbData: false,
			isDelDiscData: false,
			showTip: false,
			useUUIDTable: "yes",
			styleType: 'list',
			maxSingleFileSize: 9,
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

	//关闭
	function cancel() {
		parent.layer.closeAll(); //关闭弹窗
	}
</script>
</html>
