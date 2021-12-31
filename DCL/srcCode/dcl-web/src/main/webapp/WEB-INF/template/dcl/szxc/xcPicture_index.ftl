<!DOCTYPE html>
<html>
<head>
    <title>保存</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/js/photoviewerjs/photoviewer.css"/>
    <#include "/component/commonFiles-1.1.ftl" />
    <#include "/component/maxJqueryEasyUIWin.ftl" />
    <style type="text/css">
        .uploadwraper {
            width: 78%;
            overflow: hidden;
            display: inline-block;
            float: left;
        }

        .uploadbox {
            display: inline-block;
            float: left;
            position: relative;
            width: 300px;
            height: 200px;
            margin: 8px 15px 8px 0;
        }

        .addfilebox {
            display: inline-block;
            float: left;
            width: 300px;
            height: 200px;
            margin: 8px 15px 8px 0;
        }

        .addfilebox .addfile {
            display: inline-block;
            width: 100%;
            height: 200px;
            line-height: 200px;
            border: 2px dashed #ccc;
            font-size: 100px;
            color: #ccc;
            text-align: center;
            text-decoration: none;
            box-sizing: border-box;
        }

        .imgpreview-box {
            width: 100%;
            height: 200px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .imgpreview {
            width: 100%;
            height: 100%;
        }

        .removebox {
            position: absolute;
            top: -8px;
            right: -8px;
            width: 20px;
            height: 20px;
        }

        .removeicon {
            display: inline-block;
            width: 100%;
            height: 100%;
            background: url(${rc.getContextPath()}/images/close.png) no-repeat 100% 100%;
            background-size: 100%;
        }

        .removeicon:hover {
            background: url(${rc.getContextPath()}/images/closeHover.png) no-repeat 100% 100%;
            background-size: 100%;
        }

        .mask {
            position: absolute;
            top: 0;
            left: 0;
            width: 300px;
            height: 200px;
            background: rgba(101, 101, 101, 0.6);
            color: #ffffff;
            opacity: 0;
        }

        .mask h3 {
            padding: 0;
            width: 300px;
            height: 200px;
            text-align: center;
            display: table-cell;
            vertical-align: middle
        }

        .imgpreview-box a:hover .mask {
            opacity: 1;
        }
    </style>
</head>
<body>
<form id="submitForm">
    <input type="hidden" id="id" name="id" value="${id!}"/>
    <div id="content-d" class="MC_con content light">
        <div name="tab" class="NorForm">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <div class="uploadwraper" style="padding-left: 5px; width: 100%;">
                            <div class="addfilebox" <#if !editable>style="display:none;"</#if>>
                                <a href="javascript:void(0);" class="addfile"
                                   onclick="document.getElementById('upload_btn_').click();">+</a>
                                <input id="upload_btn_" type="file" style="display: none;" accept="image/*">
                            </div>
                            <#list pictures as picture>
                                <div class="uploadbox" id="pic_${picture.attachmentId}">
                                    <div class="imgpreview-box">
                                        <a data-gallery="manual" href="${FILE_URL}${picture.filePath}"
                                           alt="${picture.fileName}">
                                            <img class="imgpreview" src="${FILE_URL}${picture.filePath}"
                                                 alt="${picture.fileName}">
                                            <div class="mask"><h3>预览</h3></div>
                                        </a>
                                    </div>
                                    <#if editable>
                                        <div class="removebox">
                                            <a class="removeicon"
                                               href="javascript:delPicutre('${picture.attachmentId}');"></a>
                                        </div>
                                    </#if>
                                    <input type="hidden" name="pictures" value="${picture.attachmentId}">
                                </div>
                            </#list>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <#if editable>
            <div class="BigTool">
                <div class="BtnList">
                    <a href="javascript:;" class="BigNorToolBtn SaveBtn" onClick="save();">保存</a>
                </div>
            </div>
        </#if>
    </div>
</form>
</body>
<script type="text/javascript" src="${rc.getContextPath()}/js/photoviewerjs/photoviewer.js"></script>
<script type="text/javascript">

    $(function () {
        //图片上传
        $('#upload_btn_').off('change').on('change', function (e) {
            var _this = e.target;
            if ($(_this).val()) {
                var formData = new FormData();
                formData.append("uploadFile", e.target.files[0]);
                modleopen(); //打开遮罩层
                $.ajax({
                    type: 'post',
                    url: "${rc.getContextPath()}/upFileServlet?method=up&moudle=attr&bizType=${model}",
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        var data = $.parseJSON(response);
                        if ($.isArray(data)) {
                            data = data[0];
                        }
                        var _file = e.target.files[0];
                        var _reader = new FileReader();
                        _reader.readAsDataURL(_file);
						_reader.onload = function () {
							$('.uploadwraper').append(
									'<div class="uploadbox" id="pic_' + data.attachmentId + '">' +
									'	<div class="imgpreview-box">' +
									'		<a data-gallery="manual" href="' + this.result + '" alt="' + data.fileName + '">' +
									'		<img class="imgpreview" src="' + this.result + '"><div class="mask"><h3>预览</h3></div></a>' +
									'	</div>' +
									'	<div class="removebox">' +
									'		<a class="removeicon" href="javascript:delPicutre(\'' + data.attachmentId + '\');"></a>' +
									'	</div>' +
									'	<input type="hidden" name="pictures" value="' + data.attachmentId + '">' +
									'</div>'
							);
							modleclose(); //关闭遮罩层
						}
                    },
                    error: function () {
                        modleclose(); //关闭遮罩层
                        alert("上传失败");
                    }
                });
            }
        });

        $('.uploadwraper').delegate("[data-gallery=manual]", "click", function (e) {
            e.preventDefault();
            var items = [];
            $('[data-gallery=manual]').each(function () {
                let src = $(this).attr('href');
                let alt = $(this).attr('alt');
                items.push({
                    src: src,
                    caption: alt
                });
            });
            new PhotoViewer(items, {
                index: $(this).parent().parent().index() - 1,
                gapThreshold: 0.2
            });
        });

    });

    //删除图片
    function delPicutre(aid) {
        $('#pic_' + aid).remove();
    }

    //保存
    function save() {
        modleopen(); //打开遮罩层

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/xcBigScreen/pictureSave.json?model=${model}',
            data: $('#submitForm').serializeArray(),
            dataType: 'json',
            success: function (data) {
                if (data.result == 'fail') {
                    $.messager.alert('错误', '保存失败！', 'error');
                } else {
                    $.messager.alert('提示', '保存成功！', 'info');
                }
            },
            error: function () {
                $.messager.alert('错误', '连接超时！', 'error');
            },
            complete: function () {
                modleclose(); //关闭遮罩层
            }
        });
    }

</script>
</html>
