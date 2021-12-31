<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文化旅游</title>
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" href="${UI_DOMAIN!''}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet"
          href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css"/>
    <link rel="stylesheet"
          href="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-wenhualvyou.css"/>
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

    <script src="${UI_DOMAIN!''}/web-assets/common/js/calc-rem.js"></script>
</head>
<body>
<div class="contextMenu" id="myMenu2" style="display:none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>

<div class="h100 djyl-bj-padd bs">
    <div class="clearfix prr20 h-x h100 posi-rela">
        <!-- 左右 -->
        <div class="fl whly-w100-950 whly-h970 cun-box-bg-ext2">
            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
            <!-- 公共标题 -->
            <div class="flex flex-jc box-title-ext1">
                <div class="box-title-ext1-contet h100 bs flex flex-jc">
                    <p class="font-size-r18 font-bold text-align-c line-height-r32">乡村旅游</p>
                </div>
            </div>
            <!-- 内容 -->
            <div class="mtr25 plr20 prr20 whly-h-box" id="xclyR">
                <!-- 轮播 -->
                <div class="whly-lb-box">

                    <div class="swiper-container xcfz-swiper1 w100 h100">
                        <!-- 暂无数据 start -->
                        <div class="none-data-ext1 hide" id="xclyZwsj">
                            <img class="none-data-p1"
                                 src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                        <!-- 暂无数据 end -->
                        <div class="swiper-wrapper" id="xcly">
                        </div>
                        <div class="swiper-pagination font-size-0"></div>
                    </div>
                </div>

                <!-- 乡村民宿  |  农家乐 -->
                <p class="plr15 mtr20 mbr10 font-size-r16 cor-333 font-bold xcms-p-bf posi-rela" id="msnjlClick">
                    <em class="cor-e97418" style="cursor: pointer">乡村民宿</em>&#x3000;| &#x3000;<em
                            style="cursor: pointer">农家乐</em>
                </p>
                <!-- 民宿名称民宿名称 -->
                <!-- 内容 -->
                <div class="ptr20 pbr20 plr20 prr20 bs whlv-bj-div whlv-h-njl" id="xcmsR">
                    <div class="whlv-h-njl-nr">
                        <!-- 暂无数据 start -->
                        <div class="none-data-ext1 hide" id="xcmsZwsj">
                            <img class="none-data-p1"
                                 src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                        <!-- 暂无数据 end -->
                        <div class="swiper-container xcfz-swiper2 w100 h100" id="xcmsSwiper">
                            <div class="swiper-wrapper" id="xcms">
                            </div>
                        </div>
                        <div class="swiper-bott-lb font-size-0 " style="z-index: 9999" id="xcmspaging"></div>
                    </div>
                </div>
                <div class="ptr20 pbr20 plr20 prr20 bs whlv-bj-div whlv-h-njl hide" id="njlR">
                    <div class="whlv-h-njl-nr">
                        <!-- 暂无数据 start -->
                        <div class="none-data-ext1 hide" id="njlZwsj">
                            <img class="none-data-p1"
                                 src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                        <!-- 暂无数据 end -->
                        <div class="swiper-container xcfz-swiper2 w100 h100" id="njlSwiper">
                            <div class="swiper-wrapper" id="njl">
                            </div>
                        </div>
                        <div class="swiper-bott-lb font-size-0" style="z-index: 9999" id="njlpaging"></div>
                    </div>
                </div>

            </div>
        </div>
        <div class="fr whly-w936 whly-h970 cun-box-bg-ext2">
            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
            <!-- 公共标题 -->
            <div class="flex flex-jc box-title-ext1">
                <div class="box-title-ext1-contet h100 bs flex flex-jc">
                    <p class="font-size-r18 font-bold text-align-c line-height-r32">乡村文化</p>
                </div>
            </div>
            <!-- 内容 -->
            <div class="mtr25 plr20 whly-h-box">
                <!-- 村规民约 -->
                <div class="clearfix whly-hei1 mrr20" id="cgmyR">
                    <div class="swiper-container xcfz-swiper3 w100 h100">
                        <!-- 暂无数据 start -->
                        <div class="none-data-ext1 hide" id="cgmyZwsj">
                            <img class="none-data-p1"
                                 src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                        <!-- 暂无数据 end -->
                        <div class="swiper-wrapper" id="cgmy">
                        </div>
                        <div class="swiper-pagination font-size-0"></div>
                    </div>
                </div>
                <!-- 乡贤榜 -->
                <div class="mtr15 whly-h-xxb prr20">
                    <div class="whly-xxb-bj h100 ptr50 bs">
                        <!-- 头部 -->
                        <div class="whly-xxb-top font-size-0">
                            <em class="font-size-r24">乡贤榜</em>
                        </div>
                        <!-- 内容 -->
                        <div class="plr20 whly-xxb-h" id="xxbR">
                            <!-- 暂无数据 start -->
                            <div class="none-data-ext1 hide" id="xxbZwsj">
                                <img class="none-data-p1"
                                     src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                <p class="none-data-t1">暂无数据</p>
                            </div>
                            <!-- 暂无数据 end -->
                            <div class="swiper-container xcfz-swiper4 w100 h100">
                                <div class="swiper-wrapper" id="xxb">

                                </div>
                            </div>
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
</div>
<script src="${UI_DOMAIN!''}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${UI_DOMAIN!''}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${UI_DOMAIN!''}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
<script>
    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true,
    });
    $('.h-o').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true,
    });

    $(function () {
        findNoticeList(10000009)
        renderXxb()
        renderXcly()
        renderHomestay()
        renderFarmhouse()
        bindRightMouse('cgmyR')
        bindRightMouse('xxbR')
        bindRightMouse('xclyR')
        bindRightMouse('xcmsR')
        bindRightMouse('njlR')
    })

    function getOverViewById(list, ids, catalogId) {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/getOverViewByIdsForJsonp.json?jsonpcallback=""',
            data: {
                ids: ids
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                var str = ''
                var overViews = []
                for (index in data) {
                    overViews.push(data[index])
                }
                overViews.reverse()
                for (let i = 0; list && i < list.length; i++) {
                    // 点击数据，查看详情。
                    var showPic = `<div><div class="none-data-ext1">
                        <img class="none-data-p1" style="margin-top:10px;cursor: pointer" onclick='showMore( ` + catalogId + ` ,"村规民约"," ` + list[i].infoOpenId + `")' src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                        </div></div>`;
                    <#--var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';-->
                    var photo = '${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png';
                    if (list[i].fileName) {
                        photo = "${$IMG_DOMAIN}" + list[i].fileName
                        showPic = `<img style="top: 50%;left: 50%;min-width: 100%;max-height: 100%;cursor: pointer" src="` + photo + `"  onclick='showMore( ` + catalogId + ` ,"村规民约"," ` + list[i].infoOpenId + `")'">`;
                    }
                    var desc = ''
                    if (overViews[i]) {
                        desc = overViews[i].replace(/<[^>]+>/g, '')
                    }

                    str += `
                                                        <div class="swiper-slide">
                                <div class="whly-hei2 whly-imgs flex flex-ac flex-jc posi-rela">
                                    ` + showPic +`
                                </div>
                                <div class="ptr20 pbr20 plr20 prr20 bs whlv-bj-div whlv-h146">
                                <div class="h100 font-size-0">
                                <p class="text-line-c1">
                                <em class="cor-d62a1e font-size-r24 font-bold">村规民约</em>
                                </p>
                                <div class="clearfix">
                                <div class="whlv-htext whlv-hfont-size-r16 cor-333 text-line-c3text-wb fl mtr10 prr5" style="padding-top: 10px;">
                                <p class="font-size-r16 cor-333 text-line-c3">
                                ` + desc + `</p>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>

                        `
                }
                $('#cgmy').html(str)

                // 循环轮播。
                if (list.length > 1) {
                    // 放在外面轮播会失效。
                    // 左  村规民约轮播
                    var swiper03 = new Swiper(".xcfz-swiper3", {
                        // touchRatio : 0,
                        loop: false,
                        // slidesPerView : 'auto',
                        autoplay: {
                            delay: 5000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true, //修改swiper的父元素时，自动初始化swiper
                    });
                    //鼠标放上暂停轮播
                    $('.xcfz-swiper3').hover(function () {
                        swiper03.autoplay.stop();
                    }, function () {
                        swiper03.autoplay.start();
                    });
                }
            },
            error: function (data) {
                console.log('获取详情数据连接超时！');
            },
            complete: function () {
            }
        });
    }

    //乡村文化-村规民约
    function findNoticeList(catalogId) {
        var map = {
            orgCode: "${regionCode!''}",
            page: 1,
            rows: 5,
        };
        map.catalogId = catalogId;
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
            success: function (data) {
                var idList = ''
                var list = data.rows;
                if (list && list.length > 0) {
                    //左上角轮播图 村规民约
                    for (let i = 0; i < list.length; i++) {
                        idList += list[i].infoOpenId + ',';
                    }
                    idList = idList.substring(0, idList.length - 1);
                    getOverViewById(list, idList, catalogId)
                } else {
                    $('#cgmyZwsj').removeClass('hide');
                    $('#cgmy').hide();
                }
            },
            error: function (err){
                console.log('获取乡村文化数据异常');
            }
        })
    }

    //乡贤榜
    function renderXxb() {
        var url = '${rc.getContextPath()}/dcl/culturalTourism/getExpertList.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                regionCode: '${regionCode!''}',
                page: 1,
                rows: 10
            },
            success: function (data) {
                var str = '';
                var list = data.rows;
                if ( list && list.length > 0) {
                    for (let i = 0; i < list.length; i++) {
                        <#--var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'-->
                        var photo = '${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/wenhualvyou/toux.png'
                        if (list[i].photoPath) {
                            photo = "${$IMG_DOMAIN}" + list[i].photoPath
                        }
                        var personalInfo = ''
                        if (list[i].personalInfo) {
                            personalInfo = list[i].personalInfo.replace(/<[^>]+>/g, '')
                        }
                        var name = ''
                        if (list[i].name) {
                            name = list[i].name
                        }
                        var postName = ''
                        if (list[i].postName) {
                            postName =
                                `<span class="xxb-text-box-span font-size-r14 cor-fff mlr10">` + list[i].postName + `</span>`
                        }

                        str += `
                            <div class="swiper-slide" style="height: 152px;">
                            <div class="clearfix">
                            <div class="xxb-img whly-imgs fl flex flex-ac flex-jc">
                            <img src="` + photo + `" style="cursor: pointer"  onclick='showMore( "" ,"乡贤榜"," ` + list[i].hashId + `","culturalTourism_xxb")'
                            alt="">
                            </div>
                            <div class="xxb-text-box fr">
                            <p class="font-size-0 ptr10 prr20">
                            <em class="font-size-r18 cor-333 font-bold">` + name + `</em>
                            ` + postName + `
                            </p>
                            <div class="mtr20 xxb-text-div prr20">
                            <p class="font-size-r14 cor-666">
                            ` + personalInfo + `</p>
                            </div>
                            </div>
                            </div>
                            </div>

                            `

                    }
                    $('#xxb').html(str)
                    var slidesPerView = 2
                    var loop = true
                    if (list.length < 2) {
                        slidesPerView = 'auto'
                        loop = false
                    }
                    // 左  乡贤榜轮播
                    var swiper04 = new Swiper(".xcfz-swiper4", {
                        // touchRatio : 0,
                        loop: loop,
                        slidesPerView: slidesPerView,
                        direction: 'vertical',
                        autoplay: {
                            delay: 5000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true, //修改swiper的父元素时，自动初始化swiper
                    });
                    //鼠标放上暂停轮播
                    $('.xcfz-swiper4').hover(function () {
                        swiper04.autoplay.stop();
                    }, function () {
                        swiper04.autoplay.start();
                    });
                } else {
                    $('#xxbZwsj').removeClass('hide');
                    $('#xxb').hide();
                }
                $('.h-x').getNiceScroll().resize()
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    //乡村旅游
    function renderXcly() {
        var url = '${rc.getContextPath()}/dcl/culturalTourism/getAttraction.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                orgCode: '${regionCode!''}',
                issuStatus: 1,
                page: 1,
                rows: 5
            },
            success: function (data) {
                var str = '';
                var list = data.rows;
                if ( list && list.length > 0) {
                    for (let i = 0; i < list.length; i++) {
                        <#--var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'-->
                        var photo = '${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png'
                        if (list[i].picUrl) {
                            photo = "${$IMG_DOMAIN}" + list[i].picUrl
                        }
                        var attractionsName = ''
                        if (list[i].attractionsName) {
                            attractionsName = list[i].attractionsName
                        }
                        var desc = ''
                        if (list[i].attractionsDesc) {
                            desc = list[i].attractionsDesc.replace(/<[^>]+>/g, '')
                        }
                        str +=
                            `
                                                       <div class="swiper-slide">
                                <div class="whly-lb whly-imgs flex flex-ac flex-jc posi-rela">
                                    <img src="` + photo + `" style="cursor: pointer" onclick="detail(1,'` + list[i].uuid + `')"/>
                                </div>
                                <div class="ptr20 pbr20 plr20 prr20 bs whlv-bj-div whlv-h146">
                                <div class="h100 font-size-0">
                                <p class="text-line-c1">
                                <em class="font-size-r16 font-bold cor-333">` + attractionsName + `</em>
                                </p>
                                <div class="clearfix">
                                <div class="whlv-htext whlv-htext-wb fl mtr15 prr5">
                                <p class="font-size-r16 cor-666 text-line-c3">
                                ` + desc + `</p>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>

                                `

                    }
                    $('#xcly').html(str)
                    // 右  乡村旅游轮播
                    var swiper = new Swiper(".xcfz-swiper1.swiper-container", {
                        // touchRatio : 0,
                        loop: false,
                        slidesPerView: 'auto',
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true, //修改swiper的父元素时，自动初始化swiper
                        pagination: {
                            el: ".xcfz-swiper1 .swiper-pagination",
                        },
                    });
                    //鼠标放上暂停轮播
                    $('.xcfz-swiper1').hover(function () {
                        swiper.autoplay.stop();
                    }, function () {
                        swiper.autoplay.start();
                    });
                } else {
                    $('#xclyZwsj').removeClass('hide');
                    $('#xcly').hide();
                }
                $('.h-x').getNiceScroll().resize()
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    $("#msnjlClick em").on('click', function () {
        $(this).addClass('cor-e97418').siblings().removeClass('cor-e97418')
        if ($(this).text() === '农家乐') {
            $("#xcmsR").hide()
            $("#njlR").show()
        } else {
            $("#njlR").hide()
            $("#xcmsR").show()
        }
    })

    //乡村民宿
    function renderHomestay() {
        var url = '${rc.getContextPath()}/dcl/culturalTourism/getHomestay.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                orgCode: '${regionCode!''}',
                currentPage: 1,
                pageSize: 5
            },
            success: function (data) {
                var str = '';
                var list = data.data;
                if ( list && list.length > 0) {
                    for (let i = 0; i < list.length; i++) {
                        <#--var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'-->
                        var photo = '${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png'
                        if (list[i].picUrl) {
                            photo = "${$IMG_DOMAIN}" + list[i].picUrl
                        }
                        var homestayName = ''
                        if (list[i].homestayName) {
                            homestayName = list[i].homestayName
                        }
                        var homestayDesc = ''
                        if (list[i].homestayDesc) {
                            homestayDesc = list[i].homestayDesc.replace(/<[^>]+>/g, '')
                        }
                        var tel = ''
                        if (list[i].tel) {
                            tel = list[i].tel
                        }
                        var address = ''
                        if (list[i].address) {
                            address = list[i].address
                        }
                        str +=
                            `
                                                                <div class="swiper-slide clearfix posi-rela">
                                    <div class="whlv-h-njl-nr-img h100 whly-imgs flex flex-ac flex-jc fl">
                                        <img src="` + photo + `"  style="cursor: pointer" onclick="detail(2,'` + list[i].uuid + `')"
                                             alt="">
                                    </div>
                                    <div class="whlv-h-njl-nr-text h100 font-size-0 fr posi-rela">
                                        <p class="font-size-r22 cor-d62a1e font-bold text-line-c1">` + homestayName + `</p>
                                        <div class="text-index2 mtr15 mbr15 whlv-h-njl-nr-text-h prr5 posi-rela">
                                            <p class="font-size-r15 cor-333">
                                                ` + homestayDesc + `</p>
                                        </div>
                                <p class="mtr10 text-line-c1">
                                <i class="whlv-h-njl-icon">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/wenhualvyou/icon03.png"
                                alt="">
                                </i>
                                <em class="font-size-r16 cor-333 mlr10">` + tel + `</em>
                                </p>
                                <p class="mtr10 text-line-c1">
                                <i class="whlv-h-njl-icon">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/wenhualvyou/icon04.png"
                                alt="">
                                </i>
                                <em class="font-size-r16 cor-333 mlr10">` + address + `</em>
                                </p>
                                </div>
                                </div>

                                `

                    }
                    $('#xcms').html(str)
                    // 右  乡村民宿轮播
                    var swiper02 = new Swiper("#xcmsSwiper", {
                        // touchRatio : 0,
                        loop: false,
                        slidesPerView: 'auto',
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true, //修改swiper的父元素时，自动初始化swiper
                        pagination: {
                            el: "#xcmspaging"
                        },
                    });
                    $('.xcfz-swiper2').hover(function () {
                        swiper02.autoplay.stop();
                    }, function () {
                        swiper02.autoplay.start();
                    });
                } else {
                    $('#xcmsZwsj').removeClass('hide');
                    $('#xcms').parent().hide();
                }
                $('.h-x').getNiceScroll().resize()
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    //农家乐
    function renderFarmhouse() {
        var url = '${rc.getContextPath()}/dcl/culturalTourism/getFarmhouse.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                orgCode: '${regionCode!''}',
                page: 1,
                rows: 5
            },
            success: function (data) {
                var str = '';
                var list = data.rows;
                if ( list && list.length > 0) {
                    for (let i = 0; i < list.length; i++) {
                        <#--var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'-->
                        var photo = '${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png'
                        if (list[i].picUrl) {
                            photo = "${$IMG_DOMAIN}" + list[i].picUrl
                        }
                        var homestayName = ''
                        if (list[i].farmhouseName) {
                            homestayName = list[i].farmhouseName
                        }
                        var homestayDesc = ''
                        if (list[i].serviceDesc) {
                            homestayDesc = list[i].serviceDesc.replace(/<[^>]+>/g, '')
                        }
                        var tel = ''
                        if (list[i].tel) {
                            tel = list[i].tel
                        }
                        var address = ''
                        if (list[i].address) {
                            address = list[i].address
                        }
                        str +=
                            `
                                                                <div class="swiper-slide clearfix posi-rela">
                                    <div class="whlv-h-njl-nr-img h100 whly-imgs flex flex-ac flex-jc fl">
                                        <img src="` + photo + `"  style="cursor: pointer" onclick="detail(3,'` + list[i].uuid + `')"
                                             alt="">
                                    </div>
                                    <div class="whlv-h-njl-nr-text h100 font-size-0 fr posi-rela">
                                        <p class="font-size-r22 cor-d62a1e font-bold text-line-c1">` + homestayName + `</p>
                                        <div class="text-index2 mtr15 mbr15 whlv-h-njl-nr-text-h prr5 posi-rela">
                                            <p class="font-size-r15 cor-333">
                                                ` + homestayDesc + `</p>
                                        </div>
                                <p class="mtr10 text-line-c1">
                                <i class="whlv-h-njl-icon">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/wenhualvyou/icon03.png"
                                alt="">
                                </i>
                                <em class="font-size-r16 cor-333 mlr10">` + tel + `</em>
                                </p>
                                <p class="mtr10 text-line-c1">
                                <i class="whlv-h-njl-icon">
                                <img src="${UI_DOMAIN!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/wenhualvyou/icon04.png"
                                alt="">
                                </i>
                                <em class="font-size-r16 cor-333 mlr10">` + address + `</em>
                                </p>
                                </div>
                                </div>
                                `
                    }
                    $('#njl').html(str)
                    // 右  农家乐轮播
                    var swiper20 = new Swiper("#njlSwiper", {
                        // touchRatio : 0,
                        loop: false,
                        slidesPerView: 'auto',
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true, //修改swiper的父元素时，自动初始化swiper
                        pagination: {
                            el: "#njlpaging"
                        },
                    });
                    $('.xcfz-swiper20').hover(function () {
                        swiper20.autoplay.stop();
                    }, function () {
                        swiper20.autoplay.start();
                    });
                } else {
                    $('#njlZwsj').removeClass('hide');
                    $('#njl').parent().hide()
                }
                $('.h-x').getNiceScroll().resize()
            },

            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }


    function detail(type, id) {
        var url
        if (type === 1) {
            url = '${rc.getContextPath()}/dcl/attractionsManagement/view.jhtml?id=' + id;
        } else if (type === 2) {
            url = '${rc.getContextPath()}/dcl/homestayManagementPc/view.jhtml?uuid=' + id;
        } else if (type === 3) {
            url = '${rc.getContextPath()}/dcl/farmhouseManagement/view.jhtml?uuId=' + id;
        }
        url += '&regionCode=${regionCode!}'
        window.open(url)
    }

    function showMore(catalogId, title, infoOpenId, module) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=' +
            catalogId + '&module=' + (module || 'ztdr') + '&title=' +
            encodeURI(title) + '&infoOpenId=' + infoOpenId + '&regionCode=${regionCode!}'
        );
    }

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

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
                        // 村规民约
                        case 'cgmyR':
                            type = 81;
                            break;
                        // 乡贤榜
                        case 'xxbR':
                            type = 82;
                            break;
                        // 乡村旅游
                        case 'xclyR':
                            type = 83;
                            break;
                        // 乡村民宿
                        case 'xcmsR':
                            type = 84;
                            break;
                        // 农家乐
                        case 'njlR':
                            type = 85;
                            break;
                        default:
                            type = 81;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);

                },
                'item_2': function (t) {
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