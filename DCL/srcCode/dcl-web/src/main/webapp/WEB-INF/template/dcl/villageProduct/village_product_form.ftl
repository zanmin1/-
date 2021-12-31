<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>添加商品</title>

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
    <!-- 富文本 start -->
    <link rel="stylesheet" href="${rc.getContextPath()}/js/kindeditor-4.1.10/themes/default/default.css"/>
    <script type="text/javascript" src="${rc.getContextPath()}/js/kindeditor-4.1.10/kindeditor-all-min.js"
            charset="UTF-8"></script>
</head>
<body>
<div class="bs h100 layui-form padding-ext1 layui-form">
    <div class="layer-title-ext1 clearfix">
        <div class="layer-title-ext1-left clearfix fl">
            <p class="text-lh1 font-size-14 fl font-bold"><#if bo.uuid??>编辑<#else>添加</#if>商品</p>
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
                            <label class="layui-form-label"><i>*</i>商品名称</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="uuid" name="uuid" value="${bo.uuid!''}">
                                <input type="hidden" id="picUrl" name="picUrl" value="${bo.picUrl!''}">
                                <input type="text" class="layui-input" id="goodsName" value="${bo.goodsName!''}"
                                       name="goodsName"
                                       placeholder="请填写商品名称" autocomplete="off"
                                       lay-verify-custom="required: true, validType: 'maxLength[50]'">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>商品类型</label>
                            <div class="layui-input-block">
                                <select id="goodsType" name="goodsType" lay-verify-custom="required: true">
                                    <option value="">请选择商品类型</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>市场价格参考</label>
                            <div class="layui-input-block standard-three-input-ext1 flex flex-ac">
                                <input type="text" placeholder="请填写最低价" class="layui-input flex1"
                                       id="marketPriceLow" value="${bo.marketPriceLow!''}" name="marketPriceLow"
                                       lay-verify-custom="required: true, number: [13, 2], validType:'minValue[0]'">
                                <i class="ml10 mr10 font-size-14 cor-333 sti-ext1-i">-</i>
                                <input type="text" placeholder="请填写最高价格" class="layui-input flex1"
                                       id="marketPriceHigh" value="${bo.marketPriceHigh!''}" name="marketPriceHigh"
                                       lay-verify-custom="required: true, number: [13, 2], validType:'minValue[0]'">
                                <p class="font-size-14 cor-333 ml10 mr10 sti-ext1-p">元/</p>
                                <select id="goodsUnit" name="goodsUnit" lay-verify-custom="required: true">
                                    <option value="">请选择单位</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>产地区域</label>
                            <div class="layui-input-block">
                                <input id="regionCode" name="regionCode" type="hidden" value="${bo.regionCode!''}">
                                <input type="text" placeholder="请选择产地区域" name="regionName" id="regionName" readonly
                                       autocomplete="off" value="${bo.regionName!''}" lay-verify-custom="required: true"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>产地详细地址</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="address" value="${bo.address!''}"
                                       name="address"
                                       placeholder="请填写产地详细地址" autocomplete="off"
                                       lay-verify-custom="required: true, validType: 'maxLength[100]'">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>是否上架</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="curShelfStatus" value="${bo.shelf!''}">
                                <input type="radio" name="shelf" lay-verify="shelf" value="1" title="是"
                                       <#if bo.shelf != '0'>checked=""</#if>>
                                <input type="radio" name="shelf" lay-verify="shelf" value="0" title="否"
                                       <#if bo.shelf == '0'>checked=""</#if>>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>联系人</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="operator" value="${bo.operator!''}"
                                       name="operator"
                                       placeholder="请填写联系人" autocomplete="off"
                                       lay-verify-custom="required: true, validType: 'maxLength[50]'">
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
                            <label class="layui-form-label"><i>*</i>商品购买链接地址</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="goodsUrl" value="${bo.goodsUrl!''}"
                                       name="goodsUrl"
                                       placeholder="请填写商品购买链接地址" autocomplete="off"
                                       lay-verify-custom="required: true, validType: 'maxLength[200]'">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>产品介绍</label>
                            <div class="layui-input-block">
                                <div class="form-rich-ext1">
                                    <textarea type="text" class="hide layui-textarea" id="goodsDesc" name="goodsDesc"
                                              autocomplete="off" placeholder="请填写产品介绍">${bo.goodsDesc!''}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
                            <label class="layui-form-label"><i>*</i>上传图片，可设置主图为商品封面<span>支持格式: jpg. jpeg、 .png等常用照片类型,多可以上传8张图片建议尺寸1146*717, 最低尺寸>960*600</span></label>
                            <div class="parent_div" id="bigupload_2" lay-verify-custom="required: true"></div>
                        </div>
                    </div>
                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item form-upload-video">
                            <label class="layui-form-label">上传视频<span class="cor-999 font-size-12 ml10">支持格式：.avi、.mp4等常用视频类型，最多可以上传 2 份视频</span></label>
                            <div class="layui-input-block">
                                <div class="parent_div layui-form-label" id="bigupload_3"></div>
                            </div>
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
<div style="display: none!important;" id="tempGoodsDesc">${bo.goodsDesc!''}</div>
<script>
    //初始化富文本框
    var KindWidth = $('#goodsDesc').parent().width();
    var goodsDesc = '';

    function initKindEditor() {
        KindEditor.ready(function (K) {
            goodsDesc = K.create('#goodsDesc', {
                width: KindWidth + "px",
                minWidth: KindWidth + "px",
                height: "300px",
                resizeType: 0,
                newlineTag: 'br',
                //设置编辑器为简单模式
                items: [
                    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                    'anchor', 'link', 'unlink', '|', 'about'
                ],
                filterMode: false,//是否开启过滤模式
                uploadJson: "${rc.getContextPath()}/dcl/upLoadFile4x.jhtml"
            });
            //加载完后再显示 不然会有一个多行文本框变成富文本框的过程
            $('#goodsDesc').removeClass("hide");
            goodsDesc.html($('#tempGoodsDesc').html());
        });
    }

    $(function () {
        initKindEditor();
        //图片附件
        var bigupload_2 = $("#bigupload_2").bigfileUpload({
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
            chunkSize: 5,//切片的大小（默认5M）
            fileNumLimit: 8,//最大上传的文件数量（默认9）
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
            isUseLabel: true,//是否开启附件便签功能
            isUseSetText: true,//是否开启附件设置回调功能
            setdefutext: "设为主图",
            useUUIDTable: "yes",
            isDelDbData: false,
            isDelDiscData: false,
            useDomainCache: true,
            setCallback: function (obj) {
                bigupload_2.setText(obj, "主图", "设为主图");
                bigupload_2.moveFileToIndexPos(0, obj);
                //设置主图
                $("#picUrl").val(obj.context.nextElementSibling.children[0].dataset.filepath);
            },
            styleType: "box",//块状样式：box,列表样式：list,自定义样式：self
            styleCallback: function (fileShowObjArr, opt) {
            },
            showTip: true,
            initFileElemsCallback: function (fileShowObjArr, opt) {
            },
            fileQueuedCallback: function (fileShowObj, opt) {
            },
            uploadProgressCallback: function () {
            },
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
            openFileDesc: true
        });

        //视频附件
        var bigupload_3 = $("#bigupload_3").bigfileUpload({
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
            chunkSize: 5,//切片的大小（默认5M）
            fileNumLimit: 2,//最大上传的文件数量（默认9）
            maxSingleFileSize: 500,//单个文件最大值（默认300）,单位M
            fileExt: '.mp4,.avi,.flv',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
            //initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
            attachmentData: {bizId: '${bo.uuid!''}', attachmentType: '${bizVideoType!''}'},
            appcode: "tpr",//文件所属的应用代码（默认值components）
            module: '${bizVideoType!''}',//文件所属的模块代码（默认值bigfile）
            imgDomain: '${imgDomain}',//图片服务器域名
            uiDomain: '${uiDomain}',//公共样式域名
            skyDomain: '${skyDomain}',//网盘挂载IP
            fileDomain: '${fileDomain}',//文件服务域名
            componentsDomain: '${componentsDomain}',//公共组件域名
            isSaveDB: true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
            //isDelDiscData : false,//是否删除磁盘数据，(默认true)
            isUseLabel: false,//是否开启附件便签功能
            isUseSetText: false,//是否开启附件设置回调功能
            styleType: "box",//块状样式：box,列表样式：list,自定义样式：self
            //uploadBtnPostion:"front",//按钮位置
            useUUIDTable: "yes",
            styleCallback: function (fileShowObjArr, opt) {
            },
            showTip: true,
            initFileElemsCallback: function (fileShowObjArr, opt) {
            },
            fileQueuedCallback: function (fileShowObj, opt) {
            },
            uploadProgressCallback: function (file, percentage) {
            },
            uploadSuccessCallback: function () {
                $('.scroll').niceScroll().resize();
            },
            deleteCallback: function () {
                $('.scroll').niceScroll().resize();
            },
            videoSize: ['460px', '318px'],
            fitVideoSize: true,
            openFileDesc: true
        });

        //字典
        LayuiComp.SingleSelect('goodsType', {
            selectValue: '${(bo.goodsType)!''}', //默认值
            pCode: '${DICT_VILLAGE_PRODUCT_TYPE}',//SPR007
            selectedCallback: function (data) {
            },
            context: '${sysDomain}'
        });
        LayuiComp.SingleSelect('goodsUnit', {
            selectValue: '${(bo.goodsUnit)!''}', //默认值
            pCode: '${DICT_VILLAGE_PRODUCT_UNIT}',//SPR007
            selectedCallback: function (data) {
            },
            context: '${sysDomain}'
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

        layui.use(['layedit', 'form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            var form = layui.form;
            // 关闭弹窗
            $('.layui-icon-close').click(function () {
                var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
                parent.layer.close(index);  //再执行关闭
            });

            //刷新表单组件
            form.render();
        })
    });

    //保存
    function save() {
        if (!LayuiComp.valdationCom.verification($('#submitForm'))) {
            return;
        }

        if (parseFloat($('#marketPriceLow').val()) > parseFloat($('#marketPriceHigh').val())) {
            layer.tips('最低价不能高于最高价', $('#marketPriceLow'), {
                tips: [1, '#000'],
                time: 3000
            });
            return;
        }
        if (goodsDesc.count('html') == 0) {
            layer.tips('必填项不能为空', $('.ke-container'), {
                tips: [1, '#000'],
                time: 3000
            });
            return;
        }
        $('#goodsDesc').val(goodsDesc.html());
        var submitLoad = layer.load(1);//打开遮罩
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/villageProductPc/save.json',
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

    function cancel() {
        $('.layui-icon-close').click();
    }
</script>
</body>
</html>