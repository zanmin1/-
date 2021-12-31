<!DOCTYPE html>
<html>

<head>
    <title>模块管理-添加/编辑</title>

    <#include "/component/layuiCommonHead.ftl" />
    <!-- 网格树下拉框。 -->
    <#include "/component/ComboBox.ftl" />

    <#--主题选择-->
    <script src="${rc.getContextPath()}/js/tableSelect.js?89"></script>
</head>

<body class="ovh bg-f5f5f5 layui-ov-hide layui-form-veri modify-table-tips scroll">
<div class="bs h100 layui-form padding-ext1 layui-form">
    <div class="layer-title-ext1 clearfix">
        <div class="layer-title-ext1-left clearfix fl">
            <p class="text-lh1 font-size-14 fl font-bold">
                <i class="text-icon"></i>基础信息</p>
        </div>
    </div>
    <div class="layer-content-ext1 layer-box-bg-ext1">
        <div class="layui-fluid layer-content-height-ext1 scroll">
            <form id="submitForm">
                <input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
                <div class="layui-row standard-form-box-ext1">
                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>主题选择</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="themeUuId" name="themeUuId" value="${(bo.themeUuId)!''}"/>
                                <#if bo.uuid == null >
                                    <input type="text" placeholder="请选择主题" id="themeName" name="themeName"
                                           value="${(bo.themeName)!''}"
                                           class="layui-input" lay-verify-custom="required:true" readonly="readonly"/>
                                </#if>
                                <#if bo.uuid != null >
                                    <input type="text" placeholder="请选择主题" id="themeName" name="themeName"
                                           value="${(bo.themeName)!''}"
                                           class="layui-input" lay-verify-custom="required:true" readonly="readonly"
                                           disabled/>
                                </#if>
                            </div>
                        </div>
                    </div>


                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>模块名称</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="name" name="name" value="${bo.name!''}"
                                       placeholder="请填写名称" autocomplete="off"
                                       lay-verify-custom="required:true, validType:'maxLength[50]'">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row standard-form-box-ext1">

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>模块类型</label>
                            <div class="layui-input-block">
                                <select id="type" name="type" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">使用场景</label>
                            <div class="layui-input-block">
                                <select id="useType" name="useType" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="layui-row standard-form-box-ext1">

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>是否启用</label>
                            <div class="layui-input-block">
                                <select id="isEnable" name="isEnable" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>
                <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">排序</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="seq" name="seq" value="${bo.seq!''}"
                                       placeholder="请填写排序" autocomplete="off"
                                       lay-verify-custom="validType:'maxLength[200]' , number: [5, 0]">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="layer-btn-box-ext1">
            <button type="button" onclick="save()" class="layui-btn layui-btn-normal">保存</button>
            <button type="button" class="layui-btn layui-btn-ext1" onclick="cancel()">取消</button>
        </div>
    </div>

</div>
</div>

<script>
    // 弹窗宽高
    var dmWidth = '70%', dmHeight = '80%';
    var form,table,layer,tableSelect
    //保存
    function save() {
        var url = '${rc.getContextPath()}/dcl/dvModular/save.json';
        var flag = LayuiComp.valdationCom.verification($('#submitForm'));
        var saveData = $('#submitForm').serializeArray();

        if (!flag) {
            return;
        }

        var submitLoad = layer.load(1);//打开遮罩

        $.ajax({
            type: 'POST',
            url: url,
            data: saveData,
            dataType: 'json',
            success: function (data) {
                if (data.success) {
                    var opts = {
                        msg1: data.tipMsg,
                        icon: 2,
                        btn: []
                    };
                    parent.commonShowDialog(opts);
                    setInterval("cancel()",2000);
                    parent.searchData();
                } else {
                    var opts = {
                        msg1: data.tipMsg,
                        icon: 3,
                        btn: []
                    };
                    commonShowDialog(opts);
                    layer.close(submitLoad);
                }
            },
            error: function (data) {
                var opts = {
                    msg1: "连接超时！",
                    icon: 4,
                    btn: []
                };
                commonShowDialog(opts);
                layer.close(submitLoad);
            },
        });
    }

    $(function () {

        layui.use(['form', 'layer', 'table','element'],function () {
            form = layui.form,
                table = layui.table,
                layer = layui.layer;

            // 数据字典 - 模块类型。
            LayuiComp.SingleSelect('type', {
                selectValue: '${(bo.type)!''}', // 默认值
                pCode: '${typeDictCode}', // 字典编码
                selectedCallback: function (data) {

                },
                context: '${sysDomain}'
            });
            // 数据字典 - 是否启用。
            LayuiComp.SingleSelect('isEnable', {
                selectValue: '${(bo.isEnable)!''}', // 默认值
                pCode: '${isEnableDictCode}', // 字典编码
                selectedCallback: function (data) {
                },
                context: '${sysDomain}'
            });
            // 数据字典 - 使用场景。
            LayuiComp.SingleSelect('useType', {
                selectValue: '${(bo.useType)!''}', // 默认值
                pCode: '${useTypeDictCode}', // 字典编码
                selectedCallback: function (data) {
                },
                context: '${sysDomain}'
            });


            // 选择主题
            var themeOpts = {
                // checkedKey: 'id',
                table: {
                    width: 1000,
                    url: '${rc.getContextPath()}/dcl/dvTheme/listData.json',
                    cols: [[
                        {type: 'numbers', fixed: 'left'}
                        , {field: 'name', title: '主题名称', align: 'center'}
                        , {field: 'regionName', title: '地区名称', align: 'center'}
                        , {fixed: 'right', align: 'center', title: '操作', toolbar: '#barDemo', width: 120}
                    ]]
                },
            };
            tableSelect = layui.tableSelect

            tableSelect.render($.extend(themeOpts, {
                elem: '#themeName',
                where: {
                    name: $('#name').val()
                },
                request: {
                    pageName: 'currentPage' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                },
                searchKey: 'name',
                searchPlaceholder: '主题名称',
                done: function (elem, data) {
                    layui.each(data, function (index, item) {
                        $('#themeUuId').val(item.uuid);
                        $('#themeName').val(item.name);
                    });
                }
            }));
            ;

            //刷新表单组件
            form.render();
        }

    )
    });

    //取消
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }

</script>
</body>
</html>