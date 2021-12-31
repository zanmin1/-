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
			<p class="text-lh1 font-size-14 fl font-bold">帮扶项目</p>
		</div>
		<a style="display: none" href="javascript:void(0);" class="layer-close-ext1 fr">
			<i class="layui-icon layui-icon-close"></i>
		</a>
	</div>
	<div class="layer-content-ext1 layer-box-bg-ext1">
		<div class="layui-fluid layer-content-height-ext1 scroll">
			<form id="submitForm">
				<div class="layui-row standard-form-box-ext1">
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">所属区域</label>
							<div class="layui-input-block">
								<input id="orgCode" name="orgCode"  type="hidden" value="${bo.orgCode!''}">
								<input type="text" style="width: 100%;" placeholder="请选择景点所属区域"
									   name="orgName" id="orgName" autocomplete="off" value="${bo.orgName!''}"
									   lay-verify-custom="required:false" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>帮扶项目名称</label>
							<div class="layui-input-block">
								<input type="hidden" id="uuId" name="uuId" value="${bo.uuId!''}">
								<input type="text"  class="layui-input" id="helpProjectName" value="${bo.helpProjectName!''}"
									   name="helpProjectName" placeholder="请填帮扶项目名称" autocomplete="off"
									   lay-verify-custom="required:true,validType:'maxLength[100]'">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label"><i>*</i>项目类型</label>
							<div class="layui-input-block">
								<select id="projectType" name="projectType" lay-verify-custom="required:true"></select>
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">项目起止时间</label>
							<div class="layui-input-block">
								<input   type="text" lay-key="1" class="layui-input layui-cur-pot" id="prjYear"
										 value="${(bo.projectStartTime?string("yyyy-MM-dd"))+' - '!}${(bo.projectEndTime?string("yyyy-MM-dd"))!}"
										 placeholder="请选择项目起止时间"   lay-verify-custom="required:false" readonly>
								<input type="text"   hidden 	id="projectStartTime"  name="projectStartTimeStr" value="${(bo.projectStartTime?string("yyyy-MM-dd"))!}">
								<input type="text"   hidden 	id="projectEndTime"  name="projectEndTimeStr" value="${(bo.projectEndTime?string("yyyy-MM-dd"))!}">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">施工单位</label>
							<div class="layui-input-block">
								<input type="text"  class="layui-input"
									   id="imUnit" name="imUnit" value="${(bo.imUnit)!}" placeholder="请填施工单位"
									   autocomplete="off" lay-verify-custom="validType:'maxLength[100]'">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">实施单位联系人</label>
							<div class="layui-input-block">
								<input type="text"  class="layui-input"
									   id="imUnitContractPerson" name="imUnitContractPerson" value="${(bo.imUnitContractPerson)!}"
									   placeholder="请填实施单位联系人"
									   autocomplete="off" lay-verify-custom="validType:'maxLength[100]'">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">实施单位联系电话</label>
							<div class="layui-input-block">
								<input placeholder="请输入实施单位联系电话" type="text"
									   id="imUnitTel" name="imUnitTel" value="${(bo.imUnitTel)!}"
									   class="layui-input" autocomplete="off"
									   lay-verify-custom=" mobileOrPhone: true">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">项目地点</label>
							<div class="layui-input-block">
								<input type="text"  class="layui-input"
									   id="projectLocation" name="projectLocation" value="${(bo.projectLocation)!}"
									   placeholder="请填写项目地点" autocomplete="off" lay-verify-custom="validType:'maxLength[100]'">
							</div>
						</div>
					</div>
					<div class="layui-col-xs4 pl15 pr15">
						<div class="layui-form-item">
							<label class="layui-form-label">地图标注</label>
							<div class="layui-input-block clearfix">
								<a href="javascript:void(0);" class="maps-mark  flex flex-ac">
									<p  id='a'></p>
								</a>
								<input type="hidden" id="t_x" name="t_x"  />
								<input type="hidden" id="t_y" name="t_y"  />
							</div>
						</div>
					</div>
					<div class="layui-col-xs12 pl15 pr15">
					</div>
					<div class="layui-col-xs12 pl15 pr15">
						<div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
							<label class="layui-form-label"><span>支持格式: jpg. jpeg、 .png等常用照片类型</span></label>
							<div class="parent_div" id="bigupload_2"></div>
						</div>
					</div>
					<div class="layui-col-xs12 pl15 pr15">
						<div class="layui-form-item form-upload-video">
							<label class="layui-form-label">上传文件<span class="cor-999 font-size-12 ml10">支持格式：.doc,.docx,.xlsx,.xls,.ppt,.pptx,.pdf</span></label>
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
			id:"${(bo.uuId)!}",
			name : '地图标注',//业务名称，地图定位显示时的标题
			markerType :module,//模块类型
			markerOperation :markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
			gridId : gridId,//网格标识，用于打开地图初始的默认位置
			type: "UUID",//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
		},
		done:function (data) {//弹框确认回调，已回填了xyz到页面元素
			$("#t_x").val(data.x);
			$("#t_y").val(data.y);
		}
	});
</script>

<script>

	function exit() {
		$(".layui-icon-close").click();
	}

	//保存
	function save() {
		var url = '${rc.getContextPath()}/dcl/helpProject/save.json';
		var flag = LayuiComp.valdationCom.verification($('#submitForm'));
		if(!flag){
			return;
		}
		var submitLoad = layer.load(1);//打开遮罩
		$.ajax({
			type: 'POST',
			url: url,
			data: $('#submitForm').serializeArray(),
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
		//图片附件
		var bigupload_2 = $("#bigupload_2").bigfileUpload({
			useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
			chunkSize : 5,//切片的大小（默认5M）
			fileNumLimit : 8,//最大上传的文件数量（默认9）
			maxSingleFileSize:50,//单个文件最大值（默认300）,单位M
			fileExt : '.jpg,.png,.gif,.bmp,.jpeg',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
			//initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
			attachmentData:{bizId:'${bo.uuId!''}',attachmentType:'${bizType!''}'},
			appcode:"tpr",//文件所属的应用代码（默认值components）
			module:'${bizType!''}',//文件所属的模块代码（默认值bigfile）
			imgDomain : '${imgDomain}',//图片服务器域名
			uiDomain : '${uiDomain}',//公共样式域名
			skyDomain : '${skyDomain}',//网盘挂载IP
			fileDomain : '${fileDomain}',//文件服务域名
			componentsDomain : '${componentsDomain}',//公共组件域名
			isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
			//isDelDiscData : false,//是否删除磁盘数据，(默认true)
			isUseLabel: false,//是否开启附件便签功能
			isUseSetText: false,//是否开启附件设置回调功能
			useUUIDTable:"yes",
			isDelDbData:false,
			isDelDiscData:false,
			useDomainCache:true,
			setCallback :function(obj){
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
				$('.scroll').niceScroll().resize();
			},
			deleteCallback:function(obj){
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

		//文件附件
		var bigupload_3 = $("#bigupload_3").bigfileUpload({
			useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
			chunkSize : 5,//切片的大小（默认5M）
			fileNumLimit : 2,//最大上传的文件数量（默认9）
			maxSingleFileSize:10,//单个文件最大值（默认300）,单位M
			fileExt : '.doc,.docx,.xlsx,.xls,.ppt,.pptx,.pdf',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
			//initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
			attachmentData:{bizId:'${bo.uuId!''}',attachmentType:'${bizFileType!''}'},
			appcode:"tpr",//文件所属的应用代码（默认值components）
			module:'${bizFileType!''}',//文件所属的模块代码（默认值bigfile）
			imgDomain : '${imgDomain}',//图片服务器域名
			uiDomain : '${uiDomain}',//公共样式域名
			skyDomain : '${skyDomain}',//网盘挂载IP
			fileDomain : '${fileDomain}',//文件服务域名
			componentsDomain : '${componentsDomain}',//公共组件域名
			isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
			//isDelDiscData : false,//是否删除磁盘数据，(默认true)
			isUseLabel: false,//是否开启附件便签功能
			isUseSetText: false,//是否开启附件设置回调功能
			styleType:"box",//块状样式：box,列表样式：list,自定义样式：self
			//uploadBtnPostion:"front",//按钮位置
			useUUIDTable:"yes",
			styleCallback:function(fileShowObjArr,opt){
			},
			showTip : true,
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
		LayuiComp.SingleSelect('projectType',{
			selectValue:'${(bo.projectType)!''}', //默认值
			pCode:'${HELP_PROJECT}',//SPR007
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

			// 图片裁剪的弹窗
			$('.fup-ext1-f-edit').click(function(){
				layer.open({
					skin: 'layer-ext-sch',
					title :'封面上传',
					type: 2,
					shadeClose: true, //点击遮罩关闭
					area: ['700px', '476px'],
					content: ['./layer-pic-tailoring-1.html'],
					success: function (layero, index) {
					}
				});
			})

			laydate.render({
				elem: '#prjYear',
				range: true,
				trigger: 'click',
				format: 'yyyy-MM-dd',
				theme: 'rq1',
				btns: ['clear', 'confirm'],
				type: 'date',
				value: '${(bo.releaseTimeStr?string("yyyy-MM-dd"))}',
				// min: '2021-10-19',
				done: function (value, date, endDate) {
					var projectStartTime = date.year+"-"+date.month+"-"+date.date;
					var projectEndTime = endDate.year+"-"+endDate.month+"-"+endDate.date;
					var flage = false;
					if(date.year>endDate.year){
						flage = true;
					}else if(date.year = endDate.year && date.month>endDate.month){
						flage = true;
					}else if((date.year = endDate.year )&& (date.month = endDate.month) && date.date>endDate.date){
						flage = true;
					}
					if(flage){
						var opts = {
							msg1 : "结束时间不可大于开始时间",
							icon : 4,
							btn : []
						};
						commonShowDialog(opts);
						return;
					}
					$("#projectStartTime").val(projectStartTime);
					$("#projectEndTime").val(projectEndTime);
				}
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

</script>
</body>
</html>