<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>全屏弹窗-表单页</title>

	<#include "/component/layuiCommonHead.ftl" />
	<#include "/component/sdcomponentsFiles-1.1.ftl" />
	<#include "/component/ComboBox.ftl" />
	<#include "/component/uploadFileCommon.ftl" />


	<!-- 富文本 start -->
	<link rel="stylesheet" href="${rc.getContextPath()}/js/kindeditor-4.1.10/themes/default/default.css" />
	<script type="text/javascript" src="${rc.getContextPath()}/js/kindeditor-4.1.10/kindeditor-all-min.js" charset="UTF-8"></script>
	<!-- 新地图标注js start -->
<#--	<script type="text/javascript" src="${uiDomain}/js/global.js"></script>-->
<#--	<script type="text/javascript" src="${GIS_URL}/js/gis/map/gisMap.js"></script>-->
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
<body class="scroll">
<div class="bs h100 layui-form padding-ext1 layui-form">
	<div class="layer-title-ext1 clearfix">
		<div class="layer-title-ext1-left clearfix fl">
			<p class="text-lh1 font-size-14 fl font-bold">景点信息</p>
		</div>
		<a href="javascript:void(0);" class="layer-close-ext1 fr">
			<i class="layui-icon layui-icon-close"></i>
		</a>
	</div>
	<div class="layer-content-ext1 layer-box-bg-ext1">
		<div class="layui-fluid layer-content-height-ext1 scroll">
			<form id="submitForm">
				<div class="layui-row standard-form-box-ext1">
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>景点名称</label>
							<div class="layui-input-block">
								<input type="hidden" id="picUrl" name="picUrl" value="${bo.picUrl!''}">
								<input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
								<input type="text"  class="layui-input" id="attractionsName" value="${bo.attractionsName!''}" name="attractionsName" placeholder="请填写景点名称" autocomplete="off" lay-verify-custom="required:true,validType:'maxLength[100]'">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>景点类型</label>
							<div class="layui-input-block">
								<select id="attractionsType" name="attractionsType" lay-verify-custom="required:true"></select>
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>是否收费</label>
							<div class="layui-input-block">
								<input type="radio" name="chargeType"  value="1" title="免费" checked>
								<input type="radio" name="chargeType"  value="3" title="收费">
								<input type="radio" name="chargeType"   value="2" title="部分收费">
							</div>
						</div>
					</div>


					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>所属区域</label>
							<div class="layui-input-block">
								<input id="orgCode" name="orgCode"  type="hidden" value="${bo.orgCode!''}">
								<input type="text" style="width: 100%;" placeholder="请选择景点所属区域"  name="orgName" id="orgName" autocomplete="off" value="${bo.orgName!''}" lay-verify-custom="required:true" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>详细地址</label>
							<div class="layui-input-block">
								<input type="text"  class="layui-input" id="address" value="${bo.address!''}" name="address" placeholder="请填写详细地址" autocomplete="off" lay-verify-custom="required:true,validType:'maxLength[100]'">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">地图标注</label>
							<div class="layui-input-block clearfix">
								<a href="javascript:void(0);" class="maps-mark  flex flex-ac">
									<#--<i></i>-->
									<p  id='a'></p>
								</a>

								<input type="hidden" id="t_x" name="t_x"  />
								<input type="hidden" id="t_y" name="t_y"  />

								<!-- 装经纬度的input -->
								<!-- <input type="text" value="115.947282，28.685946" class="layui-input jd-maps-input" readonly> -->
							</div>
						</div>
					</div>

					<div class="layui-col-xs6 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>是否发布</label>
							<div class="layui-input-block">
								<input type="radio" name="issuStatus"  value="1" title="是" checked >
								<input type="radio" name="issuStatus"  value="0" title="否">
							</div>
						</div>
					</div>
					<div class="layui-col-xs12 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">景点介绍</label>
							<div class="layui-input-block">
								<div class="form-rich-ext1">
									<textarea type="text"  class="hide  layui-textarea" id="attractionsDesc"  name="attractionsDesc" autocomplete="off"  placeholder="请填写介绍" >${(bo.attractionsDesc)!''}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-xs12 pl15 pr15">
						<div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
							<label class="layui-form-label">上传图片,设置主图为景点封面,未设置默认第一张为封面<span>支持格式: jpg. jpeg、 .png等常用照片类型,多可以上传8张图片建议尺寸1146*717, 最低尺寸>960*600</span></label>
							<div class="parent_div" id="bigupload_2"></div>
						</div>
					</div>
					<div class="layui-col-xs12 pl15 pr15">
						<div class="layui-form-item form-upload-video">
							<label class="layui-form-label">上传视频<span class="cor-999 font-size-12 ml10">支持格式：.avi、.mp4等常用视频类型，最多可以上传 2 份视频</span></label>
							<div class="layui-input-block">
									<div class="parent_div" id="bigupload_3"></div>
							</div>
						</div>
					</div>
				</div>
			</form >
		</div>
		<div class="layer-btn-box-ext1">
			<button type="button" onclick="save()" class="layui-btn layui-btn-normal">保存</button>
			<button type="button"  onclick="exit()" class="layui-btn layui-btn-ext1">取消</button>
		</div>
	</div>
</div>


<script type="text/javascript">

	var gridId = "${gridId}";
	var markerOperation ='${(markerOperation)!}';
	var module = '${(module)!}';

	var mapMarker= new MapMarker({
		el:"a",//div挂载点
		context:'${GIS_URL}',//gis域名
		width:650,//弹框宽度，可以不传，默认480px
		height:500,//弹框高度，可以不传，默认360px
		data:{ //业务数据
			id:"${(bo.uuid)!}",
			name : '景点位置',//业务名称，地图定位显示时的标题
			markerType :module,//模块类型
			markerOperation :markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
			gridId : gridId,//网格标识，用于打开地图初始的默认位置
			type: "UUID",//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
		},
		done:function (data) {//弹框确认回调，已回填了xyz到页面元素
		//	if(data){
			$("#t_x").val(data.x);
			$("#t_y").val(data.y);
			//	$("#t_z").val(data.z);
		//	}
	      }
	});

	<#--initMap(window,'a','${GIS_URL}', gridId,"${(bo.uuid)!}",module,markerOperation,{type:'uuid'});-->
</script>

<script>



	function exit() {
		$(".layui-icon-close").click();
	}


	//保存
	function save() {

		//地图必填校验
		// if($("#x").val()==null||$("#x").val()==''){
		// 	var myLayerTips = layer.tips('请标记地图位置',$('#a'),{
		// 		tips: [1, '#000'],
		// 		time: 3000
		// 	})
		// 	return;
		// }

		//富文本
		editor.sync();


		var url = '${rc.getContextPath()}/dcl/attractionsManagement/save.json';

		var flag = LayuiComp.valdationCom.verification($('#submitForm'));

		//表单序列化
		var saveData = $('#submitForm').serializeArray();

		KindEditor.ready(function(K) {
			var attractionsDesc = editor.text();

			saveData.attractionsDesc =attractionsDesc
		});

		//富文本必填校验
		if(saveData.attractionsDesc.length>50000){
			var myLayerTips = layer.tips('景区介绍内容长度超过限制',$('.form-rich-ext1'),{
				tips: [1, '#000'],
				time: 3000
			})
			return;
		}
		//表单验证
		if(!flag){
			return;
		}

		var submitLoad = layer.load(1);//打开遮罩

		$.ajax({
			type: 'POST',
			url: url,
			data: saveData,
			dataType: 'json',
			success: function(data) {
				if (data.result=="success") {

					var opts = {
						msg1 : "保存成功",
						icon : 2,
						btn : []
					};
					parent.commonShowDialog(opts);
					$('.layui-icon-close').click();
					parent.searchData();

				} else {
					var opts = {
						msg1 : "保存失败",
						icon : 3,
						btn : []
					};
					commonShowDialog(opts);
					layer.close(submitLoad);
				}
			},
			error: function(data) {
				var opts = {
					msg1 : "连接超时",
					icon : 4,
					btn : []
				};
				commonShowDialog(opts);
				layer.close(submitLoad);
			},

		});
	}



	$(function(){

		//编辑设置 radio数据
		if('${bo.uuid!''}'!=''&&'${bo.uuid!''}'!=null){
			$("input[name=chargeType][value='1']").attr("checked", '${bo.chargeType!''}' == '1' ? true : false);
			$("input[name=chargeType][value='2']").attr("checked", '${bo.chargeType!''}' == '2' ? true : false);
			$("input[name=chargeType][value='3']").attr("checked", '${bo.chargeType!''}' == '3' ? true : false);
			$("input[name=issuStatus][value='1']").attr("checked", '${bo.issuStatus!''}' == '1' ? true : false);
			$("input[name=issuStatus][value='0']").attr("checked", '${bo.issuStatus!''}' == '0' ? true : false);
		}
		//富文本框初始化
		initKindEditor();



		//图片附件
		var bigupload_2 = $("#bigupload_2").bigfileUpload({
			useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
			chunkSize : 5,//切片的大小（默认5M）
			fileNumLimit : 8,//最大上传的文件数量（默认9）
			maxSingleFileSize:50,//单个文件最大值（默认300）,单位M
			fileExt : '.jpg,.png,.gif,.bmp,.jpeg',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
			//initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
			attachmentData:{bizId:'${bo.attractionsId!''}',attachmentType:'${bizType!''}'},
			appcode:"tpr",//文件所属的应用代码（默认值components）
			module:'${bizType!''}',//文件所属的模块代码（默认值bigfile）
			imgDomain : '${imgDomain}',//图片服务器域名
			uiDomain : '${uiDomain}',//公共样式域名
			skyDomain : '${skyDomain}',//网盘挂载IP
			fileDomain : '${fileDomain}',//文件服务域名
			componentsDomain : '${componentsDomain}',//公共组件域名
			isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
			//isDelDiscData : false,//是否删除磁盘数据，(默认true)
			isUseLabel: true,//是否开启附件便签功能
			isUseSetText: true,//是否开启附件设置回调功能
			setdefutext: "设为主图",
			useUUIDTable:"yes",
			isDelDbData:false,
			isDelDiscData:false,
			useDomainCache:true,
			setCallback :function(obj){
				bigupload_2.setText(obj,"主图","设为主图");
				bigupload_2.moveFileToIndexPos(0,obj);
				//设置主图
				$("#picUrl").val(obj.context.nextElementSibling.children[0].dataset.filepath);
			},
			styleType:"box",//块状样式：box,列表样式：list,自定义样式：self
			//uploadBtnPostion:"front",//按钮位置
			styleCallback:function(fileShowObjArr,opt){

			},
			showTip : true,
			//tipText:"文件大小不能超过#maxSize#",
			//parentObj:parent,
			initFileElemsCallback : function(fileShowObjArr,opt){

			},
			fileQueuedCallback : function(fileShowObj,opt){

			},
			uploadProgressCallback : function(file,percentage){

			},
			uploadSuccessCallback : function(file,response){
				// $(".parent_div").attr("lay-verType","");
				// $(".parent_div").attr("lay-verify","");
				$('.scroll').niceScroll().resize();
			},
			deleteCallback:function(obj){
				// var attNum = bigFile$.getAttachmentNum();
				// if(attNum == 0){
				// 	$(".parent_div").attr("lay-verType","tips");
				// 	$(".parent_div").attr("lay-verify","required");
				// }
				 var path =obj.filePath;
				//若删的是主图
				if(path==$("#picUrl").val()){
				$("#picUrl").val("");
				}

				$('.scroll').niceScroll().resize();
			},
			videoSize : ['460px', '318px'],
			fitVideoSize : true,
			openFileDesc : true
		});

		//视频附件
		var bigupload_3 = $("#bigupload_3").bigfileUpload({
			useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
			chunkSize : 5,//切片的大小（默认5M）
			fileNumLimit : 2,//最大上传的文件数量（默认9）
			maxSingleFileSize:500,//单个文件最大值（默认300）,单位M
			fileExt : '.mp4,.avi,.flv',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
			//initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
			attachmentData:{bizId:'${bo.attractionsId!''}',attachmentType:'${bizVideoType!''}'},
			appcode:"tpr",//文件所属的应用代码（默认值components）
			module:'${bizVideoType!''}',//文件所属的模块代码（默认值bigfile）
			imgDomain : '${imgDomain}',//图片服务器域名
			uiDomain : '${uiDomain}',//公共样式域名
			skyDomain : '${skyDomain}',//网盘挂载IP
			fileDomain : '${fileDomain}',//文件服务域名
			componentsDomain : '${componentsDomain}',//公共组件域名
			isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
			//isDelDiscData : false,//是否删除磁盘数据，(默认true)
			isUseLabel: true,//是否开启附件便签功能
			isUseSetText: true,//是否开启附件设置回调功能
			styleType:"box",//块状样式：box,列表样式：list,自定义样式：self
			//uploadBtnPostion:"front",//按钮位置
			useUUIDTable:"yes",
			styleCallback:function(fileShowObjArr,opt){

			},
			showTip : true,
			//tipText:"文件大小不能超过#maxSize#",
			//parentObj:parent,
			initFileElemsCallback : function(fileShowObjArr,opt){

			},
			fileQueuedCallback : function(fileShowObj,opt){

			},
			uploadProgressCallback : function(file,percentage){

			},
			uploadSuccessCallback : function(file,response){

				$('.scroll').niceScroll().resize();
			},
			deleteCallback:function(obj){

				$('.scroll').niceScroll().resize();
			},
			videoSize : ['460px', '318px'],
			fitVideoSize : true,
			openFileDesc : true
		});


		//字典加载 一级归属
		LayuiComp.SingleSelect('attractionsType',{
			selectValue:'${(bo.attractionsType)!''}', //默认值
			pCode:'${DICT_ATTR_TYPE}',//SPR007
			selectedCallback:function(data){
			},
			context:'${sysDomain}'
		});

		//组织树 地域树
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
		})
		// $('.scroll').scrollTop( $('.scroll')[0].scrollHeight);

		layui.use(['layedit','form', 'table', 'laydate', 'laytpl', 'element','layer'], function () {
			var form = layui.form,
					table = layui.table,
					laydate = layui.laydate,
					laytpl = layui.laytpl,
					element = layui.element,
					layer = layui.layer;
			var layedit = layui.layedit;


			//自定义验证规则
			form.verify({
				otherReq: function(value,item){
					var $ = layui.$;
					var verifyName=$(item).attr('name')
							, verifyType=$(item).attr('type')
							,formElem=$(item).parents('.layui-form')//获取当前所在的form元素，如果存在的话
							,verifyElem=formElem.find('input[name='+verifyName+']')//获取需要校验的元素
							,isTrue= verifyElem.is(':checked')//是否命中校验
							,focusElem = verifyElem.next().find('i.layui-icon');//焦点元素
					if(!isTrue || !value){
						//定位焦点
						focusElem.css(verifyType=='radio'?{"color":"#FF5722"}:{"border-color":"#FF5722"});
						//对非输入框设置焦点
						focusElem.first().attr("tabIndex","1").css("outline","0").blur(function() {
							focusElem.css(verifyType=='radio'?{"color":""}:{"border-color":""});
						}).focus();
						return '必填项不能为空';
					}
				}
			});


			//日期范围
			laydate.render({
				elem: '#time2',
				format: 'yyyy年MM月dd日',
				theme: 'rq1',
				btns:['clear', 'confirm'],
			});
			// 关闭弹窗
			$('.layui-icon-close').click(function(){
				var  index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
				parent.layer.close(index);  //再执行关闭
			})
			//刷新表单组件
			form.render();
		})
	})

	var KindWidth = $('#attractionsDesc').parent().width();

	//初始化富文本框
	function initKindEditor(){
		var submitLoad = layer.load(1);//打开遮罩
		KindEditor.ready(function(K) {
			editor = K.create('#attractionsDesc', {
				width : KindWidth+"px",
				minWidth : KindWidth+"px",
				height : "300px",
				resizeType : 0,
				newlineTag : 'br',
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
				uploadJson :  "${rc.getContextPath()}/dcl/upLoadFile4x.jhtml"
			});
			//加载完后再显示 不然会有一个多行文本框变成富文本框的过程
			$('#attractionsDesc').removeClass("hide");
			layer.close(submitLoad);
		});
	}


</script>
</body>
</html>