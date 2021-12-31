<!DOCTYPE html>
<html>
<head>
    <title>积分管理-列表</title>

    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <!-- 网格树下拉框。 -->
    <#include "/component/ComboBox.ftl" />
</head>

<body>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
            <div class="layui-row layui-form layui-sch-g flex mt15">
                <div class="flex">
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属区域</label>
                        <div class="layui-input-block w160">
                            <input type="hidden" id="regionCode" name="regionCode" value="${infoOrgCode!''}"/>
                            <input class="layui-input" type="text" id="regionName" name="regionName"
                                   value="${infoOrgName!''}"/>
                        </div>
                    </div>
<#--                    <div class="layui-form-item">-->
<#--                        <label class="layui-form-label">姓名</label>-->
<#--                        <div class="layui-input-block w160">-->
<#--                            <input type="text" placeholder="请输入姓名" class="layui-input" id="name">-->
<#--                        </div>-->
<#--                    </div>-->
                    <div class="layui-form-item">
                        <label class="layui-form-label">年度</label>
                        <div class="layui-input-block">
                            <input type="text" readonly class="layui-input" id="statDate" placeholder="请选择年度">
<#--                            <select id="platform" name="platform"></select>-->
                        </div>
                    </div>
                </div>
                <div class="ml10 mr10">
                    <button type="button" class="layui-btn layui-btn-normal" id="searchBtn">查询</button>
                    <button type="button" class="layui-btn layui-btn-ext1" id="resetBtn">重置</button>
                    <button hidden type="button" id="search"></button>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-row">
        <div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
            <div class="layui-fluid">
                <div class="layui-col-xs12 kq-table-box1 ">
                    <table class="layui-hide" id="tableId" lay-filter="tableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
<!-- 表格的头部工具栏 -->
<script type="text/html" id="tbTollsBar">
    <div class="layui-col-xs12">
        <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>积分列表</p>
        <div class="crudbox fr">
            <@actionCheck2></@actionCheck2>

            <#--						<button type="button" class="layui-btn layui-btn-normal" id="file-add" onclick="add()">添加</button>-->
            <#--			<button type="button" class="layui-btn layui-btn-normal" id="file-edit" onclick="edit()">编辑</button>-->
            <#--			<button type="button" class="layui-btn layui-btn-ext4 jyj-mb-del" onclick="del()">删除</button>-->

        </div>
    </div>
</script>

<script>
    var selectItem = null;
    // 弹窗宽高
    var dmWidth = '60%', dmHeight = '60%';
    var vWidth = '80%', vHeight = '95%';
    var totalCount = 0;
    var currPage = 1;
    var pageSize = 10;
    var title = '积分';

    var year;

    $(function () {
        calcLayBdH();

        var date=new Date;
        year=date.getFullYear();

        // 所属区域
        AnoleApi.initGridZtreeComboBox("regionName", null, function (gridId, items) {
            $("#regionCode").val(items[0].orgCode);
        }, {
            ShowOptions: {GridShowToLevel: 5}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        });

		// 数据字典 - 发布状态。
        LayuiComp.SingleSelect('platform', {
            selectValue: '', // 默认值
            pCode: '${platformDictCode}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        layui.use(['form', 'table', 'layer', 'element','laydate'], function () {
            var form = layui.form,
                table = layui.table,
                element = layui.element,
                layer = layui.layer,
                laydate = layui.laydate

            //年选择器
            laydate.render({
                elem: '#statDate'
                ,type: 'year'
                ,value: year,
                theme:'rq1',
                btns:['clear', 'confirm'],
            });

            // 渲染表格
            table.render({
                elem: '#tableId'
                ,
                url: '${rc.getContextPath()}/dcl/integral/listData.json'
                ,
                height: tbH
                ,
                toolbar: '#tbTollsBar' //开启头部工具栏，并为其绑定左侧模板
                ,
                defaultToolbar: []
                ,
                request: {
                    pageName: 'currentPage' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }
                , where: {
                    regionCode: $('#regionCode').val(),
                    type: '1',
                    statDate: $('#statDate').val(),
                    tableType: 'ZONE_USER_INTEGRAL',
                    moduleClass: 'ZONE_USER_INTEGRAL',
                    activityNum: '',
                },
                limit: 10
                ,
                cols: [[
                    {type: 'numbers', fixed: 'left'}
                    , {field: 'order', title: '排名', align: 'center',templet:function (data,b,c){
                return data.LAY_INDEX;
            }}
                    , {field: 'nickname', title: '姓名', align: 'center'}
                    , {field: 'addUpScore', title: '累计获得积分', align: 'center'}
                    , {field: 'scoreTotal', title: '剩余积分', align: 'center'}
                    , {
                        field: '',
                        title: '操作',
                        align: 'center',
                        event: 'viewDetails',
                        style: 'color:#3d80f4; cursor:pointer;',
                        templet:function (data){
                            return "详情";
                        }
                    }
                ]]
                ,
                page: true
                , text: {none: listNoDataHtml}
                , id: 'tableId',
                done: function () {
                    element.render();
                }
            });

            //监听搜索
            $('#search').on('click', function () {
                selectItem = null;
                // 渲染表格
                table.reload('tableId', {
                    where: {
                        regionCode: $('#regionCode').val(),
                        type: '1',
                        statDate: $('#statDate').val(),
                        tableType: 'ZONE_USER_INTEGRAL',
                        moduleClass: 'ZONE_USER_INTEGRAL',
                        activityNum: '',
                    },
                    page: {
                        curr: currPage
                    }
                });
            })
            // // 监听行单击事件
            // table.on('row(tableId)', function (obj) {
            //     $(obj.tr).toggleClass('md-table-click').siblings('tr').removeClass('md-table-click');
            //
            //     if ($($(obj.tr)[0]).hasClass('md-table-click')) {
            //         selectItem = obj.data;
            //     } else {
            //         selectItem = null;
            //     }
            // });

            // 表格列表事件
            table.on('tool(tableId)', function (obj) {
                // 详情事件
                if (obj.event === 'viewDetails') {
                    var regionCode = $('#regionCode').val();
                    var index = layer.open({
                        skin: 'layer-ext-sch',
                        title: title + '-详情',
                        align: 'c',
                        type: 2,
                        // shadeClose: true, //点击遮罩关闭
                        area: [vWidth, vHeight],
                        content: '${rc.getContextPath()}/dcl/integral/view.jhtml?userId=' + obj.data.userId + '&statDate=' + obj.data.statDate + '&statType=1&regionCode=' + regionCode
                    });
                }
            });

            // 监听查询按钮
            $("#searchBtn").on('click', function () {
                var statDate = $('#statDate').val()
                if (statDate == null || statDate == undefined || statDate == ''){
                    return layer.msg("年度不能为空",{skin:'layui-layer-hui'});
                }
                searchData();
            });

            // 监听重置按钮
            $("#resetBtn").on('click', function () {
                $("#regionCode").val('${infoOrgCode!''}');
                $("#regionName").val('${infoOrgName!''}');
                $("#statDate").val(year);
                form.render();

                searchData();
            });

            // 屏幕变化table重载
            $(window).on('resize', function () {
                calcLayBdH();
                table.reload('tableId', {
                    height: tbH + 'px'
                });
            });

        });
    });

    // 查询
    function searchData() {
        currPage = 1;
        $("#search").click();
    }
</script>


</html>