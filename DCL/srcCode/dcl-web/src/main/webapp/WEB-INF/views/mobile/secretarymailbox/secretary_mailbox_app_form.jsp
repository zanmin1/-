<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String fullPath = basePath + path;
%>

<!doctype html>
<html>
<head>
	<title>留言</title>
	<meta charset="utf-8">
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="white">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="x-rim-auto-match" content="none">
	<script>
		var uiDomain = '${uiDomain}';
	</script>
	<!-- 时间控件 -->
	<link href="<%=path%>/css/app/css/box.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/reset.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/global.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/event.css" rel="stylesheet"/>
	<link href="<%=path%>/css/event.css" rel="stylesheet"/>

	<script src="${uiDomain}/app-assets/common/js/jqry-9-1-12-4.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- 附件上传相关 -->
	<script type="text/javascript" src="${rc.getContextPath()}/js/upload/bridge.js?version=1.0.1"></script>
	<script src="<%=path%>/js/layer/layer.js" type="text/javascript"></script>
	<script src="<%=path%>/js/layer/layer_wap.js" type="text/javascript"></script>
	<script src="<%=path%>/js/uitl/common.js"></script>
	<script src="${uiDomain}/web-assets/plugins/layui-v2.4.5/layui/layui.all.js"></script>
	<script src="${uiDomain}/app-assets/extend/app-address/geo_address_plugin.js"></script>
	<script src="${uiDomain}/app-assets/extend/wap-person-select/js/custom_msgClient.js"></script>
<%--	<script src="${uiDomain}/app-assets/extend/app-bridge/app-common-bridge.js"></script>--%>

	<link rel="stylesheet" href="${uiDomain}/app-assets/_wangge/basic/css/form.css"/>

	<link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css">
	<link rel="stylesheet" href="${uiDomain}/app-assets/_wangge/zhangzhou-xc110/css/global.css" />
	<link rel="stylesheet" href="${uiDomain}/app-assets/_wangge/zhangzhou-xc110/css/event110.css?v=1224471">
	<link href="<%=path%>/css/bootstrap/css/bootstrap.imgdialog.css" rel="stylesheet">

	<style>
		body .layui-layer-loading .layui-layer-content  {
			width: 32px;
			height: 32px;
			background: url('${uiDomain}/app-assets/components/images/common/loading.gif') no-repeat;
		}
		.form-line .label-con {
			padding: 12px 12px 12px 0px;
		}
		.add-images .close-btn {
			top: 10px;
			right: 10px;
			max-height: 20px;
			max-width: 20px;
		}

		.add-images .del-file-img {right: -7px;}
	</style>
</head>

<body>
	<form action="" method="post" id="baseForm">
		<input type="hidden" id="regionCode" name="regionCode" value="${userOrgCode}">

		<div class="form-wrap p-b-66">
			<div class="wrap-box  p-l">
				<div class="form-line">
					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<span class="red-asterisk">*</span></label>
					<a class="label-con select-a">
						<input type="text" name="claimant" id="claimant" style="padding-right: 5px;"
							   maxcodelength="50" value="${userInfo.nickname}" readonly />
					</a>
				</div>
				<div class="form-line">
					<label>电话号码<span class="red-asterisk">*</span></label>
					<a class="label-con select-a">
						<input type="text" name="tel" id="tel" style="padding-right: 5px;"
							   maxcodelength="11" value="${userInfo.mobile}" readonly />
					</a>
				</div>
				<div class="form-line only-con">
					<label>留言内容<span class="red-asterisk">*</span></label>
					<a class="label-con select-a">
						<textarea placeholder="请输入留言内容" name="appealContent" id="appealContent" style="height: 42px;"
								  appValidation isNotEmpty="请输入留言内容！"
								  onpropertychange="this.style.height=this.scrollHeight+'px';"
								  oninput="this.style.height=this.scrollHeight+'px';"></textarea>
					</a>
				</div>

				<div class="box-hd subt-mod-tit">
					<h3>添加附件</h3>
				</div>
				<div id="photo" class="pl10">
					<div tag="attachMentList" class="wrap-file">
<%--						<ul class="add-images" id="addImg">--%>
<%--							<li class="upload-box" id="attachment">--%>
<%--								<a style="width:86px; height:86px;">--%>
<%--									<div class="img-box">--%>
<%--										<img style="width:86px; height:86px;" src="<%=path%>/css/device/img/add-photo.png" />--%>
<%--									</div>--%>
<%--								</a>--%>
<%--							</li>--%>
<%--						</ul>--%>
							<ul id="attDiv_0" class="idx-dyn-pic">
								<li class="evt-upload-defult "></li>
							</ul>
					</div>
				</div>
			</div>

<%--			<!-- 附件-->--%>
			<div class="wrap-box p-l">

			</div>
		</div>
<%--		<!-- 弹窗 -->--%>
		<div class="mengcengImg">
			<div class="mengceng-main">
				<p>添加附件内容</p>
				<ul class="mengceng-container  ">
					<li onclick="uploadVideo(this);" class="hideMeng" style="display:none" capture="camcorder">
						<p><img src="${uiDomain}/app-assets/_wangge/zhangzhou-xc110/images/img110/icon-picture.png"></p>
						<p>相册选择</p>
					</li>
					<li id="uploadVoiceDiv" style="display:none;"></li>
					<li id="videoLiId" onclick="uploadVideo(this);" >
						<!-- capture="camcorder" 该属性只能调起摄像头拍摄-->
						<input id="filed"  type="file" accept="image/*" style="display:none;" capture="camera" multiple>
						<p><img src="${uiDomain}/app-assets/_wangge/zhangzhou-xc110/images/img110/icon-shipin.png"></p>
						<p>拍照</p>
					</li>
				</ul>
			</div>
			<div class="mengceng-luyin">
				<p>正在录音中...</p>
				<p><img src="${uiDomain}/app-assets/_wangge/zhangzhou-xc110/images/icon-yuyin.gif"></p>
				<p><a href="javascrpt:void(0);" onclick="stopRecordInter()" class="report-save report-save-yuyin">确&nbsp;&nbsp;&nbsp;&nbsp;定</a></p>
			</div>
		</div>
<%--		<!-- 弹窗 -->--%>

<%--		<!-- 按钮 -->--%>
		<div class="footer-bar" id="btnInfo">
			<div class="footer-wrap mix-btn btn-2">
				<a href="javascript:void(0)" onclick="cancel();" class="a-r-border">取消</a>
				<a href="javascript:void(0)" onclick="submitData();" class="btn-blue">提交</a>
			</div>
		</div>
	</form>

<%--	<!-- 附件上传相关 -->--%>
	<script type="text/javascript">
		window["wechat_domain"] = '${componentsDomain}';
		<%--window["wechat_domain"] = '${csDomain}'--%>
		window["static_domain"] = '${uiDomain}';
		<%--alert(window["wechat_domain"]+'----${componentsDomain}')--%>
	</script>
	<link rel="stylesheet" href="${uiDomain}/app-assets/extend/wxjsapi/css/wx-ui-all.css">
	<script type="text/javascript" src="${uiDomain}/app-assets/extend/wxjsapi/js/layer/layer.js"></script>
	<script type="text/javascript" src="${uiDomain}/app-assets/extend/wxjsapi/js/layer/layer_wap.js"></script>
	<script type="text/javascript" src="${uiDomain}/app-assets/extend/wxjsapi/js/ffcs-wxjssdk-v1.0.1.js?v=1.0.03"></script>

<%--	<!-- 微信图片上传 -->--%>
	<script type="text/javascript" src="<%=path%>/js/upload/weixin/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="<%=path%>/js/upload/wap_upload_zhangzhou.js?v=12246"></script>
	<script type="text/javascript" src="<%=path%>/js/upload/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var global_file_index = 0;
		$(function() {
			var global = $("#global_index").val();
			if (!global || global == '') {
				global_file_index = 0;
			} else {
				global_file_index = parseInt(global);
			}

			if(isweixin()){
				var attDivId = "0";
				initWxUploadImg({wx_id:attDivId,wx_lineimg_num:3,wx_maximg_num:9});
				getJsSdkMsg_();
				bodyAppendImgDialog('图片预览');
				initUploadVoice();//初始化上传语音组件
				wx.ready(function(){
					// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
					// getLocation(getAddressName);
				});
			}else{
				console.log('初始化非微信插件')
				initUploadVoice();//初始化上传语音组件

			}
			$('.evt-upload-defult').click(function(){
				$('.mengcengImg').addClass('mengcengImg-on');
				$('.mengceng-main').slideDown(300);
			});
			$('.mengcengImg').click(function(){
				$(this).removeClass('mengcengImg-on');
				if ($('.mengceng-luyin').hasClass('mengceng-luyin-on')) {
					wx.stopRecord({
						success: function (res) {
						},
						fail: function (res) {
						}
					});
				}
				$('.mengceng-luyin').removeClass('mengceng-luyin-on');
			});
			$('.evt-audio-close').click(function(){
				$(this).parents('.evt-audio-li').remove();
			});

			// 附件
			<%--$('#attachment').wapImgUpload({--%>
			<%--	"count": 9,--%>
			<%--	sourceType: ['album', 'camera'],//可以指定来源是相册还是相机，默认二者都有,album相册,camera相机拍照--%>
			<%--	defaultCameraMode: "batch",//normal表示普通单拍模式，batch表示连拍模式--%>
			<%--	attamentType: '${SECRETARY_MAILBOX_FILE}',--%>
			<%--	bizId: "${bo.uuid}",--%>
			<%--	isSaveDb: 'yes',--%>
			<%--	appcode: 'dcl',--%>
			<%--	module: '${SECRETARY_MAILBOX_FILE}',--%>
			<%--	isNeedBase64: 'N',--%>
			<%--	isBindBizId: 'no',--%>
			<%--	showType: 'add',--%>
			<%--	appendType: 'outAfter',--%>
			<%--	static_domain: window["static_domain"],--%>
			<%--	showImgEle: '.img-box',--%>
			<%--	delBtnEle: '.close_btn',--%>
			<%--	uploadFileUrl: '',--%>
			<%--	delFileUrl: '',--%>
			<%--	allowPullFresh: false, //app有效--%>
			<%--	autoInitFiles: false,--%>
			<%--	isUuidBizId: 'yes',--%>
			<%--	wechat_domain: window["wechat_domain"],--%>
			<%--	uploadFail: function() {--%>
			<%--	},--%>
			<%--	uploadSuccess: function(node, data) {--%>
			<%--		var res = data.data;--%>
			<%--		if (res.status == 1) {--%>
			<%--			alyer.msg(res.desc);--%>
			<%--			return;--%>
			<%--		}--%>

			<%--		var list = data.data.list;--%>
			<%--		var html = '';--%>
			<%--		for (var i = 0 ,len = list.length; i < len; i++) {--%>
			<%--			var imgDomain = '${imgDomain}';--%>
			<%--			var obj = list[i];--%>
			<%--			var picUrl = imgDomain + obj.path;--%>
			<%--			html+='<li id="attachment_'+global_file_index+'">';--%>
			<%--			html+=' <input type="hidden" name="attachmentId" value="'+obj.attaId+'">';--%>
			<%--			html+=' <input type="hidden" name="attList['+global_file_index+'].attachmentId" value="'+obj.attaId+'"/>';--%>
			<%--			html+=' <input type="hidden" name="attList['+global_file_index+'].title" value="'+obj.fileName+'"/>';--%>
			<%--			html+=' <input type="hidden" name="attList['+global_file_index+'].fileName" value="'+obj.fileName+'"/>';--%>
			<%--			html+=' <input type="hidden" name="attList['+global_file_index+'].filePath" value="'+obj.path+'"/>';--%>
			<%--			html+=' <a href="javascript:void(0)" href="javascript:">';--%>
			<%--			html+=' <img class="preview-img showimg" style="width:86px;height:86px;" onclick="WxJsSdkUtils.previewSingleImage(this, \'' + obj.fullPath + '\')" src="'+picUrl+'" />';--%>
			<%--			html+=' </a>';--%>
			<%--			html+=' <i class="del-file-img" onclick="delImg(this)"></i>';--%>
			<%--			html+='</li>';--%>
			<%--			global_file_index++;--%>
			<%--		}--%>
			<%--		$('#attachment').before(html);--%>
			<%--	}--%>
			<%--});--%>
		});

		// 删除附件。
		function delImg(curDoc) {
			$(curDoc).parent().remove();
		}
		//微信接口：图片上传，语音，定位
		function getJsSdkMsg_(){
			//获取请求的url
			var urlStr=location.href.split('#')[0];
			var jsTicketUrl = "${jsTicketUrl}";
			var accountAppId = "${accountAppId}";
			var orgCode = "${orgCode}";
			loadSdkIndex=layer.load();
			//加载微信jsdk
			getJsSdkMsg(jsTicketUrl,urlStr,accountAppId,orgCode,function(status,msg){
				if(status=="error"){
					layer.msg(msg);
				}else{
					layer.close(loadSdkIndex);
				}
			});
		};
		function uploadVideo(node) {
			var len = $('input[data-type="video"]').length;
			if (len > 0 ) {
				layer.msg('小视频只能上传一个');
				return;
			}
			var fileobj = document.getElementById("filed");
			fileobj.click();
		}

		$('#filed').change(function(){
			layer.msg('上传中，请稍候');
			var videoLayer = layer.load();
			setTimeout(function() {
				layer.close(videoLayer);
				var videoLayer = layer.load();
				var file = $('#filed')[0].files[0];
				var fileSize = file.size;
				if($('input[name="wxFilePath"]').length>=3){
					layer.msg('图片数量不能超过三张。');
					$('#filed').val('');
					layer.close(videoLayer);
					return false;
				}
				if ( fileSize > (20*1024*1024) ) {
					layer.msg('文件大小不能超过20M');
					$('#filed').val('');
					layer.close(videoLayer);
					return false;
				} else {
					let attamentType = '${SECRETARY_MAILBOX_FILE}';
					var uploadUrl = window["wechat_domain"] + '/commonFile/uuidBizId/upload.mhtml';
					var fileForm = new FormData();
					fileForm.append("files", file);
					fileForm.append("attachmentType", '${SECRETARY_MAILBOX_FILE}');
					fileForm.append("module", '${SECRETARY_MAILBOX_FILE}');
					fileForm.append("appcode", "dcl");
					fileForm.append("isSaveDb", "yes");
					fileForm.append("isBindBizId", "no");
					fileForm.append("showType", "add");
					fileForm.append("appendType", "outAfter");
					fileForm.append("isNeedBase64", 'N');
					fileForm.append("bizId", "${bo.uuid}");
					$.ajax({
						url: uploadUrl,
						data: fileForm,
						type: 'post',
						processData: false,
						contentType: false,
						async: false,
						success: function (res) {
							var obj = res.data.list[0];
							var path = obj.path;
							if (path) {
								if(!endWith(".PNG",path.toUpperCase()) && !endWith(".JPG",path.toUpperCase())){
									layer.msg('请上传PNG,JPG格式的图片');
									layer.close(videoLayer);
									return;
								}
								var lis ='';
								lis += '<li style="height:100%;">';
								lis += ' <input type="hidden" name="attachmentId" value="'+obj.attaId+'">';
								lis += ' <input type="hidden" name="attList['+global_file_index+'].attachmentId" value="'+obj.attaId+'"/>';
								lis += ' <input type="hidden" name="attList['+global_file_index+'].title" value="'+obj.fileName+'"/>';
								lis += ' <input type="hidden" name="attList['+global_file_index+'].fileName" value="'+obj.fileName+'"/>';
								lis += ' <input type="hidden" name="attList['+global_file_index+'].filePath" value="'+obj.path+'"/>';
								lis += '	<input  type="hidden" name="wxFilePath" value="'+ path +'"/>';
								lis += '	<div class="" onclick="videoPlay(this);" style="display:none">';
								lis += '		<a href="javascript:void(0);"></a>';
								lis += '	</div>';
								lis += '	<img style="width:100%;height:100px;" src="${imgDomain}'+path+'">';
								lis += '	<i onclick="delVideo(this)"></i>';
								lis += '</li>';
								$('.evt-upload-defult').before(lis);
								$('.mengceng-luyin').removeClass('mengceng-luyin-on');
								$('.mengcengImg').removeClass('mengcengImg-on');
								$('.mengceng-main').slideDown(300);
								global_file_index++;
							} else {
								layer.msg('上传失败');
							}
							$('#filed').val('');
							layer.close(videoLayer);
						},
						error: function(err) {
							//alert(JSON.stringify(err));
							layer.msg('网络出现异常');
							layer.close(videoLayer);
						}
					});
				}
			},1000);
		});
		var endWith=function(s,str){
			//alert(str.substring(str.length-s.length,str.length));
			if(s==null||s==""||str.length==0||s.length>str.length)
				return false;
			if(str.substring(str.length-s.length,str.length)==s)
				return true;
			else
				return false;
			return true;
		}
		function delVideo(node) {
			$(node).parent().remove();
		}
	</script>

<script type="text/javascript">
	var loadIndex = "";
	var totalW = (document.body.clientWidth - 10) / 4, aH = totalW - 10, imgH = totalW - 12;

	//提交参数
	function submitData() {
		if (formValidation()) {
			loadIndex = ffcs.loading();
			var loadW = (document.body.clientWidth - 32) / 2;
			$(".layui-layer-loading").css("left", loadW);
			$.ajax({
				type: "POST",
				url: '<%=path%>/public/wap/secretaryMailboxApp/save.json',
				data: $("#baseForm").serialize(),
				dataType: 'json',
				success: function (data) {
					layer.close(loadIndex);
					ffcs.alertMsg(data.tipMsg);
					$('.footer-bar').hide();

					if (data.success) {
						setTimeout(function() {
							cancel();
						}, 1000);
					}
				}
			});
		}
	}

	// 取消。
	function cancel() {
		location.replace('<%=path%>/public/wap/secretaryMailboxApp/index.jhtml');
	}
</script>
</body>
</html>