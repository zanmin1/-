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
<body class="ovh bg-f5f5f5 layui-ov-hide layui-form-veri modify-table-tips scroll">
<!-- 详情的弹窗 -->
<div class="bs h100 layui-form padding-ext1 layui-form">

    <div class="mask-title-ext1 clearfix">
        <div class="title-ext1 clearfix fl">
            <i></i>
            <p class="cor-333 text-lh1 font-size-14 ml10 fl font-bold">公厕详情</p>
        </div>
        <a href="javascript:void(0);" class="mask-close-ext1 mask-close-ext fr">
            <i class="layui-icon layui-icon-close"></i>
        </a>
    </div>

        <div class="layer-content-ext1 layer-box-bg-ext1">
                <!-- 详情信息 -->
                <div class="layui-fluid layer-content-height-ext1 scroll" >
                    <p class="font-size-14 font-bold sdc-title pl10 mt25">基本情况</p>

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
                                        <td><span class="mark">*</span>所属区域</td>
                                        <td>${bo.regionName!''}</td>
                                        <td><span class="mark">*</span>村级配备吸污车数量（辆）</td>
                                        <td>${bo.truckNum!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>村级配备吸污泵数量（个）</td>
                                        <td>${bo.pumpNum!''}</td>
                                        <td><span class="mark">*</span>是否有专业维护队伍</td>
                                        <td>${bo.isProfessTeamCN!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>维护队伍人数（人）</td>
                                        <td>${bo.termUserNum!''}</td>
                                        <td><span class="mark">*</span>是否有维护经费</td>
                                        <td>${bo.isFundsCN!''}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="mark">*</span>年度维护经费（元）</td>
                                        <td>${bo.yearFunds!''}</td>
                                        <td><span class="mark">*</span>已建公厕数量（座）</td>
                                        <td>${bo.toiletNum!''}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="1">村级配备其他设施</td>
                                        <td colspan="3">${bo.otherFacil!''}</td>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <p class="font-size-14 font-bold sdc-title pl10 mt25">公厕信息</p>

                    <div class="layui-row">
                        <div style="height: 375px" class="layui-col-xs12 layui-form mt15 br8 bg-fff">

                            <iframe id="wcFrame" name="wcFrame" src="${rc.getContextPath()}/dcl/resToilet/resMenberList.jhtml?uuid=${bo.uuid}&type=view"  scrolling="false" frameborder='0'  style='width:100%;height:100%;'></iframe>

                        </div>
                    </div>

                    <p class="font-size-14 font-bold sdc-title pl10 ">填表信息</p>

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
                                        <td><span class="mark">*</span>填表日期</td>
                                        <td>${(bo.fillingDate?string("yyyy-MM-dd"))!}</td>
                                        <td><span class="mark">*</span>联系电话</td>
                                        <td>${bo.mobilePhone!''}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="1"><span class="mark">*</span>填表人</td>
                                        <td colspan="3">${bo.fillingUser!''}</td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            <div class="layer-btn-box-ext1">
                <button type="button" class="layui-btn layui-btn-ext1" onclick="cancel()">关闭</button>
            </div>
        </div>

    </div>
</div>
</body>
<script type="text/javascript">

    $(function (){
        $('.mask-close-ext1').click(function () {
            parent.layer.closeAll(); //关闭弹窗
        });
    })


    //关闭
    function cancel() {
        parent.layer.closeAll(); //关闭弹窗
    }
    layui.use(['table', 'layer','element'], function () {
        var table = layui.table,
            layer = layui.layer,
        element = layui.element;

    })
</script>
</html>
