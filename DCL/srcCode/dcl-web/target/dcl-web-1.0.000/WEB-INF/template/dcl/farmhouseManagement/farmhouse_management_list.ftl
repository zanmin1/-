<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>乡村农家乐</title>
<#include "/component/layuiCommonHead.ftl" />
<#include "/component/sdcomponentsFiles-1.1.ftl" />
    <!-- 网格树下拉框。 -->
<#include "/component/ComboBox.ftl" />


    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>

    <style>

        .layui-form-label {
            padding: 0px 0px 0px 0px !important;
        }

    </style>
</head>

<body>
<#--<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>-->
<#--<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>-->

<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<![endif]-->

<div class="layui-fluid">
    <div class="layui-row">
        <form id="searchForm">
            <div class="layui-col-xs12 lay-nor-hd mt15 layui-pbt0 br8 bg-fff">
                <div class="layui-row layui-form layui-sch-g flex mt15">
                    <div class="flex">
                        <div class="layui-form-item">
                            <label class="layui-form-label">所属区域</label>
                            <div class="layui-input-block w160">
                                <input id="orgCode" name="orgCode"  type="hidden" value="${orgCode}">
                                <input type="text" placeholder="请选择所属区域"  name="orgName" id="orgName" autocomplete="off" value="${orgName}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">农家乐名称</label>
                            <div class="layui-input-block w160">
                                <input type="text"  id="farmhouseName" name="farmhouseName"  placeholder="农家乐名称" class="layui-input">
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block w160">
                                <input type="text"  id="address" name="address"  placeholder="地址" class="layui-input">
                            </div>
                        </div>

                        <div class="posi-rela ml10">
                            <button type="button" class="layui-btn layui-btn-ext10" id="more">更多<i class="layui-icon layui-icon-down more-icon"></i></button>
                            <div class="more-search-ul hide">
                                <div class="w100 h100 posi-rela scroll">
                                    <ul class=" more-search-ul-com scroll">
                                        <li class="mb10">
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">发布状态</label>
                                                <div class="layui-input-block">
                                                    <select name="issuStatus" id="issuStatus"  lay-filter="year">
                                                        <option   value=""  >全部</option>
                                                        <option value="01">已发布</option>
                                                        <option value="02">未发布</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ml10 mr10">
                        <button type="button" id="searchBtn"  class="layui-btn layui-btn-normal">查询</button>
                        <button type="button"   id="resetBtn"  class="layui-btn layui-btn-ext1">重置</button>

                        <button  hidden type="button" id="search" ></button>

                    </div>
                </div>
            </div>
        </form >
    </div>

    <div class="layui-row">
        <div class="layui-col-xs12 layui-form mt15 lay-nor-bd br8 bg-fff">
            <div class="layui-fluid h100">
                <div class="layui-col-xs12 pt10 xcjd-hd">
                    <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>农家乐列表</p>
                    <div class="crudbox fr">
                        <@actionCheck2></@actionCheck2>
                        <#--<button type="button" class="layui-btn layui-btn-normal" id="file-add" onclick="add()">添加</button>
                        <button type="button" class="layui-btn layui-btn-normal" id="file-edit" onclick="edit()">编辑</button>
                        <button type="button" class="layui-btn layui-btn-ext1" id="file-del" onclick="del()">删除</button>-->
                    </div>
                </div>
                <!-- 卡片式内容 -->
                <div class="xcjd-card">
                    <!-- 卡片列表内容 -->
                    <div  id="tableList"  class="xcjd-card-content layui-col-space20 scroll mt5 ovh bs bs layui-row">

                    <#--                            <div class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg3">-->
<#--                                <div class="xcjd-cc-item">-->
<#--                                    <div class="xcjd-cci-top clearfix">-->
<#--                                        <div class="xcjd-ccit-pic img100 fl posi-rela">-->
<#--                                            <!-- 默认图片 &ndash;&gt;-->
<#--                                            <!-- <div class="standard-default-pic-ext1"></div> &ndash;&gt;-->
<#--                                            <img src="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/images/jd-pic.png">-->
<#--                                        </div>-->
<#--                                        <div class="fl xcjd-ccit-right fl">-->
<#--                                            <div class="clearfix xcjd-ccitr-checkbox">-->
<#--                                                <div class="fr">-->
<#--                                                    <input type="checkbox" name="checkbox" lay-skin="primary">-->
<#--                                                </div>-->
<#--                                            </div>-->
<#--                                            <p class="xcjd-ccitr-title text-line-c1 font-size-16 font-bold cor-4c4c4c text-lh1">三坊七巷</p>-->
<#--                                            <p class="xcjd-ccitr-title1 mt15 text-line-c1 font-size-14 font-bold cor-666 text-lh1">名胜古迹<span class="cor-e89e00 mlr15">【部分收费】</span></p>-->
<#--                                            <div class="xcjd-ccitr-box clearfix mt10">-->
<#--                                                <div class="fr clearfix">-->
<#--                                                    <p class="font-size-14 font-bold cor-666 line-height-20 fl">上架：</p>-->
<#--                                                    <div class="fl">-->
<#--                                                        <input type="checkbox" name="switch" lay-skin="switch">-->
<#--                                                    </div>-->
<#--                                                </div>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="xcjd-cci-bottom pl15 pr15 bs">-->
<#--                                        <p class="text-lh1 font-size-14 text-line-c1">-->
<#--                                            <span  class="cor-4c4c4c font-bold">开放时间：</span>-->
<#--                                            <em class="cor-666">07:00-18:00（5月1日-9月30日）</em>-->
<#--                                        </p>-->
<#--                                        <p class="text-lh1 font-size-14 text-line-c1">-->
<#--                                            <span  class="cor-4c4c4c font-bold">景点区域：</span>-->
<#--                                            <em class="cor-666">福建省 - 福州市 - 鼓楼区</em>-->
<#--                                        </p>-->
<#--                                        <p class="text-lh1 font-size-14 text-line-c1">-->
<#--                                            <span  class="cor-4c4c4c font-bold">详细地址：</span>-->
<#--                                            <em class="cor-666">杨桥东路三坊七巷</em>-->
<#--                                        </p>-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                            <div class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg3">-->
<#--                                <div class="xcjd-cc-item">-->
<#--                                    <div class="xcjd-cci-top clearfix">-->
<#--                                        <div class="xcjd-ccit-pic img100 fl posi-rela">-->
<#--                                            <!-- 默认图片 &ndash;&gt;-->
<#--                                            <!-- <div class="standard-default-pic-ext1"></div> &ndash;&gt;-->
<#--                                            <img src="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/images/jd-pic.png">-->
<#--                                        </div>-->
<#--                                        <div class="fl xcjd-ccit-right fl">-->
<#--                                            <div class="clearfix xcjd-ccitr-checkbox">-->
<#--                                                <div class="fr">-->
<#--                                                    <input type="checkbox" name="checkbox" lay-skin="primary">-->
<#--                                                </div>-->
<#--                                            </div>-->
<#--                                            <p class="xcjd-ccitr-title text-line-c1 font-size-16 font-bold cor-4c4c4c text-lh1">三坊七巷</p>-->
<#--                                            <p class="xcjd-ccitr-title1 mt15 text-line-c1 font-size-14 font-bold cor-666 text-lh1">名胜古迹<span class="cor-ff6666 mlr15">【收费】</span></p>-->
<#--                                            <div class="xcjd-ccitr-box clearfix mt10">-->
<#--                                                <div class="fr clearfix">-->
<#--                                                    <p class="font-size-14 font-bold cor-666 line-height-20 fl">上架：</p>-->
<#--                                                    <div class="fl">-->
<#--                                                        <input type="checkbox" name="switch" lay-skin="switch" checked="">-->
<#--                                                    </div>-->
<#--                                                </div>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="xcjd-cci-bottom pl15 pr15 bs">-->
<#--                                        <p class="text-lh1 font-size-14 text-line-c1">-->
<#--                                            <span  class="cor-4c4c4c font-bold">开放时间：</span>-->
<#--                                            <em class="cor-666">07:00-18:00（5月1日-9月30日）</em>-->
<#--                                        </p>-->
<#--                                        <p class="text-lh1 font-size-14 text-line-c1">-->
<#--                                            <span  class="cor-4c4c4c font-bold">景点区域：</span>-->
<#--                                            <em class="cor-666">福建省 - 福州市 - 鼓楼区</em>-->
<#--                                        </p>-->
<#--                                        <p class="text-lh1 font-size-14 text-line-c1">-->
<#--                                            <span  class="cor-4c4c4c font-bold">详细地址：</span>-->
<#--                                            <em class="cor-666">杨桥东路三坊七巷</em>-->
<#--                                        </p>-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </div>-->

                    </div>
                    <!-- 分页 -->
                    <div class="layui-table-page xczx-page-ext1" id="xcjd-page"></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body class=" bg-f5f5f5 ">

<script>
    // 计算页面高度
    // 计算页面高度
    var winW, winH, lhH, lbH, tbH;
    function calcLayBdH() {
        winW = $(window).width(),
                winH = $(window).height(),
                lhH = $('.lay-nor-hd').outerHeight(true),
                lbH;
        if (winW <= 1366) {
            lbH = winH - lhH - 20;
            tbH = lbH;//table高度计算，可调整
        } else {
            lbH = winH - lhH - 30;
            tbH = lbH;
        }
        $('.lay-nor-bd').css({ 'height': lbH + 'px' });
    }
    calcLayBdH();

    var selectUUid =null;

    var totalCount =0;
    var currPage =1;
    var  pageSize=12;

    $(function (){


        //所属区域
        AnoleApi.initGridZtreeComboBox("orgName", null, function(gridId, items) {
            $("#orgCode").val(items[0].orgCode);
        },{
            ShowOptions : {GridShowToLevel : 5	}// 网格显示到某个层级，此参数针对AnoleApi.initGridZtreeComboBox方法。
        });

        LayuiComp.SingleSelect('chargeType',{
            pCode:'${DICT_PAY}',
            selectedCallback:function(data){
            },
            context:'${sysDomain}'
        });

    })
    //收费类型
    <#--AnoleApi.initListComboBox("typeStr", "chargeType", "${DICT_PAY!}", null, null, {ShowOptions: {EnableToolbar: true}});-->

    function searchData() {
        currPage =1;
        selectUUid =null;
        $("#search").click();

    }

    function detail(id) {

        var url = '${rc.getContextPath()}/dcl/farmhouseManagement/view.jhtml?uuId='+id;

        var indexAdd = layer.open({
            skin: 'layer-ext-sch',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['100%', '100%'],
            content: url,
            success: function (layero) {
                calcLayBdH()
                $("#search").click();
            }
        });

    }


    function add() {
        var url = '${rc.getContextPath()}/dcl/farmhouseManagement/form.jhtml';

        var indexAdd = layer.open({
            skin: 'layer-ext-sch',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['100%', '100%'],
            content: url,
            success: function (layero) {
                calcLayBdH()
                $("#search").click();
            }
        });

    };


    //编辑
    function edit() {
        if(selectUUid==null || selectUUid==''){
            layer.msg("请选择一条记录",{skin:'layui-layer-hui'});
            return;
        }

        var url = '${rc.getContextPath()}/dcl/farmhouseManagement/form.jhtml?uuId='+selectUUid;

        var indexAdd = layer.open({
            skin: 'layer-ext-sch',
            type: 2,
            title: false,
            closeBtn: 0,
            shadeClose: true, //点击遮罩关闭
            area: ['100%', '100%'],
            content: url,
            success: function (layero) {
                calcLayBdH()
                $("#search").click();
            }
        });

    };




    //删除
    function del(){

        if(selectUUid==null || selectUUid==''){
            layer.msg("请选择一条记录",{skin:'layui-layer-hui'});
            return;
        }

        var opts = {
            msg1 : "确定要删除吗?",
            icon : 1,
            callBack: function(index) {
                var submitLoad = layer.load(1);//打开遮罩
                $.ajax({
                    type: 'POST',
                    url: '${rc.getContextPath()}/dcl/farmhouseManagement/del.jhtml',
                    data: {
                        uuid : selectUUid
                    },
                    dataType: 'json',
                    success: function(data) {
                        if (data.result=='success') {
                            //	layer.msg(data.result.msg,{skin:'layui-layer-hui'});
                            var opts = {
                                msg1 : "删除成功",
                                icon : 2,
                                btn : []
                            };
                            commonShowDialog(opts);
                            //刷新
                            searchData();
                        }else {
                            //layer.msg(data.result.msg,{skin:'layui-layer-hui'});
                            var opts = {
                                msg1 : "删除失败",
                                icon : 3,
                                btn : []
                            };

                            commonShowDialog(opts);
                        }
                    },
                    error: function(data) {
                        //layer.msg("连接超时",{skin:'layui-layer-hui'});
                        var opts = {
                            msg1 : "连接超时",
                            icon : 4,
                            btn : []
                        };

                        commonShowDialog(opts);

                    },
                    complete : function() {
                        layer.close(submitLoad);//关闭遮罩
                    }
                });
            },
        };
        commonShowDialog(opts);

    }


    $(function () {

        $(window).on('resize', function () {
            calcLayBdH();
        });

        // 滚动条美化
        $('.scroll').niceScroll({
            cursorcolor: "#000", //滚动条的颜色
            cursoropacitymax: 0.12, //滚动条的透明度，从0-1
            cursorwidth: "4px", //滚动条的宽度  单位默认px
            cursorborderradius: "2px", //滚动条两头的圆角
            autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
            zindex: 8, //给滚动条设置z-index值
        })

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer','laypage'], function () {
            var form = layui.form,
                    table = layui.table,
                    laydate = layui.laydate,
                    laytpl = layui.laytpl,
                    element = layui.element,
                    laypage = layui.laypage,
                    layer = layui.layer;

            $('#search').on('click',function(){
                var submitLoad = layer.load(1);//打开遮罩
                $.ajax({
                    type: 'POST',
                    url: '${rc.getContextPath()}/dcl/farmhouseManagement/listData.jhtml',
                    data: {
                        page:currPage,
                        rows:pageSize,
                        farmhouseName: $("#farmhouseName").val(),
                        orgCode: $("#orgCode").val(),
                        address: $("#address").val(),
                        issuStatus:$("#issuStatus").val(),
                    },
                    success: function(data) {

                        console.log(data);

                        $("#tableList").empty();

                        totalCount =   data. total;

                        var html = '';

                        if(totalCount==0){
                            html = '<div class="zwsu-ext1 flex flex-ac flex-jc">'
                                    + '<img src="${uiDomain!''}/web-assets/layui-guanlihotai-biaozhun/pages/blue/images/zwsj.png" />'
                                    + '</div>';
                            $("#tableList").html(html);
                            return;
                        }

                        $.each(data.rows,function (i,val){
                         //   var picUrlObj = val.picUrl == undefined || val.picUrl == null ? '<div class="standard-default-pic-ext1"></div>' : '<img src="' + imgDomain + val.picUrl + '">';
                          //  var  picUrl =val.picUrl==undefined||val.picUrl==null? '<div class="standard-default-pic-ext1"></div>':'<img src="' + imgDomain + val.picUrl + '">';

                            var  picUrl =val.picUrl==undefined||val.picUrl==null?"<div class=\"standard-default-pic-ext1\"></div>":"<img src=\"${imgDomain}"+val.picUrl+"\">";

                            var  farmhouseName =  val.farmhouseName ==undefined?"":val.farmhouseName;
                            var  perCapitaConsum =  val.perCapitaConsum ==undefined?"":val.perCapitaConsum;
                            var  address =  val.address ==undefined?"":val.address;
                            var   issuStatus=  val.issuStatus =='01'?"checked":'';
                            var  regPath =  val.regPath ==undefined?"":val.regPath;
                            var  uuid =  val.uuid ==undefined?"":val.uuid;


                            html +=  "                            <div  data-value=\""+uuid+"\"     class=\"layui-col-xs4    layui-col-sm4 layui-col-md4 layui-col-lg3\">\n" +
                                    "                                <div class=\"xcjd-cc-item\">\n" +
                                    "                                    <div class=\"xcjd-cci-top clearfix\">\n" +
                                    "                                        <div class=\"xcjd-ccit-pic img100 fl posi-rela\">\n" +picUrl+

                                    "                                        </div>\n" +
                                    "                                        <div class=\"fl xcjd-ccit-right fl\">\n" +
                                    "                                            <div class=\"clearfix xcjd-ccitr-checkbox\">\n" +
                                    // "                                                <div class=\"fr\">\n" +
                                    // "                                                    <input type=\"checkbox\" name=\"checkbox\" lay-skin=\"primary\" >\n" +
                                    // "                                                </div>\n" +
                                    "                                            </div>\n" +
                                    "                                            <p class=\"xcjd-ccitr-title text-line-c1 font-size-16 font-bold cor-4c4c4c text-lh1\"><a href=\"javascript:void(0)\"  class='a-detail' onclick=\"detail('"+uuid+"')\">"+farmhouseName+"</a></p>\n" +
                                    "                                            <p class=\"xcjd-ccitr-title1 mt15 text-line-c1 font-size-14 font-bold cor-666 text-lh1\">"+'人均消费'+"<span class=\"cor-4ab900 mlr15\">【"+perCapitaConsum+"】</span></p>\n" +
                                    "                                            <div class=\"xcjd-ccitr-box clearfix mt10\">\n" +
                                    "                                                <div class=\"fr clearfix\">\n" +
                                    "                                                    <p class=\"font-size-14 font-bold cor-666 line-height-20 fl\">发布：</p>\n" +
                                    "                                                    <div class=\"fl\">\n" +
                                    "                                                        <input type=\"checkbox\"  value=\""+uuid+"\"  lay-filter=\"status\"  name=\"status\" lay-skin=\"switch\" "+issuStatus+"  >\n" +
                                    "                                                   </div>\n" +
                                    "                                                </div>\n" +
                                    "                                            </div>\n" +
                                    "                                        </div>\n" +
                                    "                                    </div>\n" +
                                    "                                    <div class=\"xcjd-cci-bottom pl15 pr15 bs\">\n" +

                                    // "                                        <p class=\"text-lh1 font-size-14 text-line-c1\">\n" +
                                    // "                                            <span  class=\"cor-4c4c4c font-bold\">开放时间：</span>\n" +
                                    // "                                            <em class=\"cor-666\">"+attractionsTime+"</em>\n" +
                                    // "                                        </p>\n" +
                                    "                                        <p class=\"text-lh1 font-size-14 text-line-c1\">\n" +
                                    "                                            <span  class=\"cor-4c4c4c font-bold\">所属区域：</span>\n" +
                                    "                                            <em class=\"cor-666\">"+regPath+"</em>\n" +
                                    "                                        </p>\n" +

                                    "                                        <p class=\"text-lh1 font-size-14 text-line-c1\">\n" +
                                    "                                            <span  class=\"cor-4c4c4c font-bold\">地址：</span>\n" +
                                    "                                            <em class=\"cor-666\">"+address+"</em>\n" +
                                    "                                        </p>\n" +
                                    "                                    </div>\n" +
                                    "                                </div>\n" +
                                    "                            </div>";

                        })

                        //分页功能
                        laypage.render({
                            elem: 'xcjd-page'
                            , count: totalCount
                            ,limit :pageSize
                            ,curr :currPage
                            , prev: '<i class="layui-icon"></i>'
                            , next: '<i class="layui-icon"></i>'
                            , layout: ['prev', 'page', 'next', 'skip', 'count',]
                            , groups: 3 //只显示 1 个连续页码
                            ,jump: function(obj, first){

                                //首次不执行
                                if(!first){
                                    currPage =obj.curr;
                                    //do something
                                    $("#search").click();

                                }
                            }
                        });

                        $("#tableList").html(html);

                        form.on('switch(status)', function(data){

                            var id = data.value;
                            var status = this.checked ? '01' : '02';

                            $.ajax({
                                type: 'POST',
                                url: '${rc.getContextPath()}/dcl/farmhouseManagement/save.jhtml',
                                data: {"uuid" :id,"issuStatus":status,type:"issuStatus"  },
                                beforeSend:function(){
                                    index = layer.msg('正在切换中，请稍候',{icon: 16,time:false,shade:0.1});
                                },
                                error: function(data){
                                    layer.msg('数据异常，操作失败！');
                                },
                                success: function(data){
                                    layer.close(index);
                                    layer.msg('操作成功！')

                                },
                                dataType:'JSON'
                            });

                        });
                        //点击事件
                        $('.layui-col-lg3').on('click',function(){

                            $(this).find(".xcjd-cc-item").addClass('active');
                            $(this).siblings().find(".xcjd-cc-item").removeClass('active');
                            selectUUid =$(this).data("value");
                        })
                        //layUi 重新渲染
                        form.render();

                    },
                    error: function(data) {

                    },
                    complete : function() {
                        //关闭遮罩
                        layer.close(submitLoad);
                        calcLayBdH();
                    }
                });

            })

            $("#search").click();

            //搜索
            $('#searchBtn').on('click',function(){

                searchData();

            })

            //重置
            $('#resetBtn').on('click',function(){

                $("#searchForm")[0].reset();
                $('#issuStatus').val("");
                $('#orgCode').val('${orgCode}');
                $('#orgName').val('${orgName}');
                searchData();

            })

            // 屏幕变化table重载
            $(window).on('resize', function () {
                table.reload('data1', {
                    height: tbH
                });
            });
        });

    });
</script>



</html>