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
	<title>信箱详情</title>
	<meta charset="utf-8">
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="white">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="x-rim-auto-match" content="none">

	<!-- 时间控件 -->
	<link href="<%=path%>/css/app/css/box.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/reset.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/global.css" rel="stylesheet"/>
	<link href="<%=path%>/css/app/css/event.css" rel="stylesheet"/>
	<link href="<%=path%>/css/event.css" rel="stylesheet"/>

	<script src="<%=path%>/js/jquery-9-3-2-0.min.js" type="text/javascript"></script>
	<script src="<%=path%>/js/layer/layer.js" type="text/javascript"></script>
	<script src="<%=path%>/js/layer/layer_wap.js" type="text/javascript"></script>
	<script src="<%=path%>/js/uitl/common.js"></script>
	<script src="${uiDomain}/app-assets/extend/app-bridge/app-common-bridge.js"></script>

	<script type="text/javascript">
		window["wechat_domain"] = '${componentsDomain}';
		window["static_domain"] = '${uiDomain}';
	</script>
	<link rel="stylesheet" href="${uiDomain}/app-assets/extend/wxjsapi/css/wx-ui-all.css">
	<script type="text/javascript" src="${uiDomain}/app-assets/extend/wxjsapi/js/layer/layer.js"></script>
	<script type="text/javascript" src="${uiDomain}/app-assets/extend/wxjsapi/js/layer/layer_wap.js"></script>
	<script type="text/javascript" src="${uiDomain}/app-assets/extend/wxjsapi/js/ffcs-wxjssdk-v1.0.1.js?v=1.0.03"></script>

	<style>
		body .layui-layer-loading .layui-layer-content {
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

		.form-line .label-con {
			padding: 12px 12px 12px 0px;
		}
	</style>
</head>
<body>
	<form action="" method="post" id="baseForm">

		<div class="form-wrap p-b-66">
			<div class="wrap-box p-l">
				<div class="form-line">
					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<span class="red-asterisk">*</span></label>
					<div class="label-con"><p class="value-txt">${bo.claimant}</p></div>
				</div>
				<div class="form-line">
					<label>电话号码<span class="red-asterisk">*</span></label>
					<div class="label-con"><p class="value-txt">${bo.tel}</p></div>
				</div>
				<div class="form-line only-con">
					<label>留言内容<span class="red-asterisk">*</span></label>
					<div class="label-con"><p class="value-txt">${bo.appealContent}</p></div>
					</a>
				</div>

				<div class="box-hd subt-mod-tit">
					<h3>留言附件</h3>
				</div>
				<div id="photo" style="border-bottom: 1px solid #f0f0f0;">
					<div tag="attachMentList" class="label-con">
						<ul class="add-images" id="addImg">
							<c:if test="${not empty mailboxList}">
								<c:forEach items="${mailboxList}" var="att" varStatus="status">
									<li>
										<input type="hidden" name="mailboxList[${status.index}].attachmentId" value="${att.attachmentId}"/>
										<input type="hidden" name="mailboxList[${status.index}].title" value="${att.fileName}"/>
										<input type="hidden" name="mailboxList[${status.index}].fileName" value="${att.fileName}"/>
										<input type="hidden" name="mailboxList[${status.index}].filePath" value="${att.filePath}"/>
										<a href="javascript:">
											<img class="preview-img showimg" style="width:86px;height:86px;" onclick="WxJsSdkUtils.previewSingleImage(this, '${imgDomain}${att.filePath}')" src="${imgDomain}${att.filePath}" />
										</a>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

			<c:if test="${not empty bo.reply}">
				<div class="wrap-box p-l">
					<div class="form-line only-con">
						<label>回复内容<span class="red-asterisk">*</span></label>
						<div class="label-con"><p class="value-txt">${bo.reply}</p></div>
						</a>
					</div>

					<div class="box-hd subt-mod-tit">
						<h3>回复附件</h3>
					</div>
					<div class="pl10" style="border-bottom: 1px solid #f0f0f0;">
						<div tag="attachMentList" class="label-con">
							<ul class="add-images">
								<c:if test="${not empty replyList}">
									<c:forEach items="${replyList}" var="att" varStatus="status">
										<li>
											<input type="hidden" name="replyList[${status.index}].attachmentId" value="${att.attachmentId}"/>
											<input type="hidden" name="replyList[${status.index}].title" value="${att.fileName}"/>
											<input type="hidden" name="replyList[${status.index}].fileName" value="${att.fileName}"/>
											<input type="hidden" name="replyList[${status.index}].filePath" value="${att.filePath}"/>
											<a href="javascript:">
												<img class="preview-img showimg" style="width:86px;height:86px;" onclick="WxJsSdkUtils.previewSingleImage(this, '${imgDomain}${att.filePath}')" src="${imgDomain}${att.filePath}" />
											</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</c:if>
		</div>

		<!-- 按钮 -->
		<div class="footer-bar" id="btnInfo">
			<div class="footer-wrap mix-btn btn-1">
				<a onclick="cancel();" class="a-r-border">返回</a>
			</div>
		</div>
	</form>

<script type="text/javascript">
	// 返回。
	function cancel() {
		location.replace('<%=path%>/public/wap/secretaryMailboxApp/index.jhtml');
	}
</script>
</body>
</html>