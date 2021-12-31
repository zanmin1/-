<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>农村电商</title>
    <#include "/component/layuiCommonHead.ftl" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-jfyh.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/com-gd.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-nongcundianshang.css"/>
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${uiDomain}/web-assets/common/js/calc-rem.js"></script>
</head>

<style>
    .none-data-t1 {
        text-align: center !important;
        font-size: .28rem!important;
        color: #666;
        font-weight: bold;
    }

    .jfyh-tc-div {
        width: 4.94rem !important;
        height: 4.5rem !important;
        left: calc((100% - 4.64rem) / 2) !important;
    }
</style>

<body>
    <div class="h100 bs ptr20 plr15 pbr15">
        <div class="h100 prr15 h-x clearfix posi-rela">
            <div id="ncdsMenu" class="ncds-h1">
                <!-- 一村一品 -->
                <div class="ncds-top-left h100 cun-box-bg-ext2 ncds-w1">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <div class="ncds-contnet posi-rela h100">

                        <div>
                            <!-- 标题 -->
                            <div class="flex flex-jc box-title-ext1">
                                <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                    <p class="font-size-r18 font-bold text-align-c line-height-r32">一村一品</p>
                                </div>
                            </div>
                        </div>

                        <div class="ncds-swiper1 ncds-h2">
                            <div class="w100 h100 swiper-container">
                                <div class="swiper-wrapper" id="ycyp">
                                    <#--                                    <div class="swiper-slide clearfix">-->
                                    <#--                                        <div class="ncds-list1-item mlr20 fl clearfix">-->
                                    <#--                                            <div class="ncds-list1-pic img-res mlr20 mtr20 fl">-->
                                    <#--                                                <i class="ibof"></i>-->
                                    <#--                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/nongcundianshang/dszb-pic.png">-->
                                    <#--                                                <div class="message-ext2 flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r18 cor-yellow1 mlr20">销量:1584</p>-->
                                    <#--                                                    <p class="font-size-r14 cor-fff mrr20">数据来源:电信114商城</p>-->
                                    <#--                                                </div>-->
                                    <#--                                            </div>-->
                                    <#--                                            <div class="ncds-list1-cont ncds-h3 fr mtr20 mrr5 prr15">-->
                                    <#--                                                <div class="flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r24 font-bold cor-red1">后洋村精品水稻</p>-->
                                    <#--                                                    <a href="javascript:void(0);" class="ncds-btn-ext1 font-size-r15 cor-fff font-bold">扫码查看</a>-->
                                    <#--                                                </div>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr15 text-indent line-height-r24 ncds-list1-t1">简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介，内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容。</p>-->
                                    <#--                                                <span class="ncds-bar-ext1 mtr20"></span>-->
                                    <#--                                                <p class="font-size-r20 cor-red2 mtr15">100~200元/斤</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系人:王强</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系电话:18736548562</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">供应单位:xxx采摘基地</p>-->
                                    <#--                                            </div>-->
                                    <#--                                        </div>-->
                                    <#--                                        <div class="ncds-list1-item mrr20 fr">-->
                                    <#--                                            <div class="ncds-list1-pic img-res mlr20 mtr20 fl">-->
                                    <#--                                                <i class="ibof"></i>-->
                                    <#--                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/nongcundianshang/ycyp-pic1.png">-->
                                    <#--                                                <div class="message-ext2 flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r18 cor-yellow1 mlr20">销量:1584</p>-->
                                    <#--                                                    <p class="font-size-r14 cor-fff mrr20">数据来源:电信114商城</p>-->
                                    <#--                                                </div>-->
                                    <#--                                            </div>-->
                                    <#--                                            <div class="ncds-list1-cont ncds-h3 fr mtr20 mrr5 prr15">-->
                                    <#--                                                <div class="flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r24 font-bold cor-red1">后洋村精品水稻</p>-->
                                    <#--                                                    <a href="javascript:void(0);" class="ncds-btn-ext1 font-size-r15 cor-fff font-bold">扫码查看</a>-->
                                    <#--                                                </div>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr15 text-indent line-height-r24 ncds-list1-t1">简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介，内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容。</p>-->
                                    <#--                                                <span class="ncds-bar-ext1 mtr20"></span>-->
                                    <#--                                                <p class="font-size-r20 cor-red2 mtr15">100~200元/斤</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系人:王强</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系电话:18736548562</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">供应单位:xxx采摘基地</p>-->
                                    <#--                                            </div>-->
                                    <#--                                        </div>-->
                                    <#--                                    </div>-->
                                    <#--                                    <div class="swiper-slide clearfix">-->
                                    <#--                                        <div class="ncds-list1-item mlr20 fl clearfix">-->
                                    <#--                                            <div class="ncds-list1-pic img-res mlr20 mtr20 fl">-->
                                    <#--                                                <i class="ibof"></i>-->
                                    <#--                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/nongcundianshang/dszb-pic.png">-->
                                    <#--                                                <div class="message-ext2 flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r18 cor-yellow1 mlr20">销量:1584</p>-->
                                    <#--                                                    <p class="font-size-r14 cor-fff mrr20">数据来源:电信114商城</p>-->
                                    <#--                                                </div>-->
                                    <#--                                            </div>-->
                                    <#--                                            <div class="ncds-list1-cont ncds-h3 fr mtr20 mrr5 prr15">-->
                                    <#--                                                <div class="flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r24 font-bold cor-red1">后洋村精品水稻</p>-->
                                    <#--                                                    <a href="javascript:void(0);" class="ncds-btn-ext1 font-size-r15 cor-fff font-bold">扫码查看</a>-->
                                    <#--                                                </div>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr15 text-indent line-height-r24 ncds-list1-t1">简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介，内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容。</p>-->
                                    <#--                                                <span class="ncds-bar-ext1 mtr20"></span>-->
                                    <#--                                                <p class="font-size-r20 cor-red2 mtr15">100~200元/斤</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系人:王强</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系电话:18736548562</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">供应单位:xxx采摘基地</p>-->
                                    <#--                                            </div>-->
                                    <#--                                        </div>-->
                                    <#--                                        <div class="ncds-list1-item mrr20 fr">-->
                                    <#--                                            <div class="ncds-list1-pic img-res mlr20 mtr20 fl">-->
                                    <#--                                                <i class="ibof"></i>-->
                                    <#--                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/nongcundianshang/ycyp-pic1.png">-->
                                    <#--                                                <div class="message-ext2 flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r18 cor-yellow1 mlr20">销量:1584</p>-->
                                    <#--                                                    <p class="font-size-r14 cor-fff mrr20">数据来源:电信114商城</p>-->
                                    <#--                                                </div>-->
                                    <#--                                            </div>-->
                                    <#--                                            <div class="ncds-list1-cont ncds-h3 fr mtr20 mrr5 prr15">-->
                                    <#--                                                <div class="flex flex-jb flex-ac">-->
                                    <#--                                                    <p class="font-size-r24 font-bold cor-red1">后洋村精品水稻</p>-->
                                    <#--                                                    <a href="javascript:void(0);" class="ncds-btn-ext1 font-size-r15 cor-fff font-bold">扫码查看</a>-->
                                    <#--                                                </div>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr15 text-indent line-height-r24 ncds-list1-t1">简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介，内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容，简介内容简介内容简介内容简介内容简介内容简介内容。</p>-->
                                    <#--                                                <span class="ncds-bar-ext1 mtr20"></span>-->
                                    <#--                                                <p class="font-size-r20 cor-red2 mtr15">100~200元/斤</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系人:王强</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">联系电话:18736548562</p>-->
                                    <#--                                                <p class="font-size-r16 cor-333 mtr10">供应单位:xxx采摘基地</p>-->
                                    <#--                                            </div>-->
                                    <#--                                        </div>-->
                                    <#--                                    </div>-->
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 周边特产 -->
            <div class="ncds-h4 mtr15 cun-box-bg-ext2">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <div class="ncds-contnet posi-rela h100">
                    <div>
                        <!-- 标题 -->
                        <div class="flex flex-jc box-title-ext1">
                            <div class="box-title-ext1-contet h100 bs flex flex-jc">
                                <p class="font-size-r18 font-bold text-align-c line-height-r32">周边特产</p>
                            </div>
                        </div>
                    </div>
                    <div class="ncds-swiper2 ncds-h5">
                        <div class="w100 h100 swiper-container specialtySwiper">
                            <div class="swiper-wrapper" id="peripherySpecialty">



                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="jfyh-tc hide">
            <div class="jfyh-tc-div">
                <p class="jfyh-tc-div-p line-height-r42 font-size-0 clearfix">
                    <em class="font-size-r14 cor-fff plr20 fl">扫码查看详情</em>
                    <!-- 关闭 -->
                    <a href="Javascript:;" class="jfyh-tc-div-p-a fr mrr10 j-click-lost">
                        <i></i>
                    </a>
                </p>
                <div style="padding-top: 35px" align="center">
                    <div id="qrcode"></div>
                </div>

            </div>
        </div>
    </div>

    <div class="contextMenu" id="rightClickMenu" style="display:none;">
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

<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${rc.getContextPath()}/js/qrcode.min.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js?v=1"></script>`

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
    });

    $(function () {

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer','laypage'], function () {
            var form = layui.form,
                laytpl = layui.laytpl,
                element = layui.element,
                layer = layui.layer;
        // 周边特产
        peripherySpecialty();
        // 点击  关闭弹窗
        $('.j-click-lost').on('click',function(){
            $('.jfyh-tc').fadeOut(300)
        })

        getYcypData();

        bindRightMouse();
        })
    })

  //  var data = [{title:"1"},{title:"2"},{title:"3"}];

    //一村一品数据获取
    function getYcypData() {

        $("#ycyp").empty();

        var html = "";

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/villageProductPc/listData.json',
            data: {
                page: 1,
                limit: 12,
                regionCode: ${regionCode},
                // regionCode:   350925103212,
                shelf: 1
            },
            success: function(res) {

                var data=res.data;
            //    console.log(data)
                if(data!=null&&data.length>0){

                    for (var i = 0; i < data.length ; i = i+ Number(2)) {

                        html+=   "     <div class=\"swiper-slide clearfix\">\n";

                        html+=     ycSingleData(data[i],1);
                        if(i+Number(1)<data.length){
                            html+=     ycSingleData(data[i+Number(1)],2);
                        }

                        html+=   " </div >";
                    }

                    $("#ycyp").html(html);

                    // 一村一品
                    var mySwiper = new Swiper('.ncds-swiper1 .swiper-container', {

                        spaceBetween: 10,
                        pagination: {
                            el: '.ncds-swiper1 .swiper-pagination',
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true //修改swiper的父元素时，自动初始化swiper

                    })

                }else{

                    $("#ycyp").removeClass("swiper-wrapper");

                    html += '<img class="none-data-p1" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>'

                    $("#ycyp").html(html);

                }

            },
            error: function(data) {

            },
            complete : function() {

            }

        });

    }

    function ycSingleData(data,type) {

        var classNmae =''
        html = "";

        if(type==1){
            classNmae=    "fl clearfix"
        }else   if(type==2){
            classNmae=    "fr"
        }

        var noneClass ="";
        var picUrl ="";
        //图片
         data.picUrl ? picUrl = "${imgDomain}" + data.picUrl : (picUrl = "${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png" , noneClass= "min-height:10% !important;min-width:10% !important")
        // //销量
        // var sellCount = data.sellCount || 0;
        // //数据来源
        // var orgin = data.orgin || "暂无";
        //标题
        var title = data.goodsName || "";
        //文本内容
        var content = data.goodsDesc!=undefined? getSimpleText(data.goodsDesc)   : "";
        //价格
        var price= null;
        var marketPriceLow =  data.marketPriceLow!=undefined? data.marketPriceLow+"元"  : "暂无";
        var marketPriceHigh = data.marketPriceHigh!=undefined? data.marketPriceHigh+"元"  : "暂无";

        if(marketPriceLow=="暂无"&&marketPriceHigh=="暂无"){
            price = "暂无"
        }else{
            price = marketPriceLow+" ~ "+marketPriceHigh+"";
        }

        var goodsUnitName= data.goodsUnitName!=undefined? "/"+data.goodsUnitName  : "";

        //责任人
        var person = data.operator || "暂无";
        //电话
        var phone = data.tel || "暂无";
        //单位
        var unit = data.regionName || "暂无";
        //url goodsUrl
        var url = encodeURI(data.goodsUrl || "");
        html +=
            "                                        <div class=\"ncds-list1-item mlr20 "+classNmae+"\">\n" +
            "                                            <div class=\"ncds-list1-pic img-res mlr20 mtr20 fl\">\n" +
            "                                                <img style='" + noneClass + "'  src=\"" + picUrl + "\">\n" +
            // "                                                <div class=\"message-ext2 flex flex-jb flex-ac\">\n" +
            // "                                                    <p class=\"font-size-r18 cor-yellow1 mlr20\">销量:" + sellCount + "</p>\n" +
            // "                                                    <p class=\"font-size-r14 cor-fff mrr20\">数据来源:" + orgin + "</p>\n" +
            // "                                                </div>\n" +
            "                                            </div>\n" +
            "                                            <div class=\"ncds-list1-cont ncds-h3 fr mtr20 mrr5 prr15\">\n" +
            "                                                <div class=\"flex flex-jb flex-ac\">\n" +
            "                                                    <p class=\"font-size-r24 font-bold cor-red1\">" + title + "</p>\n" +
            "                                                    <a href=\"javascript:void(0);\" onclick= \"getCode(`"+url+"`)\"   class=\"ncds-btn-ext1 font-size-r15 cor-fff font-bold\">扫码查看</a>\n" +
            "                                                </div>\n" +
            "                                                <p class=\"font-size-r16 cor-333 mtr15 text-indent line-height-r24 ncds-list1-t1 ncds-list1-t1\">"+content+"</p>\n" +
            "                                                <span class=\"ncds-bar-ext1 mtr20\"></span>\n" +
            "                                                <p class=\"font-size-r20 cor-red2 mtr15\">"+price+goodsUnitName+"</p>\n" +
            "                                                <p class=\"font-size-r16 cor-333 mtr10\">联系人:"+person+"</p>\n" +
            "                                                <p class=\"font-size-r16 cor-333 mtr10\">联系电话:"+phone+"</p>\n" +
            "                                                <p class=\"font-size-r16 cor-333 mtr10\">供应地区:"+unit+"</p>\n" +
            "                                            </div>\n" +
            "                                        </div>\n" ;

        return html;

    }


    //html剔除富文本标签，留下纯文本
    function getSimpleText(html){
        var re1 = new RegExp("<.+?>","g");//匹配html标签的正则表达式，"g"是搜索匹配多个符合的内容
        var msg = html.replace(re1,'');//执行替换成空字符
        return msg;
    }


    //二维码展示弹窗
    function getCode(code) {

  //      console.log(code);

        $("#qrcode").empty();

        var url = decodeURI(code);

        if(!IsURL(url)){
            layer.msg("暂无链接",{skin:'layui-layer-hui'});
            return;
        }

        new QRCode(document.getElementById("qrcode"), url);

        $('.jfyh-tc').fadeIn(300)

    }


    function IsURL (str_url) {
        var strRegex = '^((https|http|ftp|rtsp|mms)?://)'
            + '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@
            + '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184
            + '|' // 允许IP和DOMAIN（域名）
            + '([0-9a-z_!~*\'()-]+.)*' // 域名- www.
            + '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名
            + '[a-z]{2,6})' // first level domain- .com or .museum
            + '(:[0-9]{1,4})?' // 端口- :80
            + '((/?)|' // a slash isn't required if there is no file name
            + '(/[0-9a-zA-Z_!~*\'().;?:@&=+$,%#-]+)+/?)$';
        var re=new RegExp(strRegex);
        return re.test(str_url);
    }


    // 周边特产
    function peripherySpecialty() {
        $('#peripherySpecialty').empty();

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/villageProductPc/listData.json',
            data: {
                regionCode: "${regionCode!''}",
                page: 1,
                limit: 99,
                shelf: 1,
                type: "around"
            },
            success: function(data) {
                let html = '';
                if (data.count > 0) {
                    let dataList = data.data;
                    for(var i=1;i<=dataList.length;i++){
                        let product = dataList[i-1];
                        let noneClass = '';
                        let pre = "";
                        let suf = "";
                        let picUrl = product.picUrl;
                        if (picUrl == null || picUrl == undefined || picUrl == '') {
                            picUrl = "${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png";
                            noneClass="min-height:50% !important;min-width:50% !important;";
                            pre = '<div align="center" style="background-color:#eeeeee;">';
                            suf = '</div>';
                        } else {
                            picUrl = '${imgDomain !''}' + picUrl;
                        }
                        let price = Number(product.marketPriceLow).toFixed(2) + '~' + Number(product.marketPriceHigh).toFixed(2)
                        let goodsUnit = product.goodsUnitName;
                        let goodsUrl = product.goodsUrl || '';
                        let goodsName = product.goodsName || '';
                        let regionName = product.regionName || '';
                        if(i%5 != 0){
                            html += '<li>'+
                                '<div class="ncds-list2-pic img-res">'+
                                pre +
                                '<img style="'+noneClass+'" src="'+picUrl+'">'+
                                suf +
                                '</div>'+
                                '<div class="flex flex-jb flex-ac mlr20 mtr20 mrr20">'+
                                '<p class="font-size-r20 cor-333">'+goodsName+'</p>'+
                                '<a href="javascript:void(0);" onclick="scanQrcode(`'+encodeURI(goodsUrl)+'`)" style="cursor:pointer;" class="ncds-btn-ext1 font-size-r15 cor-fff font-bold">扫码查看</a>'+
                                '</div>'+
                                '<div class="flex flex-jb flex-ac mlr20 mtr15 mrr20">'+
                                '<p class="font-size-r16 cor-4d"><em class="font-size-r20 ycyp-ibb-text1 font-bold">'+price+'</em>元/'+goodsUnit+'</p>'+
                                '<p class="font-size-r16 cor-red2">'+regionName+'</p>'+
                                '</div>'+
                                '</li>';
                            if(i == dataList.length){
                                html = '<div class="swiper-slide">'+
                                    '<ul class="ncds-list2-item mlr35 mrr35">' + html +
                                    '</div>';
                                $('#peripherySpecialty').append(html);
                            }
                        } else {
                            html = '<div class="swiper-slide">'+
                                '<ul class="ncds-list2-item mlr35 mrr35">' + html;
                            html += '<li>'+
                                '<div class="ncds-list2-pic img-res">'+
                                '<img src="'+picUrl+'">'+
                                '</div>'+
                                '<div class="flex flex-jb flex-ac mlr20 mtr20 mrr20">'+
                                '<p class="font-size-r20 cor-333">'+goodsName+'</p>'+
                                '<a href="javascript:void(0);" onclick="scanQrcode(`'+encodeURI(goodsUrl)+'`)" style="cursor:pointer;" class="ncds-btn-ext1 font-size-r15 cor-fff font-bold">扫码查看</a>'+
                                '</div>'+
                                '<div class="flex flex-jb flex-ac mlr20 mtr15 mrr20">'+
                                '<p class="font-size-r16 cor-4d"><em class="font-size-r20 ycyp-ibb-text1 font-bold">'+price+'</em>元'+goodsUnit+'</p>'+
                                '<p class="font-size-r16 cor-red2">'+regionName+'</p>'+
                                '</div>'+
                                '</li>';
                            html += '</ul>'+
                                '</div>';
                            $('#peripherySpecialty').append(html);
                            html = '';
                        }
                    }
                    // 滑动效果specialtySwiper
                    var mySwiper2 = new Swiper('.specialtySwiper', {
                        spaceBetween: 10,
                        pagination: {
                            el: '.ncds-swiper2 .swiper-pagination',
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true //修改swiper的父元素时，自动初始化swiper
                    })
                } else {

                    html = '<div class="none-data-ext1">' +
                        '<img class="none-data-p1" style="margin-top:10px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>';
                    $('#peripherySpecialty').html(html);
                    $('.swiper-pagination').attr('style','display:none;');

                }
            },
            error: function(data) {

                console.log('获取周边特产数据连接超时！');

            },
            complete : function() {

            }
        });
    }

    // 扫码查看
    function scanQrcode(url){
        getCode(url);
    }

    // 绑定右键
    function bindRightMouse() {

        $('#ncdsMenu').contextMenu('rightClickMenu', { //菜单样式
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
                backgroundColor: 'rgba(189, 173, 173, 0.3)',
                marginTop: '2px'
            }, //菜单项鼠标放在上面样式
            itemHoverStyle: {
                color: '#333 ',
                fontWeight: 'bold',
                backgroundColor:'none',
                border: 'none'
            }, //事件
            bindings: {
                'item_1': function(t) {
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=151' );
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