<!DOCTYPE html>
<html>
<head>
	<title>模块内容-详情</title>
	<#include "/component/layuiCommonHead.ftl" />
	<!-- 附件 -->
	<#include "/component/uploadFileCommon.ftl" />

	<!-- swiper样式 -->
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css" />
	<!--本部样式-->

	<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
	<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>

	<!-- 新地图标注js start -->
	<#--    <script type="text/javascript" src="${uiDomain}/js/global.js"></script>-->
	<#--    <script type="text/javascript" src="${GIS_URL}/js/gis/map/gisMap.js"></script>-->
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
	<script src="${rc.getContextPath()}/js/html5media.min.js"></script>
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
										<td>所属区域名称</td>
										<td>${bo.orgName!}</td>
										<td><span class="mark">*</span>项目名称</td>
										<td >${bo.helpProjectName!}</td>
									</tr>
									<tr>
										<td><span class="mark">*</span>项目类型</td>
										<td>${bo.projectTypeStr!}</td>
										<td>项目状态</td>
										<td id="prijectStatus"></td>
									</tr>
									<tr>
										<td>项目开始时间</td>
										<td>${(bo.projectStartTime?string("yyyy-MM-dd"))}</td>
										<td>项目结束时间</td>
										<td>${(bo.projectEndTime?string("yyyy-MM-dd"))}</td>
									</tr>
									<tr>
										<td>实施单位</td>
										<td>${bo.imUnit!}</td>
										<td>实施单位联系人</td>
										<td>${bo.imUnitContractPerson!}</td>
									</tr>
									<tr>
										<td>实施单位联系电话</td>
										<td>${bo.imUnitTel!}</td>
										<td>项目地点</td>
										<td>${bo.projectLocation!}</td>
									</tr>
									<tr>
										<td>地理标注</td>
										<td colspan="3">
										<a href="javascript:void(0);" class="xc-dtr-adress line-height-20 font-size-14 cor-3d7be6 ml15">
											<p id='a'></p>
										</a>
										<td>
									</tr>
									<tr>
										<td>照片</td>
										<td colspan="5">
											<div class="attachment-box flex flex-wrap parent_div" id="bigupload_2"></div>
										</td>
									</tr>
									<tr>
										<td>文件</td>
										<td colspan="5">
											<div class="attachment-box flex flex-wrap parent_div" id="bigupload_3"></div>
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
	var gridId = "${gridId}";
	var markerOperation ='${(markerOperation)!}';
	var module = '${(markerType)!}';
	var mapMarker= new MapMarker({
		el:"a",//div挂载点
		context:'${GIS_URL}',//gis域名
		width:650,//弹框宽度，可以不传，默认480px
		height:500,//弹框高度，可以不传，默认360px
		data:{ //业务数据
			id:"${(bo.uuId)!}",
			//	name : $("#name").val(),//业务名称，地图定位显示时的标题
			markerType :module,//模块类型
			markerOperation :markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
			gridId : gridId,//网格标识，用于打开地图初始的默认位置
			type: "UUID",//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
		},
		done:function (data) {//弹框确认回调，已回填了xyz到页面元素
			if(data){
				// $("#t_x").val(data.x);
				// $("#t_y").val(data.y);
				// $("#t_z").val(data.z);
			}
		}
	});
	$(function (){
		var prijectStatus = "${bo.prijectStatus!}";
		prijectStatus=='1'?prijectStatus="进行中":prijectStatus=='2'?prijectStatus="已完结":prijectStatus="挂起";
		console.log(prijectStatus);
		$("#prijectStatus").text(prijectStatus);
		console.log($("#prijectStatus").text());
	})
	//关闭
	function cancel() {
		parent.layer.closeAll(); //关闭弹窗
	}

	//图片附件
	var bigupload_2 = $("#bigupload_2").bigfileUpload({
		useType: 'view',//附件上传的使用类型，add,edit,view，（默认edit）;
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
		videoSize : ['460px', '318px'],
		fitVideoSize : true,
		openFileDesc : true
	});

	//文件附件
	var bigupload_3 = $("#bigupload_3").bigfileUpload({
		useType: 'view',//附件上传的使用类型，add,edit,view，（默认edit）;
		chunkSize : 5,//切片的大小（默认5M）
		fileNumLimit : 2,//最大上传的文件数量（默认9）
		maxSingleFileSize:500,//单个文件最大值（默认300）,单位M
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

</script>
</html>
