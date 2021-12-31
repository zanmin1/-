<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>添加</title>

    <#include "/component/layuiCommonHead.ftl" />
    <#include "/component/sdcomponentsFiles-1.1.ftl" />
    <#include "/component/ComboBox.ftl" />
    <#include "/component/uploadFileCommon.ftl" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/layuiExtend.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css"/>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<#--    <script src="${rc.getContextPath()}/js/tableSelect.js?123"></script>-->
</head>
<body>
<div class="bs h100 layui-form padding-ext1 layui-form">
    <div class="layer-title-ext1 clearfix">
        <div class="layer-title-ext1-left clearfix fl">
            <p class="text-lh1 font-size-14 fl font-bold"><#if bo.uuid??>编辑<#else>添加</#if>人员</p>
        </div>
        <a href="javascript:void(0);" class="layer-close-ext1 fr">
            <i class="layui-icon layui-icon-close"></i>
        </a>
    </div>
    <div class="layer-content-ext1 layer-box-bg-ext1">
        <div class="layui-fluid layer-content-height-ext1 scroll">
            <form id="submitForm">
                <div class="layui-row standard-form-box-ext1">
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>姓名</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
                                <input type="text" class="layui-input" id="name" value="${bo.name!''}"
                                       name="name" placeholder="请填写姓名" autocomplete="off"
                                       lay-verify-custom="required: true, validType: 'maxLength[25]'">
<#--                                <input type="text" class="layui-input" id="name" value="${bo.name!''}"-->
<#--                                       name="name" placeholder="请填写姓名" autocomplete="off"-->
<#--                                       style="width: calc(100% - 41px); float: left;"-->
<#--                                       lay-verify-custom="required: true, validType: 'maxLength[25]'">-->
<#--                                <div class="layui-btn layui-btn-sm layui-btn-primary"-->
<#--                                        style="width: 41px; float: right" id="searchPerson">-->
<#--                                    <i class="layui-icon layui-icon-search"></i>-->
<#--                                </div>-->
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>类型</label>
                            <div class="layui-input-block">
                                <select id="type" name="type" lay-verify-custom="required: true">
                                    <option value="">请选择类型</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>所属区域</label>
                            <div class="layui-input-block">
                                <input id="regionCode" name="regionCode" type="hidden" value="${bo.regionCode!''}">
                                <input type="text" placeholder="请选择所属区域" name="regionName" id="regionName" readonly
                                       autocomplete="off" value="${bo.regionName!''}" lay-verify-custom="required: true"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>性别</label>
                            <div class="layui-input-block">
                                <select id="sex" name="sex" lay-verify-custom="required: true">
                                    <option value="">请选择性别</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>出生年月</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="birthday" value="${bo.birthday!''}" name="birthday"
                                       placeholder="请填写出生年月" readonly lay-verify-custom="required: true">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>联系方式</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="tel" value="${bo.tel!''}" name="tel"
                                       placeholder="请填写联系方式" autocomplete="off"
                                       lay-verify-custom="required: true, mobileOrPhone: true">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>职务</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="job" value="${bo.job!''}" name="job"
                                       placeholder="请填写职务" autocomplete="off"
                                       lay-verify-custom="required: true, validType: 'maxLength[100]'">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">排序</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="seq" value="${bo.seq!''}"
                                       name="seq"
                                       placeholder="请填写排序" autocomplete="off"
                                       lay-verify-custom="number: [3, 0], validType:'minValue[0]'">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>人员介绍</label>
                            <div class="layui-input-block">
                                <textarea id="introduction" name="introduction"
                                          class="layui-textarea lt-min-height"
                                          lay-verify-custom="required: true, validType: 'maxLength[500]'"
                                          style="min-height: 120px" >${(bo.introduction)!}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
                            <label class="layui-form-label"><i>*</i>上传图片<span>支持格式: jpg. jpeg、 .png等常用照片类型,建议尺寸1146*717, 最低尺寸>960*600</span></label>
                            <div class="parent_div" id="bigupload_2" lay-verify-custom="required: true"></div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="layer-btn-box-ext1">
            <button type="button" onclick="save()" class="layui-btn layui-btn-normal">保存</button>
            <button type="button" onclick="cancel()" class="layui-btn layui-btn-ext1">取消</button>
        </div>
    </div>
</div>
<script>

    $(function () {

        // 数据字典 - 村小组类型。
        LayuiComp.SingleSelect('type', {
            selectValue: '${(bo.type)!''}', // 默认值
            pCode: '${villageGroupDictCode}', // 字典编码
            selectedCallback: function (data) {},
            context: '${sysDomain}'
        });

        // 数据字典 - 性别。
        LayuiComp.SingleSelect('sex', {
            selectValue: '${(bo.sex)!''}', // 默认值
            pCode: 'A001074061', // 字典编码
            selectedCallback: function (data) {},
            context: '${sysDomain}'
        });

        //图片附件
        $("#bigupload_2").bigfileUpload({
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
            chunkSize: 5,//切片的大小（默认5M）
            fileNumLimit: 1,//最大上传的文件数量（默认9）
            maxSingleFileSize: 50,//单个文件最大值（默认300）,单位M
            fileExt: '.jpg,.png,.gif,.bmp,.jpeg',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
            attachmentData: {bizId: '${bo.uuid!''}', attachmentType: '${bizType!''}'},
            appcode: "tpr",//文件所属的应用代码（默认值components）
            module: '${bizType!''}',//文件所属的模块代码（默认值bigfile）
            imgDomain: '${imgDomain}',//图片服务器域名
            uiDomain: '${uiDomain}',//公共样式域名
            skyDomain: '${skyDomain}',//网盘挂载IP
            fileDomain: '${fileDomain}',//文件服务域名
            componentsDomain: '${componentsDomain}',//公共组件域名
            isSaveDB: true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
            //isDelDiscData : false,//是否删除磁盘数据，(默认true)
            isUseLabel: false,//是否开启附件便签功能
            isUseSetText: false,//是否开启附件设置回调功能
            useUUIDTable: "yes",
            isDelDbData: false,
            isDelDiscData: false,
            useDomainCache: true,
            styleType: "box",//块状样式：box,列表样式：list,自定义样式：self
            showTip: true,
            uploadSuccessCallback: function () {
                $(".parent_div").attr("lay-verType", "");
                $(".parent_div").attr("lay-verify", "");
                $('.scroll').niceScroll().resize();
            },
            deleteCallback: function () {
                var attNum = bigFile$.getAttachmentNum();
                if (attNum == 0) {
                    $(".parent_div").attr("lay-verType", "tips");
                    $(".parent_div").attr("lay-verify", "required");
                }
                $('.scroll').niceScroll().resize();
            },
            videoSize: ['460px', '318px'],
            fitVideoSize: true,
            openFileDesc: false
        });

        //组织树 地域树
        AnoleApi.initGridZtreeComboBox("regionName", "regionCode", function (regionCode, items) {
            if (items && items.length > 0) {
                $("#regionCode").val(items[0].orgCode);
            }
        });

        // 滚动条美化
        $('.scroll').niceScroll({
            cursorcolor: "#000", //滚动条的颜色
            cursoropacitymax: 0.12, //滚动条的透明度，从0-1
            cursorwidth: "4px", //滚动条的宽度  单位默认px
            cursorborderradius: "2px", //滚动条两头的圆角
            autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
            zindex: 8, //给滚动条设置z-index值
        });
        var birthdayCtr = '';
        layui.use(['layedit', 'form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            var form = layui.form;
            // 关闭弹窗
            $('.layui-icon-close').click(function () {
                var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
                parent.layer.close(index);  //再执行关闭
            });

            laydate = layui.laydate;
            // 租聘开始日期
            window.birthdayCtr = laydate.render({
                elem: '#birthday',
                format: 'yyyy-MM', //date日期
                type: 'month',
                trigger: 'click',
                theme: 'rq1',  //主题  颜色改变
                btns: ['clear', 'confirm'],
            });
            // startDate.config.value='2021-10';$('#birthday').val('2021-10');  todo

            <#--var tableSelect = layui.tableSelect;-->
            <#--tableSelect.render($.extend({-->
            <#--    checkedKey: 'id',-->
            <#--    table: {-->
            <#--        width: 1000,-->
            <#--        toLeft: 0,-->
            <#--        // http://rs.v6.aishequ.org/cirs/getAssemblyListData.jhtml?callback=jQuery1708123965278816885_1640251885986&name=&identityCard=&page=1&rows=10&_=1640251906850-->
            <#--        url: '${rsDomain}/cirs/getAssemblyListData.jhtml?infoOrgCode=${infoOrgCode!''}&callback=?',-->
            <#--        cols: [[-->
            <#--            {type: 'numbers'},-->
            <#--            {field: 'prjectName', align: 'center', title: '项目名称', minWidth: 200},-->
            <#--            {field: 'prjectCode', align: 'center', title: '项目编号'},-->
            <#--            {field: 'buildTypeStr', align: 'center', title: '建设类型'},-->
            <#--            {field: 'infoOrgName', align: 'center', title: '所属区域'},-->
            <#--            {field: 'prjCataName', align: 'center', title: '产业类别'},-->
            <#--            {fixed: 'right', align: 'center', title: '操作', toolbar: '#barDemo'}-->
            <#--        ]]-->
            <#--    },-->
            <#--}, {-->
            <#--    elem: '#searchPerson',-->
            <#--    searchKey: 'name',-->
            <#--    searchPlaceholder: '姓名',-->
            <#--    done: function (elem, data) {-->
            <#--        var item = data[0];-->
            <#--        $('#projectUUId').val(item.uuId);-->
            <#--        $('#incomeAmtFormat').val(number_format(item.income, 2, ".", ","));-->
            <#--        $('#incomeAmt').val(item.income);-->
            <#--        $('#projectName').val(item.prjectName);-->
            <#--        $('#prjDetail').show();-->
            <#--    }-->
            <#--}));-->
            //刷新表单组件
            form.render();
        })
    });

    //保存
    function save() {
        if (LayuiComp.valdationCom.verification($('#submitForm'))) {

            var submitLoad = layer.load(1);//打开遮罩
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/villageGroup/save.json',
                data: $('#submitForm').serializeArray(),
                dataType: 'json',
                success: function (data) {
                    if (data.result == "success") {
                        parent.commonShowDialog({
                            msg1: "保存成功",
                            icon: 2,
                            btn: []
                        });
                        $('.layui-icon-close').click();
                        parent.searchData(parent.layui.table);
                    } else {
                        commonShowDialog({
                            msg1: "保存失败",
                            icon: 3,
                            btn: []
                        });
                        layer.close(submitLoad);
                    }
                },
                error: function () {
                    commonShowDialog({
                        msg1: "连接超时",
                        icon: 4,
                        btn: []
                    });
                    layer.close(submitLoad);
                },
            });
        }
    }

    function cancel() {
        $('.layui-icon-close').click();
    }
</script>
</body>
</html>