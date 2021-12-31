<!DOCTYPE html>
<html>
<head>
    <title>主题-详情</title>
    <#include "/component/layuiCommonHead.ftl" />
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
                                        <col width="30%">
                                        <col width="70%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td><span class="mark">*</span>所属区域</td>
                                        <td>${bo.regionName!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>主题名称</td>
                                        <td>${bo.name!''}</td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <p class="font-size-14 font-bold sdc-title pl10 mt25">模块信息</p>
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-form mt15 br8 bg-fff">
                            <div class="layui-fluid">
                                <div class="layui-col-xs12 ">
                                    <table class="layui-hide" id="tableId" lay-filter="tableId"></table>
                                </div>
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

    //关闭
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }
    layui.use(['table', 'layer','element'], function () {
        var table = layui.table,
            layer = layui.layer,
        element = layui.element;

        // 渲染表格
        table.render({
            elem: '#tableId'
            ,
            url: '${rc.getContextPath()}/dcl/dvModular/listData.json'
            ,
            defaultToolbar: []
            ,
            request: {
                pageName: 'currentPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                themeUuId: '${bo.uuid}'
            },
            limit: 10
            ,
            cols: [[
                {type: 'numbers', fixed: 'left'}
                , {
                    field: 'name',
                    title: '模块名称',
                    align: 'center',
                    event: 'viewDetails',
                    style: 'color:#3d80f4; cursor:pointer;'
                }
                , {field: 'typeName', title: '模块类型', align: 'center'}
                , {field: 'isEnableName', title: '是否启用', align: 'center'}
                , {field: 'seq', title: '排序', align: 'center'}
            ]]
            ,
            page: true
            , text: {none: listNoDataHtml}
            , id: 'tableId',
            done: function () {
                element.render();
            }
        });

        // 表格列表事件
        table.on('tool(tableId)', function (obj) {
            // 详情事件
            if (obj.event === 'viewDetails') {
                var index = layer.open({
                    skin: 'layer-ext-sch',
                    title: '模块' + '-详情',
                    align: 'c',
                    type: 2,
                    // shadeClose: true, //点击遮罩关闭
                    area: ['100%', '100%'],
                    content: '${rc.getContextPath()}/dcl/dvModular/view.jhtml?uuid=' + obj.data.uuid+'&inType=1'

                });
            }
        });
    })
</script>
</html>
