<!DOCTYPE html>
<html>

<head>
    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/commonFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/maxJqueryEasyUIWin.ftl" />
    <#include "/component/listSet.ftl" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>历史语音推送</title>
	<!-- layui样式 -->
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/plugins/layui-v2.5.5/layui/css/layui.css" />
	<!--本部样式-->
	<!--引入 重置默认样式 statics/zhxc -->
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/common/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/layuiExtend.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css" />
	<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_jzfp/fujian-xczx/pages/blue/css/modify-index.css" />
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row">
            <div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
                <div class="layui-row layui-form layui-sch-g flex mt15">
                    <div class="flex">
                        <div class="layui-form-item">
                            <label class="layui-form-label">发送人</label>
                            <div class="layui-input-block w160">
                                <input type="text" placeholder="输入你要查询的名字" id="sendpeople" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">收信人</label>
                            <div class="layui-input-block w160">
                                <input type="text" placeholder="输入你要查询的名字" id="recipient" class="layui-input">
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
<#--                        <div class="layui-form-item">-->
<#--                            <label class="layui-form-label">所属区域</label>-->
<#--                            <div class="layui-input-block w160">-->
<#--                                <input type="hidden" id="regionCode" name="regionCode" value="${infoOrgCode!''}"/>-->
<#--                                <input class="layui-input" type="text" id="regionName" name="regionName"-->
<#--                                       value="${infoOrgName!''}"/>-->
<#--                            </div>-->
<#--                        </div>-->
                    </div>
                    <div class="ml10 mr10" >
                        <button type="button" id="searchBtn"  class="layui-btn layui-btn-normal">查询</button>
                        <button type="button"   id="resetBtn"  class="layui-btn layui-btn-ext1">重置</button>
                        <button  hidden type="button" id="search" ></button>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
                <div class="layui-fluid">
                    <!-- 表格 -->
                    <div class="layui-col-xs12 kq-table-box1 ">
                        <table class="layui-hide" id="tableId" lay-filter="tableId"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${uiDomain!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
    <!-- 表格的头部工具栏 -->
    <script type="text/html" id="tbTollsBar">
        <div class="layui-col-xs12">
            <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>历史推送记录</p>
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
        {{# console.log(rec[0]) }}
        <p class="font-size-14 cor-4d"><em class="cor-ff5151">{{rec[0] }}</em> / <span class="">{{rec[1] }}</span></p>
        {{# } }}
    </script>
    <script>
        var selectItem = null;
        var totalCount = 0;
        var currPage = 1;
        var pageSize = 10;
        var selectUUid =null;
        var vWidth = '80%', vHeight = '95%';

        // 查询
        function searchData() {
            currPage = 1;
            $("#search").click();
        };
        // //搜索
        $('#searchBtn').on('click',function(){

            searchData();

        });
        $('#resetBtn').on('click',function(){

            $('#sendpeople').val("");
            $('#recipient').val("");
            $('#orgCode').val('${infoOrgCode!''}');
            $('#orgName').val('${infoOrgName!''}');
            searchData();

        });
        //删除
        function del(){

            var datas = table.checkStatus('tableId').data;
            console.log("123")
            if(datas.length < 1){
                layer.msg("请至少选择一条记录",{skin:'layui-layer-hui'});
                return;
            }
            var ids= ""
            for(var i=0;i<datas.length;i++){
                ids+=datas[i].pushId+','
            }

            var opts = {
                msg1 : "确定要删除吗?",
                icon : 1,
                callBack: function(index) {
                    var submitLoad = layer.load(1);//打开遮罩
                    $.ajax({
                        type: 'POST',
                        url: '${rc.getContextPath()}/dcl/historyBroadcastpush/del.jhtml',
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
        //搜索
        // $('#searchBtn').on('click',function(){
        //     console.log("点击了查询")
        //     searchData();
        //
        // });
        // 所属区域
        // AnoleApi.initGridZtreeComboBox("regionName", null, function (gridId, items) {
        //     $("#regionCode").val(items[0].orgCode);
        // }, {
        //     ShowOptions: {GridShowToLevel: 5}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        // });

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

                // 表格
			    table.render({
                    elem: '#tableId'
                    ,id:'tableId'

                    , url: '${rc.getContextPath()}/dcl/historyBroadcastpush/listData.json'

                    , height: tbH

                    , toolbar: '#tbTollsBar' //开启头部工具栏，并为其绑定左侧模板

                    , defaultToolbar: []
                    , where: {
                        sendpeople: $('#sendpeople').val(),
                        recipient: $('#recipient').val(),
                    }
                    ,limit: 10
                    , cols: [[
                        { type: 'checkbox'}
                        , { type: 'numbers'}
                        , { field: 'sendtime', title: '发送时间',align:'center',width:160}
                        , { field: 'sendpeople', title: '发送人',align:'center',width:152}
                        , { field: 'recipient', title: '收信人',align:'center'}
                        , { field: 'reciveType', title: '接收情况',align:'center',width:100,templet:function(rec) {
                            return   rec.received+'/'+rec.total

                }}
                        , { field: 'url', title: '音频回播',align:'center',width:'30%',templet:function(rec) {
                            if (rec.url!=null){
                                return '<audio src="'+rec.url+'" controls="controls" controlsList="nodownload" style="height: 2rem"></audio>'
                            }else {
                                return ''
                            }

                }}
                        , { field: 'detailId', title: '详情',align:'center',event: 'viewDetails', style:'color: #0084ff;cursor: pointer;text-decoration: underline;',width:88 ,templet:function(rec) {
                    return '<a >查看详情</a>'
                } }



                    ]]
                    , page: true
                    , done: function (data) {
                        console.log(data)
                        element.render();
                    }
                });
                // 监听复选框事件
                table.on('checkbox(tableId)', function (obj) {
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

                // 表格列表事件
                table.on('tool(tableId)', function (obj) {
                    // 详情事件
                    if (obj.event === 'viewDetails') {
                        var index = layer.open({
                            skin: 'layer-ext-sch',
                            title:  '历史推送记录详情',
                            align: 'c',
                            type: 2,
                            // shadeClose: true, //点击遮罩关闭
                            area: [vWidth, vHeight],
                            content: '${rc.getContextPath()}/dcl/historyDetail/index.jhtml?id=' + obj.data.pushId
                        });
                    }
                });


                //监听搜索
                $('#search').on('click', function () {
                    selectItem = null;
                    // 渲染表格
                    table.reload('tableId', {
                        where: {
                            sendpeople: $('#sendpeople').val(),
                            recipient: $('#recipient').val(),
                        },
                        page: {
                            curr: currPage
                        }
                    });
                });

                // 屏幕变化table重载
                $(window).on('resize', function () {
                    table.reload('tableId', {
                        height: tbH
                    });
                });

            });

        })

        //详情
        function detail(id) {
            var url = "${rc.getContextPath()}/dcl/historyDetail/index.jhtml?id=" + id;
            showMaxJqueryWindow('查看詳情', url, 1000, 500);
        }

    </script>
</body>
</html>