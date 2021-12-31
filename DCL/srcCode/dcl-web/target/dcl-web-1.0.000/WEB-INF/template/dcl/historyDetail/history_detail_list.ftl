<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>历史语音推送</title>
    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <!-- 网格树下拉框。 -->
    <#include "/component/ComboBox.ftl" />
	<!-- layui样式 -->
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.css" />
	<!--本部样式-->
	<!--引入 重置默认样式 statics/zhxc -->
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/layuiExtend.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/css/modify-index.css" />
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row">
            <div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
                <div class="layui-row layui-form layui-sch-g flex mt15">
                    <div class="flex">
                        <input type="hidden" id="id" name="id" value="${id}"/>
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名查询</label>
                            <div class="layui-input-block w160">
                                <input type="text" placeholder="输入你要查询的名字" class="layui-input" id="name">
                            </div>
                        </div>
<#--                        <div class="layui-form-item">-->
<#--                            <label class="layui-form-label">所属地区</label>-->
<#--                            <div class="layui-input-block w160">-->
<#--                                <select>-->
<#--                                    <option value="" selected="">请选择归属区域</option>-->
<#--                                    <option value="0">全部</option>-->
<#--                                    <option value="1">后洋村委会1</option>-->
<#--                                    <option value="2">后洋村委会2</option>-->
<#--                                </select>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                        <div class="layui-form-item">-->
<#--                            <label class="layui-form-label">所属区域</label>-->
<#--                            <div class="layui-input-block w160">-->
<#--                                <input type="hidden" id="regionCode" name="regionCode" value="${regionCode}"/>-->
<#--                                <input class="layui-input" type="text" id="regionName" name="regionName"-->
<#--                                       value="${regionName}"/>-->
<#--                            </div>-->
<#--                        </div>-->
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
                    <!-- 表格2 -->
                    <div class="layui-col-xs12 kq-table-box2 ">
                        <table class="layui-hide" id="data2" lay-filter="data2"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- 表格2的头部工具栏 -->
    <script type="text/html" id="tbTollsBar1">
        <div class="layui-col-xs12">
            <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>历史推送记录</p>
<#--            <div class="crudbox fl ml30">-->
<#--                <a type="button" class="layui-btn yybb-btn-ext2 lsyyts-back" href='${rc.getContextPath()}/dcl/secretaryMailboxPc/index.jhtml'>返回</a>-->
<#--            </div>-->
            <div class="crudbox fr">
<#--                <button type="button" class="layui-btn layui-btn-ext4 xs-del" onclick="del()">删除</button>-->
<#--                <button type="button" class="layui-btn layui-btn-ext2 xs-import">导出</button>-->
            </div>
        </div>
    </script>
    <!-- 接收情况 -->
    <script type="text/html" id="reception">
        {{# if(d.reception){ }}
        {{# var rec = JSON.parse(d.reception); }}
        <p class="font-size-14 cor-4d"><em class="cor-ff5151">{{rec[0] }}</em> / <span class="">{{rec[1] }}</span></p>
        {{# } }}
    </script>
    <!-- 推送语音 -->
    <script type="text/html" id="pushVoice">
        <a href="javascript:void(0);" class="push-voice push-voice-play"></a>
        <div class="push-voice-files">
            <div class="audio-files audio-files1 flex flex-ac pl10 pr5 bs">
                <i></i>
                <i class="ml10"></i>
                <p class="flex1 ml20 text-line-c1 font-size-14 cor-666">{{d.pushVoice}}</p>
            </div>
        </div>
    </script>
    <!-- 推送语音 -->
    <script type="text/html" id="tsType">
        {{# if(d.type == 1){ }}
            <i class="lsyyts-icon syyts-icon1"></i>
            <p class="lsyyts-icon-text font-size-14 cor-52c41a">推送成功</p>
        {{# }else if(d.type == 0){ }}
            <i class="lsyyts-icon syyts-icon2"></i>
            <p class="lsyyts-icon-text font-size-14 cor-ff6666">推送失败</p>
        {{# } }}
    </script>
    <script>
        var selectItem = null;


        // // 所属区域
        // AnoleApi.initGridZtreeComboBox("regionName", null, function (gridId, items) {
        //     $("#regionCode").val(items[0].orgCode);
        // }, {
        //     ShowOptions: {GridShowToLevel: 5}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        // });
        // 数据字典 - 发布状态。
        <#--LayuiComp.SingleSelect('platform', {-->
        <#--    selectValue: '', // 默认值-->
        <#--    pCode: '${platformDictCode}', // 字典编码-->
        <#--    selectedCallback: function (data) {-->

        <#--    },-->
        <#--    context: '${sysDomain}'-->
        <#--});-->

        // document.write()
        $(function () {
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
                    lbH = winH - lhH - 20;
                    tbH = lbH;//table高度计算，可调整
                } else {
                    lbH = winH - lhH - 30;
                    tbH = lbH;
                }
                $('.lay-nor-bd').css({ 'height': lbH + 'px' });
            }
            calcLayBdH();

            $(window).on('resize', function () {
                calcLayBdH();
            });

            layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer'], function () {
                 form = layui.form,
                    table = layui.table,
                    laydate = layui.laydate,
                    laytpl = layui.laytpl,
                    element = layui.element,
                    layer = layui.layer;

                // 表格2
			    table.render({
                    elem: '#data2'
                    , url: '${rc.getContextPath()}/dcl/historyDetail/listData.json',
                    parseData: function(res){
                        return{
                            "code": 0,
                            "msg": "",
                            "count": res.count,
                            "data" : res.data
                        }
                    }
                    , title: '表格2'
                    , height: tbH
                    , toolbar: '#tbTollsBar1' //开启头部工具栏，并为其绑定左侧模板
                    , defaultToolbar: ['']
                    ,limit: 10
                    ,where:{
                        id:"${id}"
                    }
                    , cols: [[
                        { type: 'checkbox'}
                        ,{type:'numbers'}
                        // , { field: 'detailId',title:'ID', align:'center',hidden:true,width:60}//id
                        , { field: 'name', title: '姓名',align:'center',width:152}
                        , { field: 'sex', title: '性别',align:'center',width:60,templet:function(rec) {
                            if (rec.sex=='F'){
                                return '女'
                            }else {
                                return '男'
                            }
                }}
                        , { field: 'phone', title: '手机号码',align:'center',width:118}
                        , { field: 'addr', title: '地址',align:'center'}
                        , { field: 'status', title: '推送状态',align:'center',width:140,templet:function(rec) {
                            if (rec.status=='1'){
                                return '<a>推送中</a>'
                            }else if(rec.status=='2'){
                                return '<a>推送成功</a>'
                            }else {
                                return '<a>推送失败</a>'
                            }

                }}
                    ]]
                    , page: true
                    , done: function () {
                        // 返回
                        $('.lsyyts-back').click(function(){
                            $('.kq-table-box1').removeClass('hide').siblings('.kq-table-box2').addClass('hide');
                            // table.reload('data1', {
                            //     height: tbH
                            // });
                            table.reload('data2', {
                                height: tbH
                            });
                        })
                        element.render();
                    }
                });
                // 监听复选框事件
                table.on('checkbox(data2)', function (obj) {
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
                // 屏幕变化table重载
                $(window).on('resize', function () {
                    table.reload('data2', {
                        height: tbH
                    });
                });

                // 监听查询按钮
                $("#searchBtn").on('click', function () {
                    console.log("监听查询按钮")
                    console.log($('#name').val())
                    console.log($('#regionName').val())
                    searchData();
                });


                //监听搜索
                $('#search').on('click', function () {
                    selectItem = null;
                    // 渲染表格
                    table.reload('data2', {
                        where: {
                            name: $('#name').val(),
                            regionName: $('#regionName').val(),
                            id:"${id}",
                        },
                        page: {
                            curr: currPage
                        }
                    });
                })


            })
        })

        // 监听重置按钮
        $("#resetBtn").on('click', function () {
            $("#name").val('');
            $("#regionName").val('');
            // form.render();
            searchData();
        });

        // 查询
        function searchData() {
            console.log("查询")
            currPage = 1;
            $("#search").click();
        }




        //删除
        function del(){

            var datas = table.checkStatus('data2').data;
            console.log(datas)
            if(datas.length < 1){
                layer.msg("请至少选择一条记录",{skin:'layui-layer-hui'});
                return;
            }
            var ids= ""
            for(var i=0;i<datas.length;i++){
                ids+=datas[i].detailId+','
            }
            var opts = {
                msg1 : "确定要删除吗?",
                icon : 1,
                callBack: function(index) {
                    var submitLoad = layer.load(1);//打开遮罩
                    $.ajax({
                        type: 'POST',
                        url: '${rc.getContextPath()}/dcl/historyDetail/del.json',
                        data: {
                            ids : ids.substring(0,ids.length-1)
                        },
                        dataType: 'json',
                        success: function(data) {
                            if (data.result=='success') {
                                var opts = {
                                    msg1 : "删除成功",
                                    icon : 2,
                                    btn : []
                                };
                                commonShowDialog(opts);
                                //刷新
                                $("#searchBtn").click();
                            }else {
                                var opts = {
                                    msg1 : "删除失败",
                                    icon : 3,
                                    btn : []
                                };
                                commonShowDialog(opts);
                            }
                        },
                        error: function(data) {
                            var opts = {
                                msg1 : "连接超时",
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



        // 删除确认回调函数
        function delConfirm() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/historyDetail/del.json',
                data: {
                    detailId: selectItem
                },
                dataType: 'json',
                success: function (data) {
                    if (!data.success) {
                        var opts = {
                            msg1: "删除成功",
                            icon: 3,
                            btn: []
                        };
                        commonShowDialog(opts);
                    }
                    searchData();
                },
                error: function (data) {
                }
            });
        }
    </script>
</body>
</html>