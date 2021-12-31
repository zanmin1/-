<!DOCTYPE html>
<html>

<head>
    <title>公厕管理-添加/编辑</title>

    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/uploadFileCommon.ftl" />
</head>

<body class="ovh bg-f5f5f5 layui-ov-hide layui-form-veri modify-table-tips scroll">
<div class="bs h100 layui-form padding-ext1 layui-form">

    <div class="mask-title-ext1 clearfix">
        <div class="title-ext1 clearfix fl">
            <i></i>
            <p class="cor-333 text-lh1 font-size-14 ml10 fl font-bold">公厕基本信息</p>
        </div>
        <a href="javascript:void(0);" class="mask-close-ext1 mask-close-ext fr">
            <i class="layui-icon layui-icon-close"></i>
        </a>
    </div>

    <div class="layer-content-ext1 layer-box-bg-ext1">
        <div class="layui-fluid layer-content-height-ext1 scroll">
            <form id="submitForm">
                <div id="wcIdList">

                </div>

                <input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
                <input type="hidden" id="guid" name="guid" >

                <p class="font-size-14 font-bold sdc-title pl10 mt25">基本情况</p>
                <div class="layui-row standard-form-box-ext1">
                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>所属区域</label>
                            <div class="layui-input-block">
                                <input id="reOrgCode" name="reOrgCode" type="text" class="hide " value="${bo.reOrgCode!''}" />
                                <input id="orgCode" name="orgCode" type="text" class="hide " value="${bo.orgCode!''}" />
                                <input type="text" style="width: 100%;" placeholder="请选择区域" id="regionName"
                                       name="regionName" value="${bo.regionName!''}" autocomplete="off"
                                       lay-verify-custom="required:true" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>村级配备吸污车数量（辆）</label>
                            <div class="layui-input-block">
                                <input type="number" class="layui-input" id="truckNum" name="truckNum" value="${bo.truckNum!''}"
                                       placeholder="请填写村级配备吸污车数量（辆）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[10,0],validType:'minValue[0]'">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>村级配备吸污泵数量（个）</label>
                            <div class="layui-input-block">
                                <input type="number" class="layui-input" id="pumpNum" name="pumpNum" value="${bo.pumpNum!''}"
                                       placeholder="请填写村级配备吸污泵数量（个）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[10,0],validType:'minValue[0]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>是否有专业维护队伍</label>
                            <div class="layui-input-block">
                                <select id="isProfessTeam" name="isProfessTeam" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>维护队伍人数（人）</label>
                            <div class="layui-input-block">
                                <input type="number" class="layui-input" id="termUserNum" name="termUserNum" value="${bo.termUserNum!''}"
                                       placeholder="请填写维护队伍人数（人）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[10,0],validType:'minValue[0]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>是否有维护经费</label>
                            <div class="layui-input-block">
                                <select id="isFunds" name="isFunds" lay-verify-custom="required:true"></select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>年度维护经费（元）</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="yearFunds" name="yearFunds" value="${bo.yearFunds!''}"
                                       placeholder="请填写年度维护经费（元）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[8,2],validType:'minValue[0]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>已建公厕数量（座）</label>
                            <div class="layui-input-block">
                                <input type="number" class="layui-input" id="toiletNum" name="toiletNum" value="${bo.toiletNum!''}"
                                       placeholder="请填写已建公厕数量（座）" autocomplete="off"
                                       lay-verify-custom="required:true,number:[3,0],validType:'minValue[0]'">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">村级配备其他设施</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="otherFacil" name="otherFacil" value="${bo.otherFacil!''}"
                                       autocomplete="off"
                                       lay-verify-custom=" validType:'maxLength[200]'">
                            </div>
                        </div>
                    </div>

                </div>
                <p class="font-size-14 font-bold sdc-title pl10 mt25">公厕信息</p>

                <div style="height: 380px" class="layui-row standard-form-box-ext1">

            <iframe id="wcFrame" name="wcFrame" src=""  scrolling="false" frameborder='0'  style='width:100%;height:100%;'></iframe>

                </div>

                <p class="font-size-14 font-bold sdc-title pl10 mt25">填表信息</p>
                <div class="layui-row standard-form-box-ext1">

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>填表日期</label>
                            <div class="layui-input-block">
                                <input type="text" placeholder="请选择填表日期"
                                       value="${(bo.fillingDate?string("yyyy-MM-dd"))!}"
                                       readonly
                                       name="fillingDateStr"
                                       id="fillingDateStr"
                                       autocomplete="off" class="layui-input fillingDate"
                                       lay-verify-custom="required:true">
                                <input type="text" style="display: none"   name="fillingDate"  id="fillingDate">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>联系电话</label>
                            <div class="layui-input-block">
                                <input placeholder="请输入实施单位联系电话" type="text"
                                       id="mobilePhone" name="mobilePhone" value="${(bo.mobilePhone)!}"
                                       class="layui-input" autocomplete="off"
                                       lay-verify-custom="required:true, mobileOrPhone: true">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs6 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>填表人</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="fillingUser" name="fillingUser" value="${bo.fillingUser!''}"
                                       placeholder="填表人" autocomplete="off"
                                       lay-verify-custom="required:true,validType:'maxLength[40]'">
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
        var submitLoad = layer.load(1);//打开遮罩
        var url = '${rc.getContextPath()}/dcl/resToilet/save.json';

        var date = $('#fillingDateStr').val();
        if (date != undefined && date != '') {
         //   var fillingDate = new Date(date).format("yyyy-MM-dd");
        //    $('#fillingDate').val(fillingDate);
        }else {
            var opts = {
                msg1: "请选择填表日期!",
                icon: 3,
                btn: []
            };
            commonShowDialog(opts);
            layer.close(submitLoad);
            return ;
        }

        var reOrgCode = $('#orgCode').val();

        if (reOrgCode != undefined && reOrgCode != '') {
            if (reOrgCode.length <= 11){
                var opts = {
                    msg1: "所属区域,请选择到村级!",
                    icon: 3,
                    btn: []
                };
                commonShowDialog(opts);
                layer.close(submitLoad);

                return ;
            }
        }

        var flag = LayuiComp.valdationCom.verification($('#submitForm'));
        var saveData = $('#submitForm').serializeArray();
        if (!flag) {
            layer.close(submitLoad);
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
                        msg1: "保存成功",
                        icon: 2,
                        btn: []
                    };
                    parent.commonShowDialog(opts);
                    setInterval("cancel()",1500);
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

    var grid ;
    //新增时预设uuid
    var guid = null;
    $(function () {

        var submitLoad = layer.load(1);//打开遮罩

        guid = getGuid();

        $("#guid").val(guid);

        grid=     AnoleApi.initGridZtreeComboBox("regionName", "reOrgCode", function(gridId, items){
            if(items!=undefined && items!=null && items.length>0){

                var bo ={};
                var grid = items[0];
                bo.code=grid.orgCode;
                $("#reOrgCode").val(grid.orgCode);
                $("#orgCode").val(grid.orgCode);
                $("#regionName").val(grid.name);

            }
        },{
            ShowOptions : {
                EnableToolbar : true
            }
        });
        //判断新增编辑
        var uuid = "${(bo.uuid)!}"

        if (uuid == null || uuid == '' || uuid == undefined){
            var fillingDate = new Date().format("yyyy-MM-dd");
             $('#fillingDateStr').val(fillingDate);

            $("#fillingUser").val('${name}');
            $("#mobilePhone").val('${phone}');

            grid.setDisabled(false);
            $("#wcFrame").attr("src",  "${rc.getContextPath()}/dcl/resToilet/resMenberList.jhtml?guid="+guid);


        }else {
            grid.setDisabled(true);
            $("#wcFrame").attr("src",  "${rc.getContextPath()}/dcl/resToilet/resMenberList.jhtml?uuid="+uuid);


        }

        layui.use(['layedit','form', 'table', 'laydate', 'laytpl', 'element','layer'], function () {
            var form = layui.form,
                table = layui.table,
                laydate = layui.laydate,
                laytpl = layui.laytpl,
                element = layui.element,
                layer = layui.layer;
            var layedit = layui.layedit;


            //日期范围
            laydate.render({
                elem: '#fillingDateStr',
                format: 'yyyy-MM-dd',
                theme: 'rq1',
                btns:['clear', 'confirm'],
            });

            // 数据字典 - 使用平台
            LayuiComp.SingleSelect('isProfessTeam', {
                selectValue: '${(bo.isProfessTeam)!''}', // 默认值
                pCode: '${is_not}', // 字典编码
                selectedCallback: function (data) {

                    if (data.value == '1'){
                        $('#termUserNum').removeAttr('disabled');
                        $("#termUserNum").attr("lay-verify-custom","required:true");
                        $('#termUserNum').removeAttr('readonly')
                    }else {
                        $("#termUserNum").attr( "lay-verify-custom","required:false");
                        $('#termUserNum').attr('disabled','true');
                        $('#termUserNum').val('');
                    }

                },
                context: '${sysDomain}'
            });


            $(".mask-close-ext").on("click",function () {
                parent.layer.closeAll(); //关闭弹窗
            })

            LayuiComp.SingleSelect('isFunds', {
                selectValue: '${(bo.isFunds)!''}', // 默认值
                pCode: '${is_not}', // 字典编码
                selectedCallback: function (data) {

                    if (data.value == '1'){
                        $('#yearFunds').removeAttr('disabled');
                        $("#yearFunds").attr("lay-verify-custom","required:true");
                        $('#yearFunds').removeAttr('readonly')
                    }else {
                        $("#yearFunds").attr( "lay-verify-custom","required:false");
                        $('#yearFunds').attr('disabled','true');
                        $('#yearFunds').val('');
                    }

                },
                context: '${sysDomain}'
            });

            //刷新表单组件
            form.render();

        })

        $("#wcFrame").load(function(){
           layer.close(submitLoad);
        });

    });
    //取消
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }

    function getGuid() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }


    function setDisabled(bo) {
            grid.setDisabled(bo);
    }

    //获取添加可行性
    function getVill() {
        var bo ={};
        bo.code = $("#reOrgCode").val();

        if (bo.code.length <= 11){
            bo.res =false;
            window.wcFrame.changeVillType(bo)
        }else{
            bo.res =true;
            window.wcFrame.changeVillType(bo)
        }
    }

</script>
</body>
</html>