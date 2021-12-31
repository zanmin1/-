<!DOCTYPE html>
<html>
<head>
    <title>详情</title>
    <#include "/component/layuiCommonHead.ftl" />
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
                    <p class="font-size-14 font-bold sdc-title pl10 mt25">基础信息</p>
                    <div class="sdc-box pl10 mt15 flex">
                        <div class="flex1">
                            <div class="layui-form check-table">
                                <table class="layui-table layui-table-nohover">
                                    <colgroup>
                                        <col width="150px">
                                        <col width="auto">
                                        <col width="150px">
                                        <col width="auto">
                                        <col width="150px">
                                        <col width="auto">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td><span class="mark">*</span>姓名</td>
                                        <td>${bo.name!''}</td>
                                        <td><span class="mark">*</span>类型</td>
                                        <td>${bo.typeName!''}</td>
                                        <td><span class="mark">*</span>所属区域</td>
                                        <td>${bo.regionName!''}</td>
                                    </tr>
                                    <tr>
										<td><span class="mark">*</span>性别</td>
										<td>${bo.sexCN!''}</td>
										<td><span class="mark">*</span>出生年月</td>
										<td>${bo.birthday!''}</td>
										<td><span class="mark">*</span>联系方式</td>
										<td>${bo.tel!''}</td>
                                    </tr>
                                    <tr>
										<td><span class="mark">*</span>职务</td>
										<td>${bo.job!''}</td>
										<td>排序</td>
										<td>${bo.seq!''}</td>
                                    </tr>
                                    <tr>
										<td><span class="mark">*</span>人员介绍</td>
										<td colspan="5">${bo.introduction!''}</td>
                                    </tr>
                                    <tr>
										<td><span class="mark">*</span>图片</td>
										<td colspan="5" id="bigupload_2">
										</td>
                                    </tr>
                                    </tbody>
                                </table>
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
	//图片附件
	$("#bigupload_2").bigfileUpload({
		useType: 'view',//附件上传的使用类型，add,edit,view，（默认edit）;
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
</script>
</html>
