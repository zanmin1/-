<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>村小组</title>
    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/css/modify-index.css"/>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <style>
        .table-pic-ext1 > img {
            min-height: 100%;
        }

        .layui-table-init {
            background-color: rgba(255, 255, 255, 0.5);
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
            <div class="layui-row layui-form layui-sch-g flex mt15">
                <div class="flex">
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属区域</label>
                        <div class="layui-input-block w160">
                            <input id="regionCode" name="regionCode" type="hidden" value="${regionCode}">
                            <input type="text" placeholder="请选择所属区域" name="regionName" id="regionName"
                                   autocomplete="off" value="${regionName}" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block w160">
                            <input type="text" placeholder="姓名" class="layui-input" id="name"
                                   name="name">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <select id="type" name="type"></select>
                        </div>
                    </div>
                </div>
                <div class="ml10 mr10">
                    <button type="button" class="layui-btn layui-btn-normal" id="searchBtn">查询</button>
                    <button type="button" class="layui-btn layui-btn-ext1" id="resetBtn">重置</button>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-row">
        <div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
            <div class="layui-fluid">
                <div class="layui-col-xs12 kq-table-box1 ">
                    <table class="layui-hide" id="data1" lay-filter="data1"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- 表格的头部工具栏 -->
<script type="text/html" id="tbTollsBar">
    <div class="layui-col-xs12">
        <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>数据列表</p>
        <div class="crudbox fr">
            <@actionCheck></@actionCheck>
<#--            <button type="button" class="layui-btn layui-btn-normal" onclick="add()">添加</button>-->
<#--            <button type="button" class="layui-btn layui-btn-normal" onclick="edit()">编辑</button>-->
<#--            <button type="button" class="layui-btn layui-btn-ext4" onclick="del()">删除</button>-->
        </div>
    </div>
</script>
<script>
    var winW, winH, lhH, lbH, tbH, loader;

    function calcLayBdH() {
        winW = $(window).width(),
            winH = $(window).height(),
            lhH = $('.lay-nor-hd').outerHeight(true),
            lbH;
        if (winW <= 1366) {
            lbH = winH - lhH - 20;
            tbH = lbH;//table高度计算，可调整
        } else {
            lbH = winH - lhH - 30;
            tbH = lbH;
        }
        $('.lay-nor-bd').css({'height': lbH + 'px'});
    }

    $(function () {
        calcLayBdH();

        //组织树 地域树
        AnoleApi.initGridZtreeComboBox("regionName", "regionCode", function (regionCode, items) {
            if (items && items.length > 0) {
                $("#regionCode").val(items[0].orgCode);
            }
        });

        // 数据字典 - 发布状态。
        LayuiComp.SingleSelect('type', {
            selectValue: '', // 默认值
            pCode: '${villageGroupDictCode}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            var form = layui.form;
            var table = layui.table;
            var element = layui.element;
            // 图片表格
            table.render({
                elem: '#data1',
                url: '${rc.getContextPath()}/dcl/villageGroup/listData.json',
                // title: '列表形式',
                height: tbH,
                toolbar: '#tbTollsBar', //开启头部工具栏，并为其绑定左侧模板,
                defaultToolbar: [''],
                limit: 10,
                request: {
                    pageName: 'currentPage',
                    limitName: 'pageSize' //每页数据量的参数名，默认：limit
                },
                where: {
                    regionCode: $("#regionCode").val(),
                    name: $('#name').val(),
                    type: $('#type').val()
                },
                cols: [[
                    {type: 'numbers', fixed: 'left'},
                    {
                        field: 'name',
                        title: '姓名',
                        align: 'center',
                        style: 'color: #3d80f4; cursor: pointer;',
                        minWidth: 190,
                        event: 'viewDetails',
                    },
                    {field: 'typeName', title: '类型', align: 'center', minWidth: 190},
                    {field: 'regionName', title: '所属区域', align: 'center', minWidth: 190},
                    {field: 'job', title: '职务', align: 'center', minWidth: 190},
                    {field: 'tel', title: '联系方式', align: 'center', minWidth: 190},
                    {field: 'seq', title: '排序', align: 'center', minWidth: 190},
                ]],
                page: true,
                text: {
                    none: (
                        '<div class="zwsu-ext1 flex flex-ac flex-jc">' +
                        '   <img src="${uiDomain!''}/web-assets/layui-guanlihotai-biaozhun/pages/blue/images/zwsj.png" />' +
                        '</div>'
                    )
                },
                done: function () {
                    element.render();
                }
            });

            table.on('row(data1)', function (obj) {
                $(obj.tr.prevObject[0]).find('tr').removeClass("md-table-click");
                $(obj.tr.prevObject[1]).find('tr').removeClass("md-table-click");
                $(obj.tr.prevObject[2]).find('tr').removeClass("md-table-click");
                obj.tr.addClass("md-table-click");
                selData = obj.data;
            });

            // 监听查询按钮
            $("#searchBtn").on('click', function () {
                searchData(table);
            });

            // 监听重置按钮
            $("#resetBtn").on('click', function () {
                resetSearch();
            });

            // 屏幕变化table重载
            $(window).on('resize', function () {
                calcLayBdH();
                table.reload('data1', {
                    height: tbH
                });
            });

            // 表格列表事件
            table.on('tool(data1)', function (obj) {
                // 详情事件
                if (obj.event === 'viewDetails') {
                    layer.open({
                        skin: 'layer-ext-sch',
                        type: 2,
                        title: false,
                        closeBtn: 0,
                        shadeClose: true, //点击遮罩关闭
                        area: ['100%', '100%'],
                        content: '${rc.getContextPath()}/dcl/villageGroup/view.jhtml?uuid=' + obj.data.uuid,
                        success: function () {
                        }
                    });
                }
            });
            form.render();
        });
    });

    // 重置
    function resetSearch() {
        $("#name").val('');
        $("#regionCode").val('${regionCode!''}');
        $("#regionName").val('${regionName!''}');
        $("#type").val('');
        layui.form.render();
        searchData(layui.table);
    }

    // 查询
    function searchData(table) {
        table.reload('data1', {
            where: {
                name: $("#name").val(),
                regionCode: $("#regionCode").val(),
                type: $("#type").val(),
            }, page: {
                curr: 1
            }
        });
        selData = '';
        $('body').find('tr').removeClass("md-table-click");
    }

    function add() {
        layer.open({
            skin: 'layer-ext-sch',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['100%', '100%'],
            content: '${rc.getContextPath()}/dcl/villageGroup/form.jhtml',
            success: function () {
            }
        });
    }

    //编辑
    function edit() {
        var datas = selData;
        if (datas == '') {
            layer.msg("请选择一条记录", {skin: 'layui-layer-hui'});
            return;
        }
        layer.open({
            skin: 'layer-ext-sch',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['100%', '100%'],
            content: '${rc.getContextPath()}/dcl/villageGroup/form.jhtml?uuid=' + datas.uuid,
            success: function () {
            }
        });
    }

    //删除
    function del() {
        var datas = selData;
        if (datas == '') {
            layer.msg("请选择一条记录", {skin: 'layui-layer-hui'});
            return;
        }
        commonShowDialog({
            msg1: "确定要删除吗?",
            icon: 1,
            callBack: function () {
                var submitLoad = layer.load(1);//打开遮罩
                $.ajax({
                    type: 'POST',
                    url: '${rc.getContextPath()}/dcl/villageGroup/del.json',
                    data: {
                        uuid: datas.uuid
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.result == 'success') {
                            commonShowDialog({
                                msg1: "删除成功",
                                icon: 2,
                                btn: []
                            });
                            searchData(layui.table);
                        } else {
                            commonShowDialog({
                                msg1: "删除失败",
                                icon: 3,
                                btn: []
                            });
                        }
                    },
                    error: function () {
                        commonShowDialog({
                            msg1: "连接超时",
                            icon: 4,
                            btn: []
                        });
                    },
                    complete: function () {
                        layer.close(submitLoad);//关闭遮罩
                    }
                });
            },
        });
    }
</script>
</html>