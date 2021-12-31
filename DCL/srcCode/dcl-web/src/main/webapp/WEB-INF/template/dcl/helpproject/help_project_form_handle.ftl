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
				<input type="hidden"  name="uuId" id="uuId" value="${bo.uuId!''}">
				<div class="layui-col-xs10 pl15 pr15" style="margin-left:20px;margin-top:10px">
					<div class="layui-form-item">
						<label class="layui-form-label"><i>*</i>项目状态：</label>
						<div class="layui-input-block">
							<input type="radio" name="prijectStatus"  value="2" title="完结" checked >
							<input type="radio" name="prijectStatus"  value="3" title="挂起">
							<input type="radio" name="prijectStatus"  value="1" title="进行中">
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

<script>

	function exit() {
		$(".layui-icon-close").click();
	}

	//保存
	function save() {
		var url = '${rc.getContextPath()}/dcl/helpProject/setStatus.json';
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
				if (data) {
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
		var prijectStatus = '${bo.prijectStatus}';
		if(prijectStatus=='2'){
			$("input[name=prijectStatus][value='2").attr("checked",  true );
		}else if(prijectStatus=='3'){
			$("input[name=prijectStatus][value='3']").attr("checked",  true );
		}
			<#--$("input[name=chargeType][value='1']").attr("checked", '${bo.chargeType!''}' == '1' ? true : false);-->
		// 滚动条美化
		$('.scroll').niceScroll({
			cursorcolor: "#000", //滚动条的颜色
			cursoropacitymax: 0.12, //滚动条的透明度，从0-1
			cursorwidth: "4px", //滚动条的宽度  单位默认px
			cursorborderradius: "2px", //滚动条两头的圆角
			autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
			zindex: 8, //给滚动条设置z-index值
		})
		layui.use(['layedit','form', 'table', 'laydate', 'laytpl', 'element','layer'], function () {
			var form = layui.form,
					table = layui.table,
					laydate = layui.laydate,
					laytpl = layui.laytpl,
					element = layui.element,
					layer = layui.layer;
			var layedit = layui.layedit;

			laydate.render({
				elem: '#prjYear',
				range: true,
				trigger: 'click',
				format: 'yyyy-MM-dd',
				theme: 'rq1',
				btns: ['clear', 'confirm'],
				type: 'date',
				value: '${(bo.releaseTimeStr?string("yyyy-MM-dd"))}',
				min: '2021-10-19',
				done: function (value, date, endDate) {
					var projectStartTime = date.year+"-"+date.month+"-"+date.date;
					var projectEndTime = endDate.year+"-"+endDate.month+"-"+endDate.date;
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