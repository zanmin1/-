<!DOCTYPE html>
<html>
<head>
    <title>公厕管理</title>

    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/uploadFileCommon.ftl" />
</head>

<body style="background-color: white" class="layui-form-veri layui-ov-hide">
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<!--  支付记录新增编辑弹窗-->
<div class="layui-row layui-form  detail-add-form  lay-cxkh-con3" >
    <div class="layui-col-xs12 ">
        <div class="layui-row layui-form lay-calc-ad lay-form-col-br">

            <div class="layui-fluid">
                <form id="submitForm">
                    <input type="hidden" name="resToiletEquipId" id="resToiletEquipId" value="${bo.resToiletEquipId}" >
                    <input type="hidden" name="resToiletId" id="resToiletId" value="${bo.resToiletId}" >
                    <input type="hidden" name="guid" id="guid" value="${guid}" >
                    <input type="hidden" name="reOrgCode" id="reOrgCode" value="${reOrgCode}" >
                    <input type="hidden" name="wcCode" id="wcCode" value="${wcCode}" >
                    <input type="hidden" name="uuid" id="uuid" value="${bo.uuid}" >
                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>公厕类型：</label>
                            <div class="layui-input-block">
                                <select id="gcWcType" name="gcWcType" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div> 

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>是否财政支持：</label>
                            <div class="layui-input-block">
                                <select id="isSupport" name="isSupport" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>建设位置：</label>
                            <div class="layui-input-block">
                                <select id="toiletAddr" name="toiletAddr" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>建造年份：</label>
                            <div class="layui-input-block">
                                <select id="buildTime" name="buildTime" lay-verify-custom="required:true"></select>
                          </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>公厕种类：</label>
                            <div class="layui-input-block">
                                <select id="wcClass" name="wcClass" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>使用面积（平方米)：</label>
                            <div class="layui-input-block">
                                <input type="number" class="layui-input" id="area" name="area" value="${bo.area!''}"
                                       placeholder="请填写使用面积（平方米）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[8,2],validType:'minValue[0]'">
                                   </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>蹲位（个）：</label>
                            <div class="layui-input-block">
                                <input type="number" class="layui-input" id="toiletItemNum" name="toiletItemNum" value="${bo.toiletItemNum!''}"
                                       placeholder="请填写蹲位（个）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[3,0],validType:'minValue[0]'">
                              </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>粪污处理方式：</label>
                            <div class="layui-input-block">
                                <select id="disposalExMethon" name="disposalExMethon" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs10 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">上传附件：</label>
                            <div class="layui-input-block">
                                <p class="tishi-zp" style="margin-top: 20px">（最多上传<em>1</em>张）</p>
                                <div class="parent_div" id="bigupload_1"></div>
                            </div>
                        </div>
                    </div>


                </form >
            </div>
        </div>

    </div>
    <div class="sn-btn text-align-c">
        <button type="button" class="layui-btn layui-btn-normal min-width98" onclick="save()">保 存</button>
        <button type="button" class="layui-btn layui-btn-ext1 min-width98 refresh" onclick="cancel()">取 消</button>
    </div>
</div>

</body>

<script>
    $(function () {

        bigUploadPhoto();

        //公厕类型
        LayuiComp.SingleSelect('gcWcType', {
            selectValue: '${(bo.gcWcType)!''}', // 默认值
            pCode: '${GC_WC_TYPE}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        //建造年份
        LayuiComp.SingleSelect('buildTime', {
            selectValue: '${(bo.buildTime)!''}', // 默认值
            pCode: '${BUILD_TIME}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        //财政支持
        LayuiComp.SingleSelect('isSupport', {
            selectValue: '${(bo.isSupport)!''}', // 默认值
            pCode: '${is_not}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        //建设位置
        LayuiComp.SingleSelect('toiletAddr', {
            selectValue: '${(bo.toiletAddr)!''}', // 默认值
            pCode: '${TOILET_ADDR}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        //粪污处理方式
        LayuiComp.SingleSelect('disposalExMethon', {
            selectValue: '${(bo.disposalExMethon)!''}', // 默认值
            pCode: '${DISPOSAL_EX_METHON}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

        //wcClass 公厕种类
        LayuiComp.SingleSelect('wcClass', {
            selectValue: '${(bo.wcClass)!''}', // 默认值
            pCode: '${WC_CLASS}', // 字典编码
            selectedCallback: function (data) {

            },
            context: '${sysDomain}'
        });

    })


    //附件上传公共方法  添加
    function bigUploadPhoto() {
        bigupload = $("#bigupload_1").bigfileUpload({
            useType: 'edit',////附件上传的使用类型，edit,view，（默认edit）;
            showTip:false,
            chunkSize : 5,//切片的大小（默认5M）
            fileNumLimit : 1,//最大上传的文件数量（默认9）
            maxSingleFileSize:100,//单个文件最大值（默认300）,单位M
            fileExt : '.jpg,.png,.bmp,.gif',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
            attachmentData:{bizId:'${(bo.uuid)!""}',attachmentType:'${gcWcPicType}'},
            appcode:"components",//文件所属的应用代码（默认值components）
            module:"undertakesituation",//文件所属的模块代码（默认值bigfile）
            //imgDomain : imgDomain,//图片服务器域名
            //uiDomain : uiDomain,
            useUUIDTable:"yes",
            componentsDomain : componentsDomain,//图片服务器域名
            isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
            isUseLabel: false,//是否开启附件便签功能
            isDelDbData : false,
            isUseSetText: false,//是否开启附件设置回调功能
            showViewBtn:true,
        });
    }

    function  cancel(){
       parent.layer.closeAll();
    }

    //保存
    function save() {
        var resToiletEquipId = "${puuid}";

       $('#resToiletEquipId').val(resToiletEquipId);

        var url = '${rc.getContextPath()}/dcl/resToilet/saveResMember.json';
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
                        msg1: "保存成功!",
                        icon: 2,
                        btn: []
                    };
                    parent.commonShowDialog(opts);
                    setInterval("cancel()", 2000);
                //    parent.searchData();
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


</script>


</html>