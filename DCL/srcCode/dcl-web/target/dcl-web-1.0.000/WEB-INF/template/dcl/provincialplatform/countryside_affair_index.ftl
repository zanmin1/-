<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>村务政务</title>
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-comm.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-1.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-2.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-3.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-cwzw.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css"/>
    <script>
        var winW, whdef, rem;
        function fullPage() { //将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef; // 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }
        fullPage();
        window.onresize = fullPage;
    </script>
</head>
<body>
<div class="h100  szsh-bj plr20 ptr20 pbr20 bs">
    <div class="h100 prr20 clearfix h-x posi-rela">
        <!-- 左 -->
        <div class="h926 jfyh-left fl bs ">
            <!-- 左上 -->
            <div class="h-570 div-box bg-fff div-jieshao-bg posi-rela">
                <i class="zhdj-icon02"></i>
                <i class="zhdj-icon03"></i>
                <!-- 标题 -->
                <div class="comm-div-title-big flex flex-ac">
                    <div class="comm-subject-title-ext1 bs">
                        <p class="font-size-r14 line-height-r28 text-align-c  plr20 prr30 bs cor-fff font-bold">村情介绍</p>
                    </div>
                </div>
                <!-- 村情介绍 -->
                <div class="plr25 prr25 bs bs mtr30 clearfix posi-rela" id="moduleIntroduce">
                    <!-- 村图 -->
                    <div class="jfyh-lt-pic fl img100 posi-rela" id="countryAlbum">
                        <div class="none-data-ext1 " id="countryAlbumNone">
                            <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                    </div>
                    <!-- 村介绍 -->
                    <div class="jfyh-lt-text fr h-x prr5 bs">
                        <p class="font-size-r18 font-bold cor-333">${gridName!''}</p>
                        <p class="font-size-r14 cor-333 line-height-r22 mtr10" id="countryIntroduce"></p>
                    </div>
                </div>
                <!-- 村基本信息 -->
                <div class="mlr25 mrr25 mtr30" id="moduleGrid">
                    <div><p class="cor-d62a1e font-bold font-size-r14 p-info">村基本信息</p></div>
                    <div class="flex flex-ac flex-jr mtr20">
                        <div>
                            <p class="text-align-c font-size-0 mbr10">
                                <img class="img-60-66" src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/cwzw/icon-ren.png"/>
                            </p>
                            <p class="font-size-r42 cor-d62a1e font-bold text-align-c mbr10" id="population">0人</p>
                            <p class="font-size-r20 cor-666 text-align-c">常住人口</p>
                        </div>
                        <div>
                            <p class="text-align-c font-size-0 mbr10">
                                <img class="img-60-66" src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/cwzw/icon-hu.png"/>
                            </p>
                            <p class="font-size-r42 cor-d62a1e font-bold text-align-c mbr10" id="house">0户</p>
                            <p class="font-size-r20 cor-666 text-align-c">房屋数量</p>
                        </div>
                        <div>
                            <p class="text-align-c font-size-0 mbr10">
                                <img class="img-60-66" src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/cwzw/icon-mianji.png"/>
                            </p>
                            <p class="font-size-r42 cor-d62a1e font-bold text-align-c mbr10" id="area">0平方公里</p>
                            <p class="font-size-r20 cor-666 text-align-c">总面积</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 左下 -->
            <div class="jfyh-l-bottom h-345 bs mtr10 div-box bg-fff posi-rela" id="moduleGroup">
                <i class="zhdj-icon02"></i>
                <i class="zhdj-icon03"></i>
                <div class="comm-div-title-big j-div-title-big flex flex-ac">
                    <div class="comm-subject-title-ext1 bg-none active bs">
                        <p class="font-size-r14 line-height-r28 fl text-align-c plr20 prr30 bs cor-fff font-bold">领导小组介绍</p>
                    </div>
                    <div class="comm-subject-title-ext1 bg-none bs">
                        <p class="font-size-r14 line-height-r28 fl text-align-c plr20 prr30 bs cor-fff font-bold">乡村振兴驻村工作队</p>
                    </div>
                </div>
                <div class="lb-content mtr20 mlr20 mrr20">
                    <div class="jfyh-lbc-item clearfix">
                        <!-- 领导小组介绍 -->
                        <div class="h100 w50 fl prr20 bs">
                            <div class="ld-title-h ld-title-h2">
                                <p class="mlr10 font-size-r14 cor-fff font-bold">村务公开领导小组</p>
                            </div>
                            <div class="ld-com-h">
                                <div class="w100 h100 h-x" id="groupList01">
                                    <div class="none-data-ext1 " id="groupListNone01" style="height: calc(100% - 0.18rem);">
                                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                        <p class="none-data-t1">暂无数据</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 村民小组长 -->
                        <div class="h100 w50 fl plr20 bs">
                            <div class="ld-title-h">
                                <p class="mlr10 font-size-r14 cor-fff font-bold">村民小组长</p>
                            </div>
                            <div class="ld-com-h bs">
                                <div class="w100 h100 h-x" id="groupList02">
                                    <div class="none-data-ext1 " id="groupListNone02" style="height: calc(100% - 0.18rem);">
                                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                        <p class="none-data-t1">暂无数据</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 乡村振兴驻村工作队 -->
                    <div class="jfyh-lbc-item clearfix hide">
                        <div class="h100 w100 fl  bs">
                            <div class="ld-title-h ld-title-h2">
                                <p class="mlr10 font-size-r14 cor-fff font-bold">工作人员介绍</p>
                            </div>
                            <div class="ld-com-h  bs">
                                <div class="w100 h100 h-x" id="groupList03">
                                    <div class="none-data-ext1 " id="groupListNone03" style="height: calc(100% - 0.4rem);">
                                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                        <p class="none-data-t1">暂无数据</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 村务政务公开 -->
        <div class="h926 jfyh-right fr div-box bg-fff posi-rela" id="groupAffair">
            <i class="zhdj-icon02"></i>
            <i class="zhdj-icon03"></i>
            <!-- 标题 -->
            <div class="comm-div-title-big flex flex-ac">
                <div class="comm-subject-title-ext1 bs">
                    <p class="font-size-r14 line-height-r28 text-align-c plr20 prr30 bs cor-fff font-bold">村务政务公开</p>
                </div>
            </div>
            <!-- 图集 -->
            <div class="h-400 mtr30 mbr30 posi-rela img100 mlr40 mrr40 h-o bor4">
                <div class="swiper-container szgl-swiper1 w100 h100">
                    <div class="none-data-ext1" id="affairImagesNone">
                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                    <div class="swiper-wrapper hide" id="affairImages"></div>
                    <div class="swiper-button-next" style="display: none"></div>
                    <div class="swiper-button-prev" style="display: none"></div>
                </div>
            </div>
            <!-- 列表 -->
            <div class="jfyh-r-bottom mlr40 mrr40">
                <div class="jfyh-rb-content h100 clearfix h-o">
                    <div class="none-data-ext1" id="affairListNone">
                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                    <div class="h100 bs h-x hide" id="affairListParent">
                        <ul class="div-ul-flfg prr10" id="affairList"></ul>
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
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
<script>

    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: false,
    });
    $('.j-div-title-big>div').on('click', function () {
        $(this).addClass('active').siblings().removeClass('active');
        var itemIndex = $(this).index();
        $('.lb-content').children('.jfyh-lbc-item').eq(itemIndex).removeClass('hide').siblings().addClass('hide');
        $('.h-x').getNiceScroll().resize();
    });

    // 村情介绍
    function loadCountryIntroduce() {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${regionCode!''}",
                catalogId: '10000005',
                isEndPubDate: 'no',
                isPic: 'yes',
                isPubOrg: 'no',
                isTop: 'yes',
                onlyShowMyOrg: 'yes',
                otherpage: 1,
                page: 1,
                rows: 1
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    var item = data.rows[0];
                    if (item.fileName) {
                        $('#countryAlbumNone').hide();
                        $('#countryAlbum').append('<img src="${imgDomain}' + item.fileName + '" alt="">');
                    }

                    $.ajax({
                        type: 'POST',
                        url: '${gbpDomain!''}/gbp/commonInfoOpen/detailForJsonp.json?jsonpcallback=""',
                        data: {
                            infoOpenId: item.infoOpenId,
                            mode: 'view',
                            orgCode: '${orgCode!''}',
                        },
                        dataType: 'jsonp',
                        jsonp: "jsoncallback",
                        success: function (info) {
                            var overView = info.overView || '';
                            overView = overView.replaceAll("<strong>", "").replaceAll("</strong>", "").replaceAll("<p>", "").replaceAll("</p>", "").replaceAll("\n", "").replaceAll("\t", "").replaceAll(" ", "");
                            $('#countryIntroduce').html(overView);
                        },
                    });
                }
            },
        });
    }
    loadCountryIntroduce();

    // 村基本信息
    function loadCountryInfo() {
        $.ajax({
            type: 'POST',
            url: '${zzgridDomain!''}/zzgl/grid/mixedGrid/detailForJsonp.json',
            data: {
                gridId: "${gridId!''}",
                infoOrgCode: "${regionCode!''}",
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                    var gridInfo = data.gridInfo;
                    if (gridInfo) {
                        $('#population').text((gridInfo.declareFloatingPopulation || 0) + '人');
                        $('#house').text((gridInfo.declareHouseAmount || 0) + '户');
                        $('#area').text((gridInfo.gridArea || 0) + '平方公里');
                    }
                }
            },
        });
    }
    loadCountryInfo();

    // 村小组
    function loadVillageGroup(type, limit) {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/villageGroup/getList.json?regionCode=${regionCode}&type=' + type,
            dataType: 'json',
            success: function (list) {
                if (list && list.length > 0) {
                    $('#groupList' + type).empty();
                    for (var i = 0; i < list.length; i++) {
                        var appendClass = (i + 1) % limit === 0 ? '' : 'mrr10';
                        var item = list[i];
                        var image = item.image ? '${imgDomain}' + item.image : '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';
                        $('#groupList' + type).append(
                            '<div class="ld-zp-div mtr20 fl ' + appendClass + ' " style="width: 1.6rem;">' +
                            '   <div class="fl font-size-r14">' +
                            '       <img class="img-55-66" src="' + image + '"/>' +
                            '   </div>' +
                            '   <div class="fl" style="width: calc(100% - 0.63rem);">' +
                            '       <p class="mlr10 mbr10 mtr5 font-bold font-size-r16 cor-333 text-line-c1" title="' + item.name + '">' + item.name + '</p>' +
                            '       <p class="mlr10 font-size-r12 cor-666 text-line-c1" title="' + item.job + '">' + item.job + '</p>' +
                            '   </div>' +
                            '</div>'
                        );
                        $('.h-x').getNiceScroll().resize();
                    }
                }
            },
        });
    }
    loadVillageGroup('01', 2);// 村务公开领导小组01
    loadVillageGroup('02', 2);// 村民小组长02
    loadVillageGroup('03', 4);// 乡村振兴驻村工作队03

    var affairs = [];
    // 村务政务公开
    function loadCountryAffair(catalogId, show) {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${regionCode!''}",
                catalogId: catalogId,
                isEndPubDate: 'no',
                isPic: 'yes',
                isPubOrg: 'no',
                isTop: 'yes',
                onlyShowMyOrg: 'yes',
                otherpage: 1,
                page: 1,
                rows: 999
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows) {
                    $.merge(affairs, data.rows);
                }
                if (show) {
                    if (affairs.length > 0) {
                        affairs = affairs.sort(function (a, b) {
                            if (a.catalogId == '10000006') {
                                a.catalogId = '政策宣传';
                            } else if (a.catalogId == '10000003') {
                                a.catalogId = '村务公开';
                            }
                            if (b.catalogId == '10000006') {
                                b.catalogId = '政策宣传';
                            } else if (a.catalogId == '10000003') {
                                b.catalogId = '村务公开';
                            }
                            return a.infoOpenId - b.infoOpenId;
                        });
                        var affairImages = [];
                        for (var i = 0; i < affairs.length; i++) {
                            var item = affairs[i];
                            if (item.fileName) {
                                affairImages.push(item);
                            }
                            $('#affairList').append(
                                '<li onclick="showAffair(\'' + item.infoOpenId + '\', \'' + item.catalogId + '\')" style="cursor: pointer">' +
                                '   <p class="text-line-c1 flex">' +
                                '       <em class="cor-d62a1e font-size-r18 mr5 fl">[' + item.catalogId + ']</em>' +
                                '       <span class="font-size-r18 col-333 fl text-line-c1 flex1 mr5">' + (item.title || '') + '</span>' +
                                '       <span class="font-size-r16 col-999 fr">' + (item.pubDate ? item.pubDate.substr(0, 10) : '') + '</span>' +
                                '   </p>' +
                                '</li>'
                            );

                        }
                        $('.h-x').getNiceScroll().resize();
                        $('#affairListNone').hide();
                        $('#affairListParent').show();

                        var len = affairImages.length;
                        if (len > 0) {
                            for (var i = 0; i < len; i++) {
                                var item = affairImages[i];
                                $('#affairImages').append(
                                    '<div class="swiper-slide posi-rela" style="cursor: pointer"' +
                                    '   onclick="showAffair(\'' + item.infoOpenId + '\', \'' + item.catalogId + '\')">' +
                                    '   <div class="h100 flex flex-ac img100">' +
                                    '       <img src="${imgDomain}' + item.fileName + '"/>' +
                                    '   </div>' +
                                    '   <p class="swiper-p plr20 prr20 bs text-line-c1">' +
                                    '       <em class="mrr30">' + (i + 1) + '/' + len + '</em>' +
                                    '       <span>' + (item.title || '') + '</span>' +
                                    '   </p>' +
                                    '</div>'
                                );
                            }
                            $('#affairImagesNone').hide();
                            $('#affairImages').show();
                            if (len > 1) {
                                $('.swiper-button-next').show();
                                $('.swiper-button-prev').show();
                                new Swiper(".szgl-swiper1.swiper-container", {
                                    loop: true,
                                    slidesPerView: 'auto',
                                    autoplay: {
                                        delay: 3000,
                                        stopOnLastSlide: false,
                                        disableOnInteraction: false,
                                    },
                                    navigation: {
                                        nextEl: ".szgl-swiper1 .swiper-button-next",
                                        prevEl: ".szgl-swiper1 .swiper-button-prev",
                                    },
                                });
                            }
                        }
                    }
                } else {
                    loadCountryAffair('10000003', true);
                }
            },
        });
    }
    loadCountryAffair('10000006', false);

    function showAffair(infoOpenId, title) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?' +
            'type=3&module=ztdr&regionCode=${regionCode!''}&infoOpenId=' + infoOpenId +
            (title === '村务公开' ? '&catalogId=10000003&title=' + encodeURI('村务公开') : '&catalogId=10000006&title=' + encodeURI('政策宣传'))
        );
    }

    var MAP_MODULE = {
        'moduleGrid': '171',
        'moduleIntroduce': '172',
        'moduleGroup': '173',// 村小组
        'groupAffair': '174',// 政务公开
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
    bindRightMouse('moduleGrid');
    bindRightMouse('moduleIntroduce');
    bindRightMouse('moduleGroup');
    bindRightMouse('groupAffair');
</script>
</body>
</html>