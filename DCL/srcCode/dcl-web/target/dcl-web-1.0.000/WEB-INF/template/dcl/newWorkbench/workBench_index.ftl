<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>工作台</title>
    <meta name="referrer" content="no-referrer" />   <!-- 可以让img标签预加载网络图片。 -->

    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/com-gd.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-gongzuotai.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${uiDomain!''}/web-assets/common/js/calc-rem.js"></script>
</head>

<body>
    <div class="h100 bs ptr15 plr15 prr15 pbr15" id="mainHtml">
        <div class="h100 h-x clearfix posi-rela">
            <div class="w-910 h100 fl">
                <div class="h-470">
                    <div class="ncds-top-left h100 cun-box-bg-ext2 ncds-w1">
                        <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                        <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                        <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                        <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                        <div class="ncds-contnet posi-rela h100">
                           <div class="w100 h100 plr35 prr35 ptr20 pbr35 bs">
                               <div class="h30">
                                   <div class="fl tab-title-01 j-tab-title-01 font-size-r20">
                                       <a class="a1 active" id="threeServicesDisclosureA">三务公开</a>
                                       <a id="serviceGuideA">办事指南</a>
                                       <a id="policyPublicityA">政策宣传</a>
                                       <a id="villageRulesAndRegulationsA">村规民约</a>
                                   </div>
                                   <span class="span-rr fr cor-666 font-size-r14" id="turnToMore" onclick="turnToView('三务公开', 'ztdr', '', '10000003')">更多</span>
                               </div>
                               <div class="h100-50 tab-con-01 mtr20">
                                   <!-- 三务公开。 -->
                                    <div class="w100 h100  bs hide show" id="threeServicesDisclosureDiv">
                                        <div class="w-470 h-340 mtr10 box-radius10 h-o fl">
                                            <div class="swiper-container w100 h100 mb-cclt-box-content">
                                                <div class="swiper-wrapper" id="threeServicesDisclosurePicture">

                                                </div>
                                                <div class="swiper-pagination"></div>
                                            </div>
                                        </div>
                                        <div class="w100-490 h-340 mtr10 fr" id="threeServicesDisclosureContent">

                                        </div>
                                    </div>
                                   <!-- 办事指南。 -->
                                   <div class="w100 h100 hide ">
                                        <div class="w100 h100 bs div-swgk h-x" id="convenientQuery">

                                        </div>
                                    </div>
                                   <!-- 政策宣传。 -->
                                   <div class="w100 h100 hide ">
                                        <div class="w100 h100 bs div-swgk h-x" id="policyPublicity">

                                        </div>
                                    </div>
                                   <!-- 村规民约。 -->
                                   <div class="w100 h100 hide " id="villageRulesAndRegulationsDivOutside">
                                        <div class="w100 h100 box-radius8 plr30 prr30 ptr30 pbr30 bs" id="villageRulesAndRegulationsDivInside">
                                            <div class="w-360 h-300 fl box-radius4 img100" id="villageRulesAndRegulationsPicture">

                                            </div>
                                            <div class="w100-360 h-300 fr">
                                                <div class="h100 h-x" id="villageRulesAndRegulationsContent">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               </div>
                           </div>
                        </div>
                    </div>
                </div>

                <div class="h100-485 mtr15 ptr15 bs cun-box-bg-ext2">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <div class="ncds-contnet posi-rela h100">
                        <div class="gzt-div-title gzt-div-title2">
                            <p class="font-size-r20 fl font-bold plr20 cor-d61e1e">待办事件</p>
<#--                            <span class="span-rr fr cor-666 font-size-r14 mrr25">更多</span>-->
                        </div>
                        <div class="gzt-div-com">
                            <div class="w100 h100 plr40 prr40 ptr20 pbr20 bs">
                                <div class="h40 ">
                                    <div class="fl w100 h100 tab-title-01 tab-title-02 j-tab-title-02 bor-btb1 font-size-r20">
<#--                                        <a class=" active">-->
<#--                                            <em>语音播报</em><em class="a-em1 mlr10 font-size-r16 cor-fff" id="voiceAnnouncementsNumber">6</em>-->
<#--                                            <i class="hide show"></i>-->
<#--                                        </a>-->
<#--                                        <a>-->
<#--                                            <em>告警事件</em><em class="a-em1 mlr10 font-size-r16 cor-fff" id="alarmEventNumber">1</em>-->
<#--                                            <i class="hide"></i>-->
<#--                                        </a>-->
                                        <a class="active">
<#--                                            <em>辖区事件</em><em class="a-em1 mlr10 font-size-r16 cor-fff" id="jurisdictionalEventsNumber">0</em>-->
                                            <em>辖区事件</em>
                                            <i class="hide show"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="h100-50 tab-con-02">
                                    <div class="w100 h100 ptr20 bs hide">
                                        <div class="yybb-div01 box-radius8 h-90 bj-fde9ad posi-rela h-o">
                                           <div class="font-size-0 flex flex-ac h100">
                                               <i class="img100 yybb-div01-i mlr30">
                                                   <img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/yybb-icon01.png">
                                               </i>
                                               <span class="font-size-r16 cor-333 font-bold mlr80">
                                                   当日累计播报<em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">30</em>条
                                               </span>
                                               <em class="yybb-div01-em mlr50"></em>
                                               <span class="font-size-r16 cor-333 font-bold mlr40">
                                                   全部接收<em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">20</em>条
                                               </span>
                                               <span class="font-size-r16 cor-333 font-bold mlr80">
                                                   未全部接收<em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">10</em>条
                                               </span>
                                           </div>
                                        </div>
                                        <div class="yybb-div02 mtr30 box-radius8 h-100 bj-fff2cd posi-rela h-o plr50 prr50 bs">
                                            <div class="w100 h100 bor-1das clearfix">
                                                <p class="cor-666 font-size-r18 font-bold ptr20">2021-10-15  10:15:10</p>
                                                <div class="mtr10 flex flex-ac flex-jb">
                                                    <div class="font-size-0">
                                                        <p class="font-size-r18 cor-666">
                                                            <em class="font-size-r18 cor-333 font-bold mrr5">张大鱼</em>
                                                            向
                                                            <em class="font-size-r18 cor-ff4848 font-bold mlr5 mrr5">党员</em>
                                                            发送语音播报
                                                        </p>
                                                    </div>
                                                    <div class="font-size-0 flex mrr10">
                                                        <span class="font-size-r16 cor-333 flex flex-ac mrr30">
                                                            <i class="yybb-div02-i img100 mrr5">
                                                                <img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/yybb-icon02.png">
                                                            </i>
                                                            已接收
                                                            <em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">10</em>
                                                            人
                                                        </span>
                                                        <span class="font-size-r16 cor-333 flex flex-ac">
                                                            <i class="yybb-div02-i img100 mrr5">
                                                                <img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/yybb-icon03.png">
                                                            </i>
                                                            未接收
                                                            <em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">2</em>
                                                            人
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="yybb-div02  box-radius8 h-100 bj-fff2cd posi-rela h-o plr50 prr50 bs">
                                            <div class="w100 h100 clearfix">
                                                <p class="cor-666 font-size-r18 font-bold ptr20">2021-10-15  10:15:10</p>
                                                <div class="mtr10 flex flex-ac flex-jb">
                                                    <div class="font-size-0">
                                                        <p class="font-size-r18 cor-666">
                                                            <em class="font-size-r18 cor-333 font-bold mrr5">张大鱼</em>
                                                            向
                                                            <em class="font-size-r18 cor-ff4848 font-bold mlr5 mrr5">党员</em>
                                                            发送语音播报
                                                        </p>
                                                    </div>
                                                    <div class="font-size-0 flex mrr10">
                                                        <span class="font-size-r16 cor-333 flex flex-ac mrr30">
                                                            <i class="yybb-div02-i img100 mrr5">
                                                                <img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/yybb-icon02.png">
                                                            </i>
                                                            已接收
                                                            <em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">10</em>
                                                            人
                                                        </span>
                                                        <span class="font-size-r16 cor-333 flex flex-ac">
                                                            <i class="yybb-div02-i img100 mrr5">
                                                                <img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/yybb-icon03.png">
                                                            </i>
                                                            未接收
                                                            <em class="font-size-r28 cor-ff4848 mlr10 mrr10 font-aldr">2</em>
                                                            人
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="w100 h100 hide">
                                        <div class="h-80 mtr35">
                                            <div class="pic-dongt img100 fl">
                                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/img-cunm.png">
                                            </div>
                                            <div class="pic-dongt-r fr">
                                                <p class="clearfix font-size-r16 mtr5">
                                                    <span class="fl span1 text-line-c1 font-bold font-size-r18 cor-333 mrr10">某村口垃圾堆放未处理</span>
                                                    <span class="span2 ver0 plr5 prr5">new</span>
                                                    <span class="fr font-bold dt-span-lv">待处理</span>
                                                </p>
                                                <p class="clearfix font-size-0 mtr20">
                                                    <span class="dw-span fl img100">
                                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-daohang.png">
                                                    </span>
                                                    <span class="fl span1 text-line-c1 font-size-r16 cor-333 mlr5">民主街与河下街交叉口东北150米</span>
                                                    <span class="fr coe-666 font-size-r16">2021-12-14  10:05:32</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="h-80 mtr35">
                                            <div class="pic-dongt img100 fl">
                                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/img-cunm.png">
                                            </div>
                                            <div class="pic-dongt-r fr">
                                                <p class="clearfix font-size-r16 mtr5">
                                                    <span class="fl span1 text-line-c1 font-bold font-size-r18 cor-333 mrr10">某村口垃圾堆放未处理</span>
                                                    <span class="span2 ver0 plr5 prr5">new</span>
                                                    <span class="fr font-bold dt-span-orange">待审核</span>
                                                </p>
                                                <p class="clearfix font-size-0 mtr20">
                                                    <span class="dw-span fl img100">
                                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-daohang.png">
                                                    </span>
                                                    <span class="fl span1 text-line-c1 font-size-r16 cor-333 mlr5">民主街与河下街交叉口东北150米</span>
                                                    <span class="fr coe-666 font-size-r16">2021-12-14  10:05:32</span>
                                                </p>
                                            </div>
                                        </div>

                                         <div class="h-80 mtr35">
                                             <div class="pic-dongt img100 fl">
                                                 <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/img-cunm.png">
                                             </div>
                                             <div class="pic-dongt-r fr">
                                                 <p class="clearfix font-size-r16 mtr5">
                                                     <span class="fl span1 text-line-c1 font-bold font-size-r18 cor-333 mrr10">某村口垃圾堆放未处理</span>
                                                     <span class="span2 ver0 plr5 prr5">new</span>
                                                     <span class="fr font-bold dt-span-orange">待审核</span>
                                                 </p>
                                                 <p class="clearfix font-size-0 mtr20">
                                                    <span class="dw-span fl img100">
                                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-daohang.png">
                                                    </span>
                                                     <span class="fl span1 text-line-c1 font-size-r16 cor-333 mlr5">民主街与河下街交叉口东北150米</span>
                                                     <span class="fr coe-666 font-size-r16">2021-12-14  10:05:32</span>
                                                 </p>
                                             </div>
                                         </div>
                                     </div>
                                    <!-- 辖区事件。 -->
                                     <div class="w100 h100 hide show" id="jurisdictionalEventsContent">

                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w100-1100 h100 fl mlr15 mrr15">
                <div class="h-470">
                    <div class="h50-20">
                        <div class="ncds-top-left h100 ptr15 bs cun-box-bg-ext2 ncds-w1">
                            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                            <div class="ncds-contnet posi-rela h100">
                                <div class="gzt-div-title">
                                    <p class="font-size-r20 fl font-bold plr20 cor-d61e1e">通知公告</p>
                                    <span class="span-rr fr cor-666 font-size-r14 mrr25 hide" onclick="turnToView('通知公告', 'ztdr', '', '10000020')" id="noticeAnnouncementMore">更多</span>
                                </div>
                                <div class="gzt-div-com">
                                    <div class="w100 h100 plr20 prr20 ptr20 pbr20 bs div-swgk" id="noticeAnnouncement">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="h50-20 mtr15">
                        <div class="ncds-top-left h100 ptr15 bs cun-box-bg-ext2 ncds-w1">
                            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                            <div class="ncds-contnet posi-rela h100">
                                <div class="gzt-div-title">
                                    <p class="font-size-r20 fl font-bold plr20 cor-d61e1e">防疫资讯</p>
                                    <span class="span-rr fr cor-666 font-size-r14 mrr25 hide" onclick="turnToView('防疫资讯', 'ztdr', '', '10000030')" id="epidemicPreventionInformationMore">更多</span>
                                </div>
                                <div class="gzt-div-com">
                                    <div class="w100 h100 plr20 prr20 ptr20 pbr20 bs div-swgk div-swgk02" id="epidemicPreventionInformation">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="h100-485 mtr15 ptr15 bs cun-box-bg-ext2">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <div class="ncds-contnet posi-rela h100">
                        <div class="gzt-div-title gzt-div-title2">
                            <p class="font-size-r20 fl font-bold plr20 cor-d61e1e">返乡人员统计</p>
                        </div>
                        <div class="gzt-div-com">
                            <div class="w100 h100 plr20  prr20 ptr20 pbr20 bs">
                                <div class="w33-h fl mtr25 mbr55 ">
                                    <p class="text-align-c font-size-0"><img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-fxtj-01.png"/></p>
                                    <p class="cor-999 font-size-r18 text-align-c mtr5"><em class="font-size-r22 font-bold cor-4c86c8 mrr5" id="TOTAL">0</em>人</p>
                                    <p class="cor-666 font-size-r18 text-align-c mtr5">累计返乡人员</p>
                                </div>
                                <div class="w33-h fl mtr25 mbr55 ">
                                    <p class="text-align-c font-size-0"><img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-fxtj-02.png"/></p>
                                    <p class="cor-999 font-size-r18 text-align-c mtr5"><em class="font-size-r22 font-bold cor-ec0602 mrr5" id="HIGHDANGER">0</em>人</p>
                                    <p class="cor-666 font-size-r18 text-align-c mtr5">中高风险返乡</p>
                                </div>
                                <div class="w33-h fl mtr25 mbr55 ">
                                    <p class="text-align-c font-size-0"><img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-fxtj-03.png"/></p>
                                    <p class="cor-999 font-size-r18 text-align-c mtr5"><em class="font-size-r22 font-bold cor-feab3f mrr5"  id="LOWDANGER">0</em>人</p>
                                    <p class="cor-666 font-size-r18 text-align-c mtr5">低风险返乡</p>
                                </div>
                                <div class="w33-h fl">
                                    <p class="text-align-c font-size-0"><img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-fxtj-04.png"/></p>
                                    <p class="cor-999 font-size-r18 text-align-c mtr5"><em class="font-size-r22 font-bold cor-b429e5 mrr5"  id="ABROADBCAK">0</em>人</p>
                                    <p class="cor-666 font-size-r18 text-align-c mtr5">境外返乡</p>
                                </div>
                                <div class="w33-h fl">
                                    <p class="text-align-c font-size-0"><img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-fxtj-05.png"/></p>
                                    <p class="cor-999 font-size-r18 text-align-c mtr5"><em class="font-size-r22 font-bold cor-37bc43 mrr5" id="DETECTED">0</em>人</p>
                                    <p class="cor-666 font-size-r18 text-align-c mtr5">已核酸检测</p>
                                </div>
                                <div class="w33-h fl">
                                    <p class="text-align-c font-size-0"><img class="img-68" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-fxtj-06.png"/></p>
                                    <p class="cor-999 font-size-r18 text-align-c mtr5"><em class="font-size-r22 font-bold cor-8f8f8f mrr5" id="UNDETECTED">0</em>人</p>
                                    <p class="cor-666 font-size-r18 text-align-c mtr5">未核酸检测</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-190 h100 fl">
                <div class="h-982">
                    <div class="ncds-top-left h100 ptr15 bs cun-box-bg-ext2 ncds-w1">
                        <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                        <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                        <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                        <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                        <div class="ncds-contnet posi-rela h100">
                            <div class="gzt-div-title">
                                <p class="font-size-r20  font-bold plr20 cor-d61e1e">常用功能</p>
                            </div>
                            <div class="gzt-div-com">
                                <div class="w100 h100 plr20 prr20 ptr20 pbr20 bs flex flex-jb flex-ac flex-clm" id="commonFunctions">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 升级指南套餐弹窗。 -->
        <div class="mask mask-taocan hide">
            <div class="mask-bg"></div>
            <div class="div-taocan-com plr100 prr100 bs">
                <div class="mc-close flex flex-ac flex-jc"><i class="i1 mrr5"></i><em>关闭</em></div>
                <div class="font-size-r18">
                    <p class="text-align-c mtr50 mbr30"><img class="img-557-36" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/title.png"/></p>
                    <p class="text-align-c font-size-r24 cor-80">联系当地电信分局进行升级以下套餐，方可使用对应版本的应用和功能。</p>
                </div>
                <div class="div-tc mtr60">
                    <div class="tc-item-text fl" id="upgradeGuideBasicEdition">
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
                    <div class="tc-item-text fl mlr40 mrr40" id="upgradeGuideStandardEdition">
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
                    <div class="tc-item-text fl" id="upgradeGuideExclusiveEdition">
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

    <script src="${uiDomain!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>

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
            autohidemode: true
        });

        // 左上角。
        $('.j-tab-title-01 > a').on('click', function() {
            $(this).addClass('active').siblings().removeClass('active');
            $('.tab-con-01>div').eq($(this).index()).addClass('show').siblings().removeClass('show');
            $('.h-x').getNiceScroll().resize();

            // 三务公开。
            let turnToMore = $('#turnToMore');
            if ($(this)[0].id === 'threeServicesDisclosureA') {
                findNoticeList('10000003', 'threeServicesDisclosureContent');

                // 更换“更多”。
                turnToMore.attr('onclick', 'turnToView(\'三务公开\', \'ztdr\', \'\', \'10000003\')');
                turnToMore.show();

            // 办事指南。
            } else if ($(this)[0].id === 'serviceGuideA') {
                getServiceGuideData();

                // 更换“更多”。
                turnToMore.attr('onclick', 'turnToView(\'办事指南\', \'convenient\', \'\', \'\')');
                turnToMore.show();

            // 政策宣传。
            } else if ($(this)[0].id === 'policyPublicityA') {
                findNoticeList('10000006', 'policyPublicity');

                // 更换“更多”。
                turnToMore.attr('onclick', 'turnToView(\'政策宣传\', \'ztdr\', \'\', \'10000006\')');
                turnToMore.show();

            // 村规民约。
            } else if ($(this)[0].id === 'villageRulesAndRegulationsA') {
                findNoticeList('10000009', 'villageRulesAndRegulationsContent');

                // 隐藏“更多”。
                turnToMore.hide();
            }
        });
        // // 左下角。
        // $('.j-tab-title-02 > a').on('click', function() {
        //     $('.j-tab-title-02 > a').find('i').removeClass('show');
        //     $(this).addClass('active').siblings().removeClass('active');
        //     $(this).find('i').addClass('show');
        //     $('.tab-con-02 > div').eq($(this).index()).addClass('show').siblings().removeClass('show');
        // });



        let leftTopSwiper = '';

        findNoticeList('10000003', 'threeServicesDisclosureContent');   // 村务公开。
        // findNoticeList('10000006', 'policyPublicity');   // 政策宣传。
        // findNoticeList('10000009', 'villageRulesAndRegulationsContent');   // 村规民约。
        findNoticeList('10000020', 'noticeAnnouncement');   // 通知公告。
        findNoticeList('10000030', 'epidemicPreventionInformation');   // 防疫资讯。
        function findNoticeList(catalogId, divId) {
            $('#' + divId).empty();

            let rows = 3;
            // 村务公开。
            if (catalogId === '10000003') {
                rows= 4;
            // 政策宣传。
            } else if (catalogId === '10000006') {
                rows = 20;
            // 村规民约。
            } else if (catalogId === '10000009') {
                rows = 1;
            }

            $.ajax({
                type: 'POST',
                url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json',
                data: {
                    orgCode: '${regionCode!''}',
                    page: 1,
                    rows: rows,
                    catalogId: catalogId,
                    isEndPubDate: 'no',
                    isPic: 'yes',
                    isPubOrg: 'no',
                    isTop: 'yes'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    let noDataHtmlStyle = '';
                    if (catalogId === '10000020' || catalogId === '10000030') {
                        noDataHtmlStyle = 'style="margin-top:0;"';
                    }
                    let noDataHtml = '<div class="none-data-ext1">' +
                                     '<img class="none-data-p1" ' + noDataHtmlStyle + ' src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                     '<p class="none-data-t1">暂无数据</p>' +
                                     '</div>';
                    let noPictureDataHtml = '<div class="w100 h100 comm-zwtp flex flex-ac flex-jc"><img src="${uiDomain!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png"></div>';
                    let html = '';
                    let pictureHtml = '';

                    if (data) {
                        if (data.total > 0) {
                            let dataList = data.rows;
                            let imgNum = 0;

                            for (let i = 0; i < dataList.length; i++) {
                                let infoOpenId = dataList[i].infoOpenId;
                                let picture = dataList[i].fileName ? '<img src="${imgDomain}' + dataList[i].fileName + '" class="posi-abso w100 h100 comm-zwtp flex flex-ac flex-jc">' :
                                                                     '<div class="none-data-ext1">' +
                                                                     '<img class="none-data-p1" ' + noDataHtmlStyle + ' src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                                                     '<p class="none-data-t1">暂无图片</p>' +
                                                                     '</div>';
                                let title = dataList[i].title || '暂无标题';
                                let pubDate = dataList[i].pubDate;

                                // 村务公开。
                                if (catalogId === '10000003') {
                                    if (dataList[i].fileName) {
                                        pictureHtml += '<div class="swiper-slide">' +
                                            '                                                        <div class="mb-cclt-bg">' +
                                            picture +
                                            '                                                        </div>' +
                                            '                                                    </div>';
                                        imgNum ++;
                                    }

                                    if (i === 0) {
                                        html += '<p class="cor-333 font-size-r24 font-bold text-line-c2 plr10" title="' + title + '" onclick="turnToView(\'三务公开\', \'ztdr\', ' + infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;">' + title + '</p>' +
                                                '                                            <p class="cor-666 font-size-r16 mtr10 plr10">' + pubDate + '</p>';
                                    } else {
                                        let htmlClass = '';

                                        if (i === 1) {
                                            htmlClass = 'mtr20';
                                        } else {
                                            htmlClass = 'mtr10';
                                        }

                                        html += '<div class="bg-fff9d7 box-radius6 ptr10 pbr10 plr30 prr20 bs ' + htmlClass + '" onclick="turnToView(\'三务公开\', \'ztdr\', ' + infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;">' +
                                                '                                                <p class="p1-bef cor-333 font-size-r18 mbr5"><p class="w100 font-size-r18 text-line-c1" title="' + title + '">' + title + '</p></p>' +
                                                '                                                <p class="cor-666 font-size-r16 text-line-c1">' + pubDate + '</p>' +
                                                '                                            </div>';
                                    }

                                // 政策宣传。
                                } else if (catalogId === '10000006') {
                                    html += '<div class="div-zxxc plr20 prr20 ptr10 pbr10 bs mbr10" onclick="turnToView(\'政策宣传\', \'ztdr\', ' + infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;">' +
                                            '                                                <p class="font-size-0  plr35">' +
                                            '                                                    <span class="cor-333 font-size-r18 span1 text-line-c1 mrr10" title="' + title + '">' + title + '</span>' +
                                            '                                                    <span class="fr cor-666 font-size-r18">' + pubDate.substr(0, 10) + '</span>' +
                                            '                                                </p>' +
                                            '                                            </div>';

                                // 村规民约。
                                } else if (catalogId === '10000009') {
                                    picture = dataList[i].fileName ? '<img src="${imgDomain}' + dataList[i].fileName + '" class="w100 h100 comm-zwtp flex flex-ac flex-jc">' :
                                                                     '<div class="w100 h100 comm-zwtp flex flex-ac flex-jc"><img src="${uiDomain!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png"></div>';
                                    pictureHtml += picture;

                                    // 获取内容。
                                    let onclickHtml = 'onclick="window.open(\'${gbpDomain!''}/gbp/commonInfoOpen/homeShow.jhtml?catalogId=' + catalogId + '&infoOpenId=' + infoOpenId + '\')" style="cursor:pointer;"';
                                    getOverViewByInfoOpenIds(infoOpenId, noDataHtml, onclickHtml);

                                // 通知公告。
                                } else if (catalogId === '10000020') {
                                    html += '<p class="font-size-0 line-height-r26" onclick="turnToView(\'通知公告\', \'ztdr\', ' + infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;">' +
                                            '                                            <span class="cor-333 font-size-r18 span1 text-line-c1 mrr10" title="' + title + '">' + title + '</span>' +
                                            '                                            <span class="span2 plr5 prr5">new</span>' +
                                            '                                            <span class="fr cor-666 font-size-r18">' + pubDate.substr(0, 10) + '</span>' +
                                            '                                        </p>';
                                // 防疫资讯。
                                } else if (catalogId === '10000030') {
                                    html += '<p class="font-size-0 line-height-r26 plr15" onclick="turnToView(\'防疫资讯\', \'ztdr\', ' + infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;">' +
                                            '                                            <span class="cor-333 font-size-r18 span1 text-line-c1 mrr10" title="' + title + '">' + title + '</span>' +
                                            '                                            <span class="span2 plr5 prr5">new</span>' +
                                            '                                            <span class="fr cor-666 font-size-r18">' + pubDate.substr(0, 10) + '</span>' +
                                            '                                        </p>';
                                }
                            }

                            // 村务公开。
                            if (catalogId === '10000003') {
                                $('#threeServicesDisclosurePicture').html(pictureHtml);

                                // 左侧头部的图片轮番
                                if (leftTopSwiper) {
                                    leftTopSwiper.destroy();
                                }
                                if (imgNum > 1) {
                                    leftTopSwiper = new Swiper('.mb-cclt-box-content', {
                                        loop: true,
                                        pagination: {
                                            el: '.mb-cclt-box-content>.swiper-pagination'
                                        },
                                        autoplay: {
                                            delay: 5000,
                                            stopOnLastSlide: false,
                                            disableOnInteraction: false
                                        }
                                    });
                                } else {
                                    leftTopSwiper = new Swiper('.mb-cclt-box-content', {
                                        loop: true,
                                        pagination: {
                                            el: '.mb-cclt-box-content>.swiper-pagination'
                                        }
                                    });
                                }
                            // 村规民约。
                            } else if (catalogId === '10000009') {
                                $('#villageRulesAndRegulationsDivInside').addClass('bg-fff9d7');
                                $('#villageRulesAndRegulationsPicture').html(pictureHtml);

                            // 通知公告。
                            } else if (catalogId === '10000020') {
                                $('#noticeAnnouncementMore').show();

                            // 防疫资讯。
                            } else if (catalogId === '10000030') {
                                $('#epidemicPreventionInformationMore').show();
                            }

                            $('#' + divId).html(html);

                        } else {
                            noPictureDataHtml = '<div class="none-data-ext1">' +
                                                '<img class="none-data-p1" ' + noDataHtmlStyle + ' src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                                '<p class="none-data-t1">暂无图片</p>' +
                                                '</div>';

                            $('#' + divId).html(noDataHtml);

                            // 村务公开。
                            if (catalogId === '10000003') {
                                $('#threeServicesDisclosurePicture').html(noPictureDataHtml);
                            // 村规民约。
                            } else if (catalogId === '10000009') {
                                $('#villageRulesAndRegulationsPicture').html(noPictureDataHtml);
                            }
                        }
                    } else {
                        $('#' + divId).html(noDataHtml);

                        // 村务公开。
                        if (catalogId === '10000003') {
                            $('#threeServicesDisclosureDiv').html(noDataHtml);

                        // 村规民约。
                        } else if (catalogId === '10000009') {
                            $('#villageRulesAndRegulationsDivOutside').html(noDataHtml);
                        }
                    }
                },
                error: function() {
                    console.log('获取' + catalogId + '数据连接超时！');
                },
                complete : function() {
                }
            });
        }

        // 详情。
        function turnToView(title, type, infoOpenId, catalogId) {
            let url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=' + title + '&module=' + type + '&infoOpenId=' + infoOpenId + '&catalogId=' + catalogId;
            window.open(url);
        }

        // 办事指南。
        function getServiceGuideData() {
            $.ajax({
                type: 'POST',
                url: '${weChatDomain!''}/cct/handlingMatters/listDataJsonP.mhtml',
                data: {
                    page: 1,
                    rows: 20,
                    orgCode: ${regionCode!''}
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    let noDataHtml = '<div class="none-data-ext1">' +
                                     '<img class="none-data-p1" style="margin-top:0;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                     '<p class="none-data-t1">暂无数据</p>' +
                                     '</div>';
                    let html = '';

                    if (data) {
                        if (data.total > 0) {
                            let dataList = data.rows;

                            for (let i = 0; i < dataList.length; i++) {
                                let hmId = dataList[i].hmId;
                                let mattersName = dataList[i].mattersName || '';
                                let createTime = dataList[i].createTime.substr(0, 10);

                                html += '<div class="div-bszn bg-fff9d7 box-radius6 plr20 prr20 ptr10 pbr10 bs mbr10" onclick="turnToView(\'办事指南\', \'convenient\', ' + hmId + ', \'\')" style="cursor:pointer;">' +
                                        '                                                <p class="font-size-0  plr35">' +
                                        '                                                    <span class="cor-333 font-size-r18 span1 text-line-c1 mrr10" title="' + mattersName + '">' + mattersName + '</span>' +
                                        '                                                    <span class="fr cor-666 font-size-r18">' + createTime + '</span>' +
                                        '                                                </p>' +
                                        '                                            </div>';
                            }

                            $('#convenientQuery').html(html);
                        }
                    } else {
                        $('#convenientQuery').html(noDataHtml);
                    }
                },
                error: function() {
                    console.log('获取办事指南数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 获取内容。
        function getOverViewByInfoOpenIds(stringIds, noDataHtml, onclickHtml) {
            $.ajax({
                type: 'POST',
                url: '${gbpDomain!''}/gbp/commonInfoOpen/getOverViewByIdsForJsonp.json',
                data: {
                    ids: stringIds,
                    regionCode: '${regionCode!''}'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    if (data) {
                        let overViewList = [];
                        for (let i in data) {
                            overViewList.push(data[i]);
                        }

                        let overView = overViewList[0] ? overViewList[0].replace(/<[^>]+>/g, '') : noDataHtml;
                        onclickHtml = overView ? onclickHtml : '';
                        let html = '<p class="cor-333 font-size-r18 text-indent2 line-height-r30" ' + onclickHtml + '>' + overView + '</p>';

                        $('#villageRulesAndRegulationsContent').html(html);
                    } else {
                        $('#villageRulesAndRegulationsContent').html(noDataHtml);
                    }
                },
                error: function() {
                    console.log('获取' + stringIds + '数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 辖区事件。
        getJurisdictionalEventsData();
        function getJurisdictionalEventsData() {
            $.ajax({
                type: 'POST',
                url: '${eventDomain}/zhsq/event/eventDisposal4OuterController/fetchEventData4Jsonp.json?jsonpcallback=?&t=' + Math.random(),
                data: {
                    page: 1,
                    rows: 3,
                    infoOrgCode: '${regionCode!''}'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    let noDataHtml = '<div class="none-data-ext1">' +
                                     '<img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                     '<p class="none-data-t1">暂无数据</p>' +
                                     '</div>';
                    let html = '';

                    if (data) {
                        let list = data.list;

                        if (list.length > 0) {
                            for (let i = 0; i < list.length; i++) {
                                let eventId = list[i].eventId;
                                let eventName = list[i].eventName || '暂无名称';

                                let status = list[i].status;
                                let statusColor = '';
                                let statusName = '';
                                if (status === '00') {
                                    statusColor = 'dt-span-orange';
                                    statusName = '待处理';
                                } else if (status === '01' || status === '02') {
                                    statusColor = 'dt-span-orange';
                                    statusName = '处理中';
                                } else {
                                    statusColor = 'dt-span-lv';
                                    statusName = '已处理';
                                }

                                let occurred = list[i].occurred || '暂无位置';
                                let happenTimeStr = list[i].happenTimeStr;

                                html += '<div class="h-80 mtr35" onclick="turnToView(\'辖区事件\', \'sjlb\', ' + eventId + ', \'\')" style="cursor:pointer;">' +
                                    <#--'                                            <div class="pic-dongt img100 fl">' +-->
                                    <#--'                                                <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/img-cunm.png">' +-->
                                    <#--'                                            </div>' +-->
                                    <#--'                                            <div class="pic-dongt-r fr">' +-->
                                    '                                            <div class="pic-dongt-r" style="width:auto;">' +
                                    '                                                <p class="clearfix font-size-r16 mtr5">' +
                                    '                                                    <span class="fl span1 text-line-c1 font-bold font-size-r18 cor-333 mrr10" title="' + eventName + '">' + eventName + '</span>' +
                                    '                                                    <span class="span2 ver0 plr5 prr5">new</span>' +
                                    '                                                    <span class="fr font-bold ' + statusColor + '">' + statusName + '</span>' +
                                    '                                                </p>' +
                                    '                                                <p class="clearfix font-size-0 mtr20">' +
                                    '                                                    <span class="dw-span fl img100">' +
                                    '                                                        <img src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-daohang.png">' +
                                    '                                                    </span>' +
                                    '                                                    <span class="fl span1 text-line-c1 font-size-r16 cor-333 mlr5" title="' + occurred + '">' + occurred + '</span>' +
                                    '                                                    <span class="fr coe-666 font-size-r16">' + happenTimeStr + '</span>' +
                                    '                                                </p>' +
                                    '                                            </div>' +
                                    '                                        </div>';
                            }

                            $('#jurisdictionalEventsNumber').html(list.length);
                            $('#jurisdictionalEventsContent').html(html);
                        } else {
                            $('#jurisdictionalEventsContent').html(noDataHtml);
                        }
                    } else {
                        $('#jurisdictionalEventsContent').html(noDataHtml);
                    }
                },
                error: function() {
                    console.log('获取辖区事件数据连接超时！');
                },
                complete: function() {
                }
            });
        }



        getCommonFunctionsData();
        $(function () {
            getCount();// 返乡人员统计
        });


        function getCount() {
            let date = getNowFormatDate(new Date());
            date = date.substring(0, 7);

            $.ajax({
                type: 'get',
                url: '${weChatDomain!''}/web/xiongan/EpidemicStatistics/getCount.mhtml',
                data: {
                    regionCode: "${regionCode!''}",
                    date: date
                },
                dataType: 'jsonp',
                jsonp: "jsonpCallback",
                success: function(data) {
                    var data = data[0];
                    $('#DETECTED').html(data.DETECTED);
                    $('#HIGHDANGER').html(data.HIGHDANGER);
                    $('#LOWDANGER').html(data.LOWDANGER);
                    $('#TOTAL').html(data.TOTAL);
                    $('#UNDETECTED').html(data.UNDETECTED);
                    $('#ABROADBCAK').html(data.ABROADBCAK);
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
                month = '0' + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = '0' + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }



        getCommonFunctionsData();
        function getCommonFunctionsData() {
            let idName = 'commonFunctions';
            $('#' + idName).empty();

            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/workBench/getModularContentNew.jhtml',
                data: {
                    useType: 'cygn',   // 使用场景：常用功能。
                    regionCode: '${regionCode!''}',   // 区域编码。
                    type: '7',   // 模块类型：导航栏。
                    platform: 'pc'   // 使用平台：大屏。
                },
                success: function(data) {
                    let noDataHtml = '<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                                     '<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>' +
                                     '</div>';

                    if (data) {
                        let dvModulars = data.dvModulars;

                        if (dvModulars) {
                            for(let i = 0; i < dvModulars.length; i ++) {
                                let useType = dvModulars[i].useType;

                                if (useType === 'cygn') {
                                    let modularContents = dvModulars[i].modularContents;
                                    setButtonHtml(modularContents, idName);
                                }
                            }
                        } else {
                            $('#' + idName).html(noDataHtml);
                        }
                    } else {
                        $('#' + idName).html(noDataHtml);
                    }
                },
                error: function(data) {
                },
                complete: function() {

                }
            });
        }

        function setButtonHtml(modularContents, idName) {
            let html = '';

            for (let i = 0; i < (modularContents.length < 5 ? modularContents.length : 5); i++) {
                let url = modularContents[i].url || '';
                let picUrl = modularContents[i].attList.length > 0 ? '${imgDomain}' + modularContents[i].attList[0].filePath : '${uiDomain!''}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png';
                let name = modularContents[i].name || '';

                let divClass = '';
                if (i === 0) {
                    divClass= 'mtr10';
                }

                html += '<div class="' + divClass + '" onclick="judgePackagePermissions(\'' + name + '\', \'' + url + '\')" style="cursor: pointer;">' +
                    '                                        <p class="text-align-c font-size-0"><img class="nav-img-80" src="' + picUrl + '"/></p>' +
                    '                                        <p class="cor-333 font-size-r20 text-align-c mtr10">' + name + '</p>' +
                    '                                    </div>';

            }

            html += '<div class="j-shengji-zhinan cursor">' +
                '                                        <p class="text-align-c font-size-0"><img class="nav-img-80" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/gongzuotai/icon-cy-07.png"/></p>' +
                '                                        <p class="cor-333 font-size-r20 text-align-c mtr10">升级指南</p>' +
                '                                    </div>';

            $('#' + idName).html(html);

            // 打开套餐弹窗。
            $('.j-shengji-zhinan').on('click', function() {
                $('.mask-taocan').addClass('show');
            });
            // 关闭套餐弹窗。
            $('.mc-close').on('click', function() {
                $(this).parents('div.mask').removeClass('show');
            });
        }

        // 常用功能判断套餐权限。
        let positionCode = '${positionCode!''}';
        function judgePackagePermissions(buttonName, url) {
            if (positionCode) {
                if (positionCode === '00001') {   // 福建省基础版。
                    if (buttonName !== '工作台' && buttonName !== '疫情防控' && buttonName !== '村务政务' && buttonName !== '村务通知') {
                        setTipsPopupContent(buttonName);
                        return;
                    }
                } else if (positionCode === '00002') {   // 福建省标准版。
                    if (buttonName !== '工作台' && buttonName !== '疫情防控' && buttonName !== '村务政务' &&
                        buttonName !== '智慧党建' && buttonName !== '平安乡村' && buttonName !== '村务通知') {
                        setTipsPopupContent(buttonName);
                        return;
                    }
                }
            }

            if (url) {
                window.open(url);
            }
        }

        // 设置提示弹窗内容并打开。
        let packageVersionText = $('#packageVersionText');
        function setTipsPopupContent(functionName) {
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

        // 判断升级指南当前套餐。
        if (positionCode) {
            if (positionCode === '00001') {   // 福建省基础版。
                $('#upgradeGuideBasicEdition').addClass('active');
                $('#upgradeGuideStandardEdition').removeClass('active');
                $('#upgradeGuideExclusiveEdition').removeClass('active');

            } else if (positionCode === '00002') {   // 福建省标准版。
                $('#upgradeGuideBasicEdition').removeClass('active');
                $('#upgradeGuideStandardEdition').addClass('active');
                $('#upgradeGuideExclusiveEdition').removeClass('active');

            } else if ('${positionCode!''}' === '00003') {   // 福建省尊享版。
                $('#upgradeGuideBasicEdition').removeClass('active');
                $('#upgradeGuideStandardEdition').removeClass('active');
                $('#upgradeGuideExclusiveEdition').addClass('active');
            }
        }
    </script>
</body>
</html>