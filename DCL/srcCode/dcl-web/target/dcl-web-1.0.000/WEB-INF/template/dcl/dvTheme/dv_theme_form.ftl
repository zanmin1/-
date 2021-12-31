<!DOCTYPE html>
<html>

<head>
    <title>主题管理-添加/编辑</title>

    <#include "/component/layuiCommonHead.ftl" />
    <!-- 网格树下拉框。 -->
    <#include "/component/ComboBox.ftl" />
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
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>所属区域</label>
                            <div class="layui-input-block">
                                <input id="regionCode" name="regionCode" type="hidden" value="${bo.regionCode!''}">
                                <input type="text" style="width: 100%;" placeholder="请选择区域" id="regionName"
                                       name="regionName" value="${bo.regionName!''}" autocomplete="off"
                                       lay-verify-custom="required:true" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>使用平台</label>
                            <div class="layui-input-block">
                                <select id="platform" name="platform" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-row standard-form-box-ext1">
                        <div class="layui-col-xs8 pl15 pr15">
                            <div class="layui-form-item">
                                <label class="layui-form-label"><i>*</i>主题名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" id="name" name="name" value="${bo.name!''}"
                                           placeholder="请填写名称" autocomplete="off"
                                           lay-verify-custom="required:true, validType:'maxLength[50]'">
                                </div>
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

<script>
    //保存
    function save() {
        var url = '${rc.getContextPath()}/dcl/dvTheme/save.json';
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
        // 组织树 地域树
        AnoleApi.initGridZtreeComboBox("regionName", "regionCode", function (regionCode, items) {
            if (items && items.length > 0) {
                var regionCode = items[0].orgCode;
                $("#regionCode").val(regionCode);
            }
        });
        // 数据字典 - 使用平台
        LayuiComp.SingleSelect('platform', {
            selectValue: '${(bo.platform)!''}', // 默认值
            pCode: '${platformDictCode}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });
        layui.use(['form', 'layer'], function () {
            var form = layui.form
            //刷新表单组件
            form.render();
        })
    });
    //取消
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }
</script>
</body>
</html>