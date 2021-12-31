<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>村务政务</title>

    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN!''}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN!''}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css"/>
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/com-gd.css"/>
    <link rel="stylesheet" type="text/css"
          href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-cwzw.css"/>
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${UI_DOMAIN!''}/web-assets/common/js/calc-rem.js"></script>
    <script src="${UI_DOMAIN!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${UI_DOMAIN!''}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${UI_DOMAIN!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script type="text/javascript" src="${uiDomain!''}/js/layer/layer.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
</head>

<body>
<div class="h100  djyl-bj-padd02 bs ">
    <div class="h100 prr25 bs clearfix h-x posi-rela">
        <!-- 左右结构 -->
        <!-- 左 -->
        <div class="fl djyl-zwgk-w">
            <!-- 轮播 -->
            <div class="w100 djyl-h636 cun-box-bg-ext1 posi-rela mbr18">
                <i class="cun-box-bg-item1 cun-box-bg-item1-lt"></i>
                <i class="cun-box-bg-item1 cun-box-bg-item1-rt"></i>
                <i class="cun-box-bg-item1 cun-box-bg-item1-lb"></i>
                <i class="cun-box-bg-item1 cun-box-bg-item1-rb"></i>
                <!-- swiper -->
                <!-- 图片 -->
                <div class="swiper-container swiper01 w100 h100" id="cqfcD">
                    <div class="swiper-wrapper" id="imgPan">

                    </div>
                    <div class="swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
                </div>
            </div>
            <!-- 村情介绍 -->
            <div class="w100 djyl-h309 cun-box-bg-ext2 posi-rela" id="cqjsD">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 内容 -->
                <div class="plr20 bs h100 posi-rela">
                    <div class="prr20 bs">
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">村情介绍</p>
                            </div>
                        </div>
                    </div>
                    <!-- 左右结构 -->
                    <div class="mtr45 djyl-zwgk-nr-h clearfix plr10 posi-rela">
                        <!-- 左 -->
                        <div class="fl">
                            <!-- img -->
                            <div class="img100 djyl-zwgk-img bor" id="cqjspic">

                            </div>
                        </div>
                        <!-- 右 -->
                        <div class="fr djyl-zwgk-cxjs-w">
                            <!-- djyl-zwgk-text-h -->
                            <div class="h100 h-x prr20 bs">
                                <p class="font-size-r16 cor-333 let-sp1 line-height-r24 h-x" id="cqjs">

                                </p>
                            </div>
                            <!-- 更多 -->
                            <!-- 更多功能 -->
                            <!-- <p class="mtr10 font-bold clearfix">
                                <em class="font-size-r15 cor-333 fl">更多功能</em>
                                <span class="fr djyl-span-bot-bor-w"></span>
                            </p>
                            <ul class="mtr10 djyl-ul-gdgn clearfix">
                                <li class="fl active">
                                    <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">三务公开></a>
                                </li>
                                <li class="fl">
                                    <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">村规民约></a>
                                    <ul class="djyl-dj-ul plr20 prr20">
                                        <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c active">
                                            村规民约
                                        </li>
                                        <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c">
                                            村规民约
                                        </li>
                                        <li class="text-align-c ptr10 pbr10">
                                            村规民约
                                        </li>
                                    </ul>
                                </li>
                                <li class="fl">
                                    <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">家风家训></a>
                                </li>
                                <li class="fl">
                                    <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">移风易俗></a>
                                </li>
                            </ul> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右 -->
        <div class="fr djyl-zwgk-w534">
            <!-- 村务公开 -->
            <div class="w100 djyl-h309 cun-box-bg-ext2 posi-rela mbr18" id="cwgkD">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 内容 -->
                <div class="plr20 h100 posi-rela bs">
                    <!-- 标题 -->
                    <div class="prr20 bs">
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">村务公开</p>
                            </div>
                            <a href="Javascript:void(0);" class="flex flex-ac box-more-ext1 posi-abso">
                                <p class="font-size-r14 text-lh1 let-sp1"
                                   onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000003&module=ztdr&title=村务公开&regionCode=${regionCode!''}');"
                                   style="cursor:pointer;">
                                    更多</p>
                                <i></i>
                            </a>
                        </div>
                    </div>
                    <!-- 内容数据 -->
                    <ul class="mtr20 djyl-zwgk-nr-h plr10 prr20 bs h-x" id="cwgk">

                    </ul>
                </div>
            </div>
            <!-- 政策宣传 -->
            <div class="w100 djyl-h309 cun-box-bg-ext2 posi-rela mbr18" id="zcxcD">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 内容 -->
                <div class="plr20 bs h100 posi-rela bs">
                    <div class="prr20 bs">
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold cor-666 text-align-c line-height-r32">政策宣传</p>
                            </div>
                            <a href="Javascript:void(0);" class="flex flex-ac box-more-ext1 posi-abso">
                                <p class="font-size-r14 text-lh1 let-sp1"
                                   onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000006&module=ztdr&title=政策宣传&regionCode=${regionCode!''}');"
                                   style="cursor:pointer;">
                                    更多</p>
                                <i></i>
                            </a>
                        </div>
                    </div>
                    <!-- 内容数据 -->
                    <ul class="mtr20 djyl-zwgk-nr-h plr10 prr5 h-x prr20 bs" id="zcxc">

                    </ul>
                </div>
            </div>
            <!-- 通知公告（原办事指南）。 -->
            <div class="w100 djyl-h309 cun-box-bg-ext2 posi-rela" id="bsznD">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 内容 -->
                <div class="plr20 bs h100 posi-rela">
                    <div class="prr20 bs">
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">通知公告</p>
                            </div>
                            <a href="Javascript:void(0);" class="flex flex-ac box-more-ext1 posi-abso">
                                <p class="font-size-r14 text-lh1 let-sp1"
                                   onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000020&module=ztdr&title=通知公告&regionCode=${regionCode!''}');"
                                   style="cursor:pointer;">
                                    更多</p>
                                <i></i>
                            </a>
                        </div>
                    </div>
                    <!-- 内容数据 -->
                    <ul class="mtr20 djyl-zwgk-nr-h plr10 prr5 h-x prr20 bs" id="bszn">

                    </ul>
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
<script>
    // 更多功能点击事件
    $('.szsh-mbc-content-box').on('click', '.szsh-mbcc-item', function () {
        $(this).addClass('active').siblings().removeClass('active');
    });
    // 更多功能收起和展开事件
    $('.szsh-more-closed').click(function () {
        $(this).parents('.szsh-mb-content').animate({right: "-1.14rem"}, 'linear', function () {
            $('.szsh-m-box').removeClass('hide');
        })
    });
    $('.szsh-m-box').click(function () {
        $('.szsh-m-box').addClass('hide');
        $(this).siblings('.szsh-mb-content').animate({right: ".1rem"}, 'linear')
    });
    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true
    });

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

    bindRightMouse('cqfcD');
    bindRightMouse('cqjsD');
    bindRightMouse('cwgkD');
    bindRightMouse('zcxcD');
    bindRightMouse('bsznD');

    // 绑定右键
    function bindRightMouse(id) {
        var type = 111;
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
                        // 党员情况
                        case 'cqfcD':
                            type = 111;
                            break;
                        // 图文统计情况
                        case 'cqjsD':
                            type = 112;
                            break;
                        // 基本情况
                        case 'cwgkD':
                            type = 113;
                            break;
                        // 领导班子
                        case 'zcxcD':
                            type = 114;
                            break;
                        // 党建动态
                        case 'bsznD':
                            type = 115;
                            break;
                        default:
                            type = 111;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                },
                'item_2': function (t) {
                    location.reload();
                }
            }
        });
    }

    xcPictureList();

    function xcPictureList() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/indexContent/detatil.jhtml',
            data: {
                code: 'cqfc',
                regionCode:${regionCode!''}
            },
            dataType: 'json',
            success: function (data) {
                if (data && data.bo) {
                    var str = '';

                    let type = data.bo.type
                    // let url = data.bo.url
                    let dataList = data.bo.attList
                    for (i = 0; dataList && type==='01' && i < dataList.length; i++) {
                        str += '<div class="swiper-slide img100">'
                            + '<img src="${FILE_URL}' + dataList[i].filePath + '" alt="">'
                            + '</div>';
                    }
                    $('#imgPan').html(str);

                    if (dataList && dataList.length > 1) {
                        var mySwiper = new Swiper('.swiper01', {
                            speed: 2000,
                            autoplay: {
                                delay: 3000,
                                stopOnLastSlide: true,
                                disableOnInteraction: false,
                            },//可选选项，自动滑动
                            spaceBetween: 20,
                            loop: true,
                            pagination: {
                                el: '.swiper-pagination',
                                clickable: true
                            },
                            // direction: 'vertical',
                            observer: true, //修改swiper自己或子元素时，自动初始化swiper
                            observeParents: true //修改swiper的父元素时，自动初始化swiper
                        })
                    }
                }
            },
            error: function (data) {
                console.log("获取图片数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    findNoticeList('10000003');
    findNoticeList('10000005');
    findNoticeList('10000006');
    // findNoticeList(1);
    findNoticeList('10000020');   // 通知公告（原办事指南）。
    function findNoticeList(catalogId) {
        var map = {
            orgCode: "${regionCode!''}",
            page: 1,
            rows: 10
        };
        map.catalogId = catalogId;
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        var url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';
        if (catalogId == 1) {
            url = '${WECHAT_DOMAIN!''}/cct/handlingMatters/listDataForJsonp.json?jsonpcallback=""';
            map = {
                orgCode: "${regionCode!''}",
                page: 1,
                rows: 10
            };
        } else if (catalogId == '10000005') {
            map.onlyShowMyOrg = 'yes';
            map.otherpage = 1;
        } else if (catalogId == '10000003') {
            map.onlyShowMyOrg = 'yes';
            map.otherpage = 1;
        }
        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                var str = '';
                var list = data.rows;
                var dateStr = '';
                if (catalogId == '10000003') {
                    for (i = 0; i < list.length; i++) {
                        dateStr = list[i].pubDate;

                        str += '<li class="clearfix mtr15" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000003&module=ztdr&title=村务公开&regionCode=${regionCode!''}&infoOpenId=' + list[i].infoOpenId + '\');" style="cursor:pointer;">' +
                            '<span class="font-size-r15 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span" title="' + list[i].title + '">' + list[i].title + '</span>' +
                            '<span class="fr font-size-r15 cor-666 let-sp1">' + dateStr.substring(0, 10) + '</span>' +
                            '</li>';
                    }
                    $('#cwgk').html(str);
                } else if (catalogId == '10000005') {
                    if (list.length == 0) {
                        return;
                    }
                    if (list[0].fileName != "" && list[0].fileName != null) {
                        $('#cqjspic').html('<img src="${FILE_URL}' + list[0].fileName + '" alt="">');
                    }
                    noticeDetail(catalogId, list[0].infoOpenId);
                } else if (catalogId == '10000006') {
                    for (i = 0; i < list.length; i++) {
                        dateStr = list[i].pubDate;
                        if (list[i].fileName != "" && list[i].fileName != null) {
                            str += '<li class="clearfix mtr15 pbr15 djyl-zwgk-bottom-bor djyl-h82" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000006&module=ztdr&title=政策宣传&regionCode=${regionCode!''}&infoOpenId=' + list[i].infoOpenId + '\');" style="cursor:pointer;">' +
                                '<div class="djyl-zwgk-li-img mbr10 img100 fl">' +
                                '<img src="${FILE_URL}' + list[i].fileName + '" alt="">' +
                                '</div>' +
                                '<span class="font-size-r15 cor-333 let-sp1 fl text-line-c2 djyl-zwgk-li-span-po djyl-zwgk-li-span02 line-height-r32 mlr15" title="' + list[i].title + '">' + list[i].title + '</span>' +
                                ' <span class="fr font-size-r15 cor-666 let-sp1 djyl-zwgk-li-span-po">' + dateStr.substring(0, 10) + '</span>' +
                                '</li>';
                        } else {
                            str += '<li class="clearfix mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000006&module=ztdr&title=政策宣传&regionCode=${regionCode!''}&infoOpenId=' + list[i].infoOpenId + '\');" style="cursor:pointer;">' +
                                '<span class="font-size-r15 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span" title="' + list[i].title + '">' + list[i].title + '</span>' +
                                '<span class="fr font-size-r15 cor-666 let-sp1">' + dateStr.substring(0, 10) + '</span>' +
                                '</li>';
                        }
                    }
                    $('#zcxc').html(str);
                    // }else if(catalogId==1){
                } else if (catalogId === '10000020') {
                    for (i = 0; i < list.length; i++) {
                        str += '<li class="clearfix mtr15 pbr10 plr35 posi-rela djyl-zwgk-shouzhi" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000020&module=ztdr&title=通知公告&regionCode=${regionCode!''}&infoOpenId=' + list[i].infoOpenId + '\');" style="cursor:pointer;">' +
                            '<span class="font-size-r15 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span" title="' + list[i].title + '">' + list[i].title + '</span>' +
                            '<span class="fr font-size-r15 cor-666 let-sp1">' + list[i].pubDate.substr(0, 10) + '</span>' +
                            '</li>';
                    }
                    $('#bszn').html(str);
                }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function showNotice(id, staticUrl, catalogId) {
        var url = '${gbpDomain!''}/gbp/commonInfoOpen/homeShow.jhtml?mode=view&noTop=1&infoOpenId=' + id;
        if (staticUrl != null && staticUrl != '') {
            url = staticUrl;
        }
        if (catalogId == 1) {
            url = '${WECHAT_DOMAIN!''}/cct/handlingMatters/view.mhtml?remark=1&hmId=' + id;
        }
        var pages = layer.open({
            type: 2, //page层
            //id:"mask-eventID",
            area: ['1000px', '620px'],
            title: '信息详情',
            closeBtn: 1,
            maxmin: false,
            shade: 0.6, //遮罩透明度
            shift: 2, //0-6的动画形式，-1不开启
            content: url,
            cancel: function () {
            }
        });
    }

    function noticeDetail(catalogId, infoOpenId) {
        var map = {};
        map.infoOpenId = infoOpenId;
        map.mode = 'view';
        var url = '${gbpDomain!''}/gbp/commonInfoOpen/detailForJsonp.json?jsonpcallback=""';
        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                var overView = data.overView;
                overView = overView.replaceAll("<strong>", "");
                overView = overView.replaceAll("</strong>", "");
                overView = overView.replaceAll("<p>", "");
                overView = overView.replaceAll("</p>", "");
                overView = overView.replaceAll("\n", "");
                overView = overView.replaceAll("\t", "");
                overView = overView.replaceAll(" ", "");
                $('#cqjs').html(overView);
            },
            error: function (data) {
                console.log("获取村情介绍数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    $("#getpan").mouseover(function () {
        $("#getpan0").show();
    })
    $("#getpan").mouseout(function () {
        $("#getpan0").hide();
    })

    function openpage(url) {
        window.open(url);
    }


    function refresh() {
        location.reload();
    }

    setInterval(function () {
        findNoticeList('10000003');
        findNoticeList('10000006');
        findNoticeList(1);
    }, 15000);

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
</body>
</html>