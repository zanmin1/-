<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>民宿管理-列表</title>

	<#include "/component/layuiCommonHead.ftl" />
	<#include "/component/sdcomponentsFiles-1.1.ftl" />
	<!-- 网格树下拉框。 -->
	<#include "/component/ComboBox.ftl" />
</head>

<body class="bg-f5f5f5">
	<#--<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>-->
	<#--<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>-->

	<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
	<!--[if lt IE 9]>
	<![endif]-->
	<div class="layui-fluid">
		<div class="layui-row">
			<form id="searchForm">
				<div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
					<div class="layui-row layui-form layui-sch-g flex mt15">
						<div class="flex">
							<div class="layui-form-item" >
								<label class="layui-form-label">所属区域</label>
								<div class="layui-input-block w160">
									<input type="hidden" id="orgCode" name="orgCode" value="${infoOrgCode!''}"/>
									<input class="layui-input" type="text" id="orgName" name="orgName" value="${infoOrgName!''}"/>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">民宿名称</label>
								<div class="layui-input-block w160">
									<input type="text" placeholder="请输入名称" class="layui-input" id="homestayName">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">民宿地址</label>
								<div class="layui-input-block w160">
									<input type="text" placeholder="请输入地址" class="layui-input" id="address">
								</div>
							</div>
							<div class="posi-rela ml10">
								<button type="button" class="layui-btn layui-btn-ext10" id="more">更多<i class="layui-icon layui-icon-down more-icon"></i></button>
								<div class="more-search-ul hide">
									<div class="w100 h100 posi-rela scroll">
										<ul class=" more-search-ul-com scroll">
											<li class="mb10">
												<div class="layui-form-item">
													<label class="layui-form-label">发布状态</label>
													<div class="layui-input-block">
														<select id="issuStatus" name="issuStatus"></select>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="ml15 mr10">
							<button type="button" id="searchBtn" class="layui-btn layui-btn-normal">查询</button>
							<button type="button" id="resetBtn" class="layui-btn layui-btn-ext1">重置</button>
							<button  hidden type="button" id="search"></button>
						</div>
					</div>
				</div>
			</form >
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
				<div class="layui-fluid h100">
					<div class="layui-col-xs12 pt10 xcjd-hd">
						<p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>民宿列表</p>
						<div class="crudbox fr">
							<@actionCheck2></@actionCheck2>
<#--							<button type="button" class="layui-btn layui-btn-normal" id="file-add" onclick="add()">添加</button>-->
<#--							<button type="button" class="layui-btn layui-btn-normal" id="file-edit" onclick="edit()">编辑</button>-->
<#--							<button type="button" class="layui-btn layui-btn-ext1" id="file-del" onclick="del()">删除</button>-->
<#--							<button type="button" class="layui-btn layui-btn-ext2 jyj-mb-import" onclick="importData()">导入</button>-->
<#--							<button type="button" class="layui-btn layui-btn-ext2 jyj-mb-export" onclick="exportData()">导出</button>-->
						</div>
					</div>
					<!-- 卡片式内容 -->
					<div class="xcjd-card">
						<!-- 卡片列表内容 -->
						<div id="tableList" class="xcjd-card-content layui-col-space20 scroll mt5 ovh bs bs layui-row">

						</div>
						<!-- 分页 -->
						<div class="layui-table-page xczx-page-ext1" id="xcjd-page"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	var selectUuid = null;

	var totalCount = 0;
	var currPage = 1;
	var pageSize = 12;

	var imgDomain = '${imgDomain}'; // 文件服务器域名

	$(function () {
		calcLayBdH();

		// 所属区域
		AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
			$("#orgCode").val(items[0].orgCode);
		},{
			ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
		});

		// 数据字典 - 发布状态。
		LayuiComp.SingleSelect('issuStatus', {
			selectValue: '', // 默认值
			pCode: '${issuStatusDictCode}', // 字典编码
			selectedCallback: function(data) {

			},
			context: '${sysDomain}'
		});
	});

	function searchData() {
		currPage = 1;
		$("#search").click();
	}

	function detail(uuid) {
		var url = '${rc.getContextPath()}/dcl/homestayManagementPc/view.jhtml?uuid=' + uuid;

		var index = layer.open({
			skin: 'layer-ext-sch',
			type: 2,
			title: false,
			closeBtn: 0,
			shadeClose: true, //点击遮罩关闭
			area: ['100%', '100%'],
			content: url,
			success: function (layero) {
				calcLayBdH();
				$("#search").click();
			}
		});
	}

	function add() {
		var url = '${rc.getContextPath()}/dcl/homestayManagementPc/form.jhtml';

		var index = layer.open({
			skin: 'layer-ext-sch',
			type: 2,
			title: false,
			closeBtn: 0,
			shadeClose: true, //点击遮罩关闭
			area: ['100%', '100%'],
			content: url,
			success: function (layero) {
				calcLayBdH();
				$("#search").click();
			}
		});
	}

	//编辑
	function edit() {
		if(selectUuid == null || selectUuid == '') {
			layer.msg("请选择一条记录！", {skin:'layui-layer-hui'});
			return;
		}

		var url = '${rc.getContextPath()}/dcl/homestayManagementPc/form.jhtml?uuid=' + selectUuid;

		var index = layer.open({
			skin: 'layer-ext-sch',
			type: 2,
			title: false,
			closeBtn: 0,
			shadeClose: true, //点击遮罩关闭
			area: ['100%', '100%'],
			content: url,
			success: function (layero) {
				calcLayBdH();
				$("#search").click();
			}
		});
	}

	//删除
	function del() {
		if(selectUuid == null || selectUuid == '') {
			layer.msg("请选择一条记录！", {skin:'layui-layer-hui'});
			return;
		}

		var opts = {
			msg1: "确定要删除吗?",
			icon: 1,
			callBack: function(index) {
				var submitLoad = layer.load(1);//打开遮罩
				$.ajax({
					type: 'POST',
					url: '${rc.getContextPath()}/dcl/homestayManagementPc/del.jhtml',
					data: {
						uuid: selectUuid
					},
					dataType: 'json',
					success: function(data) {
						if (data.success) {
							var opts = {
								msg1: data.tipMsg,
								icon: 2,
								btn: []
							};
							commonShowDialog(opts);
							//刷新
							$("#search").click();
						} else {
							var opts = {
								msg1: data.tipMsg,
								icon: 3,
								btn: []
							};
							commonShowDialog(opts);
						}
					},
					error: function(data) {
						var opts = {
							msg1 : "连接超时！",
							icon : 4,
							btn : []
						};
						commonShowDialog(opts);
					},
					complete : function() {
						layer.close(submitLoad);//关闭遮罩
					}
				});
			},
		};
		commonShowDialog(opts);
	}


	$(function () {
		$(window).on('resize', function () {
			calcLayBdH();
		});

		layui.use(['form', 'table', 'layer', 'laypage'], function () {
			var form = layui.form,
					table = layui.table,
					laypage = layui.laypage,
					layer = layui.layer;

			$('#search').on('click', function() {
				selectUuid = null;

				var submitLoad = layer.load(1); // 打开遮罩

				$.ajax({
					type: 'POST',
					url: '${rc.getContextPath()}/dcl/homestayManagementPc/listData.jhtml',
					data: {
						currentPage: currPage,
						pageSize: pageSize,
						orgCode: $("#orgCode").val(),
						homestayName: $("#homestayName").val(),
						address: $("#address").val(),
						issuStatus:$("#issuStatus").val(),
					},
					success: function(data) {
						$("#tableList").empty();

						totalCount = data.count;

						// 暂无数据
						if (totalCount == 0) {
							$("#tableList").html(listNoDataHtml);
							// 关闭遮罩
							layer.close(submitLoad);
							return false;
						}

						var html = '';

						$.each(data.data, function (i, val) {
							var picUrlObj = val.picUrl == undefined || val.picUrl == null ? '<div class="standard-default-pic-ext1"></div>' : '<img src="' + imgDomain + val.picUrl + '">';
							var homestayName = val.homestayName == undefined ? "" : val.homestayName;
							var accommodationName = val.accommodationName == undefined ? "" : val.accommodationName;
							var address = val.address == undefined ? "" : val.address;

							var issuStatus = val.issuStatusName == '已发布' ? "checked" : '';
							var issuStatusName = val.issuStatusName == undefined ? "" : val.issuStatusName;
							var issuStatusColorSpan;
							if (issuStatus === 'checked') {
								issuStatusColorSpan = '<span class=\"cor-4ab900 mlr15\">【';
							} else {
								issuStatusColorSpan = '<span class=\"cor-ff6666 mlr15\">【';
							}

							var orgName = val.orgName == undefined ? "" : val.orgName;
							var uuid = val.uuid == undefined ? "" : val.uuid;

							html +=  "                            <div data-value=\"" + uuid + "\" class=\"layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg3\">\n" +
									"                                <div class=\"xcjd-cc-item\">\n" +
									"                                    <div class=\"xcjd-cci-top clearfix\">\n" +
									"                                        <div class=\"xcjd-ccit-pic img100 fl posi-rela\">\n" +
									picUrlObj +
									"                                        </div>\n" +
									"                                        <div class=\"fl xcjd-ccit-right fl\">\n" +
									"                                            <div class=\"clearfix xcjd-ccitr-checkbox\">\n" +
									"                                            </div>\n" +
									"                                            <p class=\"xcjd-ccitr-title text-line-c1 font-size-16 font-bold cor-4c4c4c text-lh1\"><a href=\"javascript:void(0)\" class='a-detail' onclick=\"detail('" + uuid + "')\">" + homestayName + "</a></p>\n" +
									"                                            <p class=\"xcjd-ccitr-title1 mt15 text-line-c1 font-size-14 font-bold cor-666 text-lh1\">" + accommodationName + issuStatusColorSpan + issuStatusName + "】</span></p>\n" +
									"                                            <div class=\"xcjd-ccitr-box clearfix mt10\">\n" +
									"                                                <div class=\"fr clearfix\">\n" +
									"                                                    <p class=\"font-size-14 font-bold cor-666 line-height-20 fl\">发布：</p>\n" +
									"                                                    <div class=\"fl\">\n" +
									"                                                        <input type=\"checkbox\" value=\""+uuid+"\" lay-filter=\"status\" name=\"status\" lay-skin=\"switch\" " + issuStatus + "  >\n" +
									"                                                   </div>\n" +
									"                                                </div>\n" +
									"                                            </div>\n" +
									"                                        </div>\n" +
									"                                    </div>\n" +
									"                                    <div class=\"xcjd-cci-bottom pl15 pr15 bs\">\n" +
									"                                        <p class=\"text-lh1 font-size-14 text-line-c1\">\n" +
									"                                            <span  class=\"cor-4c4c4c font-bold\">所属区域：</span>\n" +
									"                                            <em class=\"cor-666\">" + orgName + "</em>\n" +
									"                                        </p>\n" +
									"                                        <p class=\"text-lh1 font-size-14 text-line-c1\">\n" +
									"                                            <span  class=\"cor-4c4c4c font-bold\">详细地址：</span>\n" +
									"                                            <em class=\"cor-666\">" + address + "</em>\n" +
									"                                        </p>\n" +
									"                                    </div>\n" +
									"                                </div>\n" +
									"                            </div>";
						});

						//分页功能
						laypage.render({
							elem: 'xcjd-page'
							, count: totalCount
							,limit: pageSize
							,curr: currPage
							, prev: '<i class="layui-icon"></i>'
							, next: '<i class="layui-icon"></i>'
							, layout: ['prev', 'page', 'next', 'skip', 'count',]
							, groups: 3 //只显示 1 个连续页码
							, jump: function(obj, first) {
								//首次不执行
								if(!first) {
									currPage = obj.curr;
									$("#search").click();
								}
							}
						});

						$("#tableList").html(html);

						form.on('switch(status)', function(data) {
							var uuid = data.value;
							var issuStatus = this.checked ? '01' : '02';

							$.ajax({
								type: 'POST',
								url: '${rc.getContextPath()}/dcl/homestayManagementPc/save.jhtml',
								data: {
									"uuid": uuid,
									"issuStatus": issuStatus,
									"orgCode": $('#orgCode').val(),
                                    "type": "issuStatus"
								},
								beforeSend:function() {
									index = layer.msg('正在切换中，请稍候...', {icon: 16, time: false, shade: 0.1});
								},
								error: function(data) {
									layer.msg('数据异常，操作失败！');
								},
								success: function(data) {
									layer.close(index);

									var msg = "操作成功！";
									layer.msg(msg);

									$("#search").click();
								},
								dataType:'JSON'
							});
						});

						//点击事件
						$('.layui-col-lg3').on('click', function() {
							$(this).find(".xcjd-cc-item").addClass('active');
							$(this).siblings().find(".xcjd-cc-item").removeClass('active');
							selectUuid = $(this).data("value");
						});

						// layUi 重新渲染
						form.render();
						// 关闭遮罩
						layer.close(submitLoad);
					},
					error: function(data) {

					},
					complete: function() {
						calcLayBdH();
					}
				});
			});

			$("#search").click();

			//搜索
			$('#searchBtn').on('click',function() {
				searchData();
			});

			//重置
			$('#resetBtn').on('click',function() {
				// $('#searchForm').form('clear');
				$('#orgCode').val('${infoOrgCode}');
				$('#orgName').val('${infoOrgName}');
				$('#homestayName').val("");
				$('#address').val("");
				$('#issuStatus').val("");

				searchData();
			});
		});
	});
</script>
</html>