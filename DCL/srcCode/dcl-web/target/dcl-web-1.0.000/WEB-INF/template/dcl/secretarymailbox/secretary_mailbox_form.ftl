<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>书记信箱-添加/编辑</title>

	<#include "/component/layuiCommonHead.ftl" />
	<!-- 附件上传。 -->
	<#include "/component/uploadFileCommon.ftl" />

	<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
</head>

<body class="ovh bg-f5f5f5 layui-ov-hide layui-form-veri modify-table-tips">
	<div class="bs h100 layui-form pl10 pr10 pb10 pt10">
<#--		<div class="layer-title-ext1 clearfix">-->
<#--			<div class="layer-title-ext1-left clearfix fl">-->
<#--				<p class="text-lh1 font-size-14 fl font-bold">回复'${bo.claimant!''}'的留言</p>-->
<#--			</div>-->
<#--			<a href="javascript:void(0);" class="layer-close-ext1 fr">-->
<#--				<i class="layui-icon layui-icon-close"></i>-->
<#--			</a>-->
<#--		</div>-->
		<div class="h100 layer-box-bg-ext1 posi-rela">
			<div class="layui-fluid layer-content-height-ext1 scroll">
				<form id="submitForm">
					<input type="hidden" id="mailboxUuid" name="mailboxUuid" value="${bo.uuid!''}">
					<input type="hidden" id="regionCode" name="regionCode" value="${bo.regionCode!''}">

					<div class="layui-row standard-form-box-ext1">
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>提交人</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input layui-form-disabled" id="claimant" name="claimant" value="${bo.claimant!''}" autocomplete="off" readonly>
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>联系电话</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input layui-form-disabled" id="tel" name="tel" value="${bo.tel!''}" autocomplete="off" readonly>
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>提交时间</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input layui-form-disabled" id="appealTime" name="appealTime" value="${bo.appealTime?string("yyyy-MM-dd HH:mm:ss")}" autocomplete="off" readonly>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>留言内容</label>
								<div class="layui-input-block">
									<textarea id="appealContent" name="appealContent" class="layui-textarea lt-min-height layui-form-disabled" style="min-height: 120px" readonly>${(bo.appealContent)!}</textarea>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label">留言附件</label>
								<div class="layui-input-block">
									<div class="parent_div" id="uploadFile"></div>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>回复内容</label>
								<div class="layui-input-block">
									<textarea placeholder="请填写内容" id="reply" name="reply" class="layui-textarea lt-min-height" lay-verify-custom="required:true, validType:['maxLength[2000]']" style="min-height: 120px"></textarea>
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>是否公开</label>
								<div class="layui-input-block">
									<select id="visible" name="visible" lay-verify-custom="required:true"></select>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label">上传附件</label>
								<div class="layui-input-block">
									<div class="parent_div" id="replyUploadFile"></div>
								</div>
							</div>
						</div>
					</div>
				</form >
			</div>
			<div class="layer-btn-box-ext1">
				<button type="button" onclick="save()" class="layui-btn layui-btn-normal">保存</button>
				<button type="button" class="layui-btn layui-btn-ext1">取消</button>
			</div>
		</div>
	</div>

<script>
	//保存
	function save() {
		var url = '${rc.getContextPath()}/dcl/secretaryMailboxPc/save.json';
		var flag = LayuiComp.valdationCom.verification($('#submitForm'));
		var saveData = $('#submitForm').serializeArray();

		if(!flag) {
			return;
		}

		var submitLoad = layer.load(1);//打开遮罩

		$.ajax({
			type: 'POST',
			url: url,
			data: saveData,
			dataType: 'json',
			success: function(data) {
				if (data.success) {
					var opts = {
						msg1: data.tipMsg,
						icon: 2,
						btn: []
					};
					parent.commonShowDialog(opts);
					$('.layui-btn-ext1').click();
					parent.searchData();
				} else {
					var opts = {
						msg1: data.tipMsg,
						icon: 3,
						btn: []
					};
					commonShowDialog(opts);
					layer.close(submitLoad);
				}
			},
			error: function(data) {
				var opts = {
					msg1: "连接超时！",
					icon: 4,
					btn: []
				};
				commonShowDialog(opts);
				layer.close(submitLoad);
			},
		});
	}

	$(function() {
		// 是否公开。
		LayuiComp.SingleSelect('visible', {
			selectValue: '', // 默认值
			pCode: '${VISIBLE}', // 字典编码
			selectedCallback: function(data) {

			},
			context: '${sysDomain}'
		});

		// 上传附件。
		bigUpload("uploadFile", '${SECRETARY_MAILBOX_FILE}', '${bo.uuid!''}', "view");   // 留言附件。
		bigUpload("replyUploadFile", '${MAILBOX_REPLY_FILE}', '${bo.replyUuid!''}', "edit");   // 回复附件。

		layui.use(['form', 'layer'], function () {
			var form = layui.form,
				layer = layui.layer;

			// 刷新表单组件
			form.render();
		});

		// 取消。
		$(".layui-btn-ext1").on("click", function() {
			var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
			parent.layer.close(index);  //再执行关闭
		});
	});

	// 上传附件
	function bigUpload(eleId, bizType, uuid, useType) {
		var uploadButton$ = $("#" + eleId);
		var fileExt = '.bmp,.jpg,.png,.gif,.pdf,.text,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,.zip';

		uploadButton$.bigfileUpload({
			useType: useType,//附件上传的使用类型，add,edit,view，（默认edit）;
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
</script>
</body>
</html>