<!DOCTYPE html>
<html>

<head>
    <title>公厕管理-添加/编辑</title>

    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/uploadFileCommon.ftl" />
</head>

<body class="layui-form-veri layui-ov-hide">

<div class="bs height-100 layui-form ">
    <div class="">
        <div class="layui-row">
            <div class="">
                <#if (type)!='view'>
                    <div class="crudbox fr mt10 pb10  ">
                        <button style="display: none" type="button" id="form-search"></button>

                        <button type="button" class="layui-btn layui-btn-normal" id="file-add" onclick="add()">添加
                        </button>
                        <button type="button" class="layui-btn layui-btn-normal" id="file-edit" onclick="edit()">编辑
                        </button>
                        <button type="button" class="layui-btn layui-btn-ext1" id="file-del" onclick="del()">删除</button>
                    </div>
                </#if >
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs12">
                <div id="toolbarDemo"></div>
                <table class="layui-hide" id="data1" lay-filter="data1"></table>
            </div>
        </div>
    </div>

</div>


</div>

<script>
    var data1H = $(window).height();
    var height = $('.layui-calc-h1').outerHeight(true);
    if(window.screen.height >1366){
        height += 65;
    }else{
        height += 50;
    }
    height = 'full-'+height;

    //是否村级 父页面控制
    var isVillage = false;

    //父code
    var reOrgCode =null;

    //父uuid
    var puuid = '${(uuid)!}';
    //
    var guid = '${(guid)!}';

    //最大编码
    var  maxCode=0;

    //数量
    var wcCount = 0

    function changeVillType(bo) {

        isVillage = bo.res;
        reOrgCode =bo.code;

    }

    function init() {

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer','laypage'], function () {
            var form = layui.form,
                table = layui.table,
                laydate = layui.laydate,
                laytpl = layui.laytpl,
                element = layui.element,
                laypage = layui.laypage,
                layer = layui.layer;


            // 初始化项目选择
            form.render();

            //项目跟资金关联的列表数据获取
            tableResult = table.render({
                elem: '#data1'
                , url: '${rc.getContextPath()}/dcl/resToilet/listDataMember.jhtml'
                , parseData: function (res) {
                    // return{
                    // 	"code": 0,
                    // 	"msg": "",
                    // 	"count": res.total,
                    // 	"data" : res.rows
                    // }
                }
                , where: {
                    uuid: puuid,
                    guid:guid
                }
                , height: height
                , defaultToolbar: ['filter']
                //来源名目  投资金额（万元） 生成日期	已到账资金（万元） 待到账资金（万元） 支付记录数  备注
                , cols: [[
                    {type: 'numbers'}
                    , {type: 'radio', hide: true}
                    , {field: 'wcCode', title: '公厕编号', align: 'center' ,style:'color: #3d80f4;cursor: pointer;',  event: 'nameClick'}
                    , {field: 'gcWcTypeTCN', title: '公厕类型', align: 'center'}
                    , {
                        field: 'isSupportTCN',
                        title: '是否财政支持',
                        align: 'center'
                    }
                    , {field: 'toiletAddrTCN', title: '建设位置', align: 'center'}
                    , {field: 'buildTimeTCN', title: '建造年份', align: 'center'}
                    , {field: 'wcClassTCN', title: '公厕种类', align: 'center'}
                    , {field: 'area', title: '使用面积', align: 'center'}
                    , {field: 'toiletItemNum', title: '蹲位', align: 'center'}
                    , {field: 'disposalExMethonTCN', title: '粪污处理方式', align: 'center'}
                ]]
                , page: true
                , request: {
                    pageName: 'currentPage' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }
                , limit: 5
                , done: function (res, curr, count) { // 修改文件名称字体颜色
                    element.render();

                    parent.$('#wcIdList').empty();

                    var datas =res.data;
                    var html = '';
                    var max = 0;
                    for (let i = 0; i < datas.length; i++) {
                        if (max < datas[i].wcCode){
                            max = datas[i].wcCode;
                        }
                        html += '<input type="hidden" name="wcIds[' + i + ']" value="' + datas[i].uuid + '"/>'
                    }
                    maxCode = max;

                    wcCount =count;

                    if('${type}'!="view"){
                        if (count > 0){
                            parent.setDisabled(true);
                        }else {
                            parent.setDisabled(false);
                        }

                        parent.$('#wcIdList').append(html);
                    }


                }
                , text: {
                    none: '<div class="layui-sup-nd">\n' +
                        '<div class="layui-nd-con">\n' +
                        '<img src="${uiDomain}/web-assets/_zhcs/shenzhen-fp/images/icon-timeline-no-data.png">\n' +
                        '<p>暂无数据</p>\n' +
                        '</div>\n' +
                        '</div>'
                }
            });


            table.on('row(data1)', function (obj) {

                obj.tr.find('input[type="radio"][lay-type]').first().nextAll().not('.layui-form-radioed').click();
                obj.tr.addClass("md-table-click").siblings().removeClass("md-table-click");
            })


            $("#form-search").on("click", function () {

                tableResult.reload({
                    where: {
                        uuid: puuid,
                        guid:guid
                    }
                    , page: {
                        curr: 1
                    }
                })

            })

            //点击查看详情   data1 支付记录详情
            layui.use(['table', 'layer'], function () {

                var layer = layui.layer, table = layui.table;
                table.on('tool(data1)', function (obj) {
                    var data = obj.data;

                    //支付记录数详情页的进入
                    if (obj.event === 'nameClick') {

                        var url =   '${rc.getContextPath()}/dcl/resToilet/viewMember.jhtml?id='+data.uuid

                        var index = parent.layer.open({
                            skin: 'layer-ext-sch',
                            title: "公厕信息",
                            type: 2,
                            btnAlign: 'c',
                            area: ['80%', '80%'],
                            content: url,
                            success: function (layero) {
                                calcLayBdH();
                            }
                        });

                    }
                });
            });

        })
    }

    //弹出新增重要文件
    function add() {

        //即时调用 父code
          parent.getVill();

        if (!isVillage) {
            var opts = {
                msg1: "所属区域请选择至村级!",
                icon: 3,
                btn: []
            };

            parent.commonShowDialog(opts);
            return;
        }

        if (reOrgCode == '' || reOrgCode.length <= 11){
            return $.messager.alert('提示', '请先选择区域且为村级！', 'warning');
        }
        var wcCode = "";
        if (wcCount == 0){
            wcCode = reOrgCode + '01'
        }else {
            wcCode = parseFloat(maxCode) + 1;
        }

        var url =   '${rc.getContextPath()}/dcl/resToilet/resMenberForm.jhtml?guid='+guid+'&puuid='+puuid+'&uuid='+'&reOrgCode=' + reOrgCode+'&wcCode=' + wcCode


        var index = parent.layer.open({
            skin: 'layer-ext-sch',
            title: "添加公厕信息",
            type: 2,
            btnAlign: 'c',
            area: ['75%', '70%'],
            content: url
            , end: function (layero) {
                calcLayBdH();
                $("#form-search").click();
            }
        });

   //     LayuiComp.addWin(indexAdd);

    };

    //编辑
    function edit() {
        var datas = layui.table.checkStatus('data1').data;

        if (datas.length != 1) {
            parent.layer.msg("请选择一条记录", {skin: 'layui-layer-hui'});
            return;
        }

         var url = '${rc.getContextPath()}/dcl/resToilet/resMenberForm.jhtml?guid='+guid+'&puuid='+puuid+'&uuid='+datas[0].uuid+'&reOrgCode=' + datas[0].reOrgCode+'&wcCode=' + datas[0].wcCode;


        var index = parent.layer.open({
            skin: 'layer-ext-sch',
            title: "编辑公厕信息",
            type: 2,
            btnAlign: 'c',
            area: ['75%', '70%'],
            content: url,
            end: function (layero) {
                calcLayBdH();
                $("#form-search").click();
            }
        });
    };

    //删除
    function del() {

        var datas = layui.table.checkStatus('data1').data;
        if (datas.length != 1) {
            parent.layer.msg("请选择一条记录", {skin: 'layui-layer-hui'});
            return;
        }

        var opts = {
            msg1: "确定要删除吗?",
            icon: 1,
            callBack: function (index) {

                var submitLoad = layer.load(1);//打开遮罩
                $.ajax({
                    type: 'POST',
                    url: '${rc.getContextPath()}/dcl/resToilet/delMember.jhtml',
                    data: {
                        uuid: datas[0].uuid
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.success) {

                            var opts = {
                                msg1: "删除成功",
                                icon: 2,
                                btn: []
                            };

                            parent.    commonShowDialog(opts);
                            $("#form-search").click();
                        } else {
                            //	layer.msg("删除失败",{skin:'layui-layer-hui'});

                            var opts = {
                                msg1: "删除失败",
                                icon: 3,
                                btn: []
                            };

                            parent.  commonShowDialog(opts);
                        }
                    },
                    error: function (data) {
                        //layer.msg("连接超时",{skin:'layui-layer-hui'});

                        var opts = {
                            msg1: "连接超时",
                            icon: 4,
                            btn: []
                        };

                        parent.   commonShowDialog(opts);
                    },
                    complete: function () {
                        layer.close(submitLoad);//关闭遮罩
                    }
                });

            },
        };
        parent.    commonShowDialog(opts);

    }




    $(function () {

        init()
        calcLayBdH();
    });
    // 计算弹窗内容框高度
    function calcLayBdH() {

        $('.scroll').niceScroll().resize();


        var winW = $(window).width(),
            winH = $(window).height(),
            lhH = $('.lay-nor-hd').outerHeight(true),
            lbH,
            layCalcAdH = $('.lay-calc-ad').outerHeight(true);
        if (winW <= 1366) {
            lbH = winH - lhH - 10;
        } else {
            lbH = winH - lhH - 15;
        }
        $('.lay-nor-bd').css({ 'height': lbH + 'px' });
    }
    //取消
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }
</script>
</body>
</html>