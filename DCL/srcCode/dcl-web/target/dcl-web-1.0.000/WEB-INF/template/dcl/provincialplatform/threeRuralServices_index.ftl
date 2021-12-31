<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>三农服务</title>
    <meta name=referrer content=no-referrer>

    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/com-gd.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-cwzw.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-sannongfuwu.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${uiDomain!''}/web-assets/common/js/calc-rem.js"></script>
    <script src="${uiDomain!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${uiDomain!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>

    <style>
        /* 暂无图片。 */
        .comm-zwtp > img {
            display: block;
            width: 0.7rem;
            height: 1rem;
        }

        /* 便民查询图片。 */
        .bmfw-pic2 {
            width: 0.67rem;
        }
        /* 便民查询页签。 */
        .mv-pt-left > p span {
            cursor: default;
        }
    </style>
</head>

<body>
    <div class="h100  djyl-bj-padd02 bs">
        <div class="h100 prr25 bs clearfix h-x posi-rela">
            <!-- 左右结构 -->
            <!-- 左 -->
            <div class="fl djyl-zwgk-w">
                <!-- 便民服务 -->
                <div class="w100 h-460 cun-box-bg-ext2 posi-rela mbr18" id="bmfw">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">便民服务</p>
                        </div>
                    </div>
<#--                    <div class="mb-public-title mtr10">-->
<#--                        <div class="claerfix fl mv-pt-left mlr20 mrr20">-->
<#--                            <i class="fl"></i>-->
<#--                            <p class="fl"><span class="active" id="convenientQuerySpan">便民查询</span><em class="mlr15 mrr15">|</em><span id="serviceGuideSpan">办事指南</span></p>-->
<#--                        </div>-->
<#--                    </div>-->
                    <div class="mb-public-title mtr10">
                        <div class="claerfix fl mv-pt-left mlr20 mrr20">
                            <i class="fl"></i>
                            <p class="fl"><span>便民查询</span></p>
                        </div>
                    </div>

                    <div class="w100 posi-rela h-350 h-o">
                        <div class="clearfix div-bmcx h100 mlr20 mrr20 posi-rela h-x" id="convenientQuery">

                        </div>
                    </div>
                </div>
                <!-- 农业知识库 -->
                <div class="w100 h-500 cun-box-bg-ext2 posi-rela" id="nyzsk">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 内容 -->
                    <div class="plr20 prr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">农业知识库</p>
                            </div>
                        </div>
                        <div class="clearfix  mtr20 w100 h-o h-82 mySwiper-zsk  plr50 prr50 bs posi-rela">
                            <div class="swiper mySwiper h-82 h-o bs">
                                <div class="swiper-wrapper">
                                    <#if encyclopediasList??>
                                        <#list encyclopediasList as encyclopedias>
                                            <div class="swiper-slide bs">
                                                <div class="w100 h-82 fl dic-zsk00 dic-zsk01 <#if encyclopedias_index == 0>active</#if>" <#if encyclopedias_index == 0>id="firstEncyclopedias"</#if>>
                                                    <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15" id="${encyclopedias.dictCode}">0</p>
                                                    <p class="font-size-r16 text-align-c cor-666">${encyclopedias.dictName}</p>
                                                </div>
                                            </div>
                                        </#list>
                                    </#if>

<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk01 active">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">植保技术</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk01 active">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">植保技术</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk02">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">农业知识</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk03">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">化肥知识</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk04">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">农资农机</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk05">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">种子知识</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk04">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">农资农机</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="swiper-slide bs">-->
<#--                                        <div class="w100 h-82 fl dic-zsk00 dic-zsk05">-->
<#--                                            <p class="font-size-r24 text-align-c font-bold font-aldr col-d62a1e mtr15">12</p>-->
<#--                                            <p class="font-size-r16 text-align-c cor-666">种子知识</p>-->
<#--                                        </div>-->
<#--                                    </div>-->
                                </div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        <!-- 左右结构 -->
                        <div class="bg-fff9d7 h-300 plr20 prr20 ptr20 pbr20 h-x" id="agriculturalKnowledgeBase">

                        </div>
                    </div>
                </div>
            </div>
            <!-- 右 -->
            <div class="fr djyl-zwgk-w534">
                <!-- 农业视频 -->
                <div class="w100 h-680 cun-box-bg-ext2 posi-rela mbr18" id="nysp">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 内容 -->
                    <div class="plr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">农业视频</p>
                            </div>
                        </div>
                        <div class="w100 h-600 mtr20 posi-rela">
                            <div class="w-120 h100 fl j-div-sp mySwiper-sp h-o ptr50 pbr50 bs posi-rela">
                                <div class="swiper mySwiper  h100  posi-rela bs h-o">
                                    <div class="swiper-wrapper">
                                        <#if agriculturalVideoList??>
                                            <#list agriculturalVideoList as agriculturalVideo>
                                                <div class="swiper-slide w100 h-112 bs">
                                                    <div class="w100 h-112 fl dic-sp00 dic-sp03 flex flex-ac flex-jc <#if agriculturalVideo_index == 0>active</#if>" <#if agriculturalVideo_index == 0>id="firstAgriculturalVideo"</#if>>
                                                        <p class="font-size-r16 text-align-c cor-666" id="${agriculturalVideo.dictCode}">${agriculturalVideo.dictName}</p>
                                                    </div>
                                                </div>
                                            </#list>
                                        </#if>

<#--                                        <div class="swiper-slide w100 h-112 bs">-->
<#--                                            <div class="w100 h-112 dic-sp00 dic-sp01 active flex flex-ac flex-jc">-->
<#--                                                <p class="font-size-r16 text-align-c cor-666">互联网知识</p>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                        <div class="swiper-slide w100 h-112 bs">-->
<#--                                            <div class="w100 h-112 fl dic-sp00 dic-sp02 flex flex-ac flex-jc">-->
<#--                                                <p class="font-size-r16 text-align-c cor-666">操作说明</p>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                        <div class="swiper-slide w100 h-112 bs">-->
<#--                                            <div class="w100 h-112 fl dic-sp00 dic-sp03 flex flex-ac flex-jc">-->
<#--                                                <p class="font-size-r16 text-align-c cor-666">农业技术</p>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                        <div class="swiper-slide w100 h-112 bs">-->
<#--                                            <div class="w100 h-112 fl dic-sp00 dic-sp04 flex flex-ac flex-jc">-->
<#--                                                <p class="font-size-r16 text-align-c cor-666">种植技术</p>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                        <div class="swiper-slide w100 h-112 bs">-->
<#--                                            <div class="w100 h-112 fl dic-sp00 dic-sp05 flex flex-ac flex-jc">-->
<#--                                                <p class="font-size-r16 text-align-c cor-666">养殖技术</p>-->
<#--                                            </div>-->
<#--                                        </div>-->
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                            <div class="w100-135 div-sp-com h100 fr prr20 bs h-x" id="agriculturalVideo">

                            </div>
                        </div>
                    </div>
                </div>

                <!-- 农技专家 -->
                <div class="w100 h-280 cun-box-bg-ext2 posi-rela" id="njzj">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <!-- 内容 -->
                    <div class="plr20 prr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">农技专家</p>
                            </div>
                        </div>
                        <div class="w100 h-190  mtr20 posi-rela">

                            <div class="w100 h100  plr15 prr15 pbr10 bs">
                                <div class="w100 h100 h-o">
                                    <div class="swiper mySwiper mySwiper-xxb">
                                        <div class="swiper-wrapper" id="expert">

                                        </div>
                                        <div class="swiper-pagination"></div>
                                    </div>
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
    <div class="mask mask-taocan02 hide " id="tipsPopup" style="z-index: 1000;">
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
    $('.szsh-mbc-content-box').on('click', '.szsh-mbcc-item', function() {
        $(this).addClass('active').siblings().removeClass('active');
    });

    // 农业知识库。
    $('.mySwiper-zsk div.dic-zsk00').on('click', function() {
        $('.mySwiper-zsk div.dic-zsk00').removeClass('active');
        $(this).addClass('active');

        let catalogCode = $(this).children().attr('id');   // 二级分类标识（数据字典编码）。
        findNoticeList('10000114', catalogCode);
    });
    // 农业视频。
    $('.mySwiper-sp div.dic-sp00').on('click', function() {
        $('.mySwiper-sp div.dic-sp00').removeClass('active');
        $(this).addClass('active');

        let catalogCode = $(this).children().attr('id');   // 二级分类标识（数据字典编码）。
        findNoticeList('10000029', catalogCode);
    });

    // 更多功能收起和展开事件
    $('.szsh-more-closed').click(function() {
        $(this).parents('.szsh-mb-content').animate({right:"-1.14rem"}, 'linear', function() {
            $('.szsh-m-box').removeClass('hide');
        })
    });
    $('.szsh-m-box').click(function() {
        $('.szsh-m-box').addClass('hide');
        $(this).siblings('.szsh-mb-content').animate({right:".1rem"}, 'linear')
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
    // swiper
    var mySwiper = new Swiper('.swiper01', {
        speed:2000,
        autoplay: {
            delay: 3000,
            stopOnLastSlide: true,
            disableOnInteraction: false
        },//可选选项，自动滑动
        spaceBetween: 20,
        loop: true,
        pagination: {
            el: '.swiper-pagination'
        },
        // direction: 'vertical',
        observer: true, //修改swiper自己或子元素时，自动初始化swiper
        observeParents: true //修改swiper的父元素时，自动初始化swiper
    });

    var swiperxx = new Swiper(".mySwiper-zsk .swiper", {
        slidesPerView: 5,
        spaceBetween: 20,
        navigation: {
            nextEl: ".mySwiper-zsk .swiper-button-next",
            prevEl: ".mySwiper-zsk .swiper-button-prev",
        },
    });
    var swiperx = new Swiper(".mySwiper-sp .swiper", {
        slidesPerView: 4,
        direction: 'vertical',
        spaceBetween: 20,
        navigation: {
            nextEl: ".mySwiper-sp .swiper-button-next",
            prevEl: ".mySwiper-sp .swiper-button-prev",
        },
    });



    // 便民服务页签点击切换。
    // $('.claerfix').on('click', 'span', function () {
    //     $(this).addClass('active').siblings().removeClass('active');
    //
    //     // 便民查询。
    //     if ($(this)[0].id === 'convenientQuerySpan') {
    //         getConvenientQueryContentData();
    //     // 办事指南。
    //     } else if ($(this)[0].id === 'serviceGuideSpan') {
    //         getServiceGuideData();
    //     }
    // });

    // 便民查询。
    getConvenientQueryContentData();
    function getConvenientQueryContentData() {
        $('#convenientQuery').empty();

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/convenient/getModularContent.json',
            data: {
                currentPage: 1,
                pageSize: 100,
                orgCode: ${regionCode!''},
                modularName: '办事分类'
            },
            dataType: 'json',
            success: function(data) {
                let html = '';

                if (data.count > 0) {
                    let dataList = data.data;

                    for (let i = 0; i < dataList.length; i++) {
                        let subtitleName = dataList[i].name || '';
                        let attList = dataList[i].attList;
                        let img = '';
                        let url = dataList[i].url || '';

                        if (attList.length > 0) {
                            let attUrl = dataList[i].attList[0].filePath;
                            if (attUrl) {
                                img = '${imgDomain!''}' + attUrl;
                            }
                        }

                        html += '<div class="w-33-10 h-100 fl bg-fff9d7 flex flex-ac flex-js"';

                        if (url) {
                            html += ' onclick="turnToView(\'' + url + '\')"';
                        }

                        html += '><span class="font-size-0 mlr20 img100 bmfw-pic2">';

                        if (img) {
                            html += '<img src="' + img + '" alt="">';
                        }

                        html += '</span>' +
                            '<span class="font-size-r16 mlr10" title="' + subtitleName + '" style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' +
                            subtitleName +
                            '</span>' +
                            '</div>';
                    }
                } else {
                    html = '<div class="none-data-ext1" style="height:85%">' +
                           '<img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                           '<p class="none-data-t1">暂无数据</p>' +
                           '</div>';
                    $("#convenientQuery").removeClass("div-bmcx");
                }

                $('#convenientQuery').html(html);
            },
            error: function(data) {
                console.log('获取便民查询数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    // 详情。
    function turnToView(url) {
        window.open(url);
    }

    // 更多。
    function turnToMore(title, type, infoOpenId) {
        let url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=' + title + '&module=' + type + '&infoOpenId=' + infoOpenId;
        window.open(url);
    }

    // 办事指南。
    function getServiceGuideData() {
        $('#convenientQuery').empty();

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
                if (data.total > 0) {
                    let dataList = data.rows;
                    let html = '';

                    for (let i = 0; i < dataList.length; i++) {
                        let mattersName = dataList[i].mattersName || '';
                        let updateTime = (dataList[i].updateTime).split(' ')[0];

                        html += '<li class="line-height-r48 plr30 prr30 font-size-0 clearfix" onclick="turnToMore(\'办事指南\', \'convenient\', ' + dataList[i].hmId + ')" style="cursor:pointer;">' +
                            '<span class="font-size-r14 cor-333 font-bold fl bmfw-box-nei text-line-c1">' + mattersName + '</span>' +
                            '<span class="font-size-r14 cor-999 fr">' + updateTime + '</span>' +
                            '</li>';
                    }

                    $('#convenientQuery').html(html);
                }
            },
            error: function(data) {
                console.log('获取办事指南数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    // 农业知识库。
    getBaseData('10000114');
    function getBaseData(catalogId) {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/statCatalogCodeCountForJsonp.json',
            data: {
                catalogId: catalogId,
                orgCode: '${regionCode!''}'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                if (data.length > 0) {
                    for (let i = 0; i < data.length; i++) {
                        $('#' + data[i].CATALOG_CODE).html(data[i].TOTAL);
                    }
                }
            },
            error: function(data) {
                console.log('获取农业知识库各个数据总数连接超时！');
            },
            complete: function() {
            }
        });
    }

    let firstEncyclopedias = $('#firstEncyclopedias').children().attr('id');   // 二级分类标识（数据字典编码）。
    findNoticeList('10000114', firstEncyclopedias);   // 农业知识库。

    let firstAgriculturalVideo = $('#firstAgriculturalVideo').children().attr('id');   // 二级分类标识（数据字典编码）。
    findNoticeList('10000029', firstAgriculturalVideo);   // 农业视频。
    function findNoticeList(catalogId, catalogCode) {
        // 农业知识库。
        if (catalogId === '10000114') {
            $('#agriculturalKnowledgeBase').empty();
        // 农业视频。
        } else if (catalogId === '10000029') {
            $('#agriculturalVideo').empty();
        }

        let	url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json';
        let map = {
            orgCode: "${regionCode!''}",
            page: 1,
            rows: 20
        };
        map.catalogId = catalogId;
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        map.catalogCode = catalogCode;

        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                let html = '';

                if (data.total > 0) {
                    let dataList = data.rows;

                    // 农业知识库。
                    if (catalogId === '10000114') {
                        // 获取发布内容。
                        let stringIds = '';
                        for (let i = 0; i < dataList.length; i++) {
                            stringIds += dataList[i].infoOpenId + ',';
                        }
                        stringIds = stringIds.substring(0, stringIds.length - 1);
                        getOverViewData(stringIds, dataList, catalogId);

                    // 农业视频。
                    } else if (catalogId === '10000029') {
                        for (let i = 0; i < dataList.length; i++) {
                            let title = dataList[i].title || '';
                            let staticUrl = dataList[i].staticUrl;

                            html += '<div class="w30-10 h-174 bs fl">' +
                                '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +
                                '<i class="posi-abso w100 djyl-pic-title font-size-r14 cor-fff plr10 prr20 bs text-line-c1" style="z-index: 999">' + title + '</i>' +
                                "<video controls=\"controls\" style=\"width: 100%;height: 100%;\" autostart=\"false\" loop=\"true\" src=\"" + staticUrl + "\">" +
                                '</div>' +
                                '</div>';
                        }

                        $('#agriculturalVideo').html(html);
                    }
                } else {
                    // 农业知识库。
                    if (catalogId === '10000114') {
                        html = '<div class="none-data-ext1" style="height:85%">' +
                               '<img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                               '<p class="none-data-t1">暂无数据</p>' +
                               '</div>';
                        $('#agriculturalKnowledgeBase').html(html);

                    // 农业视频。
                    } else if (catalogId === '10000029') {
                        html = '<div class="none-data-ext1" style="height:88%">' +
                               '<img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                               '<p class="none-data-t1">暂无数据</p>' +
                               '</div>';
                        $('#agriculturalVideo').html(html);
                    }
                }
            },
            error: function(data) {
                console.log('获取' + catalogId + '数据连接超时！');
            },
            complete : function() {
            }
        });
    }

    // 发布内容。
    function getOverViewData(ids, dataList, catalogId) {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/getOverViewByIdsForJsonp.json',
            data: {
                ids: ids,
                orgCode: '${regionCode!''}'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                let overViewList = [];
                for (let i in data) {
                    overViewList.push(data[i]);
                }
                overViewList.reverse();

                let html = '';
                for (let i = 0; i < dataList.length; i++) {
                    let img = dataList[i].fileName;
                    // 无图片。
                    if (!img) {
                        img = '<div class="posi-abso w100 h100 comm-zwtp flex flex-ac flex-jc">' +
                              '<img src="${uiDomain!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png">' +
                              '</div>';
                    // 信息发布管理 文章封面 有上传。
                    } else if (img.substr(0, 1) === '/') {
                        img = '<img src="${imgDomain!''}' + dataList[i].fileName + '">';
                    // 对接数据。
                    } else {
                        img = '<img src="' + dataList[i].fileName + '">';
                    }

                    let title = dataList[i].title || '暂无标题';
                    let overView = overViewList[i] ? overViewList[i].replace(/<[^>]+>/g, '') : '暂无内容。';

                    html += '<div class="mbr20 h-134 clearfix plr10 posi-rela" onclick="turnToView(\'${gbpDomain!''}/gbp/commonInfoOpen/homeShow.jhtml?tKey=encyclopedias&catalogId=' + catalogId + '&infoOpenId=' + dataList[i].infoOpenId + '\')" style="cursor:pointer;">' +
                        '<div class="fl">' +
                        '<div class="img100 djyl-zwgk-img bor posi-rela">' +
                        img +
                        '</div>' +
                        '</div>' +
                        '<div class="h-134 fr djyl-zwgk-cxjs-w">' +
                        '<div class="h100 h-x">' +
                        '<p class="p-title font-size-r18 cor-333  posi-rela font-bold mbr10 plr20" title="' + title + '" style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + title + '</p>' +
                        '<p class="font-size-r16 cor-333 let-sp1 line-height-r24 text-line-c4">' + overView + '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                }

                $('#agriculturalKnowledgeBase').html(html);
            },
            error: function(data) {
                console.log('获取发布内容数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    // 农技专家。
    getExpertData();
    function getExpertData() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/threeRuralServices/getExpertData.json',
            data: {
                page: 1,
                rows: 20,
                regionCode: ${regionCode!''}
            },
            dataType: 'json',
            success: function(data) {
                let html = '';

                if (data.total > 0) {
                    let dataList = data.rows;

                    for (let i = 0; i < dataList.length; i++) {
                        let img = dataList[i].photoPath ? '<img src="${imgDomain!''}' + dataList[i].photoPath + '">' : '<div class="posi-abso w100 h100 comm-zwtp flex flex-ac flex-jc">' +
                                                                                                                    '<img src="${uiDomain!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png">' +
                                                                                                                    '</div>';
                        let name = dataList[i].name || '';
                        let postName = dataList[i].postName || '';
                        let personalInfo = dataList[i].personalInfo || '';

                        html += '<div class="swiper-slide bg-01 plr20 prr20 ptr20 pbr20 bs" onclick="turnToMore(\'农技专家\', \'expert\', \'' + dataList[i].hashId + '\')" style="cursor:pointer;">' +
                            '<div class="device-list1-pic-zp fl posi-rela">' +
                            img +
                            '</div>' +
                            '<div class="device-list1-cont-zp fr">' +
                            '<p class="font-size-r18 cor-333 font-bold" title="' + name + '" style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + name + '</p>' +
                            '<p class="font-size-r14 text-nor cor-999 text-line-c1 mtr5 mbr10" title="' + postName + '" style="width:80%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + postName + '</p>' +
                            '<p class="font-size-r14 text-nor cor-666 text-line-c4" title="' + personalInfo + '">' + personalInfo + '</p>' +
                            '</div>' +
                            '</div>';
                    }

                    $('#expert').empty();
                    $('#expert').html(html);

                    var swiperxxb = new Swiper(".mySwiper-xxb", {
                        slidesPerView: 2,
                        spaceBetween: 20,
                        pagination: {
                            el: ".mySwiper-xxb .swiper-pagination"
                        }
                    });
                } else {
                    html = '<div class="none-data-ext1">' +
                           '<img class="none-data-p1" style="width:15%; height:15%; margin-top:1.5%;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                           '<p class="none-data-t1">暂无数据</p>' +
                           '</div>';
                    $('#expert').html(html);
                }
            },
            error: function(data) {
                console.log('获取农技专家数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

    bindRightMouse('bmfw');
    bindRightMouse('nyzsk');
    bindRightMouse('nysp');
    bindRightMouse('njzj');

    // 绑定右键
    function bindRightMouse(id) {
        var type = 101;
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
                        // 便民服务。
                        case 'bmfw':
                            // // 便民查询。
                            // if ($('#convenientQuerySpan').attr('class')) {
                            //     type = 101;
                            // // 办事指南。
                            // } else {
                            //     type = 102;
                            // }
                            type = 101;

                            break;
                        // 农业知识库。
                        case 'nyzsk':
                            type = 103;
                            break;
                        // 农业视频。
                        case 'nysp':
                            type = 104;
                            break;
                        // 农技专家。
                        case 'njzj':
                            type = 105;
                            break;
                        default:
                            type = 101;
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