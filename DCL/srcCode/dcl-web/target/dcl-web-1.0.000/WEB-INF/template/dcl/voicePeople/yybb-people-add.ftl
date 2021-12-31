<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>添加类别</title>
	<!-- layui样式 -->
	<#include "/component/layuiCommonHeadHttps.ftl" />
	<#include "/component/ComboBoxHttps.ftl" />

</head>
<body class="ovh">
    <div class="bs h100 pl10 pr10 pb10 pt10">
		<div class="layer-box-bg-ext1 bs h100 posi-rela layui-form">
            <div class="bs pl15 pr15 layer-content-height-ext1 scroll layui-row standard-form-box-ext1">
				<form id="submitForm">
					<input type="hidden" name="peopleType"  id="peopleType" value="">
					<input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
                <div class="layui-col-xs6 pl15 pr15">
                    <div class="layui-form-item mt10">
                        <label class="layui-form-label"><i>*</i>姓名</label>
                        <div class="layui-input-block">
                            <input  id="name" name="name" value="${bo.name!''}" type="text" placeholder="请填写您的姓名" class="layui-input" lay-verify-custom="required:true, validType:'maxLength[100]'">
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs6 pl15 pr15">
                    <div class="layui-form-item mt10">
                        <label class="layui-form-label"><i>*</i>手机号</label>
                        <div class="layui-input-block">
                            <input type="text" id="tel" name="tel" value="${bo.tel!''}" placeholder="请输入手机号码" class="layui-input" lay-verify-custom="required:true,mobile:[]">
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs6 pl15 pr15">
                    <div class="layui-form-item mt10">
                        <label class="layui-form-label"><i>*</i>性别</label>
						<div class="layui-input-block">
							<select  value="${bo.sex!''}" id="sex" name="sex" lay-verify-custom="required:true"></select>
						</div>
                    </div>
                </div>

					<div class="layui-col-xs6 pl15 pr15">
						<div class="layui-form-item mt10">
							<label class="layui-form-label"><i>*</i>所属区域</label>
							<div class="layui-input-block">
								<input id="orgCode" name="orgCode"  type="hidden" value="${bo.orgCode!''}">
								<input type="text" style="width: 100%;" placeholder="请选择所属区域"  name="orgName" id="orgName" autocomplete="off" value="${bo.orgName!''}" lay-verify-custom="required:true" class="layui-input">
							</div>
						</div>
					</div>

				<div class="layui-col-xs12 pl15 pr15">
					<div class="layui-form-item">
						<label class="layui-form-label"><i>*</i>联系住址</label>
						<div class="layui-input-block">
							<textarea value="${bo.address!''}" id="address" name="address"  lay-verify-custom="required:true, validType:'maxLength[200]'" placeholder="请填写联系住址" class="layui-textarea form-textarea-height-ext1"></textarea>
						</div>
					</div>
				</div>
			</form>
			</div>
			<div class="layer-btn-box-ext1">
				<button type="button" class="layui-btn layui-btn-normal">保存</button>
				<button type="button" class="layui-btn layui-btn-ext1">取消</button>
			</div>
        </div>
    </div>
	<script>
		$(function(){
			// 滚动条美化
			$('.scroll').niceScroll({
                cursorcolor: "#000", //滚动条的颜色
                cursoropacitymax: 0.12, //滚动条的透明度，从0-1  
                cursorwidth: "4px", //滚动条的宽度  单位默认px 
                cursorborderradius: "2px", //滚动条两头的圆角
                autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条 
                zindex: 8, //给滚动条设置z-index值
            })
			
			layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer'], function () {
                var form = layui.form,
                    table = layui.table,
                    laydate = layui.laydate,
                    laytpl = layui.laytpl,
                    element = layui.element,
                    layer = layui.layer;

				//编辑设置
				if('${bo.uuid!''}'!=''&&'${bo.uuid!''}'!=null){
					if ('${bo.address!''}' != '') {
						$("#address").val('${bo.address!''}')
					} else {
						$("#address").val(null)
					}

					$("#peopleType").val("${bo.peopleType!''}")

				}else{
					$("#peopleType").val("${peopleType!''}")
				}


				LayuiComp.SingleSelect('sex',{
					selectValue:'${(bo.sex)!''}', //默认值
					pCode:'${DICT_SEX}',
					selectedCallback:function(data){
					},
					context:'https://uam.zgdxxczx.cn/'
				});

				//组织树 地域树
				AnoleApi.initGridZtreeComboBox("orgName", "orgCode", function (orgCode, items) {
					if (items && items.length > 0) {
						var orgCode = items[0].orgCode;
						$("#orgCode").val(orgCode);
					}
				});

				$(".layui-btn-ext1").on("click",function () {

					parent.layer.closeAll();

				})


				$(".layui-btn-normal").on("click",function () {
						save();
				})

			})

		})

		//保存
		function save() {

			var url = '${rc.getContextPath()}/dcl/voicePeople/save.json';


			var saveData = $('#submitForm').serializeArray();


			var flag = LayuiComp.valdationCom.verification($('#submitForm'));

			//其他表单效验
			if (!flag) {
				console.log("表单验证未成功");
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

						parent.layer.closeAll();
						parent.$("#searchBtn").click();

					}
					// else 	if (data.result=="tel") {
					//
					// 	var opts = {
					// 		msg1 : "保存失败,该手机号已存在",
					// 		icon : 3,
					// 		btn : []
					// 	};
					// 	parent.commonShowDialog(opts);
					// 	layer.close(submitLoad);
					// }
					else {
						var opts = {
							msg1 : "保存失败",
							icon : 3,
							btn : []
						};
						parent.commonShowDialog(opts);
						layer.close(submitLoad);
					}
				},
				error: function(data) {
					var opts = {
						msg1 : "连接超时",
						icon : 4,
						btn : []
					};
					parent.commonShowDialog(opts);
					layer.close(submitLoad);
				},
			});
		}

	</script>
</body>
</html>