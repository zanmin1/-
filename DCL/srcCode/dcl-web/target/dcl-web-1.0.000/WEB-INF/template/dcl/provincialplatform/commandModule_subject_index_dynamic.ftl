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
    <!-- rem缩放 -->
    <script src="${uiDomain}/web-assets/common/js/calc-rem.js"></script>
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
                    <div class="mb-cclt-box h100">
                        <div class="swiper-container w100 h100 mb-cclt-box-content">
                            <div class="swiper-wrapper" id="villageStyle">
                               
                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
                <div class="mb-ccl-bottom clearfix">
                    <div class="mb-ccr-item-rb w-50 fl">
                        <div class="item-rb-title">
                            <p>乡村治理</p>
                        </div>
                        <div class="item-rb-com">
                            <div class="w100 h100 plr20 prr25 ptr15 pbr20 bs">
                                <div class="w100 h-86 bg-xczl">
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
                                        <div class="fr mlr20">
                                            <p class="font-size-r14 text-align-c font-bold cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr" id="favorableRate">0%</em></p>
                                            <p class="font-size-r16 text-align-c font-bold cor-666">好评率</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-public-title mtr10">
                                    <div class="claerfix fl mv-pt-left">
                                        <i class="fl"></i>
                                        <p class="fl">三务公开</p>
                                    </div>
<#--                                    <a href="javascript:void(0);" class="fr vat-more">-->
<#--                                        <p>更多>></p>-->
<#--                                    </a>-->
                                </div>
                                <div class="w100 h-120 bg-fff9d7 posi-rela">
                                    <div class="w100 h100 plr15 ptr15 pbr15 bs h-o posi-rela">
                                        <div class="div-swgk w100 h100 prr15 bs h-x2 posi-rela" id="disclosureOfThreeServices">

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
                                            <p class="font-size-r14 cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr">4</em></p>
                                            <p class="font-size-r16 font-bold cor-666">公厕数</p>
                                        </div>
                                    </div>
                                    <div class="w-33 fl flex flex-ac flex-jb">
                                        <div class="img-62-62 img100">
                                            <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-8.png"/>
                                        </div>
                                        <div class="mlr10 flex1">
                                            <p class="font-size-r14 cor-666"><em class="col-d62a1e font-size-r24 mrr10 font-aldr">100%</em></p>
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
                                <div class="w100 h-150 h-o  posi-rela">
                                    <div class="w100 h100 h-x2">
                                        <div class="h-66">
                                            <div class="pic-dongt img100 fl">
                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-03.png">
                                            </div>
                                            <div class="pic-dongt-r fr">
                                                <p class="clearfix font-size-r14 cor-666 "><span class="fl font-bold dt-span-green">卫生曝光台</span><span class="fr">2021-11-15  12:12</span></p>
                                                <p class="clearfix font-size-r14 text-nor cor-666 text-line-c2 ">富泉学区协星小学校门口周边，存在垃圾堆放情况，影响环境及周边道路环境。</p> 
                                            </div>
                                        </div>
                                        <div class="h-66 mtr15">
                                            <div class="pic-dongt img100 fl">
                                                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-04.png">
                                            </div>
                                            <div class="pic-dongt-r fr">
                                                <p class="clearfix font-size-r14 cor-666"><span class="fl font-bold dt-span-blue">卫生曝光台</span><span class="fr">2021-11-15  12:12</span></p>
                                                <p class="clearfix font-size-r14 text-nor cor-666 text-line-c2 ">村中心道路两侧篱笆栏发现泥土堆放及未清理的枝干。</p> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w100 h100 plr25 prr25  pbr20 bs hide ">
                                <div class="mb-public-title">
                                    <div class="claerfix fl mv-pt-left">
                                        <i class="fl"></i>
                                        <p class="fl">特色商品</p>
                                    </div>
                                </div>
                                <div class="claerfix w100 h-66 mySwiper02 clearfix">
                                    <div class="swiper-container h100">
                                        <div class="swiper-wrapper" id="featuredItem">

                                        </div>
                                    </div>
                                </div>
                                <div class="claerfix w100 mtr20  h-o bg-fff9d7  bs posi-rela">
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
                        <div>
                            <p class="col-d62a1e font-size-r24 font-bold mbr10">${orgName!''}</p>
                            <div class="cun-details h-x">
                                <p class="font-size-r16 cor-333 text-p-2em line-height-r28" id="villageIntroduction">

                                </p>
                            </div>
                        </div>
                        <div class="mtr15 clearfix">
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-1.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="totalPopulation">0</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">总人口</p>
                                </div>
                            </div>
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-2.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="residentPopulation">0</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">常住人口</p>
                                </div>
                            </div>
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-3.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="aged">0</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">老年人</p>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix mtr15">
                            <div class="w-33 fl flex flex-ac flex-jb">
                                <div class="img-62-62 img100">
                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/icon-4.png"/>
                                </div>
                                <div class="mlr10 flex1">
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="child">0</em>人</p>
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
                                    <p class="font-size-r14 cor-666 font-bold"><em class="col-d62a1e font-size-r20 mrr10 font-aldr" id="fullPartyMember">0</em>人</p>
                                    <p class="font-size-r16 font-bold cor-666">正式党员</p>
                                </div>
                            </div>
                        </div>
                        <div class="w100 h-190 bg-01 mtr60 posi-rela">
                            <div class="div-xxb-title">乡贤榜</div>
                            <div class="w100 h100 ptr30 plr15 prr15 pbr10 bs">
                                <div class="w100 h100 h-o">
                                    <div class="swiper mySwiper mySwiper-xxb">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <div class="device-list1-pic-zp fl">
                                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-zp03.jpg">
                                                </div>
                                                <div class="device-list1-cont-zp fr">
                                                    <p class="font-size-r18 cor-333 font-bold">雷大希</p>
                                                    <p class="font-size-r14 text-nor cor-999 text-line-c1 mtr5 mbr10">站长</p>
                                                    <p class="font-size-r14 text-nor cor-666 text-line-c3 ">福建省平潭及闽江口水源配置工程莒口拦河闸搅拌站</p>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="device-list1-pic-zp fl">
                                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-zp01.jpg">
                                                </div>
                                                <div class="device-list1-cont-zp fr">
                                                    <p class="font-size-r18 cor-333 font-bold">雷大木</p>
                                                    <p class="font-size-r14 text-nor cor-999 text-line-c1 mtr5 mbr10">董事长</p>
                                                    <p class="font-size-r14 text-nor cor-666 text-line-c3 ">福建呜泉建设发展有限公司</p>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="device-list1-pic-zp fl">
                                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-zp02.jpg">
                                                </div>
                                                <div class="device-list1-cont-zp fr">
                                                    <p class="font-size-r18 cor-333 font-bold">雷大闪</p>
                                                    <p class="font-size-r14 text-nor cor-999 text-line-c1 mtr5 mbr10">总经理</p>
                                                    <p class="font-size-r14 text-nor cor-666 text-line-c3 ">河南中盛建筑有限公司哈尔滨分公司</p>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="device-list1-pic-zp fl">
                                                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/img-zp04.jpg">
                                                </div>
                                                <div class="device-list1-cont-zp fr">
                                                    <p class="font-size-r18 cor-333 font-bold">雷广震</p>
                                                    <p class="font-size-r14 text-nor cor-999 text-line-c1 mtr5 mbr10">总经理</p>
                                                    <p class="font-size-r14 text-nor cor-666 text-line-c3 ">福建大东电力建设有限公司</p> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="swiper-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-ccr-item-rb mtr15">
                    <div class="item-rb-title posi-rela">
                        <p>平安综治</p>
                        <span class="span-more" onclick="turnToView('pazz')" style="cursor:pointer;">更多>></span>
                    </div>
                    <div class="item-rb-com">
                        <div class="w100 h100 plr25 prr25 ptr25 pbr25 bs" id="safeComprehensiveTreatment">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>      
    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
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

        var swiperxxb = new Swiper(".mySwiper-xxb", {
            slidesPerView: 2,
            spaceBetween: 20,
            pagination: {
            el: ".mySwiper-xxb .swiper-pagination",
            },
        });

        // 村情风采。
        getVillageStyleData();
        function getVillageStyleData() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/xcBigScreen/xcPictureList.jhtml',
                data: {
                    id: '${gridId!''}'
                },
                success: function(data) {
                    if (data.length > 0) {
                        let imgHtml = '';

                        for (let i = 0; i < data.length; i++) {
                            let filePath = data[i].filePath ? '${imgDomain}' + data[i].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';

                            imgHtml += '<div class="swiper-slide">' +
                                        '<div class="mb-cclt-bg">' +
                                        '<img src="' + filePath + '">' +
                                        '</div>' +
                                        '</div>';
                        }

                        $('#villageStyle').empty();
                        $('#villageStyle').html(imgHtml);

                        var leftTopSwiper = new Swiper('.mb-cclt-box-content', {
                            loop: true,
                            pagination: {
                                el: '.mb-cclt-box-content>.swiper-pagination'
                            },
                            autoplay: {
                                delay: 4000,
                                stopOnLastSlide: false,
                                disableOnInteraction: false
                            },
                        });
                    }
                },
                error: function(err) {
                    console.log("获取村情风采数据连接超时！");
                },
                complete: function() {
                }
            });
        }

        // 村情介绍-村介绍。
        findNoticeList('10000005');   // 村情介绍。
        // 乡村治理-三务公开。
        findNoticeList('10000003');   // 村务公开。
        findNoticeList('10000007');   // 党务公开。
        findNoticeList('10000008');   // 财务公开。
        function findNoticeList(catalogId) {
            let	url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';

            let map = {
                orgCode: '${regionCode!''}',
                page: 1,
                rows: 999
            };
            map.catalogId = catalogId;
            map.isEndPubDate = 'no';
            map.isPic = 'yes';
            map.isPubOrg = 'no';
            map.isTop = 'yes';
            if (catalogId === '10000005') {
                map.onlyShowMyOrg = 'yes';
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
                        var listData = data.rows;

                        // 村情介绍。
                        if (catalogId === '10000005') {
                            let overView = listData[0].overView;
                            html = overView ? overView.replace(/<[^>]+>/g, '') : '暂无村介绍。';

                            $('#villageIntroduction').html(html);

                        // 村务公开，党务公开，财务公开。
                        } else if (catalogId === '10000003' || catalogId === '10000007' || catalogId === '10000008') {
                            for (let i = 0; i < listData.length; i++) {
                                let title = listData[i].title;
                                let pubDate = listData[i].pubDate;

                                html += '<p class="font-size-r14"><span class="cor-666 font-size-r14 span1 text-line-c1" onclick="turnToView(\'swgk\', ' + listData[i].infoOpenId + ')" style="cursor:pointer;" title="' + title + '">' + title + '</span><span class="fr cor-999 font-size-r14">' + pubDate + '</span></p>';
                            }

                            $('#disclosureOfThreeServices').append(html);
                        }
                    } else {
                        // 村情介绍。
                        if (catalogId === '10000005') {
                            html = '暂无村介绍。';

                            $('#villageIntroduction').html(html);
                        }
                    }
                },
                error: function(data) {
                    console.log("获取村介绍数据连接超时！");
                },
                complete: function() {
                }
            });
        }

        // 详情或更多。
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

        // 村情介绍-人口数据。
        getPopulationData();
        function getPopulationData() {
            $.ajax({
                type: 'POST',
                url: '${rsDomain!''}/cirs/getStatFromBi.jhtml?jsonpcallback=""',
                data: {
                    orgCode: '${regionCode!''}'
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    if (data) {
                        $('#totalPopulation').html(data.total);   // 总人口。
                        $('#residentPopulation').html(data.czrk);   // 常住人口。
                        $('#aged').html(data.lnr);   // 老年人。
                        $('#child').html(data.ye);   // 幼儿。
                    }
                },
                error: function(err) {
                    console.log("获取人口数据数据连接超时！");
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
                url: '${djDomain!''}/dj/partymember/pmInfo/getListForJsonpV2.jhtml?jsonpcallback=""',
                data: {
                    regionCode: '${regionCode!''}',
                    page: 1,
                    rows: 10
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    if (data) {
                        $('#fullPartyMember').html(data.length);   // 正式党员。
                    }
                },
                error: function(err) {
                    console.log("获取正式党员数据连接超时！");
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
                    console.log("获取事件数据连接超时！");
                },
                complete: function () {
                }
            });
        }

        // 生态宜居-污水处理点。
        getSewageTreatmentPointData();
        function getSewageTreatmentPointData() {
            $.ajax({
                type: 'POST',
                url: '${iotDomain!''}/iot/sewageManager/listDataForJsonp.jhtml?jsonpcallback=""',
                data: {
                    type: '2',
                    reginCode: '${regionCode!''}',
                    page: 1 ,
                    rows: 20
                },
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function(data) {
                    if (data.total > 0) {
                        $('#sewageTreatmentPoint').html(data.total);   // 污水处理点。
                    }
                },
                error: function(err) {
                    console.log("获取污水处理点数据连接超时！");
                },
                complete: function() {
                }
            });
        }

        // 乡村特色-特色商品。
        getFeaturedItemData();
        function getFeaturedItemData() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/villageProductPc/listData.json',
                data: {
                    page: 1,
                    limit: 10,
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
                    }
                },
                error: function(err) {
                    console.log("获取特色商品数据连接超时！");
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
                    limit: 12,
                    orgCode: ${regionCode!''},
                    issuStatus: 1
                },
                success: function(data) {
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
                                '<p class="font-size-r18 cor-333 font-bold mbr15">' + attractionsName + '</p>' +
                                '<p class="font-size-r14 text-nor cor-666 text-line-c4 ">' + attractionsDesc + '</p> ' +
                                '</div>' +
                                '</div>';
                        }

                        $('#scenicSpot').empty();
                        $('#scenicSpot').html(html);

                        var swipertsxc = new Swiper(".mySwiper-tsxc", {
                            slidesPerView: 1,
                            spaceBetween: 20,
                            observer:true,
                            observeParents:true,
                            pagination: {
                                el: ".mySwiper-tsxc .swiper-pagination",
                            },
                        });
                    }
                },
                error: function(err) {
                    console.log("获取景点数据连接超时！");
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
                    orgCode: '${orgCode!''}',
                    page: 1,
                    rows: 3,
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
                                videoHtml += '<div class="w-66 h100 fl prr10 bs">' +
                                    '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +
                                    '<i class="ibof"></i>' +
                                    '<i class="posi-abso w100 djyl-pic-title font-size-r14  cor-fff plr10 prr20 bs text-line-c1">' + platformName + '</i>' +
                                    '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +
                                    '</div>' +
                                    '</div>';
                            } else {
                                videoHtml += '<div class="w-33 fl" style="height:50%;" >';

                                if (i === 1) {
                                    videoHtml += '<div class="w100 h-50 pbr5 bs" style="height:100%;" >' +
                                        '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +
                                        '<i class="ibof"></i>' +
                                        '<i class="posi-abso w100 djyl-pic-title font-size-r14  cor-fff plr10 prr20 bs text-line-c1">' + platformName + '</i>' +
                                        '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +
                                        '</div>' +
                                        '</div>';
                                } else {
                                    videoHtml += '<div class="w100 h-50 ptr5 bs" style="height:100%;">' +
                                        '<div class="djyl-l-item-sp fl bs img100 posi-rela">' +
                                        '<i class="ibof"></i>' +
                                        '<i class="posi-abso w100 djyl-pic-title font-size-r14  cor-fff plr10 prr20 bs text-line-c1">' + platformName + '</i>' +
                                        '<iframe src="${gbpDomain}/gbp/globalEyes/play/index.jhtml?monitorId=' + monitorId + '" allow="autoplay" allowfullscreen="true" allowtransparency="true" webkitallowfullscreen="true" width="100%" height="100%" scrolling="no"></iframe>' +
                                        '</div>' +
                                        '</div>';
                                }

                                videoHtml += '</div>';
                            }

                            $('#safeComprehensiveTreatment').empty();
                            $('#safeComprehensiveTreatment').html(videoHtml);
                        }
                    }
                },
                error: function(err) {
                    console.log("获取平安综治数据连接超时！");
                },
                complete: function() {
                }
            });
        }
    </script>
</body>
</html>