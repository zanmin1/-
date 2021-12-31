<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>民宿管理-添加/编辑</title>

	<#include "/component/layuiCommonHead.ftl" />
	<#include "/component/sdcomponentsFiles-1.1.ftl" />
	<!-- 网格树下拉框。 -->
	<#include "/component/ComboBox.ftl" />
	<!-- 附件上传。 -->
	<#include "/component/uploadFileCommon.ftl" />

	<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>

	<!-- 富文本 start -->
	<script src="${rc.getContextPath()}/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
	<link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/js/kindeditor-4.1.10/themes/default/default.css" />

	<!-- 新地图标注js start -->
	<script type="text/javascript" src="${GIS_URL}/js/gis/base/mapMarker.js"></script>

	<!-- 地图标注点样式 start -->
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/normal.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/easyuiExtend.css" />
	<script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${uiDomain!''}/js/jquery.easyui.patch.js"></script><!--用于修复easyui-1.4中easyui-numberbox失去焦点后不能输入小数点的问题-->
	<script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<!-- 新地图标注js end -->
</head>

<body class="ovh bg-f5f5f5 layui-ov-hide layui-form-veri modify-table-tips scroll">
	<div class="bs h100 layui-form padding-ext1 layui-form">
		<div class="layer-title-ext1 clearfix">
			<div class="layer-title-ext1-left clearfix fl">
				<p class="text-lh1 font-size-14 fl font-bold"><#if bo.uuid??>编辑<#else>添加</#if>民宿信息</p>
			</div>
			<a href="javascript:void(0);" class="layer-close-ext1 fr">
				<i class="layui-icon layui-icon-close"></i>
			</a>
		</div>
		<div class="layer-content-ext1 layer-box-bg-ext1">
			<div class="layui-fluid layer-content-height-ext1 scroll">
				<form id="submitForm">
					<input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
					<input type="hidden" id="picUrl" name="picUrl" value="${bo.picUrl!''}">

					<div class="layui-row standard-form-box-ext1">
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>民宿名称</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" id="homestayName" name="homestayName" value="${bo.homestayName!''}" placeholder="请填写名称" autocomplete="off" lay-verify-custom="required:true, validType:'maxLength[200]'">
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>经营人</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" id="operator" name="operator" value="${bo.operator!''}" placeholder="请填写经营人" autocomplete="off" lay-verify-custom="required:true, validType:'maxLength[200]'">
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>联系方式</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" id="tel" name="tel" value="${bo.tel!''}" placeholder="请填写联系方式" autocomplete="off" lay-verify-custom="required:true, mobileOrPhone:true">
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>所属区域</label>
								<div class="layui-input-block">
									<input id="orgCode" name="orgCode" type="hidden" value="${bo.orgCode!''}">
									<input type="text" style="width: 100%;" placeholder="请选择区域" id="orgName" name="orgName" value="${bo.orgName!''}" autocomplete="off" lay-verify-custom="required:true" class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-col-xs8 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>详细地址</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" id="address" name="address" value="${bo.address!''}" placeholder="请填写地址" autocomplete="off" lay-verify-custom="required:true, validType:'maxLength[200]'">
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>住宿标准</label>
								<div class="layui-input-block">
									<select id="accommodation" name="accommodation" lay-verify-custom="required:true"></select>
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label"><i>*</i>发布状态</label>
								<div class="layui-input-block">
									<select id="issuStatus" name="issuStatus" lay-verify-custom="required:true"></select>
								</div>
							</div>
						</div>
						<div class="layui-col-xs4 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label">地图标注</label>
								<div class="layui-input-block clearfix">
									<input type="hidden" id="newGisX" name="newGisX" />
									<input type="hidden" id="newGisY" name="newGisY" />

									<a href="javascript:void(0);" class="maps-mark  flex flex-ac">
										<p id='map'></p>
									</a>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item">
								<label class="layui-form-label">民宿介绍</label>
								<div class="layui-input-block">
									<div class="form-rich-ext1">
										<textarea type="text" class="hide layui-textarea" id="homestayDesc" name="homestayDesc" placeholder="请填写介绍" autocomplete="off">${(bo.homestayDesc)!''}</textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
								<label class="layui-form-label">上传图片，可设置主图为民宿封面，未设置则默认第一张为封面<span>支持格式：.jpg、.jpeg、.png等常用照片类型，最多可以上传8张图片，建议尺寸：1146*717，最小尺寸：960*600。</span></label>
								<div class="parent_div" id="uploadPhoto"></div>
							</div>
						</div>
						<div class="layui-col-xs12 pl15 pr15">
							<div class="layui-form-item form-upload-video">
								<label class="layui-form-label">上传视频<span class="cor-999 font-size-12 ml10">支持格式：.avi、.mp4等常用视频类型，最多可以上传2部视频。</span></label>
								<div class="layui-input-block">
									<div class="parent_div" id="uploadVideo"></div>
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

<script type="text/javascript">
	var gridId = "${gridId}";
	var markerOperation = '${(markerOperation)!}';
	var module = '${(module)!}';

	var mapMarker = new MapMarker({
		el: "map",//div挂载点
		context: '${GIS_URL}',//gis域名
		width: 650,//弹框宽度，可以不传，默认480px
		height: 500,//弹框高度，可以不传，默认360px
		data: { //业务数据
			id:"${(bo.uuid)!}",
			name: '民宿位置',//业务名称，地图定位显示时的标题
			markerType: module,//模块类型
			markerOperation: markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
			gridId: gridId,//网格标识，用于打开地图初始的默认位置
			type: "UUID"//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
		}, done: function(data) {//弹框确认回调，已回填了xyz到页面元素
			$("#newGisX").val(data.x);
			$("#newGisY").val(data.y);
		}
	});
</script>

<div style="display: none!important;" id="tempHomestayDesc">${bo.homestayDesc!''}</div>

<script>
	//保存
	function save() {
		// 富文本 同步数据
		editor.sync();

		var url = '${rc.getContextPath()}/dcl/homestayManagementPc/save.json';
		var flag = LayuiComp.valdationCom.verification($('#submitForm'));
		var saveData = $('#submitForm').serializeArray();

		KindEditor.ready(function(K) {
			var homestayDesc = editor.text();
			saveData.homestayDesc = homestayDesc;
		});

		// 富文本必填校验
		if(saveData.homestayDesc.length > 50000) {
			var myLayerTips = layer.tips('民宿介绍内容长度超过限制！', $('.form-rich-ext1'), {
				tips: [1, '#000'],
				time: 3000
			});
			return;
		}

		if(!flag) {
			return;
		}

		// // 地图必填校验
		// if($('#x').val() == null || $('#x').val() === '') {
        //     return layer.msg("请标注地理位置！", {skin: 'layui-layer-hui'});
		// }

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
					$('.layui-icon-close').click();
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

	// 移除img标签
	function removeTAG(str) {
		str = str.replace(/<img.*?(?:>|\/>)/gi, "");
		str = str.replace(/<embed.*?(?:>|\/>)/gi, "");
		return str;
	}

	$(".layui-btn-ext1").on("click",function () {
		$('.layui-icon-close').click();
	});

	$(function() {
		// 初始化富文本框
		initKindEditor();

		// 图片附件
		var uploadPhoto = $("#uploadPhoto").bigfileUpload({
			useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
			chunkSize: 5,//切片的大小（默认5M）
			fileNumLimit: 8,//最大上传的文件数量（默认9）
			maxSingleFileSize: 50,//单个文件最大值（默认300）,单位M
			fileExt: '.jpg,.png,.gif,.bmp,.jpeg',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
			//initFileArr: attarr_1,////初始化的附件对象数组(默认为{})
			attachmentData: {bizId: '${bo.uuid!''}', attachmentType: '${bizTypePhoto!''}'},
			appcode: "tpr",//文件所属的应用代码（默认值components）
			module: '${bizType!''}',//文件所属的模块代码（默认值bigfile）
			imgDomain: '${imgDomain}',//图片服务器域名
			uiDomain: '${uiDomain}',//公共样式域名
			skyDomain: '${skyDomain}',//网盘挂载IP
			fileDomain: '${fileDomain}',//文件服务域名
			componentsDomain: '${componentsDomain}',//公共组件域名
			isSaveDB: true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
			//isDelDiscData : false,//是否删除磁盘数据，(默认true)
			isUseLabel: true,//是否开启附件便签功能
			isUseSetText: true,//是否开启附件设置回调功能
			setdefutext: "设为主图",
			useUUIDTable: "yes",
			isDelDbData: false,
			isDelDiscData: false,
			useDomainCache: true,
			setCallback: function(obj) {
				uploadPhoto.setText(obj, "主图", "设为主图");
				uploadPhoto.moveFileToIndexPos(0, obj);

				//设置主图
				$("#picUrl").val(obj.context.nextElementSibling.children[0].dataset.filepath);
			},
			styleType: "box",//块状样式：box,列表样式：list,自定义样式：self
			//uploadBtnPostion: "front",//按钮位置
			styleCallback: function(fileShowObjArr, opt) {

			},
			showTip: true,
			//tipText: "文件大小不能超过#maxSize#",
			//parentObj: parent,
			initFileElemsCallback: function(fileShowObjArr, opt) {

			},
			fileQueuedCallback: function(fileShowObj, opt) {

			},
			uploadProgressCallback: function(file, percentage) {

			},
			uploadSuccessCallback: function(file, response) {
				$(".parent_div").attr("lay-verType", "");
				$(".parent_div").attr("lay-verify", "");
				$('.scroll').niceScroll().resize();
			},
			deleteCallback: function(obj) {
				// 如果删除的是主图，则清空主图url。
				var deletePicUrl = obj.filePath;
				if (deletePicUrl === $('#picUrl').val()) {
					$('#picUrl').val('');
				}

				$('.scroll').niceScroll().resize();
			},
			videoSize: ['460px', '318px'],
			fitVideoSize: true,
			openFileDesc: true
		});

		// 视频附件
		var uploadVideo = $("#uploadVideo").bigfileUpload({
			useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
			chunkSize: 5,//切片的大小（默认5M）
			fileNumLimit: 2,//最大上传的文件数量（默认9）
			maxSingleFileSize: 500,//单个文件最大值（默认300）,单位M
			fileExt: '.mp4,.avi,.flv',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
			//initFileArr: attarr_1,////初始化的附件对象数组(默认为{})
			attachmentData: {bizId: '${bo.uuid!''}', attachmentType: '${bizTypeVideo!''}'},
			appcode: "tpr",//文件所属的应用代码（默认值components）
			module: '${bizVideoType!''}',//文件所属的模块代码（默认值bigfile）
			imgDomain: '${imgDomain}',//图片服务器域名
			uiDomain: '${uiDomain}',//公共样式域名
			skyDomain: '${skyDomain}',//网盘挂载IP
			fileDomain: '${fileDomain}',//文件服务域名
			componentsDomain: '${componentsDomain}',//公共组件域名
			isSaveDB: true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
			//isDelDiscData: false,//是否删除磁盘数据，(默认true)
			isUseLabel: true,//是否开启附件便签功能
			isUseSetText: true,//是否开启附件设置回调功能
			styleType: "box",//块状样式：box,列表样式：list,自定义样式：self
			//uploadBtnPostion: "front",//按钮位置
			useUUIDTable: "yes",
			styleCallback: function(fileShowObjArr, opt) {

			},
			showTip: true,
			//tipText: "文件大小不能超过#maxSize#",
			//parentObj: parent,
			initFileElemsCallback: function(fileShowObjArr, opt) {

			},
			fileQueuedCallback: function(fileShowObj, opt) {

			},
			uploadProgressCallback: function(file, percentage) {

			},
			uploadSuccessCallback: function(file, response) {
				$('.scroll').niceScroll().resize();
			},
			deleteCallback:function(obj) {
				$('.scroll').niceScroll().resize();
			},
			videoSize: ['460px', '318px'],
			fitVideoSize: true,
			openFileDesc: true
		});

		// 数据字典 - 住宿标准。
		LayuiComp.SingleSelect('accommodation', {
			selectValue: '${(bo.accommodation)!''}', // 默认值
			pCode: '${accommodationDictCode}', // 字典编码
			selectedCallback: function(data) {

			},
			context: '${sysDomain}'
		});

		// 数据字典 - 发布状态。
		LayuiComp.SingleSelect('issuStatus', {
			selectValue: '${(bo.issuStatus)!''}', // 默认值
			pCode: '${issuStatusDictCode}', // 字典编码
			selectedCallback: function(data) {

			},
			context: '${sysDomain}'
		});

		// 组织树 地域树
		AnoleApi.initGridZtreeComboBox("orgName", "orgCode", function (orgCode, items) {
			if (items && items.length > 0) {
				var orgCode = items[0].orgCode;
				$("#orgCode").val(orgCode);
			}
		});

		// 滚动条美化
		$('.scroll').niceScroll({
			cursorcolor: "#000", //滚动条的颜色
			cursoropacitymax: 0.12, //滚动条的透明度，从0-1
			cursorwidth: "4px", //滚动条的宽度  单位默认px
			cursorborderradius: "2px", //滚动条两头的圆角
			autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
			zindex: 8, //给滚动条设置z-index值
		});

		layui.use(['form', 'layer'], function () {
			var form = layui.form,
				layer = layui.layer;

			//自定义验证规则
			form.verify({
				otherReq: function(value, item) {
					var $ = layui.$;
					var verifyName = $(item).attr('name')
							, verifyType = $(item).attr('type')
							, formElem = $(item).parents('.layui-form')//获取当前所在的form元素，如果存在的话
							, verifyElem = formElem.find('input[name=' + verifyName + ']')//获取需要校验的元素
							, isTrue = verifyElem.is(':checked')//是否命中校验
							, focusElem = verifyElem.next().find('i.layui-icon');//焦点元素
					if(!isTrue || !value) {
						//定位焦点
						focusElem.css(verifyType=='radio'?{"color":"#FF5722"}:{"border-color":"#FF5722"});
						//对非输入框设置焦点
						focusElem.first().attr("tabIndex", "1").css("outline", "0").blur(function() {
							focusElem.css(verifyType=='radio'?{"color":""}:{"border-color":""});
						}).focus();
						return '必填项不能为空';
					}
				}
			});

			// 图片裁剪的弹窗
			$('.fup-ext1-f-edit').click(function() {
				layer.open({
					skin: 'layer-ext-sch',
					title: '封面上传',
					type: 2,
					shadeClose: true, //点击遮罩关闭
					area: ['700px', '476px'],
					content: ['./layer-pic-tailoring-1.html'],
					success: function (layero, index) {

					}
				});
			});

			// 关闭弹窗
			$('.layui-icon-close').click(function() {
				var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
				parent.layer.close(index);  //再执行关闭
			});
			//刷新表单组件
			form.render();
		})
	});

	var KindWidth = $('#homestayDesc').parent().width();
	//初始化富文本框
	function initKindEditor() {
		KindEditor.ready(function(K) {
			editor = K.create('#homestayDesc', {
				width: KindWidth + "px",
				minWidth: KindWidth + "px",
				height: "300px",
				resizeType: 0,
				newlineTag: 'br',
				//设置编辑器为简单模式
				items:[
					'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
					'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
					'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
					'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
					'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
					'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
					'anchor', 'link', 'unlink', '|', 'about'
				],
				filterMode: false,//是否开启过滤模式
				uploadJson: "${rc.getContextPath()}/dcl/upLoadFile4x.jhtml"
			});
			//加载完后再显示 不然会有一个多行文本框变成富文本框的过程
			$('#homestayDesc').removeClass("hide");
			editor.html($('#tempHomestayDesc').html());
		});
	}
</script>
</body>
</html>