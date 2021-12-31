<!DOCTYPE html>
<html>
<head>
    <#include "/component/layuiCommonHead.ftl" />
    <!-- 附件上传。 -->
    <#include "/component/uploadFileCommon.ftl" />
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
                            <label class="layui-form-label"><i>*</i>模块选择</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="modularUuId" name="modularUuId"
                                       value="${(bo.modularUuId)!''}"/>
                                <#if bo.uuid == null >
                                    <input type="text" placeholder="请选择模块" id="modularName" name="modularName"
                                           value="${(bo.modularName)!''}"
                                           class="layui-input" lay-verify-custom="required:true" readonly="readonly"/>
                                </#if>
                                <#if bo.uuid != null >
                                    <input type="text" placeholder="请选择模块" id="modularName" name="modularName"
                                           value="${(bo.modularName)!''}"
                                           class="layui-input" lay-verify-custom="required:true" readonly="readonly"
                                           disabled/>
                                </#if>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>模块内容名称</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="name" name="name" value="${bo.name!''}"
                                       placeholder="请填写内容名称" autocomplete="off"
                                       lay-verify-custom="required:true, validType:'maxLength[50]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">副标题</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="subtitleName" name="subtitleName"
                                       value="${bo.subtitleName!''}"
                                       placeholder="请填写副标题" autocomplete="off"
                                       lay-verify-custom="validType:'maxLength[50]'">
                            </div>
                        </div>
                    </div>

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
                                       lay-verify-custom="validType:'maxLength[200]', number: [5, 0]">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">url</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="url" name="url" value="${bo.url!''}"
                                       placeholder="请填写url" autocomplete="off"
                                       lay-verify-custom="validType:'maxLength[200]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
                            <label class="layui-form-label">上传图片</label>
                            <div class="parent_div" id="uploadPhoto"></div>
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
</body>
<script>
    // 弹窗宽高
    var dmWidth = '70%', dmHeight = '80%';

    //保存
    function save() {
        var url = '${rc.getContextPath()}/dcl/modularContent/save.json';
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
                    setInterval("cancel()", 2000);
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

    //附件处理
    function bigUpload(labName, bizType, styleType) {
        var uploadButton$ = $("#" + labName);
        var fileExt = '.pdf,.text,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,.zip';
        if (labName == 'uploadPhoto') {
            fileExt = '.bmp,.jpg,.png,.gif,.jpeg';
        }

        uploadButton$.bigfileUpload({
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
            componentsDomain: '${componentsDomain!''}',//公共组件域名
            useDomainCache: true,
            fileExt: fileExt,//允许上传的附件类型
            appcode: "tpr",//文件所属的应用代码（默认值components）
            module: bizType,//文件所属的模块代码（默认值bigfile）
            attachmentData: {bizId: '${bo.uuid!''}', attachmentType: bizType},
            isDelDbData: false,
            isDelDiscData: false,
            showTip: false,
            useUUIDTable: "yes",
            styleType: styleType,
            maxSingleFileSize: 20,
            uploadSuccessCallback: function (file, response) {
                $('.scroll').niceScroll().resize();
            },
            uploadErrorCallback: function (file, reason) {
                $('.scroll').niceScroll().resize();
            },
            deleteCallback: function (obj) {
                $('.scroll').niceScroll().resize();
            },
            finishEleRander: function () {
                $('.scroll').niceScroll().resize();
            }
        });
    }

    $(function () {
        bigUpload('uploadPhoto', '${bizTypePhoto!''}', 'box')

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            form = layui.form;
            layer = layui.layer;

            // 数据字典 - 是否启用。
            LayuiComp.SingleSelect('isEnable', {
                selectValue: '${(bo.isEnable)!''}', // 默认值
                pCode: '${isEnableDictCode}', // 字典编码
                selectedCallback: function (data) {
                },
                context: '${sysDomain}'
            });

            var tableSelect = layui.tableSelect;



            function initModular() {
                if ("${modularName!''}" == '') {
                    var options = {
                        elem: '#modularName',
                        where: {
                            themeUuId: $('#themeUuId').val()
                        },
                        request: {
                            pageName: 'currentPage' //页码的参数名称，默认：page
                            , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        },
                        searchKey: 'name',
                        searchPlaceholder: '模块名称',
                        done: function (elem, data) {
                            var item = data[0];
                            $('#modularUuId').val(item.uuid);
                            $('#modularName').val(item.name);
                        }
                    }
                } else {
                    var options = {
                        elem: '#modularName',
                        where: {
                            themeUuId: $('#themeUuId').val(),
                            name: '办事分类'
                        },
                        request: {
                            pageName: 'currentPage' //页码的参数名称，默认：page
                            , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        },
                        done: function (elem, data) {
                            var item = data[0];
                            $('#modularUuId').val(item.uuid);
                            $('#modularName').val(item.name);
                        }
                    }

                }
                tableSelect.render($.extend({
                    checkedKey: 'id',
                    table: {
                        width: 1000,
                        url: '${rc.getContextPath()}/dcl/dvModular/listData.json',
                        cols: [[
                            {type: 'numbers', fixed: 'left'}
                            , {field: 'name', title: '模块名称', align: 'center'}
                            , {field: 'typeName', title: '模块类型', align: 'center'}
                            , {field: 'themeName', title: '主题名称', align: 'center'}
                            , {field: 'isEnableName', title: '是否启用', align: 'center'}
                            , {field: 'seq', title: '排序', align: 'center'}
                            , {fixed: 'right', align: 'center', title: '操作', toolbar: '#barDemo', width: 120}
                        ]]
                    },
                }, options));
            }

            tableSelect.render($.extend({
                checkedKey: 'id',
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
            }, {
                elem: '#themeName',
                request: {
                    pageName: 'currentPage' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                },
                where: {
                    regionCode: '${regionCode!''}',
                    remark: '${remark!''}'
                },
                searchKey: 'name',
                searchPlaceholder: '主题名称',

                done: function (elem, data) {
                    var item = data[0];
                    $('#themeUuId').val(item.uuid);
                    $('#themeName').val(item.name);
                    $('#modularUuId').val('');
                    $('#modularName').val('');
                    initModular()
                }
            }));
            $('#modularName').on('click', function () {
                if ($('#themeName').val() == '' || $('#themeName').val() == null) {
                    layer.msg("请先选择主题！", {skin: 'layui-layer-hui'});
                    $('#themeName').focus()
                    $('#themeName').click()
                } else {
                    initModular();
                }
            })

            form.render();
        });
    });

    //取消
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }


    function showModularDetail() {
        var modularUuId = $('#modularUuId').val();
        if (modularUuId.length == 0) {
            $("#modularName").click();
            return;
        }
        var url = '${rc.getContextPath()}/dcl/dvModular/view.jhtml?uuid=' + modularUuId;
        //   打开详情
        var index = layer.open({
            skin: 'layer-ext-sch',
            title: '模块' + '-详情',
            align: 'c',
            type: 2,
            shadeClose: true, //点击遮罩关闭
            area: [dmWidth, dmHeight],
            content: url,
            success: function (layero) {
                calcLayBdH();
                $("#search").click();
            }
        });
    }

</script>
</html>