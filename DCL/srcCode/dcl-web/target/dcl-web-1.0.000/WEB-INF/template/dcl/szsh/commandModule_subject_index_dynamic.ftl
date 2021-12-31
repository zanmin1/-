<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>福建智慧乡村大数据分析</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/index-comm.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/subject-zhsy.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/subject.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/mb-index.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/mb-index1.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/cun-v1.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-index.css" />

    <!-- rem缩放 -->
    <script src="${uiDomain}/web-assets/common/js/calc-rem.js"></script>

    <style>
        /* 暂无图片。 */
        .comm-zwtp > img {
            display: block;
            width: 0.7rem;
            height: 1rem;
        }

        .djyl-l-item-sp .djyl-pic-title {
            width: 50%;
        }
    </style>
</head>

<body>
    <div class="w100 h100">
        <div class="w100 h100 plr15 prr15 ptr15 bs h-x posi-rela">
            <div class="mb-cc-left h100 fl">
                <div class="mb-ccl-top">
                    <i class="mb-t-angle mb-t-angle1"></i>
                    <i class="mb-t-angle mb-t-angle2"></i>
                    <i class="mb-t-angle mb-t-angle3"></i>
                    <i class="mb-t-angle mb-t-angle4"></i>
                    <!-------旋转圆圈 start------->
                    <div class="sec3_circle" onclick="turnToView('jczx')">
                        <div class="circle_c circle_c1"><img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon_index_sec3_c1.png"/></div>
                        <div class="circle_c circle_c2"><img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon_index_sec3_c2.png"/></div>
                        <div class="circle_c circle_c3"><img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon_index_sec3_c3.png"/></div>
                        <div class="circle_c circle_c4"><img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon_index_sec3_c4.png"/></div>
                        <div class="circle_c circle_c5"><img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon_index_sec3_c5.png"/></div>
                        <div class="circle_b flex flex-ac flex-jc">
                            <p class="font-size-r18 font-bold">监测<br>中心</p>
                        </div>
                    </div>
                    <div class="mb-cclt-box h100" id="resource">
                        <div class="swiper-container w100 h100 mb-cclt-box-content mb-cclt-box-content213213" >
                            <div class="swiper-wrapper" id="villageStyle">

                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
<#--                        <iframe  id="auto" hidden width="100%" height="100%" src="https://720yun.com/vr/39bz2crvkik#s=360704"></iframe>-->
                    </div>
                </div>
                <div class="mb-ccl-bottom clearfix">
                    <div class="mb-ccr-item-rb w-50 fl">
                        <div class="item-rb-title">
                            <p>乡村治理</p>
                        </div>
                        <div class="item-rb-com">
                            <div class="w100 h100 plr20 prr25 ptr15 pbr20 bs">
                                <div class="w100 h-86 bg-xczl" id="eventRightClick">
                                    <div class="fl mlr20 mtr20">
                                        <div class="font-size-r14 flex flex-ac flex-jb">
                                            <span class="img-46-46 img100">
                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-sj01.png"/>
                                            </span>
                                            <span class="font-size-r18 cor-333 mlr10 mrr30 font-bold">累计上报事件</span>
                                            <span class="font-size-r30 font-aldr col-d62a1e" id="cumulativeReportedEvents">0</span>
                                            <span class="font-size-r14 cor-333 mlr20 font-bold">件</span>
                                        </div>
                                    </div>
                                    <div class="fr mrr20 mtr15">
                                        <div class="fl">
                                            <p class="font-size-r14 text-align-c font-bold cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="toDoNumber">0</em></p>
                                            <p class="font-size-r16 text-align-c font-bold cor-666">待办数</p>
                                        </div>
<#--                                        <div class="fr mlr20">-->
<#--                                            <p class="font-size-r14 text-align-c font-bold cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="favorableRate">0%</em></p>-->
<#--                                            <p class="font-size-r16 text-align-c font-bold cor-666">好评率</p>-->
<#--                                        </div>-->
                                    </div>
                                </div>
                                <div class="mb-public-title mtr10" id="threeServicesDisclosureRightClickOne">
                                    <div class="claerfix fl mv-pt-left">
                                        <i class="fl"></i>
                                        <p class="fl">三务公开</p>
                                    </div>
<#--                                    <a href="javascript:void(0);" class="fr vat-more">-->
<#--                                        <p>更多>></p>-->
<#--                                    </a>-->
                                </div>
                                <div class="w100 h-120 bg-fff9d7 posi-rela" id="threeServicesDisclosureRightClickTwo">
                                    <div class="w100 h100 plr15 ptr15 pbr15 bs h-o posi-rela">
                                        <div class="div-swgk w100 h100 prr15 bs h-x2 posi-rela" id="threeServicesDisclosure">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-ccr-item-rb w-50 mlr15 fl">
                        <div class="item-rb-title item-rb-title2 j-item-rb-title2">
                            <p><a class="active">生态宜居</a><a class="mlr20">乡村特色</a></p>
                        </div>
                        <div class="item-rb-com div-com-stxc">
                            <div class="w100 h100 plr25 prr25 ptr15 pbr20 bs hide show">
                                <div class=" clearfix">
                                    <div class="w-33 fl flex flex-ac flex-jb">
                                        <div class="img-62-62 img100">
                                            <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-7.png"/>
                                        </div>
                                        <div class="mlr10 flex1">
                                            <p class="font-size-r14 cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="householdToiletsNumber">0</em></p>
                                            <p class="font-size-r16 font-bold cor-666">户厕数</p>
                                        </div>
                                    </div>
                                    <div class="w-33 fl flex flex-ac flex-jb">
                                        <div class="img-62-62 img100">
                                            <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-8.png"/>
                                        </div>
                                        <div class="mlr10 flex1">
                                            <p class="font-size-r14 cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="toiletModificationRate">0%</em></p>
                                            <p class="font-size-r16 font-bold cor-666">厕改率</p>
                                        </div>
                                    </div>
                                    <div class="w-33 fl flex flex-ac flex-jb">
                                        <div class="img-62-62 img100">
                                            <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-9.png"/>
                                        </div>
                                        <div class="mlr10 flex1">
                                            <p class="font-size-r14 cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="sewageTreatmentPoint">0</em></p>
                                            <p class="font-size-r16 font-bold cor-666">污水处理点</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-public-title">
                                    <div class="claerfix fl mv-pt-left">
                                        <i class="fl"></i>
                                        <p class="fl">最新告警动态</p>
                                    </div>
                                </div>
                                <div class="w100 h-150 h-o posi-rela">
                                    <div class="w100 h100 h-x2" id="latestAlarmDynamics">

<#--                                        <div class="h-66">-->
<#--                                            <div class="pic-dongt img100 fl">-->
<#--                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-03.png">-->
<#--                                            </div>-->
<#--                                            <div class="pic-dongt-r fr">-->
<#--                                                <p class="clearfix font-size-r14 cor-666 "><span class="fl font-bold dt-span-green">卫生曝光台</span><span class="fr">2021-11-15  12:12</span></p>-->
<#--                                                <p class="clearfix font-size-r14 text-nor cor-666 text-line-c2 ">富泉学区协星小学校门口周边，存在垃圾堆放情况，影响环境及周边道路环境。</p>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                        <div class="h-66 mtr15">-->
<#--                                            <div class="pic-dongt img100 fl">-->
<#--                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-04.png">-->
<#--                                            </div>-->
<#--                                            <div class="pic-dongt-r fr">-->
<#--                                                <p class="clearfix font-size-r14 cor-666"><span class="fl font-bold dt-span-blue">卫生曝光台</span><span class="fr">2021-11-15  12:12</span></p>-->
<#--                                                <p class="clearfix font-size-r14 text-nor cor-666 text-line-c2 ">村中心道路两侧篱笆栏发现泥土堆放及未清理的枝干。</p> -->
<#--                                            </div>-->
<#--                                        </div>-->
                                    </div>
                                </div>
                            </div>
                            <div class="w100 h100 plr25 prr25  pbr20 bs hide">
                                <div class="clearfix" id="featuredItemRightClickOne">
                                    <div class="clearfix fl mv-pt-left" style="margin-top: 0;">
                                        <i class="fl"></i>
                                        <p class="fl">特色商品</p>
                                    </div>
                                </div>
                                <div class="clearfix w100 h-66 mySwiper02 clearfix mtr10" id="featuredItemRightClickTwo">
                                    <div class="swiper-container h100">
                                        <div class="swiper-wrapper" id="featuredItem">

                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix" id="scenicSpotRightClickOne">
                                    <div class="clearfix fl mv-pt-left">
                                        <i class="fl"></i>
                                        <p class="fl">景点</p>
                                    </div>
                                </div>
                                <div class="clearfix w100 mtr10 h-o bg-fff9d7 bs posi-rela" id="scenicSpotRightClickTwo">
                                    <div class="swiper h-135 mySwiper mySwiper-tsxc">
                                        <div class="swiper-wrapper" id="scenicSpot">

                                        </div>
                                        <div class="swiper-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-cc-right h100 fr">
                <div class="mb-ccr-item-rt">
                    <div class="div-w100-h100 plr20 prr20 ptr20 pbr20 bs">
                        <div id="villageIntroductionRightClickOne">
                            <p class="col-d62a1e font-size-r24 font-bold mbr10">${orgName!''}</p>
                            <div class="cun-details h-x">
                                <p class="font-size-r16 cor-333 text-p-2em line-height-r28" id="villageIntroduction">

                                </p>
                            </div>
                        </div>
                        <div class="mtr15 clearfix" id="villageIntroductionRightClickTwo">
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-1.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="totalPopulation">-</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">总人口</p>
                                </div>
                            </div>
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-2.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="residentPopulation">-</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">户籍人口</p>
                                </div>
                            </div>
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-3.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="aged">-</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">老年人</p>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix mtr15" id="villageIntroductionRightClickThree">
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-4.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="child">-</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">幼儿</p>
                                </div>
                            </div>
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-5.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="partyBranch">1</em>个</p>
                                    <p class="font-size-r16 font-bold cor-666">党支部</p>
                                </div>
                            </div>
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-6.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="fullPartyMember">-</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">正式党员</p>
                                </div>
                            </div>
                        </div>
                        <div class="w100 h-190 bg-01 mtr60 posi-rela" id="xiangxianListRightClick">
                            <div class="div-xxb-title">乡贤榜</div>
                            <div class="w100 h100 ptr30 plr15 prr15 pbr10 bs">
                                <div class="w100 h100 h-o">
                                    <div class="swiper mySwiper mySwiper-xxb">
                                        <div class="swiper-wrapper" id="xiangxianList">
                                            
                                        </div>
                                        <div class="swiper-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-ccr-item-rb mtr15" id="monitorRightClick">
                    <div class="item-rb-title posi-rela">
                        <p>平安综治</p>
                        <span class="span-more" onclick="turnToView('pazz')" style="cursor:pointer;">更多>></span>
                    </div>
                    <div class="item-rb-com">
                        <div class="w100 h100 plr25 prr25 ptr25 pbr25 bs">

                            <div class="w-66 h100 fl prr10 bs" id="safeComprehensiveTreatment" style="width: 63.35%;">

                            </div>
                            <div class="w-33 h100 fl mlr15">
                                <div class="w100 h-50 pbr5 bs">
                                    <p class="text-align-c font-size-0">
                                        <img class="img-56-56" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/index/icon-jiankong01.png">
                                    </p>
                                    <p class="font-size-r30 col-ff4848 text-align-c font-bold font-aldr" id="camera-total">-</p>
                                    <p class="font-size-r18 cor-666 text-align-c">
                                        视频监控总数
                                    </p>
                                </div>
                                <div class="w100 h-50 ptr5 bs mtr10">
                                    <div class="box-x flex flex-ac flex-jr">
                                        <span class=" fl font-size-r18 cor-90c03e"><em><i><img class="i-zaix-li" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/index/icon-zaixian01.png">  </i></em><em>在线</em></span><span class=" font-size-r26 font-aldr cor-90c03e" id="camera-inline">-</span>
                                    </div>
                                    <div class="box-x flex flex-ac flex-jr mtr15">
                                        <span class=" fl font-size-r18 cor-666"><em><i><img class="i-zaix-li" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/index/icon-lixian01.png">  </i></em><em>离线</em></span><span class="  font-size-r26 font-aldr cor-666" id="camera-outline">-</span>
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
    </div>

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>

    <script>
        $('.j-item-rb-title2').on('click','a',function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.div-com-stxc>div').eq($(this).index()).addClass('show').siblings().removeClass('show');
        })

        // 滚动条美化
        $('.h-x').niceScroll({
            cursorcolor: "#ffea98",
            cursoropacitymax: 1,
            cursorwidth: ".04rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: false,
        });
        $('.h-x2').niceScroll({
            cursorcolor: "#ffea98",
            cursoropacitymax: 1,
            cursorwidth: ".04rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: false,
        });



        // 村情风采。
        <#--getVillageStyleData();-->
        <#--function getVillageStyleData() {-->
        <#--    $.ajax({-->
        <#--        type: 'POST',-->
        <#--        url: '${rc.getContextPath()}/dcl/xcBigScreen/xcPictureList.jhtml',-->
        <#--        data: {-->
        <#--            id: '${gridId!''}'-->
        <#--        },-->
        <#--        success: function(data) {-->
        <#--            if (data.length > 0) {-->
        <#--                let imgHtml = '';-->

        <#--                for (let i = 0; i < data.length; i++) {-->
        <#--                    let filePath = data[i].filePath ? '${imgDomain}' + data[i].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';-->

        <#--                    imgHtml += '<div class="swiper-slide">' +-->
        <#--                                '<div class="mb-cclt-bg">' +-->
        <#--                                '<img src="' + filePath + '">' +-->
        <#--                                '</div>' +-->
        <#--                                '</div>';-->
        <#--                }-->

        <#--                $('#villageStyle').empty();-->
        <#--                $('#villageStyle').html(imgHtml);-->

        <#--                var leftTopSwiper = new Swiper('.mb-cclt-box-content', {-->
        <#--                    loop: true,-->
        <#--                    pagination: {-->
        <#--                        el: '.mb-cclt-box-content>.swiper-pagination'-->
        <#--                    },-->
        <#--                    autoplay: {-->
        <#--                        delay: 4000,-->
        <#--                        stopOnLastSlide: false,-->
        <#--                        disableOnInteraction: false-->
        <#--                    },-->
        <#--                });-->
        <#--            }-->
        <#--        },-->
        <#--        error: function(err) {-->
        <#--            console.log('获取村情风采数据连接超时！');-->
        <#--        },-->
        <#--        complete: function() {-->
        <#--        }-->
        <#--    });-->
        <#--}-->

        // 村情介绍-村介绍。
        findNoticeList('10000005');   // 村情介绍。
        // 乡村治理-三务公开。
        findNoticeList('10000003');   // 村务公开。
        findNoticeList('10000007');   // 党务公开。
        findNoticeList('10000008');   // 财务公开。
        function findNoticeList(catalogId) {
            let	url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json';

            let map = {
                orgCode: '${regionCode!''}',
                page: 1,
                rows: 10
            };
            map.catalogId = catalogId;
            map.isEndPubDate = 'no';
            map.isPic = 'yes';
            map.isPubOrg = 'no';
            map.isTop = 'yes';
            if (catalogId === '10000003' || catalogId === '10000005') {
                map.onlyShowMyOrg = 'yes';
                map.otherpage = 1;
            }

            $.ajax({
                type: 'POST',
                url: url,
                data: map,
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    let html = '';
                    if (data.total > 0) {
                        let listData = data.rows;

                        // 村情介绍。
                        if (catalogId === '10000005') {
                            // 获取村介绍。
                            let ids = listData[0].infoOpenId;
                            getVillageIntroductionData(ids);

                        // 村务公开，党务公开，财务公开。
                        } else if (catalogId === '10000003' || catalogId === '10000007' || catalogId === '10000008') {
                            for (let i = 0; i < listData.length; i++) {
                                let title = listData[i].title;
                                let pubDate = listData[i].pubDate;

                                let moreTitle = '';
                                if (catalogId === '10000003') {
                                    moreTitle = '村务公开';
                                } else if (catalogId === '10000007') {
                                    moreTitle = '党务公开';
                                } else if (catalogId === '10000008') {
                                    moreTitle = '财务公开';
                                }

                                html += '<p class="font-size-r14"><span class="cor-666 font-size-r14 span1 text-line-c1" onclick="turnToMore(\'' + moreTitle + '\', \'ztdr\', ' + listData[i].infoOpenId + ', \'' + catalogId + '\')" style="cursor:pointer;" title="' + title + '">' + title + '</span><span><img class="img-52-24" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-new.png"/></span><span class="fr cor-999 font-size-r14">' + pubDate.substr(0, 10) + '</span></p>';
                            }

                            $('#threeServicesDisclosure').append(html);
                        }
                    } else {
                        // 村情介绍。
                        if (catalogId === '10000005') {
                            html = '暂无村介绍。';

                            $('#villageIntroduction').html(html);
                        } else if (catalogId === '10000003' || catalogId === '10000007' || catalogId === '10000008') {
                            if (!$('#threeServicesDisclosure').html()) {
                                let noData = '<div class="none-data-ext1">' +
                                             '<img class="none-data-p1" style="margin-top:0px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                             '<p class="none-data-t1">暂无数据</p>' +
                                             '</div>';
                                $('#threeServicesDisclosure').html(noData);
                            }
                        }
                    }
                },
                error: function() {
                    console.log('获取' + catalogId + '数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 村介绍。
        function getVillageIntroductionData(ids) {
            $.ajax({
                type: 'POST',
                url: '${gbpDomain!''}/gbp/commonInfoOpen/getOverViewByIdsForJsonp.json',
                data: {
                    ids: ids,
                    regionCode: '${regionCode!''}'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    let overViewList = [];
                    for (let j in data) {
                        overViewList.push(data[j]);
                    }

                    let overView = overViewList[0];
                    overView = overView ? overView.replace(/<[^>]+>/g, '') : '暂无村介绍。';

                    $('#villageIntroduction').html(overView);
                },
                error: function(data) {
                    console.log('获取村介绍数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 详情。
        function turnToView(type, id) {
            let url;

            // 乡村治理-三务公开。
            if (type === 'swgk') {
                url = '${gbpDomain!''}/gbp/commonInfoOpen/homeShow.jhtml?mode=view&noTop=1&infoOpenId=' + id;
            // 乡村特色-特色商品。
            } else if (type === 'tssp') {
                url = '${rc.getContextPath()}/dcl/villageProductPc/view.jhtml?uuid=' + id;
            // 乡村特色-景点。
            } else if (type === 'jd') {
                url = '${rc.getContextPath()}/dcl/attractionsManagement/view.jhtml?id=' + id;
            // 平安综治。
            } else if (type === 'pazz') {
                url = '${gbpDomain!''}/gbp/globalEyes/globalEyesBigScreen/sudokuPlay.jhtml';
            // 监测中心。
            } else if (type === 'jczx') {
                url = '${gisDomain}/gis/showAllEquipt/index.jhtml';
            }

            window.open(url);   // 打开新窗口。
        }

        // 更多。
        function turnToMore(title, type, infoOpenId, catalogId) {
            let url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=' + title + '&module=' + type + '&infoOpenId=' + infoOpenId + '&catalogId=' + catalogId;
            window.open(url);
        }

        // 村情介绍-人口数据。
        getPopulationData();
        function getPopulationData() {
            $.ajax({
                type: 'POST',
                url: '${rsDomain!''}/cirs/getStatFromBi.jhtml',
                data: {
                    orgCode: '${regionCode!''}'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    if (data) {
                        // let total = data.total === 0 ? '-' : data.total;   // 总人口。
                        let total = 618;   // 总人口。
                        // $('#totalPopulation').html(total);
                        $('#totalPopulation').html('618');

                        // let hjrk = data.hjrk === 0 ? '-' : data.hjrk;   // 户籍人口
                         let hjrk = 618;   // 户籍人口
                        // $('#residentPopulation').html(hjrk);
                        $('#residentPopulation').html('618');

                        let lnr = data.lnr === 0 ? '-' : data.lnr;   // 老年人。
                        $('#aged').html(lnr);

                        let ye = data.ye === 0 ? '-' : data.ye;   // 幼儿。
                        $('#child').html(ye);
                    }
                },
                error: function(err) {
                    console.log('获取人口数据数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 村情介绍-正式党员。
        getFullPartyMemberData();
        function getFullPartyMemberData() {
            $.ajax({
                type: 'POST',
                url: '${djDomain!''}/dj/partymember/pmInfo/getPmForJsonp.jhtml',
                data: {
                    orgCode: '${regionCode!''}',
                    regionCode: ${regionCode!''}
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    if (data.djlist) {
                        let fullPartyMember = data.djlist.dynum === 0 ? '-' : data.djlist.dynum;
                        $('#fullPartyMember').html(fullPartyMember);
                    }
                },
                error: function (data) {
                    console.log("获取正式党员数据连接超时！");
                },
                complete: function () {
                }
            });
        }

        // 乡贤榜。
        getXiangxianListData();
        function getXiangxianListData() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/culturalTourism/getExpertList.jhtml',
                data: {
                    page: 1,
                    rows: 20,
                    regionCode: ${regionCode!''}
                },
                dataType: 'json',
                success: function(data) {
                    if (data.total > 0) {
                        let dataList = data.rows;
                        let html = '';

                        for (let i = 0; i < dataList.length; i++) {
                            let img = dataList[i].photoPath ? '<img src="${imgDomain}' + dataList[i].photoPath + '">' : '<div class="posi-abso w100 h100 comm-zwtp flex flex-ac flex-jc">' +
                                                                                                                        '<img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png">' +
                                                                                                                        '</div>';
                            let name = dataList[i].name || '';
                            let postName = dataList[i].postName || '';
                            let personalInfo = dataList[i].personalInfo || '';

                            html += '<div class="swiper-slide" onclick="turnToMore(\'乡贤榜\', \'culturalTourism_xxb\', \'' + dataList[i].hashId + '\', \'\')" style="cursor:pointer;">' +
                                '<div class="device-list1-pic-zp fl posi-rela">' +
                                img +
                                '</div>' +
                                '<div class="device-list1-cont-zp fr">' +
                                '<p class="font-size-r18 cor-333 font-bold" title="' + name + '" style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + name + '</p>' +
                                '<p class="font-size-r14 text-nor cor-999 text-line-c1 mtr5 mbr10" title="' + postName + '" style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + postName + '</p>' +
                                '<p class="font-size-r14 text-nor cor-666 text-line-c3" title="' + personalInfo + '">' + personalInfo + '</p>' +
                                '</div>' +
                                '</div>';
                        }

                        $('#xiangxianList').empty();
                        $('#xiangxianList').html(html);

                        var swiperxxb = new Swiper(".mySwiper-xxb", {
                            slidesPerView: 2,
                            spaceBetween: 20,
                            pagination: {
                                el: ".mySwiper-xxb .swiper-pagination",
                            }
                        });
                    } else {
                        var noData  = '<div class="none-data-ext1">' +
                            '<img class="none-data-p1" style="margin-top:3px;width:20%;height:20%;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                            '<p class="none-data-t1">暂无数据</p>' +
                            '</div>';
                        $('#xiangxianList').empty();
                        $('#xiangxianList').html(noData);
                    }
                },
                error: function(data) {
                    console.log('获取乡贤榜数据连接超时！');
                    var noData  = '<div class="none-data-ext1">' +
                        '<img class="none-data-p1" style="margin-top:3px;width:20%;height:20%;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>';
                    $('#xiangxianList').empty();
                    $('#xiangxianList').html(noData);
                },
                complete: function() {
                }
            });
        }

        // 乡村治理-事件。
        getEventNum('00', 5);
        var num0, num1, num2, num3, num4, num5, num6;
        function getEventNum(status, listType) {
            var url = '${eventDomain!''}/zhsq/event/eventDisposal4OuterController/fetchDataCount4Jsonp.json';

            var map = {
                userId: '${userId!''}',
                orgId: '${orgId!''}',
                orgCode: '${orgCode!''}',
                infoOrgCode: '${regionCode!''}',
                status: status,
                listType: listType
            };
            if (status === '1') {
                map.evaLevelList = '03';
                map.status = '';
            }

            $.ajax({
                type: 'POST',
                url: url,
                data: map,
                dataType: 'jsonp',
                jsonp: "jsonpcallback",
                success: function (data) {
                    if (status === '00') {
                        num2 = data.total;
                        getEventNum('01,02', 5);
                    } else if (status === '01,02') {
                        num3 = data.total;
                        getEventNum('03,04', 5);
                    } else if (status === '03,04') {
                        num1 = data.total;
                        getEventNum('1', 4);
                    } else if (status === '1') {
                        num6 = data.total;
                        // $('#num1').html(num1);
                        $('#toDoNumber').html(num2);   // 待办数。
                        // $('#num3').html(num3);
                        num0 = num1 + num2 + num3;
                        $('#cumulativeReportedEvents').html(num0);   // 累计上报事件。
                        if(num0 != 0) {
                            // $('#num4').html((num1 *100 /num0).toFixed(2));
                            $('#favorableRate').html((num6 *100 /num0).toFixed(2) + '%');   // 好评率。
                        }
                    }
                },
                error: function (data) {
                    console.log('获取事件数据连接超时！');
                },
                complete: function () {
                }
            });
        }

        // 生态宜居-户厕数、厕改率。
        loadToilet();
        function loadToilet() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/hospitableEcologyProvince/countToiletInfo.json',
                data: {
                    regionCode: '${regionCode!''}'
                },
                dataType: 'json',
                success: function (data) {
                    if (data.TOTAL > 0) {
                        let total = data.TOTAL;   // 户厕数。
                        $('#householdToiletsNumber').html(total);

                        let reformedToilet = data.REFORMED || 0;   // 完成改革户厕数。
                        let toiletModificationRate = (reformedToilet / total * 100).toFixed(2);   // 厕改率。
                        $('#toiletModificationRate').html(toiletModificationRate + '%');
                    }
                },
                error: function(err) {
                    console.log('获取户厕数、厕改率数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 生态宜居-污水处理点。
        getSewageTreatmentPointData();
        function getSewageTreatmentPointData() {
            $.ajax({
                type: 'POST',
                url: '${iotDomain!''}/iot/sewageManager/listDataForJsonp.jhtml',
                data: {
                    type: '2',
                    reginCode: '${regionCode!''}',
                    page: 1 ,
                    rows: 1
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    if (data.total > 0) {
                        $('#sewageTreatmentPoint').html(data.total);   // 污水处理点。
                    }
                },
                error: function(err) {
                    console.log('获取污水处理点数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 生态宜居-最新告警动态。
        getAllEvent(3);
        function getAllEvent(fromType) {
            $.ajax({
                type: 'POST',
                url: '${weChatDomain}/wap/xiongAn/CommonEvent/updaterListJsonp.mhtml',
                data: {
                    page: 1,
                    rows: 2,
                    status: '99',   // 99是审核通过后所有状态的数据 98 是完结的数据
                    fromType: fromType,   // 1 违章搭建2一键报抽3卫生曝光
                    areaCode: '${regionCode!''}'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    if (data) {
                        if (data.rows && data.rows.length > 0) {
                            let length = data.rows.length;
                            let append = false;
                            if (fromType === 3) {
                                length = length > 2 ? 2 : length;
                                append = true;
                            }
                            let ids = [];
                            for (let i = 0; i < length; i++) {
                                ids.push(data.rows[i].eventId);
                            }
                            getEventInfo(ids, fromType, append);
                        }
                    } else {
                        let html = '<div class="none-data-ext1">' +
                            '<img class="none-data-p1" style="margin-top:0px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                            '<p class="none-data-t1">暂无数据</p>' +
                            '</div>';
                        $('#latestAlarmDynamics').html(html);
                    }
                }
            });
        }

        function getEventInfo(ids, fromType, append) {
            let len = ids.length - 1;
            if (len < 0) {   // 已加载完全部事件详情
                if (fromType === 3) {
                    $('.h-x2').getNiceScroll().resize();
                }
            } else {
                let id = ids[len];
                $.ajax({
                    type: 'POST',
                    url: '${weChatDomain}/wap/xiongAn/CommonEvent/updaterListDetail.mhtml',
                    data: {
                        id: id,
                        regionCode: '${regionCode!''}'
                    },
                    dataType: 'jsonp',
                    jsonp: "jsoncallback",
                    success: function (data) {
                        if (data) {
                            // 获取图片
                            let files = data.bo.imageList;
                            let image = '';
                            if (files && files.length > 0) {
                                for (let i = 0; i < files.length; i++) {
                                    let pathArr = files[i].path.split('.');
                                    if ("bmp|jpg|jpeg|png|gif".indexOf(pathArr[pathArr.length - 1].toLowerCase()) > -1) {
                                        image = files[i].path;
                                        break;
                                    }
                                }
                            }

                            if (fromType === 3) {
                                let className = append ? '' : 'mtr15';
                                image = image ? '${imgDomain}' + image : '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';
                                $('#latestAlarmDynamics').append(
                                    '<div class="h-66 ' + className + '" onclick="showEvent(\'' + data.bo.eventId + '\')" style="cursor:pointer;">' +
                                    '   <div class="pic-dongt img100 fl"><img src="' + image + '"></div>' +
                                    '   <div class="pic-dongt-r fr">' +
                                    '       <p class="clearfix font-size-r14 text-nor cor-666 text-line-c2" title="' + (data.bo.content || '') + '">' + (data.bo.content || '') + '</p>' +
                                    '       <p class="clearfix font-size-r14 cor-666"><span class="fr">' + (data.bo.hpTimeStr || '') + '</span></p>' +
                                    '   </div>' +
                                    '</div>'
                                );
                            }
                        } else {
                            let html = '<div class="none-data-ext1">' +
                                       '<img class="none-data-p1" style="margin-top:0px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                       '<p class="none-data-t1">暂无数据</p>' +
                                       '</div>';
                            $('#latestAlarmDynamics').html(html);
                        }
                        ids.splice($.inArray(id, ids), 1);
                        getEventInfo(ids, fromType, false);
                    }
                });
            }
        }

        function showEvent(eventId) {
            window.open(
                '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=3&module=instaShot&title=' + encodeURI('垃圾整治') + '&infoOpenId=' + eventId
            );
        }

        // 乡村特色-特色商品。
        getFeaturedItemData();
        function getFeaturedItemData() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/villageProductPc/listData.json',
                data: {
                    page: 1,
                    limit: 99,
                    shelf: 1,   // 上架情况：上架-1，下架-0。
                    regionCode: ${regionCode!''}
                },
                success: function(data) {
                    if (data.count > 0) {
                        let listData = data.data;
                        let imgHtml = '';

                        for (let i = 0; i < listData.length; i++) {
                            let picUrl = listData[i].picUrl ? '${imgDomain}' + listData[i].picUrl : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';

                            imgHtml += '<div class="swiper-slide img100" onclick="turnToView(\'tssp\', \'' + listData[i].uuid + '\')" style="cursor:pointer;">' +
                                        '<img src="' + picUrl + '" alt="">' +
                                        '</div>';
                        }

                        $('#featuredItem').empty();
                        $('#featuredItem').html(imgHtml);

                        var mySwiper02 = new Swiper('.mySwiper02 .swiper-container',{
                            autoplay: {
                                delay: 2000,
                                stopOnLastSlide: true,
                                disableOnInteraction: false
                            },
                            observer: true,
                            observeParents: true,
                            slidesPerView: 'auto',
                            spaceBetween: 10,
                            speed: 1000,
                            loop: false
                        });
                    } else {
                        var noData = '<div class="none-data-ext1">' +
                            '<img class="none-data-p1" style="margin-top:0px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                            '<p class="none-data-t1" style="font-size:8px!important;">暂无数据</p>' +
                            '</div>';
                        $('#featuredItem').empty();
                        $('#featuredItem').html(noData);
                    }
                },
                error: function(err) {
                    console.log('获取特色商品数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 乡村特色-景点。
        getScenicSpotData();
        function getScenicSpotData() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/attractionsManagement/listData.jhtml',
                data: {
                    page: 1,
                    limit: 99,
                    orgCode: ${regionCode!''},
                    issuStatus: 1
                },
                success: function(data) {
                    if (data) {
                        if (data.total > 0) {
                            let listData = data.rows;
                            let html = '';

                            for (let i = 0; i < listData.length; i++) {
                                let picUrl = listData[i].picUrl ? '${imgDomain}' + listData[i].picUrl : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';
                                let attractionsName = listData[i].attractionsName || '';
                                let attractionsDesc = listData[i].attractionsDesc ? listData[i].attractionsDesc.replace(/<[^>]+>/g, '') : '暂无景点介绍。';

                                html += '<div class="swiper-slide" onclick="turnToView(\'jd\', \'' + listData[i].uuid + '\')" style="cursor:pointer;">' +
                                    '<div class="pic-tsxc-l img100 fl">' +
                                    '<img src="' + picUrl + '">' +
                                    '</div>' +
                                    '<div class="pic-tsxc-r fr">' +
                                    '<p class="font-size-r18 cor-333 font-bold mbr15" title="' + attractionsName + '" style="width:90%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + attractionsName + '</p>' +
                                    '<p class="font-size-r14 text-nor cor-666 text-line-c4">' + attractionsDesc + '</p> ' +
                                    '</div>' +
                                    '</div>';
                            }

                            $('#scenicSpot').empty();
                            $('#scenicSpot').html(html);

                            var swipertsxc = new Swiper(".mySwiper-tsxc", {
                                slidesPerView: 1,
                                spaceBetween: 20,
                                observer: true,
                                observeParents: true,
                                pagination: {
                                    el: ".mySwiper-tsxc .swiper-pagination"
                                }
                            });
                        } else {
                            let html = '<div class="none-data-ext1">' +
                                '<img class="none-data-p1" style="margin-top:0px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                '<p class="none-data-t1">暂无数据</p>' +
                                '</div>';
                            $('#scenicSpot').html(html);
                        }
                    } else {
                        let html = '<div class="none-data-ext1">' +
                            '<img class="none-data-p1" style="margin-top:0px;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                            '<p class="none-data-t1">暂无数据</p>' +
                            '</div>';
                        $('#scenicSpot').html(html);
                    }
                },
                error: function(err) {
                    console.log('获取景点数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 平安综治。
        getSafeComprehensiveTreatmentData();
        function getSafeComprehensiveTreatmentData() {
            $.ajax({
                type: 'POST',
                url: '${gbpDomain!''}/gbp/globalEyes/api/listDataJsonp.json',
                data: {
                    orgCode: '${regionCode!''}',
                    page: 1,
                    rows: 1,
                    orgType: 'bigScreenOrderNum'
                },
                dataType: 'jsonp',
                success: function(data) {
                    if (data.total > 0) {
                        let listData = data.rows;
                        let videoHtml = '';

                        for (let i = 0; i < listData.length; i++) {
                            let platformName = listData[i].platformName || '';
                            let monitorId = listData[i].monitorId || '';

                            if (i === 0) {
                                <#--videoHtml += '<div class="w-66 h100 fl prr10 bs">' +-->
                                <#--    '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +-->
                                <#--    '<i class="posi-abso w100 djyl-pic-title font-size-r14 cor-fff plr10 prr20 bs text-line-c1" title="' + platformName + '" style="width:45%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + platformName + '</i>' +-->
                                <#--    '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +-->
                                <#--    '</div>' +-->
                                <#--    '</div>';-->
                                videoHtml += '<div class="djyl-l-item-sp fl bs img100 posi-rela">'+
                                            '<i class="posi-abso w100 djyl-pic-title font-size-r16  cor-fff plr10 prr20 bs text-line-c1" title="'+platformName+'">'+platformName+'</i>'+
                                            '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +
                                            '</div>';
                            } else {
                                <#--videoHtml += '<div class="w-33 fl" style="height:50%;">';-->

                                <#--if (i === 1) {-->
                                <#--    videoHtml += '<div class="w100 h-50 pbr5 bs" style="height:100%;" >' +-->
                                <#--        '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +-->
                                <#--        '<i class="posi-abso w100 djyl-pic-title font-size-r14 cor-fff plr10 prr20 bs text-line-c1" title="' + platformName + '" style="width:41%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + platformName + '</i>' +-->
                                <#--        '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +-->
                                <#--        '</div>' +-->
                                <#--        '</div>';-->
                                <#--} else {-->
                                <#--    videoHtml += '<div class="w100 h-50 ptr5 bs" style="height:100%;">' +-->
                                <#--        '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +-->
                                <#--        '<i class="posi-abso w100 djyl-pic-title font-size-r14 cor-fff plr10 prr20 bs text-line-c1" title="' + platformName + '" style="width:41%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + platformName + '</i>' +-->
                                <#--        '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +-->
                                <#--        '</div>' +-->
                                <#--        '</div>';-->
                                <#--}-->

                                <#--videoHtml += '</div>';-->
                            }

                            $('#safeComprehensiveTreatment').empty();
                            $('#safeComprehensiveTreatment').html(videoHtml);
                        }
                    }
                },
                error: function(err) {
                    console.log('获取平安综治数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        // 摄像头统计
        cameraStatistics('','');
        function cameraStatistics(onlineStatus, onlineStatusStr){
            $.ajax({
                type: 'POST',
                url: '${gbpDomain!''}/gbp/globalEyes/api/listDataJsonp.json',
                data: {
                    orgCode: '${regionCode!''}',
                    page: 1,
                    rows: 1,
                    orgType: 'grid',
                    loginStatus: onlineStatus,
                    loginStatusStr: onlineStatusStr
                },
                dataType: 'jsonp',
                success: function(data) {
                    if (data.total > 0) {
                        if (onlineStatus == '' || onlineStatus == null || onlineStatus == undefined){
                            // 总数
                            $('#camera-total').html(data.total);
                            cameraStatistics("1",'在线');
                        } else if(onlineStatus == "1"){
                            // 在线
                            $('#camera-inline').html(data.total);
                            cameraStatistics("0",'离线');
                        } else if (onlineStatus == "0"){
                            // 离线
                            $('#camera-outline').html(data.total);
                        }
                    }
                },
                error: function(err) {
                    console.log('获取平安综治数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        window.oncontextmenu = function (e) {
            //取消默认的浏览器自带右键 请勿删
            e.preventDefault();
        };

        bindRightMouse('villageIntroductionRightClickOne');   // 村情介绍。
        bindRightMouse('villageIntroductionRightClickTwo');
        bindRightMouse('villageIntroductionRightClickThree');
        bindRightMouse('xiangxianListRightClick');   // 乡贤榜。
        bindRightMouse('eventRightClick');   // 事件。
        bindRightMouse('threeServicesDisclosureRightClickOne');   // 三务公开。
        bindRightMouse('threeServicesDisclosureRightClickTwo');
        bindRightMouse('featuredItemRightClickOne');   // 特色商品。
        bindRightMouse('featuredItemRightClickTwo');
        bindRightMouse('scenicSpotRightClickOne');   // 景点。
        bindRightMouse('scenicSpotRightClickTwo');
        bindRightMouse('monitorRightClick');   // 监控。

        // 绑定右键
        function bindRightMouse(id) {
            var type = 131;
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
                            // 村情介绍。
                            case 'villageIntroductionRightClickOne':
                                type = 131;
                                break;
                            case 'villageIntroductionRightClickTwo':
                                type = 131;
                                break;
                            case 'villageIntroductionRightClickThree':
                                type = 131;
                                break;
                            // 乡贤榜。
                            case 'xiangxianListRightClick':
                                type = 132;
                                break;
                            // 事件。
                            case 'eventRightClick':
                                type = 133;
                                break;
                            // 三务公开。
                            case 'threeServicesDisclosureRightClickOne':
                                type = 134;
                                break;
                            case 'threeServicesDisclosureRightClickTwo':
                                type = 134;
                                break;
                            // 特色商品。
                            case 'featuredItemRightClickOne':
                                type = 135;
                                break;
                            case 'featuredItemRightClickTwo':
                                type = 135;
                                break;
                            // 景点。
                            case 'scenicSpotRightClickOne':
                                type = 136;
                                break;
                            case 'scenicSpotRightClickTwo':
                                type = 136;
                                break;
                            // 监控。
                            case 'monitorRightClick':
                                type = 137;
                                break;
                            default:
                                type = 131;
                        }
                        window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                    },
                    'item_2': function(t) {
                        location.reload();
                    },
                }
            });
        }
        getIndexContent()
        function getIndexContent() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/indexContent/detatil.jhtml',
                data: {
                    code: 'index',
                    regionCode:${regionCode!''}
                },
                dataType: 'json',
                success: function(data) {
                    if (data) {
                        let type = data.bo.type
                        let url = data.bo.url
                        let dataList = data.bo.attList
                        let html = '';
                        if(type === '01'){
                            html = '<div class="swiper-container w100 h100 mb-cclt-box-content mb-cclt-box-content213213" >' +
                                '<div class="swiper-wrapper" id="villageStyle">'

                            for (let i = 0; i < dataList.length; i++) {
                                let filePath = dataList[i].filePath ? '${imgDomain}' + dataList[i].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';

                                html += '<div class="swiper-slide">' +
                                    '<div class="mb-cclt-bg">' +
                                    '<img src="' + filePath + '">' +
                                    '</div>' +
                                    '</div>';
                            }
                            html += '</div> <div class="swiper-pagination swiper-pagination-bullets"> </div></div>'
                        }
                        else if(type === '02'){
                            html += `<iframe  id="auto" width="100%" height="100%" src="`+url+`"></iframe>`
                        }

                        $('#resource').empty();
                        $('#resource').html(html);

                        var leftTopSwiper = new Swiper('.mb-cclt-box-content213213', {
                            loop: true,
                            pagination: {
                                el: '.mb-cclt-box-content213213 .swiper-pagination-bullets'
                            },
                            autoplay: {
                                delay: 4000,
                                stopOnLastSlide: false,
                                disableOnInteraction: false
                            },
                        });
                    }
                },
                error: function(data) {
                    console.log('获取数据连接超时！');
                },
                complete: function() {
                }
            });

        }
    </script>
</body>
</html>