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

    </div>
    <div class="layer-content-ext1 layer-box-bg-ext1">
        <div class="layui-fluid layer-content-height-ext1 scroll">
            <form id="submitForm">
                <input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
                <input type="hidden" id="code" name="code" value="${code!''}">
                <div class="layui-row standard-form-box-ext1">

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>展示类型</label>
                            <div class="layui-input-block">
                                <select id="type" name="type" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15" id="urlContent">
                        <div class="layui-form-item">
                            <label class="layui-form-label">url</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="url" name="url" value="${bo.url!''}"
                                       placeholder="请填写url" autocomplete="off"
                                       lay-verify-custom="validType:'maxLength[1000]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15" id="picContent">
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
        </div>
    </div>
</div>
</body>
<script>

    //保存
    function save() {
        var url = '${rc.getContextPath()}/dcl/indexContent/save.json';
        var flag = LayuiComp.valdationCom.verification($('#submitForm'));
        var saveData = $('#submitForm').serializeArray();
        if (!flag) {
            return;
        }

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
                    commonShowDialog(opts);
                } else {
                    var opts = {
                        msg1: data.tipMsg,
                        icon: 3,
                        btn: []
                    };
                    commonShowDialog(opts);
                }
            },
            error: function (data) {
                var opts = {
                    msg1: "连接超时！",
                    icon: 4,
                    btn: []
                };
                commonShowDialog(opts);
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
        // 数据字典 - 是否启用。
        LayuiComp.SingleSelect('type', {
            selectValue: '${(bo.type)!''}', // 默认值
            pCode: '${disTypeDictCode}', // 字典编码
            selectedCallback: function (data) {
                if(data.value === '01'){
                    $("#urlContent").hide()
                    $("#picContent").show()
                }
                if(data.value === '02'){
                    $("#urlContent").show()
                    $("#picContent").hide()
                }
            },
            context: '${sysDomain}'
        });

        if('${bo.type!''}' == '02'){
            $("#urlContent").show()
            $("#picContent").hide()
        }
        else {
            $("#urlContent").hide()
            $("#picContent").show()
        }

    });


</script>
</html>