<!DOCTYPE html>
<html>
<head>
    <title>公厕-详情</title>
    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/uploadFileCommon.ftl" />
    <style>
        .mark {
            color: #ff4e4e;
            margin-right: 3px;
        }
    </style>
</head>
<body>
<!-- 详情的弹窗 -->
<div class="layui-row layui-form sm-mask height-100 student-details-mask">
    <div class="pl10 pr10 pt10 pb10 bs height-100">
        <div class="sm-content height-100">
            <div class="student-details-content">
                <!-- 详情信息 -->
                <div class="sdc-item sdc-item1" style="padding-top:0px;">

                    <div class="sdc-box pl10 mt15 flex">
                        <div class="flex1">
                            <div class="layui-form check-table">
                                <table class="layui-table layui-table-nohover">

                                    <colgroup>
                                        <col width="20%">
                                        <col width="30%">
                                        <col width="20%">
                                        <col width="30%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td><span class="mark">*</span>公厕编号</td>
                                        <td>${bo.wcCode!''}</td>
                                        <td><span class="mark">*</span>公厕类型</td>
                                        <td>${bo.gcWcTypeTCN!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>是否财政支持</td>
                                        <td>${bo.isSupportTCN!''}</td>
                                        <td><span class="mark">*</span>建设位置</td>
                                        <td>${bo.toiletAddrTCN!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>建造年份</td>
                                        <td>${bo.buildTimeTCN!''}</td>
                                        <td><span class="mark">*</span>公厕种类</td>
                                        <td>${bo.wcClassTCN!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>使用面积（平方米)</td>
                                        <td>${bo.area!''}</td>
                                        <td><span class="mark">*</span>蹲位（个）</td>
                                        <td>${bo.toiletItemNum!''}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="1"><span class="mark">*</span>粪污处理方式</td>
                                        <td colspan="3">${bo.disposalExMethonTCN!''}</td>
                                    </tr>

                                    </tbody>
                                </table>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">附件：</label>
                                    <div class="layui-input-block">
                                        <!--                <p class="tishi-zp" style="margin-top: 20px">（最多上传<em>1</em>张）</p>-->
                                        <div class="parent_div" id="bigupload_1"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="sn-btn text-align-c">
                    <button type="button" class="layui-btn layui-btn-ext1" onclick="cancel()">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    //关闭
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }
    $(function () {
        layui.use(['table', 'layer','element'], function () {
            var table = layui.table,
                layer = layui.layer,
                element = layui.element;
        })

        bigUploadPhoto();
    })


    var componentsDomain = '${componentsDomain}';//公共组件工程域名
    var bigupload;
    function bigUploadPhoto() {
        bigupload = $("#bigupload_1").bigfileUpload({
            useType: 'view',////附件上传的使用类型，edit,view，（默认edit）;
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

</script>
</html>
