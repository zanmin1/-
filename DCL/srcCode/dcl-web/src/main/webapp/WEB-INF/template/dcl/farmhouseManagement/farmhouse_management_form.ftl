<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<#include "/component/layuiCommonHead.ftl" />
<#include "/component/sdcomponentsFiles-1.1.ftl" />
<#include "/component/ComboBox.ftl" />
<#include "/component/uploadFileCommon.ftl" />


    <!-- 富文本 start -->
    <link rel="stylesheet" href="${rc.getContextPath()}/js/kindeditor-4.1.10/themes/default/default.css" />
    <script type="text/javascript" src="${rc.getContextPath()}/js/kindeditor-4.1.10/kindeditor-all-min.js" charset="UTF-8"></script>
    <!-- 新地图标注js start -->
<#--	<script type="text/javascript" src="${uiDomain}/js/global.js"></script>-->
<#--	<script type="text/javascript" src="${GIS_URL}/js/gis/map/gisMap.js"></script>-->
    <script type="text/javascript" src="${GIS_URL}/js/gis/base/mapMarker.js"></script>
    <!-- 地图标注点样式 start -->
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/normal.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/easyuiExtend.css" />
    <script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${uiDomain!''}/js/jquery.easyui.patch.js"></script><!--用于修复easyui-1.4中easyui-numberbox失去焦点后不能输入小数点的问题-->
    <script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
    <!-- 新地图标注js end -->
</head>
<body class="scroll">
<div class="bs h100 layui-form padding-ext1 layui-form">
    <div class="layer-title-ext1 clearfix">
        <div class="layer-title-ext1-left clearfix fl">
            <p class="text-lh1 font-size-14 fl font-bold">农家乐信息</p>
        </div>
        <a href="javascript:void(0);" class="layer-close-ext1 fr" >
            <i class="layui-icon layui-icon-close" onclick="cancel()"></i>
        </a>
    </div>
    <div class="layer-content-ext1 layer-box-bg-ext1">
        <div class="layui-fluid layer-content-height-ext1 scroll">
            <form id="submitForm">
                <div class="layui-row standard-form-box-ext1">
                    <input type="hidden" id="uuid" name="uuid" value="${bo.uuid!}">
                    <input type="hidden" id="picUrl" name="picUrl" value="${bo.picUrl!''}">
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>农家乐名称</label>
                            <div class="layui-input-block">
                                <input placeholder="请输入农家乐名称" type="text" id="farmhouseName"
                                       name="farmhouseName" value="${bo.farmhouseName!}" class="layui-input" lay-verify-custom="required:true,validType:'maxLength[200]'">
                            </div>
                        </div>
                    </div>



                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>所属区域</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="orgCode" name="orgCode"
                                       value="${bo.orgCode!}">
                                <input placeholder="请选择项目" type="text" id="orgName"
                                       class="layui-input" name="orgName"   readonly
                                       value="${bo.orgName!}" lay-verify-custom="required:true">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>地址</label>
                            <div class="layui-input-block">
                                <input placeholder="地址" value="${bo.address!}" name="address" class="layui-input" lay-verify-custom="required:true,validType:'maxLength[200]'">
                            <#--
                                                            <textarea name="address" placeholder="请输入地址" class="layui-textarea lt-min-height" lay-verify-custom="required:true,validType:['maxLength[200]']">${(bo.address)!}</textarea>
                            -->
                            </div>
                        </div>
                    </div>




                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">人均消费</label>
                            <div class="layui-input-block">
                                <input type="number" placeholder="请输入人均消费" id="perCapitaConsum" value="${bo.perCapitaConsum!}" name="perCapitaConsum" class="layui-input" lay-verify-custom="number: [6], validType:'minValue[0]'">
                            <#--
                                                        <textarea type="text"  class="layui-textarea" id="perCapitaConsum"  name="perCapitaConsum" autocomplete="off"  placeholder="请填写人均消费" lay-verify-custom="validType:'maxLength[200]'">${(bo.perCapitaConsum)!''}</textarea>
                            -->
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">经营人</label>
                            <div class="layui-input-block">
                                <input placeholder="请输入经营人" id="operator" value="${bo.operator!}" name="operator" class="layui-input" lay-verify-custom="validType:'maxLength[200]'">
                            <#--
                                                            <textarea type="text"  class="layui-textarea" id="operator"  name="operator" autocomplete="off"  placeholder="请填写经营人" lay-verify-custom="validType:'maxLength[200]'">${(bo.operator)!''}</textarea>
                            -->
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系方式</label>
                            <div class="layui-input-block">
                                <input placeholder="请输入联系方式" type="text" id="tel"
                                       name="tel"
                                       value="${bo.tel!}" class="layui-input" autocomplete="off"
                                       lay-verify-custom=" mobileOrPhone: true">
                            </div>
                        </div>
                    </div>


                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i>*</i>发布状态</label>
                            <div class="layui-input-block">
                            <#--<input type="radio" name="issuStatus"  value="01" title="已发布" checked >
                            <input type="radio" name="issuStatus"  value="02" title="未发布">-->

                                <input type="radio" name="issuStatus" lay-verify-custom="required:true"  value="01" title="已发布" <#if bo.issuStatus!='02'>checked</#if>>
                                <input type="radio" name="issuStatus" value="02" title="未发布" <#if bo.issuStatus='02'>checked</#if>>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">地图标注</label>
                            <div class="layui-input-block clearfix">
                                <a href="javascript:void(0);" class="maps-mark  flex flex-ac">
                                <#--<i></i>-->
                                    <p id='a'></p>
                                </a>
                                <input type="hidden" id="farmhouseId" name="farmhouseId" value="${bo.farmhouseId!}">
                                <input type="hidden" id="t_x" name="t_x"  />
                                <input type="hidden" id="t_y" name="t_y"  />
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item">
                            <label class="layui-form-label">服务介绍</label>
                            <div class="layui-input-block">
                                <div class="form-rich-ext1">
                                <#--<textarea type="text"  class="layui-textarea" id="serviceDesc"  name="serviceDesc" autocomplete="off"  placeholder="请填写经营人" lay-verify-custom="validType:'maxLength[500]'">${(bo.serviceDesc)!''}</textarea>-->
                                    <textarea type="text"  class="hide  layui-textarea" id="serviceDesc"  name="serviceDesc" autocomplete="off"  placeholder="请输入经营人" >${(bo.serviceDesc)!''}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item form-upload-pictures form-upload-pictures-ext2">
                            <label class="layui-form-label">标题图,设置主图为农家乐封面,未设置默认第一张为封面<span>支持格式: jpg. jpeg、 .png等常用照片类型,多可以上传8张图片建议尺寸1146*717, 最低尺寸>960*600</span></label>
                            <div class="parent_div" id="bigupload_2"></div>
                        </div>
                    </div>



                    <div class="layui-col-xs12 pl15 pr15">
                        <div class="layui-form-item form-upload-video">
                            <label class="layui-form-label">上传视频<span class="cor-999 font-size-12 ml10">支持格式：.avi、.mp4等常用视频类型，最多可以上传 2 份视频</span></label>
                            <div class="parent_div" id="bigupload_3"></div>
                        </div>
                    </div>
                </div>
            </form >
        </div>
        <div class="layer-btn-box-ext1">
            <button type="button" id="saveBtn" class="layui-btn layui-btn-normal">保存</button>
            <button type="button"  onclick="cancel()"   class="layui-btn layui-btn-ext1">取消</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    var gridId = "${gridId}";
    var markerOperation ='${(markerOperation)!}';
    var module = '${(markerType)!}';


    var mapMarker= new MapMarker({
        el:"a",//div挂载点
        context:'${GIS_URL}',//gis域名
        width:650,//弹框宽度，可以不传，默认480px
        height:500,//弹框高度，可以不传，默认360px
        data:{ //业务数据
            id:"${(bo.uuid)!}",
            name : '农家乐位置',//业务名称，地图定位显示时的标题
            markerType :module,//模块类型
            markerOperation :markerOperation,//地图操作类型 0和1为添加修改标注，2为查看标注
            gridId : gridId,//网格标识，用于打开地图初始的默认位置
            type: "UUID",//用于部分表主键改为uuId的类型，如果不是uuId的类型，选择不传
        },
        done:function (data) {//弹框确认回调，已回填了xyz到页面元素
            //	if(data){
            $("#t_x").val(data.x);
            $("#t_y").val(data.y);
            //	$("#t_z").val(data.z);
            //	}
        }
    });



</script>
<script>
    var bigUploads;
    var fundBigUploads;
    var postDistItemNameId ="";
    var number ="";


    //所属区域
    AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
        $("#orgCode").val(items[0].orgCode);
    },{
        ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
    });







    $(function () {
        initKindEditor();
        //字典加载 一级归属

//图片附件
        var bigupload_2 = $("#bigupload_2").bigfileUpload({
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
            chunkSize : 5,//切片的大小（默认5M）
            fileNumLimit : 8,//最大上传的文件数量（默认9）
            maxSingleFileSize:50,//单个文件最大值（默认300）,单位M
            fileExt : '.jpg,.png,.gif,.bmp,.jpeg',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
            //initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
            attachmentData:{bizId:'${bo.uuid!''}',attachmentType:'${bizType!''}'},
            appcode:"tpr",//文件所属的应用代码（默认值components）
            module:'${bizType!''}',//文件所属的模块代码（默认值bigfile）
            imgDomain : '${imgDomain}',//图片服务器域名
            uiDomain : '${uiDomain}',//公共样式域名
            skyDomain : '${skyDomain}',//网盘挂载IP
            fileDomain : '${fileDomain}',//文件服务域名
            componentsDomain : '${componentsDomain}',//公共组件域名
            isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
            //isDelDiscData : false,//是否删除磁盘数据，(默认true)
            isUseLabel: true,//是否开启附件便签功能
            isUseSetText: true,//是否开启附件设置回调功能
            setdefutext: "设为主图",
            useUUIDTable:"yes",
            isDelDbData:false,
            isDelDiscData:false,
            useDomainCache:true,
            setCallback :function(obj){
                bigupload_2.setText(obj,"主图","设为主图");
                bigupload_2.moveFileToIndexPos(0,obj);
                //设置主图
                $("#picUrl").val(obj.context.nextElementSibling.children[0].dataset.filepath);
                console.log(obj.context.nextElementSibling.children[0].dataset.filepath);
            },
            styleType:"box",//块状样式：box,列表样式：list,自定义样式：self

            styleCallback:function(fileShowObjArr,opt){

            },
            showTip : true,

            initFileElemsCallback : function(fileShowObjArr,opt){

            },
            fileQueuedCallback : function(fileShowObj,opt){

            },
            uploadProgressCallback : function(file,percentage){

            },
            uploadSuccessCallback : function(file,response){

                $('.scroll').niceScroll().resize();
            },
            deleteCallback:function(obj){


                // 如果删除的是主图，则清空主图url。
                var deletePicUrl = obj.filePath;
                if (deletePicUrl === $('#picUrl').val()) {
                    $('#picUrl').val('');
                }

                $('.scroll').niceScroll().resize();
            },
            videoSize : ['460px', '318px'],
            fitVideoSize : true,
            openFileDesc : true
        });

        //视频附件
        var bigupload_3 = $("#bigupload_3").bigfileUpload({
            useType: 'edit',//附件上传的使用类型，add,edit,view，（默认edit）;
            chunkSize : 5,//切片的大小（默认5M）
            fileNumLimit : 2,//最大上传的文件数量（默认9）
            maxSingleFileSize:500,//单个文件最大值（默认300）,单位M
            fileExt : '.mp4,.avi,.flv',//支持上传的文件后缀名(默认开放：.bmp,.pdf,.jpg,.text,.png,.gif,.doc,.xls,.docx,.xlsx,.ppt,.pptx,.mp3,.wav,.MIDI,.m4a,.WMA,.wma,.mp4,)
            //initFileArr : attarr_1,////初始化的附件对象数组(默认为{})
            attachmentData:{bizId:'${bo.uuid!''}',attachmentType:'${bizTypeVideo!''}'},
            appcode:"tpr",//文件所属的应用代码（默认值components）
            module:'${bizTypeVideo!''}',//文件所属的模块代码（默认值bigfile）
            imgDomain : '${imgDomain}',//图片服务器域名
            uiDomain : '${uiDomain}',//公共样式域名
            skyDomain : '${skyDomain}',//网盘挂载IP
            fileDomain : '${fileDomain}',//文件服务域名
            componentsDomain : '${componentsDomain}',//公共组件域名
            isSaveDB : true,//是否需要组件完成附件入库功能，默认接口为sqfile中的cn.ffcs.file.service.FileUploadService接口
            //isDelDiscData : false,//是否删除磁盘数据，(默认true)
            isUseLabel: true,//是否开启附件便签功能
            isUseSetText: true,//是否开启附件设置回调功能
            styleType:"box",//块状样式：box,列表样式：list,自定义样式：self
            //uploadBtnPostion:"front",//按钮位置
            useUUIDTable:"yes",
            styleCallback:function(fileShowObjArr,opt){

            },
            showTip : true,
            //tipText:"文件大小不能超过#maxSize#",
            //parentObj:parent,
            initFileElemsCallback : function(fileShowObjArr,opt){

            },
            fileQueuedCallback : function(fileShowObj,opt){

            },
            uploadProgressCallback : function(file,percentage){

            },
            uploadSuccessCallback : function(file,response){
                // $(".parent_div").attr("lay-verType","");
                // $(".parent_div").attr("lay-verify","");
                // $('.scroll').niceScroll().resize();
                $('.scroll').niceScroll().resize();
            },
            deleteCallback:function(obj){
                // var attNum = bigFile$.getAttachmentNum();
                // if(attNum == 0){
                // 	$(".parent_div").attr("lay-verType","tips");
                // 	$(".parent_div").attr("lay-verify","required");
                // }
                // $('.scroll').niceScroll().resize();
                $('.scroll').niceScroll().resize();
            },
            videoSize : ['460px', '318px'],
            fitVideoSize : true,
            openFileDesc : true
        });



        layui.use(['form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            form = layui.form;
            laydate = layui.laydate;
            layer = layui.layer;

            //发布时间
            laydate.render({
                elem: '#releaseTimeStr',
                format: 'yyyy-MM-dd', //date日期
                trigger: 'click',
                theme: 'rq1',  //主题  颜色改变
                btns: ['clear', 'confirm'],
                value: '${(bo.releaseTimeStr?string("yyyy-MM-dd"))}',
                done: function (value, date) {
                }
            });
            //上传时间
            laydate.render({
                elem: '#issuTimeStr',
                format: 'yyyy-MM-dd', //date日期
                trigger: 'click',
                theme: 'rq1',  //主题  颜色改变
                btns: ['clear', 'confirm'],
                value: '${(bo.issuTimeStr?string("yyyy-MM-dd"))}',
                done: function (value, date) {
                }
            });

            //字典加载 一级归属
            /*LayuiComp.SingleSelect('issuStatus',{
                selectValue:'${(bo.issuStatus)!''}', //默认值
                pCode:'dcl001',
                selectedCallback:function(data){
                },
                context:'${sysDomain}'
            });*/





            //保存按钮

            $("#saveBtn").on("click",function () {



                //富文本
                editor.sync();

                var flag = LayuiComp.valdationCom.verification($('#submitForm'));
                if(!flag){
                    return;
                }
                //富文本必填校验




              var saveData =  $('#submitForm').serializeArray();

               var serviceDesc = $("#serviceDesc").text().length;
                console.log(666,serviceDesc);

                    if(serviceDesc>50000){
                        var myLayerTips = layer.tips('服务介绍内容长度超过限制',$('.form-rich-ext1'),{
                            tips: [1, '#000'],
                            time: 3000
                        })
                        return;
                    }




                KindEditor.ready(function(K) {
                    var serviceDesc = K.trim(removeTAG(editor.text()))
                    saveData.serviceDesc = serviceDesc;
                });

                var index = layer.load(1,{
                    shade:[0.5,"#000"]
                });

                $.ajax({
                    type: 'POST',
                    url: '${rc.getContextPath()}/dcl/farmhouseManagement/save.json',
                    data:saveData,
                    dataType: 'json',
                    success: function (data) {
                        console.log(888,data);
                        var msg  = "保存成功！";
                        if (!data.success) {  //失败
                            var opts = {
                                msg1 : data.tipMsg,
                                icon : 3,
                                btn : []
                            };
                            commonShowDialog(opts);
                            layer.close(index);
                        } else {
                            var opts = {
                                msg1 : msg,
                                icon : 2,
                                btn : [],
                                isCloseAll : true
                            };
                            commonShowDialog(opts);
                            layer.close(index);
                            //给按钮增加不可编辑属性
                            $("#saveBtn").attr("disabled", "disabled");
                            setInterval("cancel()",2000);
                            parent.searchData();// 表单刷新

                        }

                    },
                    error: function (data) {
                    },
                    complete: function () {
                    }
                });
            });

            // 右上角关闭弹窗
            $('.mask-close-ext1').click(function () {
                var index = parent.layer.getFrameIndex(window.name);  //先得到当前iframe层的索引
                parent.layer.close(index);  //再执行关闭
            });
            form.render();

        });



    });

    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
        parent.selectUUid=null;
    }

    /**
     * [checkTime 检查时间]
     * @return Boolean
     */
    function checkTime(constructionStartTime,constructionEndTime){
        if(constructionStartTime==undefined){
            constructionStartTime = new Date($('#constructionStartTime').val()).getTime();
        }
        if(constructionEndTime==undefined){
            constructionEndTime = new Date($('#constructionEndTime').val()).getTime();
        }
        if (constructionEndTime < constructionStartTime) {
            return false;
        }else{
            return true;
        }
    }

    var KindWidth = $('#serviceDesc').parent().width();
    //初始化富文本框
    function initKindEditor(){
        KindEditor.ready(function(K) {
            editor = K.create('#serviceDesc', {
                width : KindWidth+"px",
                minWidth : KindWidth+"px",
                height : "300px",
                resizeType : 0,
                newlineTag : 'br',
                //设置编辑器为简单模式
                items:[
                    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                    'anchor', 'link', 'unlink', '|', 'about'
                ],
                filterMode: false,//是否开启过滤模式
                uploadJson :  "${rc.getContextPath()}/dcl/upLoadFile4x.jhtml"
            });
            //加载完后再显示 不然会有一个多行文本框变成富文本框的过程
            $('#serviceDesc').removeClass("hide");
        });

    }

    //移除img标签
    function removeTAG(str){
        str = str.replace(/<img.*?(?:>|\/>)/gi, "");
        str = str.replace(/<embed.*?(?:>|\/>)/gi, "");
        return str;
    }

</script>
</html>