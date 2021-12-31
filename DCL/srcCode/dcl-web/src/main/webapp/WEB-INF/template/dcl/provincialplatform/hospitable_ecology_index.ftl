<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>生态宜居 </title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
<#--    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/index-comm.css"/>-->
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mb-index.css"/>
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mb-index1.css"/>
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/cun-v1.css"/>
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css"/>
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-shengtaiyiju.css"/>
</head>
<body>
<div class="w100 h100 ">
    <div class="w100 h100 plr15 prr15 ptr15 bs h-x posi-rela">
        <!-- 智能监测-->
        <div class="mb-cc-right h-625 fl" id="moduleDetector">
            <div class="mb-ccr-item-rt cun-box-bg-ext2 posi-rela">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <div class="flex flex-jc box-title-ext1 ">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">智能监测</p>
                    </div>
                </div>
                <div class="plr20 prr20 ptr20 pbr20  mbr35 bs">
                    <!-- count -->
                    <div class="flex flex-ac flex-jr div-znjk j-div-znjk" id="deviceCount">
                        <div class="">
                            <p class="font-size-r14 text-align-c"><img class="w62-h62" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-4.png"/></p>
                            <p class="font-size-r14 text-align-c cor-333">
                                <span class="font-size-r30 font-bold font-aldr col-d62a1e" id="environmentDetector">0</span>
                            </p>
                            <p class="font-size-r16 text-align-c cor-666 ">环境监测</p>
                        </div>
                        <div class="">
                            <p class="font-size-r14 text-align-c"><img class="w62-h62" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-8.png"/></p>
                            <p class="font-size-r14 text-align-c cor-333">
                                <span class="font-size-r30 font-bold font-aldr col-d62a1e" id="smokeDetector">0</span>
                            </p>
                            <p class="font-size-r16 text-align-c cor-666">烟感</p>
                        </div>
                        <div class="">
                            <p class="font-size-r14 text-align-c"><img class="w62-h62" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-6.png"/></p>
                            <p class="font-size-r14 text-align-c cor-333">
                                <span class="font-size-r30 font-bold font-aldr col-d62a1e" id="waterQualityDetector">0</span>
                            </p>
                            <p class="font-size-r16 text-align-c cor-666">水质监测</p>
                        </div>
                        <div class="">
                            <p class="font-size-r14 text-align-c"><img class="w62-h62" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-9.png"/></p>
                            <p class="font-size-r14 text-align-c cor-333">
                                <span class="font-size-r30 font-bold font-aldr col-d62a1e" id="soilDetector">0</span>
                            </p>
                            <p class="font-size-r16 text-align-c cor-666">土壤监测</p>
                        </div>
                    </div>
                    <!-- detector list -->
                    <div class="div-shebei font-size-r14 j-div-shebei mtr20 mbr25 posi-rela" id="detectorList"></div>
                    <!-- detector info -->
                    <div class="clearfix mtr20" id="detectorInfo"></div>
                    <!-- no data -->
                    <div class="none-data-ext1" id="noDetector">
                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                </div>
            </div>
        </div>

        <!---美丽乡村图集-->
        <div class="mb-cc-left h-625 fr" id="moduleCountryAlbum">
            <div class="mb-ccl-top cun-box-bg-ext1 posi-rela">
                <i class="cun-box-bg-item1 cun-box-bg-item1-lt"></i>
                <i class="cun-box-bg-item1 cun-box-bg-item1-rt"></i>
                <i class="cun-box-bg-item1 cun-box-bg-item1-lb"></i>
                <i class="cun-box-bg-item1 cun-box-bg-item1-rb"></i>
                <div class="mb-cclt-box h100" id="resource">
<#--                    <iframe  width="100%" height="100%" src="https://720yun.com/vr/39bz2crvkik#s=360704"></iframe>-->
                </div>
                <div class="none-data-ext1 hide" id="resourceNone" >
                    <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                    <p class="none-data-t1">暂无数据</p>
                </div>
            </div>
        </div>

        <!---下左3-->
        <div class="mb-cc-left h-355 fl">
            <div class="mb-ccl-bottom clearfix">
                <!---厕所革命-->
                <div class="mb-ccr-item-rb w100-33  fl cun-box-bg-ext2 posi-rela" id="moduleToilet">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">厕所革命</p>
                        </div>
                    </div>
                    <div class="item-rb-com">
                        <div class="w100 h100 plr20 prr25 ptr25 pbr20 bs">
                            <div class="w100 h-86 bg-xczl">
                                <div class="w100 h-86 bg-xczl">
                                    <div class="fl mlr20 mtr10 ">
                                        <div class="font-size-r14 fl flex flex-ac flex-jb">
                                            <span class="img-46-46">
                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-di-01.png"/>
                                            </span>
                                            <span class="font-size-r18 cor-333 mlr10 mrr30 font-bold">户厕改造率</span>
                                            <span class=" font-size-r14 flex flex-ac flex-jb">
                                                <span class="font-size-r30 font-aldr mlr10 col-d62a1e"
                                                      id="toiletReformRate">0</span>
                                                <span class="font-size-r14 cor-333 mlr5 font-bold">%</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix mtr20">
                                <div class="w50-10 h-150 div-bg1 bg-fff9d7 fl">
                                    <p class="font-size-r14 text-align-c">
                                        <img class="w62-h62"
                                             src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-1.png"/>
                                    </p>
                                    <p class="font-size-r14 text-align-c cor-333"><span
                                                class="font-size-r30 font-bold font-aldr col-d62a1e"
                                                id="toilet">0</span>个</p>
                                    <p class="font-size-r14 text-align-c cor-666">户厕数</p>
                                </div>
                                <div class="w50-10 h-150 div-bg1 bg-fff9d7 fl mlr20">
                                    <p class="font-size-r14 text-align-c">
                                        <img class="w62-h62"
                                             src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-2.png"/>
                                    </p>
                                    <p class="font-size-r14 text-align-c cor-333"><span
                                                class="font-size-r30 font-bold font-aldr col-d62a1e"
                                                id="pollutionFreeToilet">0</span>个</p>
                                    <p class="font-size-r14 text-align-c cor-666">无害化厕所数</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!---污水处理-->
                <div class="mb-ccr-item-rb w100-33 mlr15 fl cun-box-bg-ext2 posi-rela" id="moduleSewageTreatment">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">污水处理</p>
                        </div>
                    </div>
                    <div class="item-rb-com div-com-stxc">
                        <div class="w100 h100 plr25 prr25 ptr25 pbr20 bs hide show">
                            <div class="w100 h-86 bg-xczl">
                                <div class="fl mlr20 mtr10 ">
                                    <div class="font-size-r14 fl flex flex-ac flex-jb">
                                        <span class="img-46-46">
                                            <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-di-02.png"/>
                                        </span>
                                        <span class="font-size-r18 cor-333 mlr10 mrr30 font-bold">污水处理点</span>
                                        <span class=" font-size-r14 flex flex-ac flex-jb">
                                            <span class="font-size-r30 font-aldr mlr30 col-d62a1e" id="sewageTreatmentPoint">0</span>
                                            <span class="font-size-r14 cor-333 mlr5 font-bold">个</span>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="w100 h-150 h-o mtr20 posi-rela">
                                <div class="swiper-container w100 h100 mb-cclt-box-content sewage-treatment-point-album">
                                    <div class="swiper-wrapper" id="sewageTreatmentPointAlbum">
                                        <div class="swiper-slide">
                                            <div class="none-data-ext1">
                                                <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                                <p class="none-data-t1">暂无数据</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Add Pagination -->
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!---农村住房安全-->
                <div class="mb-ccr-item-rb w100-33 mlr15 fl cun-box-bg-ext2 posi-rela">
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                    <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">农村住房安全</p>
                        </div>
                    </div>
                    <div class="item-rb-com div-com-stxc">
                        <div class="w100 h100 plr25 prr25 ptr25 pbr20 bs hide show">
                            <div class="w100 h-86 bg-xczl">
                                <div class="fl mlr20 mtr10 ">
                                    <div class="font-size-r14 flex flex-ac flex-jb">
                                        <span class="img-46-46">
                                            <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-di-03.png"/>
                                        </span>
                                        <span class="font-size-r18 cor-333 mlr10 mrr30 font-bold">违建农房</span>
                                        <span class="font-size-r14 cor-333  font-bold">总计</span>
                                        <span class="font-size-r30 font-aldr mlr5 col-d62a1e" id="unauthorizedBuilding">0</span>
                                        <span class="font-size-r14 cor-333 mlr20 font-bold">已整治</span>
                                        <span class="font-size-r30 font-aldr mlr5 col-d62a1e" id="regulatedBuilding">0</span>
                                    </div>
                                </div>
                            </div>
                            <div class="w100 h-150 h-o mtr20  posi-rela">
                                <div class="w100 h-150 h-o  posi-rela">
                                    <div class="swiper-container w100 h100 mb-cclt-box-content unauthorized-building-album">
                                        <div class="swiper-wrapper" id="unauthorizedBuildingAlbum">
                                            <div class="swiper-slide no-picture">
                                                <div class="none-data-ext1">
                                                    <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                                    <p class="none-data-t1">暂无数据</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Add Pagination -->
                                        <div class="swiper-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!---垃圾整治-->
        <div class="mb-cc-right mb-cc-right-btn h-355 fr ">

            <div class="mb-ccr-item-rb mtr15 cun-box-bg-ext2 posi-rela">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <div class="flex flex-jc box-title-ext1">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">垃圾整治</p>
                    </div>
                </div>

                <div class="item-rb-com">
                    <div class="w100 h100 plr25 prr25 ptr25 pbr25 bs">
                        <div class="w100 h-86 bg-xczl">
                            <div class="fl mlr20 mtr10 ">
                                <div class="font-size-r14 flex flex-ac flex-jb">
                                    <span class="img-46-46">
                                        <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/shengtaiyiju/icon-di-04.png"/>
                                    </span>
                                    <span class="font-size-r18 cor-333 mlr10 mrr30 font-bold">累计上报</span>
                                    <span class="font-size-r30 font-aldr col-d62a1e" id="rubbish">0</span>
                                    <span class="font-size-r14 cor-333 mlr20 font-bold">件</span>
                                </div>
                            </div>
                            <div class="fr mrr20 mtr18">
                                <div class="fl">
                                    <p class="font-size-r14 text-align-c font-bold cor-666"><em
                                                class="col-d62a1e font-size-r24 mrr10 font-aldr" id="regulatedRubbish">0</em></p>
                                    <p class="font-size-r16 text-align-c font-bold cor-666">已整治</p>
                                </div>
                                <div class="fr mlr20">
                                    <p class="font-size-r14 text-align-c font-bold cor-666">
                                        <em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="regulatedRubbishRate">0%</em>
                                    </p>
                                    <p class="font-size-r16 text-align-c font-bold cor-666">整治率</p>
                                </div>
                            </div>
                        </div>
                        <div class="w100 h-150 h-o mtr20  posi-rela">
                            <div class="none-data-ext1" id="noRubbish">
                                <img class="none-data-p1" style="margin-top: calc(5% - 5px);"
                                     src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                <p class="none-data-t1">暂无数据</p>
                            </div>
                            <div class="w100 h100 h-x2" id="rubbishList" style="display: none;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--右键--->
<div class="contextMenu" id="myMenu2" style="display: none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>
<!-- rem缩放 -->
<script src="${uiDomain}/web-assets/common/js/calc-rem.js"></script>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
<script>
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
    setTimeout(function(){
        $('.h-x').getNiceScroll().resize();
        $('.h-x2').getNiceScroll().resize();
    }, 200);

    // 1.	美丽乡村图集
    function loadCountryAlbum() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/xcBigScreen/xcPictureList.json?regionCode=${regionCode}&model=beautifulCountry',
            dataType: 'json',
            success: function (data) {
                if (data && data.length > 0) {
                    $('#countryAlbum').empty();

                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        $('#countryAlbum').append(
                            '<div class="swiper-slide">' +
                            '   <div class="mb-cclt-bg">' +
                            '       <img src="${imgDomain}' + item.filePath + '">' +
                            '   </div>' +
                            '</div>'
                        );
                    }

                    if (data.length > 1) {
                        new Swiper('.country-album', {
                            loop: true,
                            pagination: {
                                el: '.country-album>.swiper-pagination',
                            },
                            autoplay: {
                                delay: 4000,
                                stopOnLastSlide: false,
                                disableOnInteraction: false,
                            },
                        });
                    }
                }
            },
        });
    }

    // 2.	厕所革命
    function loadToilet() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/hospitableEcologyProvince/countToiletInfo.json?regionCode=${regionCode}',
            dataType: 'json',
            success: function (data) {
                if (data) {
                    var toilet = data.TOTAL || 0;// 户厕数
                    $('#toilet').text(toilet);
                    if (toilet > 0) {
                        var reformedToilet = data.REFORMED || 0;//完成改革户厕数
                        var rate = (reformedToilet / toilet * 100).toFixed(2);
                        $('#toiletReformRate').text(rate);
                    }
                    $('#pollutionFreeToilet').text(data.POLLUTION_FREE || 0);// 无公害厕所数
                }
            },
        });
    }

    // 3.	污水处置
    function loadSewageTreatmentPoint() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/hospitableEcologyProvince/getSewageTreatmentInfo.json?regionCode=${regionCode}',
            dataType: 'json',
            success: function (data) {
                $('#sewageTreatmentPoint').text(data.count || 0);
                if (data && data.pictures && data.pictures.length > 0) {
                    $('#sewageTreatmentPointAlbum').empty();
                    for (var i = 0; i < data.pictures.length; i++) {
                        var item = data.pictures[i].sewagePicture[0];
                        $('#sewageTreatmentPointAlbum').append(
                            '<div class="swiper-slide">' +
                            '   <div class="mb-cclt-bg">' +
                            '       <img src="${imgDomain}' + item.picUrl + '">' +
                            '   </div>' +
                            '</div>'
                        );
                    }
                    if (data.pictures.length > 1) {
                        new Swiper('.sewage-treatment-point-album', {
                            loop: true,
                            pagination: {
                                el: '.sewage-treatment-point-album>.swiper-pagination',
                            },
                            autoplay: {
                                delay: 4000,
                                stopOnLastSlide: false,
                                disableOnInteraction: false,
                            },
                        });
                    }
                }
            },
        });
    }

    var DEVICE_TYPE_NAME = {
        "水质监测": '#waterQualityDetector',
        "烟感（物模型）": '#smokeDetector',
        "环境监测": '#environmentDetector',
        "土壤监测": '#soilDetector',
    };
    // 5.1	智能监测-设备统计
    function loadDeviceCount() {
        $.ajax({
            type: 'POST',
            url: "${iotDomain}/iot/deviceStatistics/reportDeviceTypeCount.json",// http://iot.zhxc.fzyzxxjs.cn/iot
            data:{
                "orgCode": "${regionCode}"
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var id = DEVICE_TYPE_NAME[item.DEVICE_TYPE_NAME];
                        if (id) {
                            $(id).text(item.ECOUNT || 0);
                            $(id).parent().parent().attr('code', item.DEVICE_TYPE);
                            $(id).parent().parent().attr('detector', item.DEVICE_TYPE_NAME);
                        }
                    }
                    $('#environmentDetector').parent().parent().click();
                }
            }
        });
    }

    // 5.2	智能监测-设备列表
    function loadDeviceList(code, detector) {
        $('#detectorInfo').hide();
        if (code) {
            $.ajax({
                type: 'POST',
                url: "${iotDomain}/iot/deviceStatistics/reportDeviceList.json",
                data: {
                    "orgCode": "${regionCode}",
                    "deviceType": code,
                    "page": 1,//页数
                    "rows": 4
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    $('#detectorList').show();
                    if (data && data.total) {
                        $('#noDetector').hide();
                        $('#detectorList').empty();
                        for (var i = 0; i < data.rows.length; i++) {
                            var item = data.rows[i];
                            $('#detectorList').append(
                                '<span style="overflow: hidden;" title="' + item.DEVICE_NAME + '" ' +
                                '   id="detector-' + item.DEVICE_SERVICE_ID + '" ' +
                                '   onclick="loadDeviceInfo(\'' + item.DEVICE_SERVICE_ID + '\', \'' + detector + '\')">' + item.DEVICE_NAME + '</span>'
                            );
                        }
                        $('#detector-' + data.rows[0].DEVICE_SERVICE_ID).click();
                    } else {
                        $('#noDetector').show();
                        $('#detectorList').hide();
                    }
                }
            });
        } else {
            $('#detectorList').hide();
            $('#noDetector').show();
        }
    }

    var MAP_FIELD = {
        'pm10' : ['PM10', 'ug/m³'],
        'pm25' : ['PM2.5', '℃'],
        'temperature' : ['温度', '℃'],
        'humidity' : ['湿度', '%'],
        'noise' : ['噪音', 'db'],
        'wind' : ['风速', 'm/s'],
        'WindDir' : ['风向', ''],
        'light' : ['光照度', 'Lux'],
        'pressure' : ['大气压', 'Pa'],
        'Rain' : ['降雨量', 'mm'],
    };

    // 5.3	智能监测-设备信息
    var detectorFieldSwiper = null;
    function loadDeviceInfo(id, detector) {
        if (id) {
            $.ajax({
                type: 'POST',
                url: "${iotDomain}/iot/deviceStatistics/reportDeviceLastData.json",
                data: {
                    "deviceServiceId": id,
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    if (data && data.length > 0) {
                        $('#noDetector').hide();
                        $('#detectorInfo').empty();
                        $('#detectorInfo').append(
                            '<div class="swiper-container w100 h100 mb-cclt-box-content mb-cclt-box-content-yj posi-rela pbr20 bs detector-swiper">' +
                            '   <div class="swiper-wrapper" id="detectorField"></div>' +
                            '   <div class="swiper-pagination"></div>' +
                            '</div>'
                        );
                        $('#detectorInfo').show();
                        if (detectorFieldSwiper != null) {
                            detectorFieldSwiper.destroy();
                            detectorFieldSwiper = null;
                        }

                        if (detector == '环境监测') {
                            var slide = 0;
                            var line = 0;
                            var countItem = 0;
                            for (var i = 0; i < data.length; i++) {
                                var map = MAP_FIELD[data[i].COLLECT_ITEM_CODE];
                                if (map) {
                                    var countPage = slide;
                                    var countLine = line;
                                    if (countItem === (slide * 9)) {
                                        $('#detectorField').append('<div class="swiper-slide" id="fieldPage-' + countPage + '"></div>');
                                    } else if (countItem === (slide * 9 + 8)) {
                                        slide ++;
                                    }
                                    var className = '';
                                    if (countItem === (line * 3)) {
                                        $('#fieldPage-' + countPage).append(
                                            '<div class="flex flex-ac flex-jr ' + (countLine === (line * 3) ? '' : 'mtr15') + ' " id="fieldLine-' + countLine + '"></div>'
                                        );
                                    } else if (countItem === (line * 3 + 1)) {
                                        className = ' mlr15 mrr15 ';
                                    } else if (countItem === (line * 3 + 2)) {
                                        line++;
                                    }

                                    $('#fieldLine-' + countLine).append(
                                        '<div class="flex1 bg-fff9d7 plr15 ptr20 prr15 pbr20 ' + className + '">' +
                                        '   <p class="font-size-r16 text-align-l cor-666 mbr5">' + map[0] + '</p>' +
                                        '   <p class="font-size-r18 text-align-c col-ff9913"><span class="font-size-r18 font-bold mrr10">' + (data[i].COLLECT_ITEM_VALUE || '-') + '</span>' + map[1] + '</p>' +
                                        '</div>'
                                    );

                                    countItem ++;
                                }
                            }
                            if (slide >= 1) {
                                detectorFieldSwiper = new Swiper('.detector-swiper', {
                                    loop: true,
                                    pagination: {
                                        el: '.detector-swiper>.swiper-pagination',
                                    },
                                    autoplay: {
                                        delay: 4000,
                                        stopOnLastSlide: false,
                                        disableOnInteraction: false,
                                    },
                                });
                            }
                        // } else if (detector == '烟感（物模型）') {
                        // } else if (detector == '水质监测') {
                        // } else if (detector == '土壤监测') {
                        } else {
                            $('#noDetector').show();
                        }
                        if ($('#detectorField').find('.swiper-slide').length == 0) {
                            $('#noDetector').show();
                            $('#detectorInfo').hide();
                        }

                    } else {
                        $('#noDetector').show();
                        $('#detectorInfo').hide();
                    }
                }
            });
        } else {
            $('#detectorInfo').hide();
            $('#noDetector').show();
        }
    }

    function showEvent(eventId, catalogId) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?regionCode=${regionCode}&type=3&catalogId=' + catalogId + '&module=instaShot&title=' +
            encodeURI(catalogId == '1' ? '农村住房安全' : '垃圾整治') + '&infoOpenId=' + eventId
        );
    }

    function getEventInfo(ids, fromType, append) {
        var len = ids.length - 1;
        if (len < 0) {// 已加载完全部事件详情
            if (fromType == 1) {
                if ($('#unauthorizedBuildingAlbum').find('.swiper-slide').length > 1) {
                    new Swiper('.unauthorized-building-album', {
                        loop: true,
                        pagination: {
                            el: '.unauthorized-building-album>.swiper-pagination',
                        },
                        autoplay: {
                            delay: 4000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                    });
                }
            } else if (fromType == 3) {
                $('.h-x2').getNiceScroll().resize();
            }
        } else {
            var id = ids[len];
            $.ajax({
                type: 'POST',
                url: '${wechatDomain}/wap/xiongAn/CommonEvent/updaterListDetail.mhtml',
                <#--url: '${wechatDomain}/wap/xiongAn/CommonEvent/updaterListDetail.mhtml',-->
                data: {
                    id: id,
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    if (data) {
                        // 获取图片
                        var files = data.bo.imageList;
                        var image = '';
                        if (files && files.length > 0) {
                            for (var i = 0; i < files.length; i++) {
                                var pathArr = files[i].path.split('.');
                                if ("bmp|jpg|jpeg|png|gif".indexOf(pathArr[pathArr.length - 1].toLowerCase()) > -1) {
                                    image = files[i].path;
                                    break;
                                }
                            }
                        }

                        if (fromType == 1) {
                            if (image) {
                                // 如果还未移除暂无图片，移除
                                if ($('#unauthorizedBuildingAlbum').find('.no-picture').length > 0) {
                                    $('#unauthorizedBuildingAlbum').empty();
                                }

                                // 状态 1 草稿  2 上报待审核  3 处理中  4 待评价（已处理） 5 驳回 9 归档
                                var status = '';
                                var iclass = '';
                                if (data.bo.status == 2 || data.bo.status == 3) {
                                    status = '未整治';
                                    iclass = 'i2';
                                } else if (data.bo.status != 1) {
                                    status = '已整治';
                                    iclass = 'i1';
                                }

                                $('#unauthorizedBuildingAlbum').append(
                                    '<div class="swiper-slide" style="cursor: pointer;" onclick="showEvent(\'' + data.bo.eventId + '\', \'' + fromType + '\')">' +
                                    '   <div class="mb-cclt-bg div-zhufang posi-rela">' +
                                    '       <i class="' + iclass + '">' + status + '</i>' +
                                    '       <img src="${imgDomain}' + image + '">' +
                                    '   </div>' +
                                    '</div>'
                                );
                            }
                        } else if (fromType == 3) {
                            var className = append ? '' : 'mtr15';
                            image = image ? '${imgDomain}' +image : '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';
                            $('#rubbishList').append(
                                '<div class="h-66 ' + className + '" style="cursor: pointer;" ' +
                                '   onclick="showEvent(\'' + data.bo.eventId + '\', \'' + fromType + '\')">' +
                                '   <div class="pic-dongt img100 fl"><img src="' + image + '"></div>' +
                                '   <div class="pic-dongt-r fr">' +
                                '       <p class="clearfix font-size-r14 text-nor cor-666 text-line-c2" title="' + (data.bo.content || '') + '">' + (data.bo.content || '') + '</p>' +
                                '       <p class="clearfix font-size-r14 cor-666"><span class="fr">' + (data.bo.hpTimeStr || '') + '</span></p>' +
                                '   </div>' +
                                '</div>'
                            );
                        }
                    }
                    ids.splice($.inArray(id, ids), 1);
                    getEventInfo(ids, fromType, false);
                },
            });
        }
    }

    function getDoneEvent(fromType, all, done, rate) {
        $.ajax({
            type: 'POST',
            url: '${wechatDomain}/wap/xiongAn/CommonEvent/updaterListCount.mhtml',
            <#--url: '${wechatDomain}/wap/xiongAn/CommonEvent/updaterListCount.mhtml',-->
            data: {
                status: '98',//99是审核通过后所有状态的数据 98 是完结的数据
                fromType: fromType,//1 违章搭建2一键报抽3卫生曝光
                areaCode: "${regionCode!''}",
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                    var countDone = parseInt(data.COUNT || 0);
                    $(done).text(countDone);
                    var countAll = parseInt($(all).text());
                    if (rate && countAll > 0) {
                        $(rate).text((countDone / countAll * 100).toFixed(2) + '%');
                    }
                }
            },
        });
    }

    function getAllEvent(fromType, all, done, rate) {
        $.ajax({
            type: 'POST',
            url: '${wechatDomain}/wap/xiongAn/CommonEvent/updaterListJsonp.mhtml',
            <#--url: '${wechatDomain}/wap/xiongAn/CommonEvent/updaterListJsonp.mhtml',-->
            data: {
                page: 1,
                rows: 5,
                status: '99',//99是审核通过后所有状态的数据 98 是完结的数据
                fromType: fromType,//1 违章搭建2一键报抽3卫生曝光
                areaCode: "${regionCode!''}",
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                    $(all).text(data.total || 0);
                    getDoneEvent(fromType, all, done, rate);
                    if (data.rows && data.rows.length >0) {
                        var length = data.rows.length;
                        var append = false;
                        if (fromType == 3) {
                            $('#rubbishList').show();
                            $('#noRubbish').hide();
                            length = length > 2 ? 2 : length;
                            append = true;
                        }
                        var ids = [];
                        for (var i = 0; i < length; i++) {
                            ids.push(data.rows[i].eventId);
                        }
                        getEventInfo(ids, fromType, append);
                    }
                }
            },
        });
    }

    // 4.	农村住房安全
    getAllEvent(1, '#unauthorizedBuilding', '#regulatedBuilding');
    // 6.	垃圾整治
    getAllEvent(3, '#rubbish', '#regulatedRubbish', '#regulatedRubbishRate');

    // loadCountryAlbum();
    loadToilet();
    loadSewageTreatmentPoint();
    loadDeviceCount();

    // 设备点击监听
    $('.j-div-shebei').on('click', 'span', function () {
        $(this).addClass('active').siblings().removeClass('active');
    });
    // 设备类型点击监听
    $('.j-div-znjk>div').on('click', function () {
        $(this).addClass('active').siblings().removeClass('active');
        loadDeviceList($(this).attr('code'), $(this).attr('detector'));
    });

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

    var MAP_MODULE = {
        'moduleDetector': '71',
        'moduleCountryAlbum': '72',
        'moduleToilet': '73',
        'moduleSewageTreatment': '74',
    };
    // 绑定右键
    function bindRightMouse(id) {
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
                backgroundColor: 'rgba(189, 173, 173, 0.3)',
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
                    var type = MAP_MODULE[t.id];
                    if (type) {
                        window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                    }
                },
                'item_2': function () {
                    location.reload();
                }
            }
        });
    }
    bindRightMouse('moduleDetector');
    // bindRightMouse('moduleCountryAlbum');
    bindRightMouse('moduleToilet');
    bindRightMouse('moduleSewageTreatment');

    function getIndexContent() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/indexContent/detatil.jhtml',
            data: {
                code: 'styj',
                regionCode: '${regionCode}',
            },
            dataType: 'json',
            success: function (data) {
                if (data && data.bo) {
                    $('#resource').show();
                    $('#resourceNone').hide();
                    let type = data.bo.type;
                    let url = data.bo.url;
                    let dataList = data.bo.attList;
                    let html = '';
                    if (type === '01') {
                        html = '<div class="swiper-container w100 h100 mb-cclt-box-content mb-cclt-box-content213213" >' +
                            '<div class="swiper-wrapper" id="villageStyle">';

                        for (let i = 0; i < dataList.length; i++) {
                            let filePath = dataList[i].filePath ? '${imgDomain}' + dataList[i].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';

                            html += '<div class="swiper-slide">' +
                                '<div class="mb-cclt-bg">' +
                                '<img src="' + filePath + '">' +
                                '</div>' +
                                '</div>';
                        }
                        // html += '<div class="swiper-pagination"></div> </div></div>'
                        html += '</div> <div class="swiper-pagination swiper-pagination-bullets"> </div></div>'

                    } else if (type === '02') {
                        html += `<iframe  id="auto" width="100%" height="100%" src="` + url + `"></iframe>`
                    }

                    $('#resource').empty();
                    $('#resource').html(html);

                    new Swiper('.mb-cclt-box-content213213', {
                        loop: true,
                        pagination: {
                            el: '.mb-cclt-box-content213213 .swiper-pagination'
                        },
                        autoplay: {
                            delay: 4000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false
                        },
                    });
                } else {
                    $('#resource').hide();
                    $('#resourceNone').show();
                }
            },
        });
    }
    getIndexContent();
</script>
</body>
</html>