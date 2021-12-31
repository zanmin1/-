<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>三资管理</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css"/>
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xczl-1.css"/>
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script>
        var winW, whdef, rem;

        function fullPage() {//将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef;// 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }

        fullPage();
        window.onresize = fullPage;
    </script>
</head>
<body>
<!-- 更多功能 start -->
<div class="szsh-more posi-abso hide">
    <div class="szsh-m-box hide">
        <div class="w100 h100  flex flex-ac flex-jc">
            <p class="szsh-mb-text">更多<br>功能</p>
        </div>
    </div>
    <div class="szsh-mb-content posi-abso bs">
        <div class="szsh-mbc-title">
            <p>更多功能</p>
        </div>
        <div class="szsh-mbc-content flex flex-clm">
            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc active">
                <div class="szsh-mbcci-icon">
                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-zcgl.png">
                </div>
                <p class="szsh-mbcci-text">资产管理</p>
            </div>
            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc">
                <div class="szsh-mbcci-icon">
                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-zjgl.png">
                </div>
                <p class="szsh-mbcci-text">资金管理</p>
            </div>
            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc">
                <div class="szsh-mbcci-icon">
                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-zygl.png">
                </div>
                <p class="szsh-mbcci-text">资源管理</p>
            </div>
            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc">
                <div class="szsh-mbcci-icon">
                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-htgl.png">
                </div>
                <p class="szsh-mbcci-text">合同管理</p>
            </div>
        </div>
        <a href="javascript:void(0);" class="flex flex-ac szsh-more-closed flex-jc">
            <p>收起</p>
            <i></i>
        </a>
    </div>
</div>

<div class=" h100  szsh-bj plr20 ptr20 pbr20 bs">
    <div class="h100 prr20 h-x clearfix ">
        <!-- 左 -->
        <div class="h100 smfw-l-w main-div-box fl bs plr35 pbr20 bor cun-box-bg-ext1 h-o">
            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
            <div class="cont-h9 index-ext1 h-o mtr40 prr35 pbr20 bs">
                <div class="jfyh-l-top jfyh-l-top-h">
                    <div class="div-banner h-600 img100" id="szgl">
                        <div class="swiper-container szgl-swiper1 w100 h100" >
                            <!-- 暂无数据 start -->
                            <div class="none-data-ext1 hide" id="picDivZwsj">
                                <img class="none-data-p1"
                                     src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                <p class="none-data-t1">暂无数据</p>
                            </div>
                            <!-- 暂无数据 end -->

                            <div class="swiper-wrapper" id="picDiv">

                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <div class="h-100-600 clearfix bs mtr40">
                        <div class="h-100 w-33-20 fl" id="zjqk1">
                            <div class="comm-title-ext1">
                                <div class="comm-te1-item  w100 h100 bs plr5 prr5 fl posi-rela ">
                                    <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3"><em
                                                class="col-d62">收入</em>情况</p>
<#--                                    <span class="fr">-->
<#--                                            <i class="i-right"></i>-->
<#--                                        </span>-->
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="div-t-com w100 mtr40 flex flex-ac ">
                                <div class="font-size-0"><img class="img-w89-h97"
                                                              src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/szgl/icon-01.png"/>
                                </div>
                                <div class="mlr20">
                                    <p class="font-size-r18 col-d62"><em class="font-size-r38 font-bold mrr10 "
                                                                         id="sumIncome">121.17</em>万元</p>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 w-33-20 fl mlr30 mrr30" id="zjqk2">
                            <div class="comm-te1-item comm-title-ext1 w100 h100 bs plr5 prr5 fl posi-rela ">
                                <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3"><em class="col-d62">支出</em>情况
                                </p>
<#--                                <span class="fr">-->
<#--                                        <i class="i-right"></i>-->
<#--                                    </span>-->
                            </div>
                            <div class="clearfix"></div>
                            <div class="div-t-com w100 mtr40 flex flex-ac " >
                                <div class="font-size-0"><img class="img-w89-h97"
                                                              src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/szgl/icon-02.png"/>
                                </div>
                                <div class="mlr20">
                                    <p class="font-size-r18 col-d62"><em class="font-size-r38 font-bold mrr10 "
                                                                         id="sumPay">121.17</em>万元</p>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 w-33-20 fl " id="htqk">
                            <div class="comm-te1-item comm-title-ext1 w100 h100 bs plr5 prr5 fl posi-rela ">
                                <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3" >
                                    <em class="col-d62">合同</em>总数</p>
<#--                                <span class="fr">-->
<#--                                        <i class="i-right"></i>-->
<#--                                    </span>-->
                            </div>
                            <div class="clearfix"></div>
                            <div class="div-t-com w100 mtr40 flex flex-ac ">
                                <div class="font-size-0"><img class="img-w89-h97"
                                                              src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/szgl/icon-03.png"/>
                                </div>
                                <div class="mlr20" >
                                    <p class="font-size-r18 col-d62"><em class="font-size-r38 font-bold mrr10" id="contractCount">3182</em>份
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- 右 -->
        <div class="h100 smfw-r-w  fr">
            <div class="smfw-r-top smfw-r-top-szgl main-div-box mbr10 cun-box-bg-ext1">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 标题 -->
                <div class="flex flex-jc box-title-ext1">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">各类资源构成情况</p>
                    </div>
                </div>

                <div class="div-w-h-com" id="zygc">
                    <!-- 暂无数据 start -->
                    <div class="none-data-ext1 hide" id="columnarDivZwsj">
                        <img class="none-data-p1"
                             src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                    <!-- 暂无数据 end -->
                    <div class="div-w100-h100 plr30 prr30 ptr30 pbr30 img100 bs" id="columnarDiv">

                    </div>
                </div>
            </div>
            <div class="smfw-r-btn smfw-r-btn-szgl main-div-box cun-box-bg-ext1">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 标题 -->
                <div class="flex flex-jc box-title-ext1">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">资产类型占比情况</p>
                    </div>
                </div>
                <div class="div-w-h-com" id="zczb">
                    <!-- 暂无数据 start -->
                    <div class="none-data-ext1 hide" id="pieDivZwsj">
                        <img class="none-data-p1"
                             src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                    <!-- 暂无数据 end -->
                    <div class="div-w100-h100 szgl-ext1 plr30 prr30 ptr10 pbr10 bs" id="pieDiv">

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="contextMenu" id="myMenu2" style="display:none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>

<!-- 提示套餐弹窗 -->
<div class="mask mask-taocan02 hide " id="tipsPopup">
    <div class="mask-bg"></div>
    <div class="div-taocan-com plr100 prr100 bs">
        <div class="mc-close flex flex-ac flex-jc" id="tipsCloseButton"><i class="i1 mrr5"></i><em>关闭</em></div>
        <div class="font-size-r18">
            <p class="text-align-c mtr50 mbr30"><img class="img-557-36" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/title2.png"/></p>
            <p class="text-align-c font-size-r24 cor-80" id="packageVersionText">&nbsp;</p>
        </div>
        <div class="div-tc mtr60">
            <div class="tc-item-text fl" id="tipsBasicEdition">
                <div class="tc-item">
                    <div class="h-80 div-jc w100 clearfix">
                        <p class="font-size-r20 cor-fff font-bold text-align-c ptr10 pbr5">基础版</p>
                        <p class="font-size-r13 cor-fff text-align-c"><em class="em-rem"></em><em class="font-size-r20 font-bold mrr5 mlr5">1200</em><em>元</em><em class="mlr5 mrr5">/</em><em>年</em></p>
                    </div>
                    <div class="font-size-r14 w100 mtr30 ">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 bor-radius20">享4大专题，3大应用，24项功能</span>
                        </p>
                    </div>
                    <div class="h-130 mbr20">
                        <div class=" h100 font-size-r14 cor-333 posi-rela">
                            <div class="w100 posi-ab ">
                                <div class="w50 fl text-align-c">工作台</div>
                                <div class="w50 fl text-align-c">村务通知</div>
                                <div class="w50 fl text-align-c">疫情防控</div>
                                <div class="w50 fl text-align-c">村务政务</div>
                            </div>
                        </div>
                    </div>

                    <div class="font-size-r14 w100">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 span-yyb">通知语音包（500分钟/月）</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="tc-item-text fl mlr40 mrr40" id="tipsStandardEdition">
                <div class="tc-item">
                    <div class="h-80 div-bz w100 clearfix">
                        <p class="font-size-r20 cor-fff font-bold text-align-c ptr10 pbr5">标准版</p>
                        <p class="font-size-r13 cor-fff text-align-c"><em class="em-rem"></em><em class="font-size-r20 font-bold mrr5 mlr5">3600</em><em>元</em><em class="mlr5 mrr5">/</em><em>年</em></p>
                    </div>
                    <div class="font-size-r14 w100 mtr30 ">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 bor-radius20">享6大专题，3大应用，34项功能</span>
                        </p>
                    </div>
                    <div class="h-130 mbr20">
                        <div class="w100 h100 font-size-r14 cor-333  posi-rela">
                            <div class="w100 posi-ab plr30 prr30 bs">
                                <div class="w33 fl text-align-c">工作台</div>
                                <div class="w33 fl text-align-c">村务通知</div>
                                <div class="w33 fl text-align-c">平安乡村</div>
                                <div class="w33 fl text-align-c">疫情防控</div>
                                <div class="w33 fl text-align-c">村务政务</div>
                                <div class="w33 fl text-align-c">智慧党建</div>
                            </div>
                        </div>
                    </div>

                    <div class="font-size-r14 w100">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 span-yyb">通知语音包（1500分钟/月）</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="tc-item-text  fl">
                <div class="tc-item">
                    <div class="h-80 div-jx w100 clearfix">
                        <p class="font-size-r20 cor-fff font-bold text-align-c ptr10 pbr5">尊享版</p>
                        <p class="font-size-r13 cor-fff text-align-c"><em class="em-rem"></em><em class="font-size-r20 font-bold mrr5 mlr5">18000</em><em>元</em><em class="mlr5 mrr5">/</em><em>年</em></p>
                    </div>
                    <div class="font-size-r14 w100 mtr30 ">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 bor-radius20">享10大专题，3大应用，52项功能</span>
                        </p>
                    </div>
                    <div class="h-130 ptr30 bs mbr20">
                        <div class=" h100 font-size-r14 cor-333 posi-rela">
                            <div class="w100 posi-ab plr30 prr30 bs">
                                <div class="w33 fl text-align-c">工作台</div>
                                <div class="w33 fl text-align-c">村务通知</div>
                                <div class="w33 fl text-align-c">平安乡村</div>
                                <div class="w33 fl text-align-c">疫情防控</div>
                                <div class="w33 fl text-align-c">村务政务</div>
                                <div class="w33 fl text-align-c">智慧党建</div>
                                <div class="w33 fl text-align-c">乡村特色</div>
                                <div class="w33 fl text-align-c">积分银行</div>
                                <div class="w33 fl text-align-c">三农服务</div>
                                <div class="w33 fl text-align-c">乡村三资</div>
                            </div>

                        </div>
                    </div>

                    <div class="font-size-r14 w100">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 span-yyb">通知语音包（10000分钟/月）</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="div-kxb flex">
            <div class="div-kxb-l fl mrr30">
                <p class="font-size-r18 font-bold cor-d61e1e ptr5">可<br>选<br>包</p>
            </div>
            <div class="flex1">
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-01.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">视频监控</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-02.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">智慧音箱</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-03.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">乡村VR</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-04.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">语音包</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-05.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">更多</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${UI_DOMAIN}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
<script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${UI_DOMAIN}/web-assets/common/js/echarts4.2.0.min.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>


<script>

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

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
        init()
        $('.h-o').niceScroll({
            cursorcolor: "#dfa29d",
            cursoropacitymax: 1,
            cursorwidth: ".03rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: true,
        })
    });

    function init() {
        initClickDiv();
        //轮播图
        initPic();
        //echars图数据
        initEchartsData();
        //柱状图
        // initColumnar();
        //饼图
        // initPie();
    }

    function initClickDiv() {
        // 特色乡村-村情村貌轮播图
        // bindRightMouse('lb');
        // 资金情况
        bindRightMouse('zjqk1');
        bindRightMouse('zjqk2');
        //合同情况
        bindRightMouse('htqk');

        bindRightMouse('szgl')
        // 各类资源构成情况
        bindRightMouse('zygc');
        // 资产类型占比情况
        bindRightMouse('zczb');
    }

    // 绑定右键
    function bindRightMouse(id) {
        var type = 0;
        $('#' + id).contextMenu('myMenu2', { //菜单样式
            menuStyle: {
                border: 'none',
                width: 'auto',
                padding: '0',
                borderRadius: '4px'

            }, //菜单项样式
            itemStyle: {
                fontSize: '14px',
                color: '#666',
                padding: '5px 15px',
                fontWeight: 'normal',
                border: 'none',
                borderRadius: '4px',
                backgroundColor: 'rgba(189,173,173,0.3)',
                marginTop: '2px'
            }, //菜单项鼠标放在上面样式
            itemHoverStyle: {
                color: '#333 ',
                fontWeight: 'bold',
                backgroundColor: 'none',
                border: 'none'
            }, //事件
            bindings: {
                'item_1': function (t) {
                    switch (t.id) {
                        // 特色乡村-村情村貌轮播图
                        case 'szgl':
                            type = 41;
                            break;
                        // 资金情况
                        case 'zjqk1':
                            type = 42;
                            break;
                        // 资金情况
                        case 'zjqk2':
                            type = 42;
                            break;
                        // 合同情况
                        case 'htqk':
                            type = 43;
                            break;
                        // 各类资源构成情况
                        case 'zygc':
                            type = 44;
                            break;
                        // 资产类型占比情况
                        case 'zczb':
                            type = 45;
                            break;
                        default:
                            type = 0;
                    }
                    if (type != 0) {
                        window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                    }

                },
                'item_2': function (t) {
                    location.reload();
                }
            }
        });
    }

    //echars图数据
    function initEchartsData() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/fundManagement/bunchData.jhtml',
            data: {
                orgCode: '${orgCode!''}'
            },
            dataType: 'json',
            success: function (data) {
                if (data != null && data != undefined) {
                    if (data.sum != undefined) {
                        $('#contractCount').text(data.sum.contractCount)
                        var sumIncome = (data.sum.sumIncome / 10000).toFixed(2)
                        $('#sumIncome').text(sumIncome)
                        var sumPay = (data.sum.sumPay / 10000).toFixed(2)
                        $('#sumPay').text(sumPay)
                    }
                    if (data.resList != undefined) {
                        var nameList = []
                        var dataList = []
                        $.each(data.resList, function (i, val) {
                            var name = val.typeName == null ? '' : val.typeName
                            nameList.push(name);
                            var json = {
                                name: name,
                                value: val.count == null ? 0 : val.count,
                                itemStyle: {
                                    color: '#ed2315'
                                },
                            }
                            dataList.push(json);
                        })
                        if(dataList.length > 0){
                            initColumnar(nameList, dataList)
                        }
                        else{
                            $("#columnarDivZwsj").show()
                            $("#columnarDiv").hide()
                        }
                    }
                    if (data.assList != undefined) {
                        var dataList = []
                        $.each(data.assList, function (i, val) {
                            var json = {
                                name: val.typeName == null ? '' : val.typeName,
                                value: val.count == null ? 0 : val.count,
                            }
                            dataList.push(json);
                        })
                        if(dataList.length > 0){
                            initPie(dataList)
                        }else{
                            $("#pieDivZwsj").show()
                            $("#pieDiv").hide()
                        }
                    }
                }
                // console.log(data)
                $('.h-x').getNiceScroll().resize()
            },
            error: function (data) {
                $.messager.alert('错误', '连接超时！', 'error');
            },
            complete: function () {
                // modleclose(); //关闭遮罩层
            }
        });
    }

    //轮播图
    function initPic() {
        var map = {
            orgCode: "${orgCode!''}",
            page: 1,
            rows: 5,
        };
        map.catalogId = '10000116';
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        // map.otherpage = 1;
        var url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';
        $.ajax({
                type: 'POST',
                url: url,
                data: map,
                dataType: 'jsonp',
                jsonp: "jsoncallback",
        <#--$.ajax({-->
        <#--    type: 'POST',-->
        <#--    url: '${rc.getContextPath()}/dcl/threeCapital/getPzListData.jhtml',-->
        <#--    data: {-->
        <#--        page: 1,-->
        <#--        rows: 20,-->
        <#--        catalogId: '10000116',-->
        <#--        orgCode: '${orgCode!''}',-->
                <#--regionCode: '${orgCode!''}',-->
                // isEndPubDate:'no',
                // isPic:'yes',
                // isPubOrg:'yes',
                // isTop:'yes',
                // tKey:'bannerManage',
            // },
            success: function (data) {
                $('#picDiv').empty()
                if (data.rows != null && data.total > 0) {
                    var html = '';
                    $.each(data.rows, function (i, val) {
                        var pic = '${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/img01.png'
                        var fileName = val.fileName == null || val.fileName == undefined ? pic : '${FILE_URL}' + val.fileName
                        var infoOpenId = val.infoOpenId
                        html += '<div onclick="showMore(\'10000116\',\'村情村貌\',' + infoOpenId + ')" class="swiper-slide">\n' +
                            '        <div class="h100 flex flex-ac img100">\n' +
                            '           <img class="" style="cursor:pointer;" src="' + fileName + '"/>\n' +
                            '        </div>\n' +
                            '  </div> ';
                    })
                    $('#picDiv').append(html);
                    var swiper = new Swiper(".szgl-swiper1.swiper-container", {
                        // touchRatio : 0,
                        loop: false,
                        slidesPerView: 'auto',
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        pagination: {
                            el: ".szgl-swiper1 .swiper-pagination",
                        },
                    });
                } else {
                    $('#picDivZwsj').show()
                    $('#picDiv').hide()
                }
                $('.h-x').getNiceScroll().resize()
            },
            error: function (data) {

            },
            complete: function () {
            }
        });
    }

    function showMore(catalogId, title, infoOpenId) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=' +
            catalogId + '&module=ztdr&title=' + encodeURI(title) + '&infoOpenId=' + infoOpenId +'&regionCode=${orgCode!}'
        );
    }

    //柱状图
    function initColumnar(nameList, dataList) {
        var myChart = echarts.init(document.getElementById('columnarDiv'));
        var option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {type: 'shadow'},
            },
            grid: {
                left: '4%',
                right: '4%',
                bottom: '8%',
                containLabel: true,
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {show: false},
                    axisLabel: {
                        textStyle: {fontSize: 0.14 * rem, color: '#4D4D4D'},
                        interval: 0,
                        rotate: 40
                    },
                    axisLine: {
                        lineStyle: {color: '#ed2315'},
                    },
                    data: nameList,
                },
            ],
            yAxis: {
                type: 'value',
                show: false,
                splitLine: {
                    show: false,
                },
                nameTextStyle: {fontSize: 0.14 * rem, color: '#4D4D4D'},
                axisLabel: {
                    show: false,
                },
                axisTick: {show: false},
                axisLine: {
                    lineStyle: {color: '#707070'},
                },
            },
            series: [
                {
                    name: '',
                    type: 'bar',
                    barWidth: '40%',
                    itemStyle: {
                        normal: {
                            barBorderRadius: [5, 5, 0, 0],
                            label: {
                                show: true, //开启显示
                                position: 'top', //在上方显示
                                textStyle: {
                                    //数值样式
                                    color: 'black',
                                    fontSize: 0.16 * rem,
                                },
                            },
                        },
                    },
                    data: dataList,
                },
            ],
        };
        //console.log(option);
        myChart.setOption(option);
        myChart.resize();
    }

    //饼图
    function initPie(data) {
        var myChart = echarts.init(document.getElementById('pieDiv'));
        // var data = [{
        //     "name": "1111",
        //     "value": 10
        // }, {
        //     "name": "2222",
        //     "value": 10
        // }, {
        //     "name": "3333",
        //     "value": 10
        // }, {
        //     "name": "4444",
        //     "value": 10
        // }, {
        //     "name": "5555",
        //     "value": 10
        // }, {
        //     "name": "6666",
        //     "value": 20
        // }, {
        //     "name": "7777",
        //     "value": 30
        // }, ]

        // var a = ['#fc645a', '#d94f43', '#5fc8ff',  '#649abf', '#ffd05f', '#dba047', '#ff895f', '#db6a47', '#35dc87', '#45a965']

        var option = {

            color: ['#fc645a', '#5fc8ff', '#ffd05f', '#ff895f', '#35dc87', '#A0CE3A', '#31C5C0', '#1E9BD1', '#0F347B', '#585247', '#7F6AAD', '#009D85', "rgba(250,250,250,0.3)"],
            grid: {
                bottom: 1.5 * rem,
                left: 1 * rem,
                right: '10%'
            },
            legend: {
                orient: 'vertical',
                top: "middle",
                right: "5%",
                textStyle: {
                    fontSize: 0.15 * rem,

                },
                icon: 'circle',
                data: data,
            },
            series: [
                // 主要展示层的
                {
                    radius: ['40%', '61%'],
                    center: ['35%', '50%'],
                    type: 'pie',
                    label: {
                        normal: {
                            show: true,
                            formatter: "{d}%",
                            textStyle: {
                                fontSize: 0.3 * rem,

                            },
                            position: 'outside'
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    labelLine: {
                        normal: {
                            show: true,
                            length: 10,
                            length2: 10
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    name: "",
                    data: data,

                },
                // 边框的设置
                {
                    radius: ['40%', '44%'],
                    center: ['35%', '50%'],
                    type: 'pie',
                    label: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: false
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: false
                        }
                    },
                    animation: false,
                    tooltip: {
                        show: false
                    },
                    data: [{
                        value: 1,
                        itemStyle: {
                            color: "rgba(250,250,250,0.3)",
                        },
                    }],
                }
            ]
        };
        //console.log(option);
        myChart.setOption(option);
        myChart.resize();
    }

    function goback() {
        window.history.back();
    }

    // 设置提示弹窗内容并打开。
    function setTipsPopupContent(functionName) {
        let positionCode = '${positionCode!''}';
        let packageVersionText = $('#packageVersionText');

        if (positionCode) {
            if (positionCode === '00001') {   // 福建省基础版。
                let text = '';
                if (functionName === '智慧党建' || functionName === '平安乡村') {
                    text = '标准版&尊享版';
                } else {
                    text = '尊享版';
                }
                packageVersionText.html('该功能属于<span class="mlr5 mrr5 cor-ff4848 font-bold">' + text + '</span>，需联系当地电信分局升级为下方对应版本后方可激活。');
                $('#tipsBasicEdition').addClass('active');
                $('#tipsStandardEdition').removeClass('active');

            } else if (positionCode === '00002') {   // 福建省标准版。
                packageVersionText.html('该功能属于<span class="mlr5 mrr5 cor-ff4848 font-bold">尊享版</span>，需联系当地电信分局升级为下方对应版本后方可激活。');
                $('#tipsBasicEdition').removeClass('active');
                $('#tipsStandardEdition').addClass('active');

            } else {
                packageVersionText.html('当前账号未开通下方套餐，需联系当地电信分局开通后方可使用。');
                $('#tipsBasicEdition').removeClass('active');
                $('#tipsStandardEdition').removeClass('active');
            }
        } else {
            packageVersionText.html('当前账号未开通下方套餐，需联系当地电信分局开通后方可使用。');
            $('#tipsBasicEdition').removeClass('active');
            $('#tipsStandardEdition').removeClass('active');
        }

        $('.mask-taocan02').addClass('show');
    }
</script>
<#include "/dcl/szsh/more_function.ftl" />

</body>
</html>