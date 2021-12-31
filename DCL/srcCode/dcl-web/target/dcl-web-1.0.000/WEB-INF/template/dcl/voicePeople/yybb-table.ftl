<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>语音播报</title>
    <!-- layui样式 -->
    <#include "/component/layuiCommonHeadHttps.ftl" />
    <#include "/component/ComboBoxHttps.ftl" />

</head>
<body>
<div class="bbts-content-ext1">
    <div class="yybb-table-left h100 bg-fff fl bs br8">
        <div class="yybb-tl-top clearfix bs mt20 pl15 pr15">
            <i class="yybb-icon1 fl"></i>
            <p class="font-size-16 cor-333 font-bold line-height-20 fl">请选择推送对象</p>
        </div>
        <ul id="dictList" class="yybb-tl-list scroll pl20 pr20 bs mt20">

            <#if list?? && (list?size > 0) >
                <#list list as item>

                    <li data-value="${item.groupId}" data-id="${item.uuid}"
                        class="peopleType  posi-rela clearfix pl20 pr15 bs ">
                        <i class="fl"></i>
                        <p class="font-size-15 cor-4d fl yybb-tll-text text-line-c1">${item.name!''}</p>
                        <div class="fr yybb-tll-btn clearfix">
                            <a data-name="${item.name!''}" data-id="${item.uuid}" href="javascript:void(0);"
                               class="yybb-list-edit fl"></a>
                            <a data-id="${item.uuid}" href="javascript:void(0);" class="yybb-list-del fl"></a>
                        </div>
                    </li>

                </#list>
            </#if>

        </ul>
        <div class="yybb-tl-btn">
            <button type="button" class="layui-btn yybb-type-add">新增群组</button>
        </div>
    </div>
    <div class="yybb-table-right fr">
        <div class="layui-row">
            <form id="searchForm">
                <div class="layui-col-xs12 lay-nor-hd layui-pbt0 br8 bg-fff">
                    <div class="layui-row layui-form layui-sch-g flex mt15">
                        <div class="flex">
                            <div class="layui-form-item">
                                <label class="layui-form-label">姓名查询</label>
                                <div class="layui-input-block w160">
                                    <input type="text" id="name" name="name" placeholder="输入你要查询的名字"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别选择</label>
                                <div class="layui-input-block w90">
                                    <select id="sex" name="sex"></select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">所属区域</label>
                                <div class="layui-input-block w160">
                                    <input id="orgCode" name="orgCode" type="hidden" value="${orgCode}">
                                    <input type="text" placeholder="请选择所属区域" name="orgName" id="orgName"
                                           autocomplete="off" value="${orgName}" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="ml10 mr10">
                            <button type="button" id="searchBtn" class="layui-btn layui-btn-normal">查询</button>
                            <button type="button" id="resetBtn" class="layui-btn layui-btn-ext1">重置</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
                <div class="layui-fluid">
                    <!-- 表格 -->
                    <div class="layui-col-xs12 kq-table-box1 ">
                        <table class="layui-hide" id="data1" lay-filter="data1"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 群组弹窗 -->
<div class="bs hide group-window h100 pl10 pr10 pb10 pt10">
    <div class="layer-box-bg-ext1 bs h100 posi-rela layui-form">
        <div class="bs pl15 pr15 layer-content-height-ext1 scroll layui-row standard-form-box-ext1">
            <div class="layui-col-xs12 pl15 pr15">
                <div class="layui-form-item mt10">
                    <label class="layui-form-label"><i>*</i>群组名称</label>
                    <div class="layui-input-block">
                        <input type="text" id="groupName" placeholder="请输入群组名称" class="layui-input" maxlength="12">
                    </div>
                </div>
            </div>
        </div>
        <div class="layer-btn-box-ext1">
            <button type="button" onclick="save()" class="layui-btn layui-btn-normal">保存</button>
            <button type="button" onclick="cancel()" class="layui-btn layui-btn-ext1">取消</button>
        </div>
    </div>
</div>


<!-- 表格的头部工具栏 -->
<script type="text/html" id="tbTollsBar">
    <div class="layui-col-xs12">
        <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>人员列表</p>
        <div class="crudbox fr">
            <button type="button" class="layui-btn layui-btn-ext4 xs-fsyx"><i class="fsyy-icon mr10"></i>发送语音</button>
            <button type="button" onclick="add()" class="layui-btn layui-btn-normal xs-add">添加</button>
            <button type="button" onclick="edit()" class="layui-btn layui-btn-normal xs-edit">编辑</button>
            <#--                <button type="button" class="layui-btn layui-btn-ext2 xs-import">导入</button>-->
            <button type="button" onclick="del()" class="layui-btn layui-btn-ext4 xs-del">删除</button>
        </div>
    </div>
</script>
<script>

    var peopleType = null; //全局群组搜索 条件
    var selectUUid = null; //选中项
    var uuidGroup = null; //编辑选择群组
    var  linkMan = '${linkMan}'; //用户 linkman

    $(function () {

        getDict();
        freshButton();

        // 添加群组
        $('.yybb-type-add').click(function () {

            $("#groupName").val(null);

            layer.open({
                skin: 'layer-ext-sch',
                title: '添加群组',
                type: 1,
                area: ['470px', '220px'],
                shadeClose: true, //点击遮罩关闭
                content: $('.group-window'),
                success: function (layero, index) {

                }, end: function (layero, index) {
                    //刷新
                    groupFresh()
                },
            })
        })

        //所属区域
        AnoleApi.initGridZtreeComboBox("orgName", null, function (gridId, items) {
            $("#orgCode").val(items[0].orgCode);
        }, {
            ShowOptions: {GridShowToLevel: 5}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        });

        LayuiComp.SingleSelect('sex', {
            pCode: '${DICT_SEX}',
            selectedCallback: function (data) {
            },
            context: 'https://uam.zgdxxczx.cn/'
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
        // 计算页面高度
        var winW, winH, lhH, lbH, tbH;

        function calcLayBdH() {
            winW = $(window).width(),
                winH = $(window).height(),
                lhH = $('.lay-nor-hd').outerHeight(true),
                lbH;
            if (winW <= 1366) {
                lbH = winH - lhH - 30;
                tbH = lbH;//table高度计算，可调整
            } else {
                lbH = winH - lhH - 45;
                tbH = lbH;
            }
            $('.lay-nor-bd').css({'height': lbH + 'px'});
        }

        calcLayBdH();

        $(window).on('resize', function () {
            calcLayBdH();
        });

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            var form = layui.form,
                table = layui.table,
                laydate = layui.laydate,
                laytpl = layui.laytpl,
                element = layui.element,
                layer = layui.layer;

            // 表格
            tableResult = table.render({
                elem: '#data1'
                , url: '${rc.getContextPath()}/dcl/voicePeople/listData.jhtml'
                , title: ''
                , height: tbH
                , toolbar: '#tbTollsBar' //开启头部工具栏，并为其绑定左侧模板
                , defaultToolbar: ['']
                , page: true
                , request: {
                    pageName: 'page' //页码的参数名称，默认：page
                    , limitName: 'rows' //每页数据量的参数名，默认：limit
                }
                , where: { //初始查询条件
                    peopleType: peopleType,
                    orgCode: '${orgCode}'
                }
                , limit: 15
                , cols: [[
                    {type: 'checkbox'}
                    , {field: 'name', title: '姓名', align: 'center', style: 'color: #3d80f4;', width: "20%"}
                    , {field: 'sexStr', title: '性别', align: 'center', width: "15%"}
                    , {field: 'tel', title: '手机号码', align: 'center', width: "20%"}
                    , {field: 'address', title: '地址', align: 'center', width: "45%",
                        formatter: function (value, rec, index){
                            var ret = '<p title="'+value+'">'+value+'</p>';
                            return ret;
                        }
                }
                ]]
                , done: function () {

                    // 语音播报
                    $('.xs-fsyx').click(function () {

                        //先判断组织是否有权限
                        // if(linkMan==""||linkMan==null){
                        //
                        //     var opts = {
                        //         msg1: "您所在组织未开通语音功能!",
                        //         icon: 3,
                        //         btn: []
                        //     };
                        //
                        //     commonShowDialog(opts);
                        //     return;
                        // }

                        var datas = layui.table.checkStatus('data1').data;

                        if (datas.length < 1) {
                            layer.msg("请至少选择一条记录!", {skin: 'layui-layer-hui'});
                            return;
                        }

                        var people = [];//发送json至 播报页面

                        $.each(datas, function (i, val) {
                            var bo = {};
                            bo.name = val.name;
                            bo.tel = val.tel;
                            bo.uuid = val.uuid;
                            people.push(bo);
                        })

                        var json = JSON.stringify(people);

                        json = encodeURI(json);

                        var dmHeight = '586px';
                        if ($(window).width() < 1366) {
                            dmHeight = '95%';
                        }
                        var url = '${rc.getContextPath()}/dcl/voicePeople/getVoice.jhtml?people=' + json;
                        layer.open({
                            skin: 'layer-ext-sch',
                            title: '语音播报',
                            type: 2,
                            area: ['650px', dmHeight],
                            shadeClose: true, //点击遮罩关闭
                            content: url,
                            success: function (layero, index) {
                            }
                        })
                    })
                    //表单刷新
                    element.render();
                    form.render();
                }
                , parseData: function (res) {
                    return {
                        "code": 0,
                        "msg": "",
                        "count": res.total,
                        "data": res.rows
                    }
                }
                , text: {
                    none: '<div class="layui-sup-nd">\n' +
                        '<div class="layui-nd-con">\n' +
                        '<img src="http://static.zgdxxczx.cn/web-assets/_zhcs/shenzhen-fp/images/icon-timeline-no-data.png">\n' +
                        '<p>暂无数据</p>\n' +
                        '</div>\n' +
                        '</div>'
                }
            });
            // 监听复选框事件
            table.on('checkbox(data1)', function (obj) {
                if (obj.type == 'one') {
                    if (obj.checked) {
                        obj.tr.addClass("md-table-click")
                    } else {
                        obj.tr.removeClass("md-table-click")
                    }
                } else if (obj.type == 'all') {
                    if (obj.checked) {
                        $(obj.tr.prevObject[0]).find('tr').addClass("md-table-click")
                        $(obj.tr.prevObject[1]).find('tr').addClass("md-table-click")
                        $(obj.tr.prevObject[2]).find('tr').addClass("md-table-click")
                    } else {
                        $(obj.tr.prevObject[0]).find('tr').removeClass("md-table-click")
                        $(obj.tr.prevObject[1]).find('tr').removeClass("md-table-click")
                        $(obj.tr.prevObject[2]).find('tr').removeClass("md-table-click")
                    }
                }
            });
            // // 屏幕变化table重载
            // $(window).on('resize', function () {
            //     table.reload('data1', {
            //         height: tbH
            //     });
            // });

            // // 监听复选框事件
            // table.on('checkbox(data1)', function (obj) {
            //     if (obj.type == 'one') {
            //         if (obj.checked) {
            //             obj.tr.addClass("layui-table-click")
            //         } else {
            //             obj.tr.removeClass("layui-table-click")
            //         }
            //     } else if (obj.type == 'all') {
            //         if (obj.checked) {
            //             $(obj.tr.prevObject[0]).find('tr').addClass("layui-table-click")
            //         } else {
            //             $(obj.tr.prevObject[0]).find('tr').removeClass("layui-table-click")
            //         }
            //     }
            // });

            //监听查询按钮
            $("#searchBtn").on('click', function () {
                search(tableResult);
            });

            //监听重置按钮
            $("#resetBtn").on('click', function () {
                $("#searchForm")[0].reset();
                $('#orgCode').val('${orgCode}');
                $('#orgName').val('${orgName}');
                search(tableResult);
            });

        })
    })

    //监听查询按钮
    function search(table) {

        table.reload({
            where: {
                peopleType: peopleType,
                orgCode: $("#orgCode").val(),
                sex: $("#sex").val(),
                name: $("#name").val(),
            }, page: {
                curr: 1
            }
        })

    }


    //刷新群组
    function groupFresh() {

        $("#dictList").empty();

        var submitLoad = layer.load(1);//打开遮罩

        var html = "";

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/voiceGroup/listData.json',
            data: {
                orgCode: $("#orgCode").val(),
            },
            dataType: 'json',
            success: function (data) {

                if (data != null && data.rows.length > 0) {

                    $.each(data.rows, function (i, val) {
                        html += '                        <li  data-value="' + val.groupId + '"  data-id="' + val.uuid + '" class="peopleType  posi-rela clearfix pl20 pr15 bs ">\n' +
                            '                            <i class="fl"></i>\n' +
                            '                            <p class="font-size-15 cor-4d fl yybb-tll-text text-line-c1">' + val.name + '</p>\n' +
                            '                            <div class="fr yybb-tll-btn clearfix">\n' +
                            '                                <a  data-name="' + val.name + '"  data-id="' + val.uuid + '"  href="javascript:void(0);" class="yybb-list-edit fl"></a>\n' +
                            '                                <a  data-id="' + val.uuid + '" href="javascript:void(0);" class="yybb-list-del fl"></a>\n' +
                            '                            </div>' +
                            '                        </li>'

                    })


                    $("#dictList").html(html);

                    getDict();
                    freshButton();
                }
            },
            error: function () {
                commonShowDialog({
                    msg1: "连接超时",
                    icon: 4,
                    btn: []
                });
                commonShowDialog(opts);
            },
            complete: function () {
                layer.close(submitLoad);//关闭遮罩
            }
        });

    }

    //刷新按钮事件
    function freshButton() {

        // 小弹窗两行
        $('.yybb-list-del').on('click', function () {

            var uuid = $(this).data("id");

            var maskHtml = '<div class="clearfix" style="padding:20px;background:#fff;">' +
                '<i class="fl ts-icon"></i>' +
                '<div class="fl ml10" style="width:calc(100% - 40px)">' +
                '<p class="ts-title">是否确认删除该群组？</p>' +
                '<p class="mt5 ts-text">删除该群组，如其下存在的数据也会一并删除</p>' +
                '</div>' +
                '</div>';
            layer.open({
                skin: 'layer-ext-sch',
                title: '确认提示', //不显示标题
                type: 1,
                btn: ['确定', '取消'],
                btn1: function (index, layero) {

                    var submitLoad = layer.load(1);//打开遮罩
                    $.ajax({
                        type: 'POST',
                        url: '${rc.getContextPath()}/dcl/voiceGroup/del.jhtml',
                        data: {
                            uuid: uuid
                        },
                        dataType: 'json',
                        success: function (data) {

                            if (data.result == 'success') {

                                var opts = {
                                    msg1: "删除成功",
                                    icon: 2,
                                    btn: []
                                };
                                commonShowDialog(opts);
                                groupFresh();
                                setTimeout("cancel()", 1500);
                                //刷新  群组刷新 包括 列表刷新 和按钮刷新
                            } else {

                                var opts = {
                                    msg1: "删除失败",
                                    icon: 3,
                                    btn: []
                                };

                                commonShowDialog(opts);
                            }
                        },
                        error: function (data) {

                            var opts = {
                                msg1: "连接超时",
                                icon: 4,
                                btn: []
                            };

                            commonShowDialog(opts);

                        },
                        complete: function () {
                            layer.close(submitLoad);//关闭遮罩
                        }
                    });

                },
                btn2: function (index, layero) {
                    //按钮【取消】的回调
                },
                btnAlign: 'c',
                area: ['400px', 'auto'],
                shadeClose: true, //点击遮罩关闭
                content: maskHtml
            });
        })

        //点击事件
        $(".peopleType").on("click", function () {

            $(".peopleType").removeClass("active");

            peopleType = $(this).data("id");

            $(this).addClass("active");

            $("#searchBtn").click();
        })

        // 编辑群组
        $('.yybb-list-edit').click(function () {

            uuidGroup = $(this).data("id");
            $("#groupName").val($(this).data("name"));

            layer.open({
                skin: 'layer-ext-sch',
                title: '编辑群组',
                type: 1,
                area: ['470px', '220px'],
                shadeClose: true, //点击遮罩关闭
                content: $('.group-window'),
                success: function (layero, index) {


                }, end: function (layero, index) {
                    uuidGroup = null;
                    $("#groupName").val("");
                    //刷新
                    groupFresh()
                },
            })
        })

    }


    //群组保存
    function save() {

        var submitLoad = layer.load(1);//打开遮罩
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/voiceGroup/save.json',
            data: {
                name: $("#groupName").val(),
                uuid: uuidGroup,
                orgCode: $("#orgCode").val(),
            },
            dataType: 'json',
            success: function (data) {
                if (data.result == "success") {
                    commonShowDialog({
                        msg1: "保存成功",
                        icon: 2,
                        btn: []
                    });
                    setTimeout("cancel()", 1500);

                } else {
                    commonShowDialog({
                        msg1: "保存失败",
                        icon: 3,
                        btn: []
                    });
                    layer.close(submitLoad);
                }
            },
            error: function () {
                commonShowDialog({
                    msg1: "连接超时",
                    icon: 4,
                    btn: []
                });
                layer.close(submitLoad);
            },
        });
    }

    //新增
    function add() {
        var url = '${rc.getContextPath()}/dcl/voicePeople/form.jhtml?peopleType=' + peopleType;

        var indexAdd = layer.open({
            skin: 'layer-ext-sch',
            title: '添加人员',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['570px', '474px'],
            content: url,
            success: function (layero) {
                calcLayBdH()

                $("#searchBtn").click();

            }
        });

    };

    //编辑
    function edit() {
        var datas = layui.table.checkStatus('data1').data;
        if (datas.length != 1) {
            layer.msg("请选择一条记录", {skin: 'layui-layer-hui'});
            return;
        }
        var url = '${rc.getContextPath()}/dcl/voicePeople/form.jhtml?id=' + datas[0].uuid;

        var indexAdd = layer.open({
            skin: 'layer-ext-sch',
            title: '添加人员',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['570px', '474px'],
            content: url,
            success: function (layero) {
                calcLayBdH()
                $("#searchBtn").click();

            }
        });
    };

    //删除
    function del() {

        var datas = layui.table.checkStatus('data1').data;
        if (datas.length != 1) {
            layer.msg("请选择一条记录", {skin: 'layui-layer-hui'});
            return;
        }

        var opts = {
            msg1: "确定要删除吗?",
            icon: 1,
            callBack: function (index) {
                var submitLoad = layer.load(1);//打开遮罩
                $.ajax({
                    type: 'POST',
                    url: '${rc.getContextPath()}/dcl/voicePeople/del.jhtml',
                    data: {
                        uuid: datas[0].uuid
                    },
                    dataType: 'json',
                    success: function (data) {


                        if (data.result == 'success') {

                            var opts = {
                                msg1: "删除成功",
                                icon: 2,
                                btn: []
                            };
                            commonShowDialog(opts);
                            //刷新
                            $("#searchBtn").click();
                        } else {

                            var opts = {
                                msg1: "删除失败",
                                icon: 3,
                                btn: []
                            };

                            commonShowDialog(opts);
                        }
                    },
                    error: function (data) {

                        var opts = {
                            msg1: "连接超时",
                            icon: 4,
                            btn: []
                        };

                        commonShowDialog(opts);

                    },
                    complete: function () {
                        layer.close(submitLoad);//关闭遮罩
                    }
                });
            },
        };

        commonShowDialog(opts);

    }

    // 群组默认选中事件
    function getDict() {

        //第一个加上如上class 并查询
        $("#dictList").find("li").eq(0).addClass("active")

        var id = $("#dictList").find("li").eq(0).data("value");

        var uuid = $("#dictList").find("li").eq(0).data("id");

        peopleType = uuid;

        $("#searchBtn").click();

    }
    //全局关闭
    function cancel() {
        layer.closeAll();
    }


</script>
</body>
</html>