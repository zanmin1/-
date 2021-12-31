<!DOCTYPE html>
<html>
<head>
    <title>列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <#include "/component/commonFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/maxJqueryEasyUIWin.ftl" />
    <#include "/component/listSet.ftl" />

    <#include "/component/AnoleDate.ftl" />
    <#--    <#include "/component/customJqueryEasyUIWin.ftl" />-->
    <style type="text/css">
        .inp1 {
            width: 100px;
        }

        .detail-a {
            text-decoration: none;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            width: 100%;
            display: block;
        }
    </style>
</head>
<body class="easyui-layout">
<div id="_DivCenter" region="center">
    <table id="list"></table>
</div>
<div id="jqueryToolbar">
    <div class="ConSearch">
        <form id="searchForm">
            <div class="fl">
                <ul>
                    <li>所属区域：</li>
                    <li>
                        <input type="hidden" id="regionCode" name="regionCode" value="${(regionCode)!}"/>
                        <input type="text" id="regionName" name="regionName" value="${(regionName)!}" class="inp1"
                               style="width: 120px"/>
                    </li>

                    <li>合同名称：</li>
                    <li><input class="inp1" type="text" id="contractName" name="contractName"/></li>

                    <li>开始日期：</li>
                    <li>
                        <input id="date1" type="text" class="inp1" style="width: 240px;" value="" readonly/>
                        <input type="hidden" id="timeStart" name="timeStart" value=""/>
                        <input type="hidden" id="timeEnd" name="timeEnd" value=""/>
                    </li>

                    <li>结束日期：</li>
                    <li>
                        <input class="inp1 Wdate" type="text" id="endTimeStr" name="endTimeStr"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly/>
                    </li>
                </ul>
            </div>
            <div class="btns">
                <ul>
                    <li><a href="javascript:;" class="chaxun" title="查询数据" onclick="searchData()">查询</a></li>
                    <li><a href="javascript:;" class="chongzhi" title="重置查询条件" onclick="resetCondition()">重置</a></li>
                </ul>
            </div>
        </form>
    </div>
    <div class="h_10" id="TenLineHeight1"></div>
    <div class="ToolBar">
        <div class="tool fr">
<#--            <a href="javascript:void(0)" class="NorToolBtn DelBtn" onclick="del();">删除</a>-->
<#--            <a href="javascript:void(0)" class="NorToolBtn EditBtn" onclick="edit();">编辑</a>-->
<#--            <a href="javascript:void(0)" class="NorToolBtn AddBtn" onclick="add();">新增</a>-->
            <@actionCheck></@actionCheck>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#date1").anoleDateRender({
            ShowOptions: {
                TabItems: ["常用", "年", "季", "月", "清空"],
                CommUsed: ["本周", "本月", "今天", "确定"]
            },
            BackEvents: {
                OnSelected: function (api, type) {
                    $("#timeStart").val(api.getStartDate());
                    $("#timeEnd").val(api.getEndDate());
                },
                OnCleared: function () {
                    $("#timeStart").val("");
                    $("#timeEnd").val("");
                }
            }
        }).anoleDateApi();
        // 加载网格
        AnoleApi.initGridZtreeComboBox("regionName", null, function (gridId, items) {
            if (items && items.length > 0) {
                $("#regionCode").val(items[0].orgCode);
            }
        }, {
            ShowOptions: {
                GridShowToLevel: 6
            }// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        });
        loadList(); //加载列表

    });

    //加载列表
    function loadList() {
        $('#list').datagrid({
            rownumbers: true, //行号
            fitColumns: true, //自适应宽度
            nowrap: true,
            striped: true,
            singleSelect: true,
            fit: true,
            url: '${rc.getContextPath()}/dcl/dvContract/listData.jhtml',
            queryParams: $('#searchForm').serializeJson(),
            columns: [[
                {field: 'regionName', title: '所属区域', align: 'center', width: 100},
                {
                    field: 'contractName', title: '合同名称', align: 'center', width: 150
                    , formatter: function (value, bo, index) {
                        return '<a href="javascript:void(0);" class="detail-a" title="' + value + '" onclick="detail(\'' + bo.uuid + '\')">' + value + '</a>';
                    }
                },
                {field: 'contractAmt', title: '合同金额（元）', align: 'center', width: 100},
                {field: 'startTimeStr', title: '开始日期', align: 'center', width: 100},
                {field: 'endTimeStr', title: '结束日期', align: 'center', width: 100}
            ]],
            pagination: true,
            pageSize: 20,
            toolbar: '#jqueryToolbar',
            onLoadSuccess: function (data) {
                listSuccess(data); //暂无数据提示
            },
            onLoadError: function () {
                listError();
            }
        });
    }

    //新增
    function add() {
        var url = '${rc.getContextPath()}/dcl/dvContract/form.jhtml';
        showMaxJqueryWindow('新增', url, 800, 450);
    }

    //编辑
    function edit() {
        var rows = $('#list').datagrid('getSelections');
        if (rows.length != 1) {
            $.messager.alert('提示', '请选择一条记录!', 'warning');
        } else {
            var url = '${rc.getContextPath()}/dcl/dvContract/form.jhtml?id=' + rows[0].uuid;
            showMaxJqueryWindow('编辑', url, 800, 450);
        }
    }

    //详情
    function detail(id) {
        var url = "${rc.getContextPath()}/dcl/dvContract/view.jhtml?id=" + id;
        showMaxJqueryWindow('详情', url, 800, 450);
    }

    //删除
    function del() {
        var rows = $('#list').datagrid('getSelections');
        if (rows.length != 1) {
            $.messager.alert('提示', '请选择一条记录!', 'warning');
        } else {
            $.messager.confirm('提示', '您确定删除选中的信息吗?', function (r) {
                if (r) {
                    modleopen(); //打开遮罩层
                    $.ajax({
                        type: 'POST',
                        url: '${rc.getContextPath()}/dcl/dvContract/del.json',
                        data: {
                            uuid: rows[0].uuid
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.result == 'fail') {
                                $.messager.alert('错误', '删除失败！', 'error');
                            } else {
                                $.messager.alert('提示', '删除成功！', 'info');
                                searchData();
                            }
                        },
                        error: function (data) {
                            $.messager.alert('错误', '连接超时！', 'error');
                        },
                        complete: function () {
                            modleclose(); //关闭遮罩层
                        }
                    });
                }
            });
        }
    }

    //查询
    function searchData() {
        $('#list').datagrid('reload', $('#searchForm').serializeJson());
    }

    //重置
    function resetCondition() {
        $('#searchForm').form('clear');
        $("#regionCode").val("${regionCode!''}");
        $("#regionName").val("${regionName!''}");
        searchData();
    }
</script>
</html>
