<!DOCTYPE html>
<html>
<head>
    <title>新增/编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <#include "/component/commonFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/GridAdminSelector.ftl" />
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
        .inp1 {
            width: 220px;
        }

        .LabName {
            width: 120px;
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
                    <td class="LeftTd">
                        <label class="LabName"><span><font color="red">*</font>所属区域：</span></label>
                        <input type="text" id="regionName" name="regionName" value="${(bo.regionName)!}"
                               class="inp1 easyui-validatebox"
                               data-options="validType:'maxLength[100]', tipPosition:'bottom', required:true"/>
                        <input type="hidden" id="regionCode" name="regionCode" value="${(bo.regionCode)!}"/>
                        <input type="hidden" id="uuid" name="uuid" value="${(bo.uuid)!}"/>
                        <input type="hidden" id="gridId" name="" value="${(gridId)!}"/>
                    </td>
                    <td>
                        <label class="LabName"><span><font color="red">*</font>合同名称：</span></label>
                        <input type="text" id="contractName" name="contractName" value="${(bo.contractName)!}"
                               class="inp1 easyui-validatebox"
                               data-options="validType:['maxLength[100]','characterCheck'], tipPosition:'bottom', required:true"/>
                    </td>
                </tr>
                <tr>
                    <td class="LeftTd" colspan="2">
                        <label class="LabName"><span><font color="red">*</font>合同摘要：</span></label>
                        <textarea id="desc" name="desc" style="height: 80px; width: 635px" rows="3" cols="30"
                                  class="area1 easyui-validatebox"
                                  data-options="validType:['maxLength[2000]','characterCheck'],tipPosition:'bottom', required:true">${bo.desc!''}</textarea>
                    </td>
                </tr>
                <tr>
                    <td class="LeftTd">
                        <label class="LabName"><span>甲方名称：</span></label>
                        <input type="text" id="partyA" name="partyA" value="${(bo.partyA)!}"
                               class="inp1 easyui-validatebox"
                               data-options="validType:['maxLength[100]','characterCheck'], tipPosition:'bottom'"/>
                    </td>
                    <td>
                        <label class="LabName"><span>乙方名称：</span></label>
                        <input type="text" id="partyB" name="partyB" value="${(bo.partyB)!}"
                               class="inp1 easyui-validatebox"
                               data-options="validType:['maxLength[100]','characterCheck'], tipPosition:'bottom'"/>
                    </td>
                </tr>
                <tr>
                    <td class="LeftTd">
                        <label class="LabName"><span>合同金额：</span></label>
                        <input type="text" id="contractAmt" name="contractAmt" value="${(bo.contractAmt)!}"
                               class="inp1 easyui-numberbox"
                               data-options="min:0, max:9999999999999.99, precision:2, tipPosition:'bottom'"
                               style="height: 30px;"/>
                        <font style="margin-left: 5px">元</font>
                    </td>
                    <td>
                        <label class="LabName"><span>合同款项交纳方式：</span></label>
                        <input type="text" id="paymentMethod" name="paymentMethod" value="${(bo.paymentMethod)!}"
                               class="inp1 easyui-validatebox"
                               data-options="validType:['maxLength[500]','characterCheck'], tipPosition:'bottom'"/>
                    </td>
                </tr>
                <tr>
                    <td class="LeftTd">
                        <label class="LabName"><span><font color="red">*</font>开始日期：</span></label>
                        <input type="text" id="startTimeStr" name="startTimeStr" value="${(bo.startTimeStr)!}"
                               class="inp1 Wdate easyui-validatebox" data-options="tipPosition:'bottom', required:true"
                               readonly
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'endTimeStr\')}'});"
                               onchange="calculate()"/>
                    </td>
                    <td>
                        <label class="LabName"><span><font color="red">*</font>结束日期：</span></label>
                        <input type="text" id="endTimeStr" name="endTimeStr" value="${(bo.endTimeStr)!}"
                               class="inp1 Wdate easyui-validatebox" data-options="tipPosition:'bottom', required:true"
                               readonly
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'#F{$dp.$D(\'startTimeStr\')}'});"
                               onchange="calculate()"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="LeftTd">
                        <label class="LabName"><span>期限：</span></label>
                        <input type="text" id="timeLimit" name="timeLimit" value="${(bo.timeLimit)!}"
                               class="inp1 " readonly style="height: 30px;"/>
                           <font style="margin-left: 5px">年</font>
                    </td>
                </tr>
                <tr>
                    <td class="LeftTd" colspan="2">
                        <label class="LabName"><span>备注：</span></label>
                        <input type="text" id="remark" name="remark" value="${(bo.remark)!}"
                               class="area1 easyui-validatebox" style="height: 30px; width: 635px"
                               data-options="validType:['maxLength[500]','characterCheck'],tipPosition:'bottom'"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="LeftTd RightTd necessarily">
                        <label class="LabName lWidth"><span>附件上传：</span></label>
                        <div id="fileUpload" class="ImgUpLoad"></div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="BigTool">
        <div class="BtnList">
            <a href="javascript:;" class="BigNorToolBtn SaveBtn" onClick="save();">保存</a>
            <a href="javascript:;" class="BigNorToolBtn CancelBtn" onClick="cancel();">取消</a>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">

    $(function () {
        //加载网格
        AnoleApi.initGridZtreeComboBox("regionName", null, function (gridId, items) {
            if (items && items.length > 0) {
                $("#regionCode").val(items[0].orgCode);
            }
        }, {
            ShowOptions: {
                GridShowToLevel: 6
            }// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        });
        $("#fileUpload").bigfileUpload({
            skyDomain: skyDomain,
            fileDomain: fileDomain,
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
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

    function calculate() {
        var startTimeStr = $('#startTimeStr').val();
        var endTimeStr = $('#endTimeStr').val();
        if (endTimeStr == '' || startTimeStr == '') {
            return;
        }

        var startTime = new Date(startTimeStr);
        var endTime = new Date(endTimeStr);
        var n = endTime.getFullYear() - startTime.getFullYear();

        // 获取合同开始日期的前一天n年
        var year = startTime.getFullYear() + n;
        var month = startTime.getMonth();
        var day = startTime.getDate() - 1;
        var yesterday = new Date(year, month, day);

        // 剩余天数
        var remainingDay = (endTime.getTime() / 1000 - yesterday.getTime() / 1000) / (60 * 60 * 24);
        // 闰年2月29号前
        if (((year % 4 === 0 && year % 100 !== 0) || (year % 100 === 0 && year % 400 === 0)) && month <= 1 && day < 29) {
            n = parseFloat(n) + parseFloat((remainingDay / 366).toFixed(2));
        } else {
            n = parseFloat(n) + parseFloat((remainingDay / 365).toFixed(2));
        }
        $('#timeLimit').val(n);
    }

    //保存
    function save() {
        var isValid = $('#submitForm').form('validate');
        if (isValid) {
            calculate();
            modleopen(); //打开遮罩层
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/dvContract/save.json',
                data: $('#submitForm').serializeArray(),
                dataType: 'json',
                success: function (data) {
                    if (data.result == 'fail') {
                        $.messager.alert('错误', '保存失败！', 'error');
                    } else {
                        $.messager.alert('提示', '保存成功！', 'info', function () {
                            parent.closeMaxJqueryWindow();
                        });
                        parent.searchData();
                    }
                },
                error: function (data) {
                    $.messager.alert('错误', '连接超时！', 'error');
                },
                complete: function () {
                    modleclose(); //关闭遮罩层
                }
            });
        }
    }

    //取消
    function cancel() {
        parent.closeMaxJqueryWindow();
    }
</script>
</html>
