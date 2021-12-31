<!DOCTYPE html>
<html>
<head>
    <title>详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <#include "/component/commonFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <!--图片上传-->
    <script src="${uiDomain}/web-assets/extend/bigfileupload/bigfileupload-v2.1.0/js/layui-v2.4.5/layui/layui.js"
            type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/extend/bigfileupload/bigfileupload-v2.1.0/css/layui.css">
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/extend/bigfileupload/bigfileupload-v2.1.0/css/big-file-upload.css">
    <script src="${uiDomain}/web-assets/extend/bigfileupload/bigfileupload-v2.1.0/js/webuploader/webuploader.js"
            type="text/javascript" charset="utf-8"></script>
    <script src="${uiDomain}/web-assets/extend/bigfileupload/bigfileupload-v2.1.0/js/upload-common.js"
            type="text/javascript"></script>
    <script src="${uiDomain}/web-assets/extend/bigfileupload/bigfileupload-v2.1.0/js/big-file-upload.js"
            type="text/javascript" charset="utf-8"></script>
    <style type="text/css">

        .LabName {
            width: 120px;
        }

        td {
            width: 50%;
        }

        .Check_Radio {
            width: calc(100% - 130px);
        }
    </style>
    <script>
        var base = '${rc.getContextPath()}';//项目的上下文，（工程名）
        var imgDomain = '${imgDomain}';//文件服务器域名
        var uiDomain = '${uiDomain}';//公共样式域名
        var skyDomain = '${skyDomain}';//网盘挂载IP【文档在线预览服务器IP：询问赛男团队，获取ip值】
        var componentsDomain = '${components_domain}';//公共组件工程域名
        var fileDomain = '${SQ_FILE_URL}';
    </script>
</head>
<body>
<form id="submitForm">
    <div id="content-d" class="MC_con content light">
        <div name="tab" class="NorForm">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <label class="LabName"><span><font color="red">*</font>所属区域：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.regionName)!}</span>
                    </td>
                    <td>
                        <label class="LabName"><span><font color="red">*</font>合同名称：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.contractName)!}</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="LabName"><span><font color="red">*</font>合同摘要：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.desc)!}</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="LabName"><span>甲方名称：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.partyA)!}</span>
                    </td>
                    <td>
                        <label class="LabName"><span>乙方名称：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.partyB)!}</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="LabName"><span>合同金额：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.contractAmt)!}<#if bo.timeLimit??>元</#if></span>
                    </td>
                    <td>
                        <label class="LabName"><span>合同款项交纳方式：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.paymentMethod)!}</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="LabName"><span><font color="red">*</font>开始日期：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.startTimeStr)!}</span>
                    </td>
                    <td>
                        <label class="LabName"><span><font color="red">*</font>结束日期：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.endTimeStr)!}</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="LabName"><span>期限：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.timeLimit)!}<#if bo.timeLimit??>年</#if></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="LabName"><span>备注：</span></label>
                        <span class="Check_Radio FontDarkBlue">${(bo.remark)!}</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="LeftTd RightTd necessarily">
                        <label class="LabName lWidth"><span>附件：</span></label>
                        <div id="fileUpload" class="ImgUpLoad"></div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="BigTool">
        <div class="BtnList">
            <a href="javascript:void(0);" class="BigNorToolBtn CancelBtn" onclick="cancel();">关闭</a>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
    function cancel() {
        parent.closeMaxJqueryWindow();
    }

    $(function () {
        $("#fileUpload").bigfileUpload({
            skyDomain: skyDomain,
            fileDomain: fileDomain,
            useType: 'view',//附件上传的使用类型，add,edit,view，（默认edit）;
            chunkSize: 5,//切片的大小（默认5M）
            fileNumLimit: 9,//最大上传的文件数量（默认9）
            maxSingleFileSize: 50,//单个文件最大值（默认300）,单位M
            fileExt: '.jpg,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp4,.m4a,.pdf,.txt,.jpeg,.bmp',//支持上传的文件后缀名(默认值请查看参数说明）
            attachmentData: {bizId: '${bo.uuid!''}', attachmentType: '${bizType!''}'},
            imgDomain: imgDomain,//图片服务器域名
            uiDomain: uiDomain,//公共样式域名
            componentsDomain: componentsDomain,//公共组件域名
            isSaveDB: true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
            isDelDbData: true,//是否删除数据库数据(默认true)
            useUUIDTable: "yes",
            setCallback: function (obj) {//点击设置标签的回到事件
            },
            styleType: "box",//块状样式：box,列表样式：list,自定义样式：self
        });
    });
</script>
</html>
