<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>党建引领</title>

    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/com-gd.css" />
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-djyl.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${UI_DOMAIN!''}/web-assets/common/js/calc-rem.js"></script>
    <script src="${UI_DOMAIN!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${UI_DOMAIN!''}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${UI_DOMAIN!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script src="${uiDomain!''}/web-assets/common/js/echarts4.2.0.min.js"></script>
    <script type="text/javascript" src="${uiDomain!''}/js/layer/layer.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
</head>

<body>
    <div class="h100 djyl-bj djyl-bj-padd bs">
        <div class="h100 prr20 clearfix h-x">
            <!-- 左右结构 -->
            <!-- 左 -->
            <div class="fl djyl-w932 h-o">
                <!-- 党员情况 -->
                <div class="w100 djyl-h351 mbr15 cun-box-bg-ext2" id="dyqk">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">党员情况</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="clearfix mtr30">
                        <div class="fl plr35">
                            <!-- 数量 -->
                            <div class="clearfix">
                                <!-- 男性数量 -->
                                <div class="fl djyl-w230">
                                    <div class="fl djyl-icon img100 mtr5">
                                        <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon01.png" alt="">
                                    </div>
                                    <div class="fl mlr20">
                                        <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="mannum">0</em>人</p>
                                        <p class="cor-666 font-size-r15">男性数量</p>
                                    </div>
                                </div>
                                <!-- 女性数量 -->
                                <div class="fl djyl-w230 mlr5">
                                    <div class="fl djyl-icon img100 mtr5">
                                        <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon02.png" alt="">
                                    </div>
                                    <div class="fl mlr20">
                                        <p class="color-huang01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="womannum">0</em>人</p>
                                        <p class="cor-666 font-size-r15">女性数量</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 占比 -->
                            <div class="clearfix mtr50">
                                <div class="djyl-echarts01 img100 fl" id="sexpan">
                                    <!-- #ec0501 #ff7e00 -->
                                </div>
                                <div class="mlr30 fl mtr20">
                                    <p class="color-red01 font-aldr font-bold font-size-r16"><em class="font-size-r46 mrr5" id="sexper">0</em>%</p>
                                    <p class="font-size-r15 cor-333">男性占比（最多占比）</p>
                                </div>
                            </div>
                        </div>
                        <div class="fr prr60 djyl-echarts02 img100 ptr20 bs" id="agepan" style="margin-left:-50px; widht:240px;">
                            <!-- 柱颜色 #ed2315 #feac00 #ffd499 #fbf20c #e5c5c3 -->
                            <!-- 字体颜色 #333333 -->
                        </div>
                    </div>
                </div>
                <!-- 图文统计情况 -->
                <div class="w100 djyl-h295 mbr15 cun-box-bg-ext2" id="twtjqk">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">图文统计情况</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <ul class="mtr35 plr5 prr5">
                        <li class="line-height-r24 font-size-0 clearfix mbr30">
                            <span class="djyl-span-w120 text-line-c1 font-size-r16 cor-333 text-align-r mrr5 fl">先锋模范</span>
                            <em class="djyl-em-w50 text-align-r text-line-c1 font-aldr color-red01 font-bold font-size-r22 mrr10 fl" id="unitnum">0</em>
                            <p class="djyl-p-w200 djyl-p-jd fl">
                                <span class="jindu" data-per="20" id="unitper"></span>
                            </p>
                        </li>
                        <li class="line-height-r24 font-size-0 clearfix mbr30">
                            <span class="djyl-span-w120 text-line-c1 font-size-r16 cor-333 text-align-r mrr5 fl">党务公开</span>
                            <em class="djyl-em-w50 text-align-r text-line-c1 font-aldr color-red01 font-bold font-size-r22 mrr10 fl" id="dwnum">0</em>
                            <p class="djyl-p-w200 djyl-p-jd fl">
                                <span class="jindu" data-per="100" id="dwper"></span>
                            </p>
                        </li>
                        <li class="line-height-r24 font-size-0 clearfix mbr30">
                            <span class="djyl-span-w120 text-line-c1 font-size-r16 cor-333 text-align-r mrr5 fl">组织生活会</span>
                            <em class="djyl-em-w50 text-align-r text-line-c1 font-aldr color-red01 font-bold font-size-r22 mrr10 fl" id="meetnum">0</em>
                            <p class="djyl-p-w200 djyl-p-jd fl">
                                <span class="jindu" data-per="10" id="meetper"></span>
                            </p>
                        </li>
                        <li class="line-height-r24 font-size-0 clearfix">
                            <span class="djyl-span-w120 text-line-c1 font-size-r16 cor-333 text-align-r mrr5 fl">党建新闻</span>
                            <em class="djyl-em-w50 text-align-r text-line-c1 font-aldr color-red01 font-bold font-size-r22 mrr10 fl" id="newnum">0</em>
                            <p class="djyl-p-w200 djyl-p-jd fl">
                                <span class="jindu" data-per="30" id="newper"></span>
                            </p>
                        </li>
                    </ul>
                </div>
                <!-- 基本情况 -->
                <div class="w100 djyl-h295 cun-box-bg-ext2" id="jbqk">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">基本情况</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="clearfix plr35 prr35 bs">
                        <div class="djyl-div-jbxx-box mtr50 fl">
                            <div class="fl djyl-icon02 img100 mtr5">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/djyl/icon01.png" alt="">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="populationCount">0</em>人</p>
                                <p class="cor-666 font-size-r15">总人口数量</p>
                            </div>
                        </div>
<#--                        <div class="djyl-div-jbxx-box mtr50 fl">-->
<#--                            <div class="fl djyl-icon02 img100 mtr5">-->
<#--                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/djyl/icon02.png" alt="">-->
<#--                            </div>-->
<#--                            <div class="fl mlr20">-->
<#--                                <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr">0</em>个</p>-->
<#--                                <p class="cor-666 font-size-r15">乡镇数量</p>-->
<#--                            </div>-->
<#--                        </div>-->
                        <div class="djyl-div-jbxx-box mtr50 fl">
                            <div class="fl djyl-icon02 img100 mtr5">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/djyl/icon03.png" alt="">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-huang01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="managernum">0</em>个</p>
                                <p class="cor-666 font-size-r15">党支部管理人员数量</p>
                            </div>
                        </div>
<#--                        <div class="djyl-div-jbxx-box mtr50 fl">-->
<#--                            <div class="fl djyl-icon02 img100 mtr5">-->
<#--                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/djyl/icon04.png" alt="">-->
<#--                            </div>-->
<#--                            <div class="fl mlr20">-->
<#--                                <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr">8475</em>人</p>-->
<#--                                <p class="cor-666 font-size-r15">常住人口</p>-->
<#--                            </div>-->
<#--                        </div>-->
                        <div class="djyl-div-jbxx-box mtr50 fl">
                            <div class="fl djyl-icon02 img100 mtr5">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/djyl/icon05.png" alt="">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="dxznum">0</em>个</p>
                                <p class="cor-666 font-size-r15">党小组数量</p>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr50 fl">
                            <div class="fl djyl-icon02 img100 mtr5">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/djyl/icon06.png" alt="">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-huang01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="dynum">0</em>人</p>
                                <p class="cor-666 font-size-r15">党员</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 右 -->
            <div class="fr djyl-w932 h-o">
                <!-- 领导班子 -->
                <div class="w100 djyl-h351 mbr15 cun-box-bg-ext2" id="ldbz">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">领导班子</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <ul class="clearfix djyl-li-tox mtr30 plr50 prr50">
                        <!-- 照片 -->
                        <div class="swiper-container swiper01 w100 h100">
                            <div class="swiper-wrapper" id="manpan">

                            </div>
                            <div class="swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
                        </div>
                    </ul>
                </div>
                <!-- 党建动态 -->
                <div class="w100 djyl-h605 cun-box-bg-ext2" id="djdt">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">党建新闻</p>
                        </div>
                        <a href="Javascript:void(0);" class="flex flex-ac box-more-ext1 posi-abso prr40">
                            <p class="font-size-r14 text-lh1 let-sp1"
                               onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=djxw&title=党建新闻&regionCode=${regionCode!''}');" style="cursor:pointer;">更多</p>
                            <i></i>
                        </a>
                    </div>
                    <!-- 内容 -->
                    <div class="mtr30 plr35 prr35 djyl-div-box-nr">
                        <!-- 动态新闻 -->
                        <!-- djyl-div-box-new -->
                        <div class="h100">
                            <div class="swiper-container swiper02 w100 h100">
                                <div class="swiper-wrapper" id="noticePan">

                                </div>
                            </div>
                        </div>
                    </div>
                        <!-- 更多功能 -->
                        <!-- <p class="mtr30 font-bold clearfix">
                            <em class="font-size-r15 cor-333 fl">更多功能</em>
                            <span class="fr djyl-span-bot-bor-w"></span>
                        </p>
                        <ul class="mtr30 djyl-ul-gdgn clearfix">
                            <li class="fl active">
                                <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">主题党日></a>
                            </li>
                            <li class="fl">
                                <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">组织生活会></a>
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
                                <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">先锋模范></a>
                            </li>
                            <li class="fl">
                                <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">党员学习></a>
                            </li>
                        </ul> -->
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
    $('.szsh-mbc-content-box').on('click','.szsh-mbcc-item',function() {
        $(this).addClass('active').siblings().removeClass('active');
    });
    // 更多功能收起和展开事件
    $('.szsh-more-closed').click(function() {
        $(this).parents('.szsh-mb-content').animate({right:"-1.14rem"},'linear',function() {
            $('.szsh-m-box').removeClass('hide');
        })
    });
    $('.szsh-m-box').click(function() {
        $('.szsh-m-box').addClass('hide');
        $(this).siblings('.szsh-mb-content').animate({right:".1rem"},'linear')
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

    // 左下角 swiper


    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

    $(function () {
        // 党员情况
        bindRightMouse('dyqk');
        // 图文统计情况
        bindRightMouse('twtjqk');
        // 基本情况
        bindRightMouse('jbqk');
        // 领导班子
        bindRightMouse('ldbz');
        // 党建动态
        bindRightMouse('djdt');
    });


    // 绑定右键
    function bindRightMouse(id) {
        var type = 1;
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
                        case 'dyqk':
                            type = 1;
                            break;
                        // 图文统计情况
                        case 'twtjqk':
                            type = 2;
                            break;
                        // 基本情况
                        case 'jbqk':
                            type = 3;
                            break;
                        // 领导班子
                        case 'ldbz':
                            type = 4;
                            break;
                        // 党建动态
                        case 'djdt':
                            type = 5;
                            break;
                        default:
                            type = 1;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);

                },
                'item_2': function (t) {
                    location.reload();
                }
            }
        });
    }

    findNoticeList();

    function findNoticeList() {
        var map = {
            orgCode: "${regionCode!''}",
            page: 1,
            rows: 7,
            isSend: 2
        };
        var url = '${djDomain!''}/dj/news/listDataForJsonp.json?jsonpcallback=""';
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
                for (i = 0; i < list.length; i++) {
                    //      str += '<div class="swiper-slide" onclick="showNotice(' + list[i].id + ')">'
                    dateStr = list[i].createDate;

                    str += '<div class="swiper-slide" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=djxw&title=党建新闻&regionCode=${regionCode!''}&infoOpenId=' + list[i].id + '\')" style="cursor:pointer;">' +
                        '<div class="font-size-0 h100 clearfix line-height-r46">' +
                        '<span class="fl font-size-r16 cor-333 text-line-c1 sw-span" title="' + list[i].title + '">' +
                        list[i].title +
                        '</span>' +
                        '<em class="fr font-size-r16 cor-999">' + dateStr.substring(0, 19) + '</em>' +
                        '</div>' +
                        '</div>';
                }
                $('#noticePan').html(str);

                var isLoop = false;
                //if(list.length>7){  要刷新就都不轮播了
                //	isLoop=true;
                //}
                // 党建新闻
                var mySwiper02 = new Swiper('.swiper02', {
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: true,
                        disableOnInteraction: false
                    },//可选选项，自动滑动
                    direction: 'vertical',
                    loop: isLoop,
                    slidesPerView: 15,
                    // direction: 'vertical',
                    observer: true, //修改swiper自己或子元素时，自动初始化swiper
                    observeParents: true //修改swiper的父元素时，自动初始化swiper
                });
                //鼠标放上暂停轮播
                $('.djyl-div-box-new').hover(function () {
                    mySwiper02.autoplay.stop();
                }, function () {
                    mySwiper02.autoplay.start();
                });

            },
            error: function (data) {
                console.log("获取三务数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function showNotice(id) {
        var url = '${djDomain!''}/dj/news/detail.jhtml?id=' + id;
        var pages = layer.open({
            type: 2, //page层
            //id:"mask-eventID",
            area: ['900px', '620px'],
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

    getPopulationData();

    function getPopulationData() {
        $.ajax({
            type: 'POST',
            url: '${rsDomain}/cirs/findRsCountForJsonp.jhtml?jsonpcallback=""&regionCode=${regionCode!''}&orgCode=${regionCode!''}',
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data != null) {
                    $("#populationCount").html(data.populationCount);
                    //          $("#registerCount").html(data.registerCount);
                }
                if ("${regionCode!''}" == '660201004001') {
                    $("#populationCount").html(3100);
                    //          $("#registerCount").html(1367);
                }
            },
            error: function (data) {
                console.log("获人口数据连接超时！");
            }
        });
    }


    getDwnum();
    var dwnum;

    function getDwnum() {
        var url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';
        var map = {
            orgCode: "${regionCode!''}",
            page: 1,
            rows: 1
        };
        map.catalogId = '10000007';
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                dwnum = data.total;
                getPmData();//先获得dwnum再执行
            },
            error: function (data) {
                console.log("获取三务数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function getPmData() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/partymember/pmInfo/getPmForJsonp.jhtml?jsonpcallback=""&regionCode=${regionCode!''}&orgCode=${orgCode!''}',
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                var sexlist = data.sexlist;
                var agelist = data.agelist;
                var manlist = data.manlist;
                $("#dxznum").html(data.dxznum);

                var djlist = data.djlist;
                var dynum = djlist.dynum;
                var unitnum = djlist.unitnum;
                var meetnum = djlist.meetnum;
                var newnum = djlist.newnum;
                var max = 0;
                for (var key in djlist) {
                    //if(max<djlist[key] && key!='dynum'){
                    //	max=djlist[key];
                    //}
                    if (key != 'dynum') {
                        max += djlist[key];
                    }
                }
                max += dwnum;
                //if(max<dwnum){
                //	max=dwnum;
                //}
                var unitper = unitnum * 100 / max;
                var meetper = meetnum * 100 / max;
                var newper = newnum * 100 / max;
                var dwper = dwnum * 100 / max;
                $('#dynum').html(dynum);

                $('#dwnum').html(dwnum);
                $('#unitnum').html(unitnum);
                $('#meetnum').html(meetnum);
                $('#newnum').html(newnum);
                $('#dwper').attr('data-per', dwper);
                $('#unitper').attr('data-per', unitper);
                $('#meetper').attr('data-per', meetper);
                $('#newper').attr('data-per', newper);

                $('.jindu').each(function (index, el) {
                    $(el).css('width', '0');
                    setTimeout(function () {
                        $(el).animate({
                            width: $(el).data('per') + '%',
                        }, 1500)
                    }, 1500)
                });

                var male = sexlist.male;
                var female = sexlist.female;
                var sexcolor = 'color-red01';
                var sexper = 0;
                var sextag = '';
                if (male > female) {
                    sextag = '男性占比（最多占比）';
                    sexper = (male * 100 / (male + female)).toFixed(2);
                } else if (male == female) {
                    sextag = '男女占比相同';
                    sexper = 50;
                } else {
                    sextag = '女性占比（最多占比）';
                    sexper = (female * 100 / (male + female)).toFixed(2);
                    sexcolor = 'color-huang01';
                }
                $("#sexp").addClass(sexcolor);
                $("#sexper").html(sexper);
                $("#sextag").html(sextag);
                $("#mannum").html(male);
                $("#womannum").html(female);
                var arrList = [];
                var sexmap = {value: male, name: '男'};
                arrList.push(sexmap);
                sexmap = {value: female, name: '女'};
                arrList.push(sexmap);
                setOpection(arrList, 'sexpan');

                var agedata = [agelist.AGE_LESS_30, agelist.AGE_30_49, agelist.AGE_50_69, agelist.AGE_70_89, agelist.AGE_MORE_90];
                setOpection1(agedata, 'agepan');

                var str = '';
                $("#managernum").html(manlist.length);
                for (i = 0; i < manlist.length; i++) {
                    var filePath = '${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/img05.png';
                    if (manlist[i].photo != '') {
                        filePath = "${FILE_URL}/" + manlist[i].photo;
                    }

                    str += '<div class="swiper-slide">' +
                        '<li class="h100">' +
                        '<div class="djyl-li-tox-img img100">' +
                        '<img src="' + filePath + '" alt="">' +
                        '</div>' +
                        '<div class="w100 djyl-li-p-box mtr10">' +
                        '<p class="text-align-c color-red01 font-size-r24 font-bold djyl-li-p">' +
                        '<em>' + manlist[i].pmName + '</em>' +
                        '</p>' +
                        '</div>' +
                        '<div class="w100 djyl-li-p-box mtr5">' +
                        '<p class="text-align-c font-size-0 djyl-li-p02">' +
                        '<em class="cor-333 font-size-r14">' + manlist[i].pmTypeName + '</em>' +
                        '</p>' +
                        '</div>' +
                        '</li>' +
                        '</div>';
                }
                $('#manpan').html(str);
                var loop = false;
                if (manlist.length > 5) {
                    loop = true;
                }
                // 领导班子
                var mySwiper = new Swiper('.swiper01', {
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: true,
                        disableOnInteraction: false
                    },//可选选项，自动滑动
                    spaceBetween: 20,
                    loop: loop,
                    slidesPerView: manlist.length < 5 ? manlist.length : 5,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true
                    },
                    // direction: 'vertical',
                    observer: true, //修改swiper自己或子元素时，自动初始化swiper
                    observeParents: true //修改swiper的父元素时，自动初始化swiper
                });
                for (let i = 0; i < $('.swiper01 .swiper-slide').length; i++) {
                    var djylBox = $('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p-box');
                    var djylP =  $('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p');
                    var djylP02 =  $('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p02');

                    var lip = djylBox[0].offsetWidth;
                    var lipem = djylP[0].offsetWidth;
                    var lipem02 = djylP02[0].offsetWidth;
                    if (lip < lipem) {
                        djylP.append($('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p>em').clone());
                        djylP.css({
                            // left:-lipem,
                            'WebkitAnimation': 'scrollTr linear ' + lipem * 0.055 + 's 1s infinite',
                            'MsAnimation': 'scrollTr linear ' + lipem * 0.055 + 's 1s infinite',
                            // 'transition': 'linear ' + lipem * 0.02 + 's 2s',
                            // 'animation': 'scrollTr linear ' + lipem * 0.028 + 's 1s infinite'
                            'animation': 'scrollTr linear' + lipem * 0.055 + 's 1s infinite'
                        })
                    }
                    if (lip < lipem02) {
                        djylP02.append($('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p02>em').clone());
                        djylP02.css({
                            // left:-lipem,
                            'WebkitAnimation': 'scrollTr linear ' + lipem * 0.055 + 's 1s infinite',
                            'MsAnimation': 'scrollTr linear ' + lipem * 0.055 + 's 1s infinite',
                            // 'transition': 'linear ' + lipem * 0.02 + 's 2s',
                            // 'animation': 'scrollTr linear ' + lipem * 0.028 + 's 1s infinite'
                            'animation': 'scrollTr linear' + lipem * 0.055 + 's 1s infinite'
                        })
                    }
                }
                //鼠标放上暂停轮播
                $('.djyl-li-tox').hover(function () {
                    mySwiper.autoplay.stop();
                }, function () {
                    mySwiper.autoplay.start();
                });

            },
            error: function (data) {
                console.log("获取党建数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function setOpection1(valList, id) {
        var myChart = echarts.init(document.getElementById(id));
        option = {
            grid: {
                left: 0,
                right: 0,
                bottom: 0,
                top: 20,
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: ['29岁\n以下', '30-\n49岁', '50-\n69岁', '70-\n89岁', '90岁\n以上'],
                axisLine: {       //轴
                    show: false
                },
                axisTick: {       //轴刻度线
                    show: false
                }
            },
            yAxis: {
                show: false,
                type: 'value'
            },
            series: [
                {
                    name: '数量',
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                var colorList = [
                                    '#C1232B', '#B5C334', '#FCCE10', '#E87C25', '#27727B'
                                ];
                                return colorList[params.dataIndex]
                            },
                            label: {
                                show: true,
                                position: 'top',
                                formatter: '{c}'
                            }
                        }
                    },
                    barWidth: 13,
                    data: valList,
                    type: 'bar'
                }
            ]
        };
        //console.log(option);
        myChart.setOption(option);
        myChart.resize();
    }

    function setOpection(arrList, id) {
        var myChart = echarts.init(document.getElementById(id));
        option = {
            color: ['#d62a1e', '#ffac00'],
            tooltip: {
                show: false,
                trigger: 'item',
                formatter: '{a} <br/>{b}: {c} ({d}%)'
            },
            legend: false,
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: ['50%', '90%'],
                    center: ['45%', '50%'],
                    avoidLabelOverlap: false,
                    hoverAnimation: false,//不放大
                    label: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: false,
                    labelLine: {
                        show: false
                    },
                    data: arrList
                }
            ]
        };
        //console.log(option);
        myChart.setOption(option);
        myChart.resize();
    }

    $("#getpan").mouseover(function () {
        $("#getpan0").show();
    })
    $("#getpan").mouseout(function () {
        $("#getpan0").hide();
    })
    $("#getpan1").mouseover(function () {
        $("#getpan10").show();
    })
    $("#getpan1").mouseout(function () {
        $("#getpan10").hide();
    })

    function openpage(url) {
        window.open(url);
    }

    function refresh() {
        location.reload();
    }

    setInterval(findNoticeList, 15000);

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