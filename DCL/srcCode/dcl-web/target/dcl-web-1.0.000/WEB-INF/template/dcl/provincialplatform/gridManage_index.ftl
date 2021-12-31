<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网格管理</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xczl-1.css" />
    <script>
        var winW, whdef, rem;
        function fullPage() { //将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef; // 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }
        fullPage();
        window.onresize = fullPage;
    </script>
</head>

<body>
<div class="contextMenu" id="myMenu2" style="display:none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>
    <!-- 更多功能 start -->
<#--    <div class="szsh-more posi-abso hide">-->
<#--        <div class="szsh-m-box hide">-->
<#--            <div class="w100 h100  flex flex-ac flex-jc">-->
<#--                <p class="szsh-mb-text">更多<br>功能</p>-->
<#--            </div>-->
<#--        </div>-->
<#--        <div class="szsh-mb-content posi-abso bs">-->
<#--            <div class="szsh-mbc-title">-->
<#--                <p>更多功能</p>-->
<#--            </div>-->
<#--            <div class="szsh-mbc-content flex flex-clm">-->
<#--                <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc">-->
<#--                   <div class="szsh-mbcci-icon">-->
<#--                        <img src="${UI_DOMAIN!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-sjsb.png">-->
<#--                    </div>-->
<#--                    <p class="szsh-mbcci-text">事件上报</p>-->
<#--                </div>-->
<#--                <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc active">-->
<#--                    <div class="szsh-mbcci-icon">-->
<#--                       <img src="${UI_DOMAIN!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-wgry.png">-->
<#--                    </div>-->
<#--                    <p class="szsh-mbcci-text">网格人员</p>-->
<#--                </div>-->
<#--            </div>-->
<#--            <a href="javascript:void(0);" class="flex flex-ac szsh-more-closed flex-jc">-->
<#--                <p>收起</p>-->
<#--                <i></i>-->
<#--            </a>-->
<#--        </div>-->
<#--    </div>-->
    <div class="h100 szsh-bj plr20 ptr20 pbr20 bs">
        <div class="h100 prr20 clearfix">
            <!-- 左 -->
            <div class="h100 cont-w1 fl">
                <div class="cont-h1 main-div-box cun-box-bg-ext1" id="wggl">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 内容 -->
                    <div class="bmfw-box cont-h4 mtr25">
                        <div class="cont-box-ext1 cont-margin1 cont-h5" id="gridImg">
<#--                            <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/wggl/ui-wggl-banner1.jpg">-->
                        </div>
                    </div>
                </div>
                <div class="cont-h2 main-div-box mtr10 cun-box-bg-ext1" id="sjdt">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">事件动态 </p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="bmfw-box cont-h3 mtr10 ptr20 h-x" style="cursor: pointer;">
                        <ul class="cont-margin1" id="eventBody">
<#--                            <li class="mbr25">-->
<#--                                <div class="evt-ext1-t evt-ext1-bg1">-->
<#--                                    <p class="font-size-r18 text-cor1 font-bold mlr15 fl">进行中：</p>-->
<#--                                    <p class="font-size-r18 cor-333 font-bold fl">婚姻家庭纠纷</p>-->
<#--                                    <p class="font-size-r16 text-cor6 mrr25 fr">2021-10-11</p>-->
<#--                                </div>-->
<#--                                <div class="evt-ext1-b">-->
<#--                                    <dl class="list1-ext1">-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w3 font-size-r16 cor-999 plr15 prr15">紧急程度: <em class="cor-666">普通事件</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">涉及人员: <em class="cor-666">2人</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系人员: <em class="cor-666">黄富康</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系电话: <em class="cor-666">13557548724</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="cont-w4 font-size-r16 cor-999 plr15 prr15">地理位置: <a href="javascript:;" class="text-cor2 text-underline">查看地理位置</a></p>-->
<#--                                        </dd>-->
<#--                                    </dl>-->
<#--                                </div>-->
<#--                            </li>-->
<#--                            <li class="mbr25">-->
<#--                                <div class="evt-ext1-t evt-ext1-bg2">-->
<#--                                    <p class="font-size-r18 text-cor3 font-bold mlr15 fl">待处理：</p>-->
<#--                                    <p class="font-size-r18 cor-333 font-bold fl">婚姻家庭纠纷</p>-->
<#--                                    <p class="font-size-r16 text-cor6 mrr25 fr">2021-10-11</p>-->
<#--                                </div>-->
<#--                                <div class="evt-ext1-b">-->
<#--                                    <dl class="list1-ext1">-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w3 font-size-r16 cor-999 plr15 prr15">紧急程度: <em class="text-cor4">III紧急事件</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">涉及人员: <em class="cor-666">2人</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系人员: <em class="cor-666">黄富康</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系电话: <em class="cor-666">13557548724</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="cont-w4 font-size-r16 cor-999 plr15 prr15">地理位置: <a href="javascript:;" class="text-cor2 text-underline">查看地理位置</a></p>-->
<#--                                        </dd>-->
<#--                                    </dl>-->
<#--                                </div>-->
<#--                            </li>-->
<#--                            <li class="mbr25">-->
<#--                                <div class="evt-ext1-t evt-ext1-bg2">-->
<#--                                    <p class="font-size-r18 text-cor3 font-bold mlr15 fl">待处理：</p>-->
<#--                                    <p class="font-size-r18 cor-333 font-bold fl">婚姻家庭纠纷</p>-->
<#--                                    <p class="font-size-r16 text-cor6 mrr25 fr">2021-10-11</p>-->
<#--                                </div>-->
<#--                                <div class="evt-ext1-b">-->
<#--                                    <dl class="list1-ext1">-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w3 font-size-r16 cor-999 plr15 prr15">紧急程度: <em class="text-cor5">II紧急事件</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">涉及人员: <em class="cor-666">2人</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系人员: <em class="cor-666">黄富康</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系电话: <em class="cor-666">13557548724</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="cont-w4 font-size-r16 cor-999 plr15 prr15">地理位置: <a href="javascript:;" class="text-cor2 text-underline">查看地理位置</a></p>-->
<#--                                        </dd>-->
<#--                                    </dl>-->
<#--                                </div>-->
<#--                            </li>-->
<#--                            <li class="mbr25">-->
<#--                                <div class="evt-ext1-t evt-ext1-bg3">-->
<#--                                    <p class="font-size-r18 cor-999 font-bold mlr15 fl">已完成：</p>-->
<#--                                    <p class="font-size-r18 cor-333 font-bold fl">婚姻家庭纠纷</p>-->
<#--                                    <p class="font-size-r16 text-cor6 mrr25 fr">2021-10-11</p>-->
<#--                                </div>-->
<#--                                <div class="evt-ext1-b">-->
<#--                                    <dl class="list1-ext1">-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w3 font-size-r16 cor-999 plr15 prr15">紧急程度: <em class="cor-666">普通事件</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">涉及人员: <em class="cor-666">2人</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系人员: <em class="cor-666">黄富康</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系电话: <em class="cor-666">13557548724</em></p>-->
<#--                                        </dd>-->
<#--                                        <dd>-->
<#--                                            <p class="cont-w4 font-size-r16 cor-999 plr15 prr15">地理位置: <a href="javascript:;" class="text-cor2 text-underline">查看地理位置</a></p>-->
<#--                                        </dd>-->
<#--                                    </dl>-->
<#--                                </div>-->
<#--                            </li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 右 -->
            <div class="h100 cont-w2 fr">
                <div class="cont-h6 main-div-box cun-box-bg-ext1" id="fwjs">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">服务基数</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="bmfw-box mtr25">
                        <div class="evt-report-t cont-margin1">
                            <p class="font-size-r20 cor-333 font-bold mlr35 fl">累计上报事件</p>
                            <p class="font-size-r16 cor-333 mrr35 fr"><em class="font-aldr font-size-r28 text-cor7 font-bold mrr5" id="num0">0</em>件</p>
                        </div>
                        <ul class="evt-handle">
                            <li>
                                <span class="evt-handle-i1 fl mlr30"></span>
                                <div class="mlr15 fl">
                                    <p class="font-size-r14 text-cor4"><em class="font-size-r20 font-bold mrr5" id="num1">0</em>条</p>
                                    <p class="font-size-r14 cor-666">已处理</p>
                                </div>
                            </li>
                            <li>
                                <span class="evt-handle-i2 fl mlr30"></span>
                                <div class="mlr15 fl">
                                    <p class="font-size-r14 text-cor4"><em class="font-size-r20 font-bold mrr5" id="num2">0</em>条</p>
                                    <p class="font-size-r14 cor-666">待处理</p>
                                </div>
                            </li>
                            <li>
                                <span class="evt-handle-i3 fl mlr30"></span>
                                <div class="mlr15 fl">
                                    <p class="font-size-r14 text-cor4"><em class="font-size-r20 font-bold mrr5" id="num3">0</em>条</p>
                                    <p class="font-size-r14 cor-666">处理中</p>
                                </div>
                            </li>
                            <li>
                                <span class="evt-handle-i4 fl mlr30"></span>
                                <div class="mlr15 fl">
                                    <p class="font-size-r14 text-cor4"><em class="font-size-r20 font-bold mrr5" id="num4">0</em>%</p>
                                    <p class="font-size-r14 cor-666">处理率</p>
                                </div>
                            </li>
                            <li>
                                <span class="evt-handle-i5 fl mlr30"></span>
                                <div class="mlr15 fl">
                                    <p class="font-size-r14 text-cor4"><em class="font-size-r20 font-bold mrr5" id="num5">0</em>人</p>
                                    <p class="font-size-r14 cor-666">网格员数</p>
                                </div>
                            </li>
                            <li>
                                <span class="evt-handle-i6 fl mlr30"></span>
                                <div class="mlr15 fl">
                                    <p class="font-size-r14 text-cor4"><em class="font-size-r20 font-bold mrr5" id="num6">0</em>%</p>
                                    <p class="font-size-r14 cor-666">好评率</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="cont-h7 main-div-box mtr10 cun-box-bg-ext1" id="wggly">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">网格管理员</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="bmfw-box cont-h8 mtr20 h-x">
                        <ul class="manager-list cont-margin1" id="adminBody">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
    <script>
        // 更多功能点击事件
        $('.szsh-mbc-content').on('click','.szsh-mbcc-item',function(){
            $(this).addClass('active').siblings().removeClass('active');
        })
        // 更多功能收起和展开事件
        $('.szsh-more-closed').click(function(){
            $(this).parents('.szsh-mb-content').animate({right:"-1.14rem"},'linear',function(){
                $('.szsh-m-box').removeClass('hide');
            })
        })
        $('.szsh-m-box').click(function(){
            $('.szsh-m-box').addClass('hide');
            $(this).siblings('.szsh-mb-content').animate({right:".1rem"},'linear')
        })

        // 滚动条
        $('.h-x').niceScroll({
            cursorcolor: "#dfa29d",
            cursoropacitymax: 1,
            cursorwidth: ".03rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: true,
        })
        // 动画结束 后执行
        document.querySelector('body').addEventListener("animationend", function () {
            $('.h-x').scroll().size()
        })
        $(function () {
            bindRightMouse('wggl');
            bindRightMouse('sjdt');
            bindRightMouse('fwjs');
            bindRightMouse('wggly');
        });

        // 绑定右键
        function bindRightMouse(id) {
            var type=61;
            $('#' + id).contextMenu('myMenu2', { //菜单样式
                menuStyle: {
                    border: 'none',
                    width:'auto',
                    padding:'0',
                    borderRadius:'4px'

                }, //菜单项样式
                itemStyle: {
                    fontSize: '14px',
                    color: '#666',
                    padding:'5px 15px',
                    fontWeight: 'normal',
                    border: 'none',
                    borderRadius:'4px',
                    backgroundColor:'rgba(189,173,173,0.3)',
                    marginTop:'2px'
                }, //菜单项鼠标放在上面样式
                itemHoverStyle: {
                    color: '#333 ',
                    fontWeight: 'bold',
                    backgroundColor:'none',
                    border: 'none'
                }, //事件
                bindings: {
                    'item_1': function(t) {
                        switch(t.id) {
                            case 'wggl':
                                type=61;
                                break;
                            case 'sjdt':
                                type=62;
                                break;
                            case 'fwjs':
                                type=62;
                                break;
                            case 'wggly':
                                type=63;
                                break;
                            default:
                                type=61;
                        }
                        window.open('${rc.getContextPath()}/system/setindex.jhtml?type='+type);

                    },
                    'item_2': function(t) {
                        location.reload();
                    }
                }
            });
        }

        getAdmin();
        function getAdmin() {
            $.ajax({
                type : 'POST',
                dataType : "jsonp",
                data: {
                    page : 1,
                    rows : 20,
                    startGridId : "${gridInfo.gridId!''}"
                },
                url : "${ZZGRID_DOMAIN}/zzgl/grid/gridAdmin/listDataForJsonp.json?jsoncallback=?&t="+Math.random(),
                success: function(data) {
                    var list = data.rows;
                    $('#num5').html(data.total);
                    var str='';
                    for (i = 0; i < list.length; i++) {
                        var filePath = '${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/img05.png';
                        if (list[i].photo != '') {
                            filePath = "${FILE_URL}/" + list[i].photo;
                        }
                        str += '<li>'
                            +'<span class="manager-list-p fl">'
                            +'<img src="'+filePath+'">'
                            +'</span>'
                            +'<div class="cont-w6 fr">'
                            +'<div class="over-hide mtr10">'
                            +'<p class="font-size-r24 text-lh1 cor-333 font-bold fl">'+list[i].partyName+'</p>'
                            +'<p class="manager-list-des font-size-r18 cor-fff fl mlr10">'+list[i].dutyLabel+'</p>'
                            +'</div>'
                            +'<div class="over-hide mtr15">'
                            +'<p class="cont-w5 font-size-r16 cor-666 fl">'
                            +'<i class="manager-list-i1"></i>'
                            +'<em>'+list[i].mobileTelephone+'</em>'
                            +'</p>'
                            +'</div>';
                        if(list[i].responsibility!=null && list[i].responsibility!=''){
                            str+= '<p class="text-line-c2 line-height-r24 mtr10 font-size-r16 cor-666">'
                                +'<em>'+list[i].responsibility+'</em>'
                                +'</p>'
                                +'</div>';
                        }
                        +'</li>';
                    }
                    $('#adminBody').html(str);
                },
                error : function() {
                    console.log("获取数据连接超时！");
                }
            });
        }

        getGrid();
        function getGrid() {
            $.ajax({
                type : 'POST',
                dataType : "jsonp",
                data: {
                    gridId : "${gridInfo.gridId!''}"
                },
                url : "${ZZGRID_DOMAIN}/zzgl/grid/mixedGrid/detailForJsonp.json?jsoncallback=?&t="+Math.random(),
                success: function(data) {
                    var attList=JSON.parse(data.attList);
                    if(attList!=null){
                        var str='<img src=\"${FILE_URL!''}/'+attList[0].path+'\">';
                        $('#gridImg').html(str);
                    }
                },
                error : function() {
                    console.log("获取数据连接超时！");
                }
            });
        }


        getEvent();
        function getEvent() {
            $.ajax({
                type : 'POST',
                dataType : "jsonp",
                data: {
                    page : 1,
                    rows : 10,
                    infoOrgCode : "${regionCode!''}"
                },
                url : "${eventDomain}/zhsq/event/eventDisposal4OuterController/fetchEventData4Jsonp.json?jsonpcallback=?&t="+Math.random(),
                success: function(data) {
                    var list = data.list;
                    var str='';
                    var status='';
                    var color='';
                    for (i = 0; i < list.length; i++) {
                        status=list[i].status;
                        if (status == '00') {
                            color = 'text-cor3';
                            status = '待处理';
                        }else if (status == '01' || status == '02') {
                            color = 'text-cor1';
                            status = '处理中';
                        }else{
                            color = 'cor-999';
                            status = '已处理';
                        }
                        str += '<li class="mbr25" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=sjlb&title=辖区事件列表&regionCode=${regionCode!''}&infoOpenId='+list[i].eventId+'\');">'
                            +'<div class="evt-ext1-t evt-ext1-bg2">'
                            +'<p class="font-size-r18 '+ color +' font-bold mlr15 fl">'+ status +'：</p>'
                            +'<p class="font-size-r18 cor-333 font-bold fl">'+list[i].eventName+'</p>'
                            +'<p class="font-size-r16 text-cor6 mrr25 fr">'+list[i].happenTimeStr+'</p>'
                            +'</div>'
                            +'<div class="evt-ext1-b">'
                            +'<dl class="list1-ext1">'
                            +'<dd>'
                            +'<p class="list1-ext1-bar1 cont-w3 font-size-r16 cor-999 plr15 prr15">紧急程度: <em class="text-cor4">'+list[i].urgencyDegreeName+'</em></p>'
                            +'</dd>'
                            +'<dd>'
                            +'<p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系人员: <em class="cor-666">'+list[i].contactUser+'</em></p>'
                            +'</dd>'
                            +'<dd>'
                            +'<p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">联系电话: <em class="cor-666">'+list[i].tel+'</em></p>'
                            +'</dd>'
                            +'<dd>'
                            +'<p class="list1-ext1-bar1 cont-w4 font-size-r16 cor-999 plr15 prr15">发生位置: <em class="cor-666">'+list[i].occurred+'</em></p>'
                            +'</dd>'
                            +'</dl>'
                            +'</div>'
                            +'</li>';
                    }
                    $('#eventBody').html(str);
                },
                error : function() {
                    console.log("获取数据连接超时！");
                }
            });
        }


        getEventnum('00',5);
        var num0,num1,num2,num3,num4,num5,num6;
        function getEventnum(status,listType,) {

            var url = '${eventDomain!''}/zhsq/event/eventDisposal4OuterController/fetchDataCount4Jsonp.json';
            var map = {
                userId: "${userId!''}",
                orgId: "${orgId!''}",
                orgCode: "${orgCode!''}",
                infoOrgCode: "${regionCode!''}",
                status : status,
                listType : listType
            };
            if(status=='1'){
                map.evaLevelList='02,03,04';
                map.status='';
            }
            $.ajax({
                type: 'POST',
                url: url,
                data: map,
                dataType: 'jsonp',
                jsonp: "jsonpcallback",
                success: function (data) {
                    if(status=='00'){
                        num2=data.total;
                        getEventnum('01,02',5);
                    }else if(status=='01,02'){
                        num3=data.total;
                        getEventnum('03,04',5);
                    }else if(status=='03,04'){
                        num1=data.total;
                        getEventnum('1',4);
                    }else if(status=='1'){
                        num6=data.total;
                        $('#num1').html(num1);
                        $('#num2').html(num2);
                        $('#num3').html(num3);
                        num0=num1+num2+num3;
                        $('#num0').html(num0);
                        if(num0!=0){
                            $('#num4').html((num1*100/num0).toFixed(2));
                            $('#num6').html((num6*100/num1).toFixed(2));
                        }
                    }
                },
                error: function (data) {
                    console.log("获取三务数据连接超时！");
                },
                complete: function () {
                }
            });
        }

        function goback() {
            window.history.back();
        }

        function openpage(url) {
            window.open(url);
        }
    </script>
    <#include "/dcl/szsh/more_function.ftl" />
</body>

</html>