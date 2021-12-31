<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>疫情防控</title>
    
    <link rel="stylesheet" href="${uiDomain!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${uiDomain!''}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" href="${uiDomain!''}/web-assets/plugins/layui-v2.5.5/layui/css/layui.css">
    <link rel="stylesheet" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/com-gd.css" />
    <link rel="stylesheet" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-djyl.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${uiDomain!''}/web-assets/common/js/calc-rem.js"></script>
    <script src="${uiDomain!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
    <script src="${uiDomain}/web-assets/common/js/echarts-4.2.0-rc.1.js"></script>
    <script src="${uiDomain}/web-assets/common/js/echarts-gl.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>

    <style>
        #no_data {
            width: 30%;
            height: 30%;
        }

        .yqfk-w1 {
           width: 1.4rem;
        }
    </style>
</head>

<body>
    <div class="h100 djyl-bj-padd bs">
        <div class="h100 prr20 clearfix h-x">
            <!-- 左右结构 -->
            <!-- 左 -->
            <div class="fl djyl-w932 h-o">
                <!-- 党员情况 -->
                <div class="w100 yqfk-h1 mbr15 cun-box-bg-ext2">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">返乡人员统计</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="clearfix plr35 prr35 bs posi-rela layui-form">
                        <div class="select-ext1 yqfk-pos2 yqfk-w1">
                            <div class="layui-input-block">
                                <select lay-filter="date1">

                                    <option value="2021-12" selected="">2021-12</option>
                                    <option value="2022-01">2022-01</option>
                                    <option value="2022-02">2022-02</option>
                                </select>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr30 fl">
                            <div class="fl yqfk-list1-icon img100">
                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list1-i1.png">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-blue1 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="TOTAL">-</em>人</p>
                                <p class="cor-666 font-size-r15">累计返乡人数</p>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr30 fl">
                            <div class="fl yqfk-list1-icon img100">
                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list1-i2.png">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="HIGHDANGER">-</em>人</p>
                                <p class="cor-666 font-size-r15">中高风险返乡</p>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr30 fl">
                            <div class="fl yqfk-list1-icon img100">
                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list1-i3.png">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-orange1 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="LOWDANGER">-</em>人</p>
                                <p class="cor-666 font-size-r15">低风险返乡</p>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr35 fl">
                            <div class="fl yqfk-list1-icon img100">
                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list1-i4.png">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-purple1 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="ABROADBCAK">0</em>人</p>
                                <p class="cor-666 font-size-r15">境外返乡</p>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr35 fl">
                            <div class="fl yqfk-list1-icon img100">
                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list1-i5.png">
                            </div>
                            <div class="fl mlr20">
                                <p class="color-green1 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="DETECTED">-</em>人</p>
                                <p class="cor-666 font-size-r15">已核酸检测</p>
                            </div>
                        </div>
                        <div class="djyl-div-jbxx-box mtr35 fl">
                            <div class="fl yqfk-list1-icon img100">
                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list1-i6.png">
                            </div>
                            <div class="fl mlr20">
                                <p class="cor-999 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-aldr" id="UNDETECTED">-</em>人</p>
                                <p class="cor-666 font-size-r15">未核酸检测</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 图文统计情况 -->
                <div class="w100 yqfk-h2 mbr15 cun-box-bg-ext2">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">返乡事由统计</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="yqfk-ec yqfk-ec1 mtr20" id="goHomeEchart">
<#--                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/ui-yqfk-ex1.png">-->
                    </div>
                </div>
                <!-- 基本情况 -->
                <div class="w100 yqfk-h2 cun-box-bg-ext2">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">人员返乡趋势</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="yqfk-ec yqfk-ec1 mtr20 layui-form">
                        <div class="select-ext1 yqfk-pos2 yqfk-w1 yqfk-w2">
                            <div class="layui-input-block">
                                <select lay-filter="date2">
                                    <option selected=""  >7天</option>
                                    <option  >30天</option>
                                </select>
                            </div>
                        </div>
                        <div id="goHomeTrendDiv" style="height: 2.5rem;"></div>
<#--                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/ui-yqfk-ex2.png">-->
                    </div>
                </div>
            </div>
            <!-- 右 -->
            <div class="fr djyl-w932 h-o">
                <!-- 领导班子 -->
                <div class="w100 djyl-h351 mbr15 cun-box-bg-ext2">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">全村疫苗接种情况</p>
                        </div>
                    </div>
                    <!-- 内容 -->
                    <div class="clearfix cont-yqfk-ext1 mtr30">
                        <div class="yqfk-w3 fl" id="wholeVillageVaccinationRightClick">
                            <div class="flex mlr15">
                                <div class="flex1 flex flex-clm flex-ac">
                                    <i class="yqfk-list2-icon">
                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list2-i1.png">
                                    </i>
                                    <p class="font-size-r18 font-bold color-red01 mtr10"><em class="font-size-r24 font-bold font-aldr" id="vaccinationpersonsPercent">-</em>%</p>
                                    <p class="font-size-r16 cor-333 mtr5">全村疫苗接种率</p>
                                </div>
                                <div class="flex1 flex flex-clm flex-ac">
                                    <i class="yqfk-list2-icon">
                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list2-i2.png">
                                    </i>
                                    <p class="font-size-r18 font-bold color-red01 mtr10"><em class="font-size-r24 font-bold font-aldr" id="nonvaccinationpersonsNumber">-</em></p>
                                    <p class="font-size-r16 cor-333 mtr5">未接种</p>
                                </div>
                                <div class="flex1 flex flex-clm flex-ac">
                                    <i class="yqfk-list2-icon">
                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/xiangcunzhili/yqfk/icon-yqfk-list2-i3.png">
                                    </i>
                                    <p class="font-size-r18 font-bold color-red01 mtr10"><em class="font-size-r24 font-bold font-aldr" id="vaccinationpersonsNumber">-</em></p>
                                    <p class="font-size-r16 cor-333 mtr5">已接种</p>
                                </div>
                            </div>
                            <ul class="yqfk-list3 mlr30 mtr20 mrr50">
                                <li>
                                    <p class="font-size-r14 cor-666 fl mlr30">完成第一针接种</p>
                                    <p class="font-size-r14 cor-666 fr mrr30"><em class="color-orange1 font-bold mrr5" id="firstvaccinationNumber">-</em>人</p>
                                </li>
                                <li>
                                    <p class="font-size-r14 cor-666 fl mlr30">完成第二针接种</p>
                                    <p class="font-size-r14 cor-666 fr mrr30"><em class="color-orange1 font-bold mrr5" id="secondvaccinationNumber">-</em>人</p>
                                </li>
                                <li>
                                    <p class="font-size-r14 cor-666 fl mlr30">完成第三针接种</p>
                                    <p class="font-size-r14 cor-666 fr mrr30"><em class="color-orange1 font-bold mrr5" id="thirdvaccinationNumber">-</em>人</p>
                                </li>
                            </ul>
                        </div>
                        <div class="yqfk-w4 fr" id="vaccinationSiteRightClick">
                            <p class="font-size-r16 cor-333 font-bold"><i class="block-ext1 mrr5"></i>村疫苗接种点</p>
                            <ul class="yqfk-list4 mtr25 mrr15" id="VaccinationSite">

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 党建动态 -->
                <div class="w100 djyl-h605 cun-box-bg-ext2" id="epidemicBroadcastingRightClick">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 公共标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">疫情播报</p>
                        </div>
                        <!-- <a href="Javascript:void(0);" class="flex flex-ac box-more-ext1 posi-abso prr40">
                            <p class="font-size-r14 text-lh1 let-sp1">更多</p>
                            <i></i>
                        </a> -->
                    </div>
                    <!-- 内容 -->
                    <div class="mtr30 plr35 prr35 djyl-div-box-nr">
                        <!-- 动态新闻 -->
                        <!-- djyl-div-box-new -->
                        <div class="h100">
                            <div class="swiper-container swiper02 w100 h100">
                                <div class="swiper-wrapper" id="epidemicBroadcasting">

                                </div>
                            </div>
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
<script>

    layui.use(['form'], function () {
        var form = layui.form;

        form.on('select(date2)', function(data){

            if (data.value=='7天'){
                goHomeTrend(1)
            }else {
                goHomeTrend(2)
            }

        });
        form.on('select(date1)', function(data){

            getCount(data.value);// 返乡人员统计
            goHomeReason(data.value);// 返乡事由统计

        });


    });

    // 更多功能点击事件
    $('.szsh-mbc-content-box').on('click', '.szsh-mbcc-item', function () {
        $(this).addClass('active').siblings().removeClass('active');
    });
    // 更多功能收起和展开事件
    $('.szsh-more-closed').click(function () {
        $(this).parents('.szsh-mb-content').animate({ right: "-1.14rem" }, 'linear', function () {
            $('.szsh-m-box').removeClass('hide');
        })
    });
    $('.szsh-m-box').click(function () {
        $('.szsh-m-box').addClass('hide');
        $(this).siblings('.szsh-mb-content').animate({ right: ".1rem" }, 'linear')
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
    $('.jindu').each(function (index, el) {
        $(el).css('width', '0');
        setTimeout(function () {
            $(el).animate({
                width: $(el).data('per') + '%',
            }, 1500)
        }, 1500)
    });
    // 左下角 swiper
    // 领导班子
    var mySwiper = new Swiper('.swiper01', {
        autoplay: {
            delay: 3000,
            stopOnLastSlide: true,
            disableOnInteraction: false
        },//可选选项，自动滑动
        spaceBetween: 20,
        loop: true,
        slidesPerView: 5,
        pagination: {
            el: '.swiper-pagination'
        },
        // direction: 'vertical',
        observer: true, //修改swiper自己或子元素时，自动初始化swiper
        observeParents: true //修改swiper的父元素时，自动初始化swiper
    });

    //鼠标放上暂停轮播
    $('.djyl-li-tox').hover(function () {
        mySwiper.autoplay.stop();
    }, function () {
        mySwiper.autoplay.start();
    });

    for (let i = 0; i < $('.swiper01 .swiper-slide').length; i++) {
        var djylBox = $('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p-box');
        var djylP = $('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p');
        var djylP02 = $('.swiper01 .swiper-slide').eq(i).find('.djyl-li-p02');

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
</script>

<script>
    $(function () {
        var date= getNowFormatDate(new Date())
        date=date.substring(0,7)

        getCount(date);// 返乡人员统计
        goHomeReason(date);// 返乡事由统计
        goHomeTrend(1) ; // 人员返乡趋势
    });


    function  getCount(date){
        $.ajax({
            type: 'get',
            url: '${WECHAT_DOMAIN!''}/web/xiongan/EpidemicStatistics/getCount.mhtml',
            data: {
                regionCode: "${regionCode!''}",
                date: date,

            },
            dataType: 'jsonp',
            jsonp: "jsonpCallback",
            success: function(data) {
                var data =data[0]
                $('#DETECTED').html(data.DETECTED)
                $('#HIGHDANGER').html(data.HIGHDANGER)
                $('#LOWDANGER').html(data.LOWDANGER)
                $('#TOTAL').html(data.TOTAL)
                $('#UNDETECTED').html(data.UNDETECTED)
                $('#ABROADBCAK').html(data.ABROADBCAK)

            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }


    function goHomeReason( date) {

        $.ajax({
            type: 'get',
            url: '${WECHAT_DOMAIN!''}/web/xiongan/EpidemicStatistics/goHomeReason.mhtml',
            data: {
                regionCode: "${regionCode!''}",
                date: date,

            },
            dataType: 'jsonp',
            jsonp: "jsonpCallback",
            success: function(data) {
                var data =data[0]
                var dataKey =[];
                var dataValue =[];

                for( var key in data){
                    dataKey.push(key)
                    dataValue.push(data[key])
                }

                var chartDom = document.getElementById('goHomeEchart');
                var myChart = echarts.init(chartDom);
                var option;
                option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: dataKey,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            // name: 'Direct',
                            type: 'bar',
                            barWidth: '60%',
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#FF967F'
                            }, {
                                offset: 1,
                                color: '#FFBF7F'
                            }]),
                            data: dataValue
                        }
                    ]
                };

                myChart.setOption(option);
            },
            error: function(data) {
            },
            complete : function() {
            }
        });


    }

    function getNowFormatDate(date) {

        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

    function  getTimeList(type ){
        var num=7
        if(type==2){
            num=30
        }
        var time =[]
            for(var i=0;i<num;i++){
                var date = new Date();
                date= date.setDate(date.getDate()+i);
                var endData= new Date(date)
                time.push(getNowFormatDate( endData))
            }
        return time ;


    }

    function goHomeTrend(type){
        var startTime= getNowFormatDate( new Date())
        var date = new Date();
        if (type==1){
            date= date.setDate(date.getDate()+7);
        }else {
            date= date.setDate(date.getDate()+30);
        }



        var endData= new Date(date)
        var endTime= getNowFormatDate( endData)

        var  TimeList=getTimeList(type)


        $.ajax({
            type: 'get',
            url: '${WECHAT_DOMAIN!''}/web/xiongan/EpidemicStatistics/goHomeTrend.mhtml',
            data: {
                regionCode: "${regionCode!''}",
                date: '2021-12',
                startTime:startTime,
                endTime:endTime

            },
            dataType: 'jsonp',
            jsonp: "jsonpCallback",
            success: function(data) {


                var value = []
                for (var i=0;i<TimeList.length;i++){
                    value.push(0)
                }
                for (var i=0;i<data.length;i++){
                    var id =  TimeList.indexOf(data[i].DAY)
                    if(id!=-1){
                        value[id]=data[i].COUNT
                    }

                }
                var chartDom = document.getElementById('goHomeTrendDiv');
                var myChart = echarts.init(chartDom);
                var option;
                option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: TimeList
                    },
                    yAxis: {
                        type: 'value'
                    },
                    grid: {
                        top:'15%',
                        left: '3%',
                        right: '6%',
                        bottom: '0%',
                        containLabel: true
                    },
                    series: [
                        {
                            data: value,
                            type: 'line',
                            smooth: true,
                            color: new echarts.graphic.LinearGradient(0, 0, 1, 1, [{
                                offset: 0,
                                color: '#FCCAC5'
                            }, {
                                offset: 1,
                                color: '#FFEFB8'
                            }, {
                                offset: 1,
                                color: '#FFFAE5'
                            }]),
                            areaStyle: {}
                        }
                    ]
                };

                myChart.setOption(option);




            },
            error: function(data) {
            },
            complete : function() {
            }
        });



    }
</script>

<script>
    $(function () {
        // 疫苗接种情况
        getVaccinationStatus();
        // 疫苗接种点
        getVaccinationSite();
        // 疫情播报。
        findNoticeList('10000030');
    });

    function getVaccinationStatus() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/vaccinationStatus/listData.jhtml',
            data: {
                page: 1,
                rows: 1,
                regionCode: ${regionCode!''}
            },
            dataType: 'json',
            success: function(data) {
                if (data.total > 0) {
                    let info = data.rows[0];
                    let nonvaccinationpersonsNumber = info.nonvaccinationpersonsNumber; // 未接种人数
                    // let vaccinationpersonsNumber = info.vaccinationpersonsNumber; // 已接种人数
                    let firstvaccinationNumber = info.firstvaccinationNumber; // 第一针
                    let secondvaccinationNumber = info.secondvaccinationNumber; //第二针
                    let thirdvaccinationNumber = info.thirdvaccinationNumber; // 第三针
                    let vaccinationpersonsNumber = firstvaccinationNumber + secondvaccinationNumber + thirdvaccinationNumber; // 已接种人数
                    if (vaccinationpersonsNumber > 0){
                        $('#nonvaccinationpersonsNumber').html(nonvaccinationpersonsNumber);
                        $('#vaccinationpersonsNumber').html(vaccinationpersonsNumber);
                        $('#firstvaccinationNumber').html(firstvaccinationNumber);
                        $('#secondvaccinationNumber').html(secondvaccinationNumber);
                        $('#thirdvaccinationNumber').html(thirdvaccinationNumber);
                        let vaccinationpersonsPercent = (vaccinationpersonsNumber / (nonvaccinationpersonsNumber + vaccinationpersonsNumber) * 100).toFixed(2);
                        $('#vaccinationpersonsPercent').html(vaccinationpersonsPercent);
                    }
                }
            },
            error: function(data) {
                console.log('获取疫情数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    // 疫苗接种点
    function getVaccinationSite() {
        $('#vaccinationsite').empty();

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/vaccinationSite/listData.jhtml',
            data: {
                page: 1,
                rows: 2,
                regionCode: ${regionCode!''}
            },
            dataType: 'json',
            success: function(data) {
                let html = '';
                if (data.total > 0) {
                    let dataList = data.rows;
                    for (let i = 0; i < dataList.length; i++) {
                        let vaccinationsiteName = dataList[i].vaccinationsiteName;
                        html += '<li>' +
                                '<p class="font-size-r14 cor-333 mlr15 mtr10" title="'+vaccinationsiteName+'"  style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;"><i class="pos-ext1 mrr5"></i>' + vaccinationsiteName + '</p>' +
                                '<p class="font-size-r14 text-nor cor-666 yqfk-list4-t1 mlr20 mtr8"><em class="mrr15">每周一、三、五</em><em class="mrr15">上午：09:00-12:00</em><em>下午：14:00-18:00</em></p>' +
                                '</li>';
                    }
                    $('#VaccinationSite').html(html);
                    $('.h-x').niceScroll().resize();
                } else {
                    html = '<div class="none-data-ext1">' +
                        '<img id="no_data" class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>';
                    $('#VaccinationSite').html(html);
                }
            },
            error: function(data) {
                console.log('获取疫情接种点数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    function findNoticeList(catalogId) {
        $('#epidemicBroadcasting').empty();

        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json',
            data: {
                orgCode: "${regionCode!''}",
                page: 1,
                rows: 99,

                catalogId: catalogId,
                isEndPubDate: 'no',
                isPic: 'yes',
                isPubOrg: 'no',
                isTop: 'yes'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                let html = '';

                if (data.total > 0) {
                    let dataList = data.rows;

                    for (let i = 0; i < dataList.length; i++) {
                        let title = dataList[i].title || '暂无标题';
                        let pubDate = dataList[i].pubDate;

                        html += '<div class="swiper-slide" onclick="turnToMore(\'疫情播报\', \'ztdr\', ' + dataList[i].infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;">' +
                            '<div class="font-size-0 h100 clearfix line-height-r52">' +
                            '<span class="fl font-size-r16 cor-333 text-line-c1 sw-span" title="' + title + '">' +
                            title +
                            '</span>' +
                            '<em class="fr font-size-r16 cor-999">' + pubDate + '</em>' +
                            '</div>' +
                            '</div>';
                    }

                    $('#epidemicBroadcasting').html(html);

                    var mySwiper02 = new Swiper('.swiper02', {
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: true,
                            disableOnInteraction: false
                        },//可选选项，自动滑动
                        direction: 'vertical',
                        loop: false,
                        slidesPerView: 10,
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
                } else {
                    html = '<div class="none-data-ext1">' +
                        '<img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>';
                    $('#epidemicBroadcasting').html(html);
                }
            },
            error: function(data) {
                console.log('获取' + catalogId + '数据连接超时！');
            },
            complete : function() {
            }
        });
    }

    // 详情。
    function turnToView(url) {
        window.open(url);
    }

    // 更多。
    function turnToMore(title, type, infoOpenId, catalogId) {
        let url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=' + title + '&module=' + type + '&infoOpenId=' + infoOpenId + '&catalogId=' + catalogId;
        window.open(url);
    }

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

    bindRightMouse('wholeVillageVaccinationRightClick');   // 全村疫苗接种情况。
    bindRightMouse('vaccinationSiteRightClick');   // 村疫苗接种点。
    bindRightMouse('epidemicBroadcastingRightClick');   // 疫情播报。

    // 绑定右键。
    function bindRightMouse(id) {
        let type = 141;
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
                backgroundColor:'rgba(189, 173, 173, 0.3)',
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
                        // 全村疫苗接种情况。
                        case 'wholeVillageVaccinationRightClick':
                            type = 141;
                            break;
                        // 村疫苗接种点。
                        case 'vaccinationSiteRightClick':
                            type = 142;
                            break;
                        // 疫情播报。
                        case 'epidemicBroadcastingRightClick':
                            type = 143;
                            break;
                        default:
                            type = 141;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                },
                'item_2': function(t) {
                    location.reload();
                }
            }
        });
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
</body>

</html>