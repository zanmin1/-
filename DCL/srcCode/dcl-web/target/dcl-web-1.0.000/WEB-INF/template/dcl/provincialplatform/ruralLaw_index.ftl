<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>乡村法制</title>
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <!-- <link rel="stylesheet" type="text/css" href="../../../../../statics/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-1.css" /> -->
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-xcfz.css" />
    <script>
        var winW, whdef, rem;
        function fullPage() { //将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef; // 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }
        fullPage();
        window.onresize = fullPage;
    </script>
</head>
<body>
<!--右键--->
<div class="contextMenu" id="myMenu2" style="display: none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>

<div class="h100  szsh-bj plr20 ptr20 pbr0 bs">
    <div class="h100 prr20 clearfix h-x posi-rela">
        <!-- 左 -->
        <div class="h965 smfw-l-w main-div-box fl bs plr30 prr40 cun-box-bg-ext2">
            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
            <div class="jfyh-l-top jfyh-l-top-h">
                <div class="div-banner h-356 img100" id="coverDiv">
                    <div class="swiper-container xcfz-swiper1 w100 h100">
                        <div class="swiper-wrapper" id="coverList"></div>
                        <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
                <div class=" h-100-400  clearfix bs">
                    <div class="h-100 w-50-15 fl " id="popularizingLawEducationDiv">
                        <div class="comm-title-ext1 clearfix">
                            <div class="comm-te1-item  w100 h100 bs plr5 prr5 fl posi-rela ">
                                <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3">普法<em class="col-d62">教育</em></p>
                                <span class="fr">
                                    <i class="i-right" onclick="showMore('10000013', '乡村法治-普法教育', '')"></i>
                                </span>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="div-t-com w100 mtr30">
                            <div class="h-106 w100" id="popularizingLawEducation1"></div>
                            <div class="h-100-106 w100" >
                                <ul class="div-jy-ul ptr5" id="popularizingLawEducation2"></ul>
                                <div class="none-data-ext1 hide" id="popularizingLawEducationNone">
                                    <img class="none-data-p1"
                                         src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                    <p class="none-data-t1">暂无数据</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="h-100 w-50-15 fr " id="caseDiv">
                        <div class="comm-te1-item comm-title-ext1 w100 bs plr5 prr5 fl posi-rela ">
                            <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3">以案<em class="col-d62">释法</em></p>
                            <span class="fr">
                                <i class="i-right" onclick="showMore('10000012', '乡村法治-以案释法', '')"></i>
                            </span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="div-t-com w100 mtr30">
                            <div class="h-106 w100" id="caseList1">
                            </div>
                            <div class="h-100-106 w100">
                                <ul class="div-jy-ul ptr5"  id="caseList2"></ul>
                                <div class="none-data-ext1 hide" id="caseListNone">
                                    <img class="none-data-p1"
                                         src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                    <p class="none-data-t1">暂无数据</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- 右 -->
        <div class="h965 smfw-r-w  fr">
            <div class="smfw-r-top main-div-box mbr10 cun-box-bg-ext2" id="expertDiv">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 公共标题 -->
                <div class="flex flex-jc box-title-ext1">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">法律服务</p>
                    </div>
                </div>
                <div class="div-w-h-com">
                    <div class="div-w100-h100 plr30 prr30 ptr30 pbr30 bs">
                        <!-- <div class="h-40">
                            <p class="p-gw font-bold">法律顾问</p>
                        </div> -->
                        <div class="h-110" id="expertList"></div>
                        <div class="none-data-ext1 hide" id="expertListNone">
                            <img class="none-data-p1"
                                 src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="smfw-r-btn main-div-box cun-box-bg-ext2" id="lawDiv">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 公共标题 -->
                <div class="flex flex-jc box-title-ext1">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">法律法规</p>
                    </div>
                </div>
                <!-- <div class="comm-div-title comm-div-title-w100 font-size-0 posi-rela">
                    <em class="font-size-r16 cor-d62a1e font-bold plr15">法律法规</em>
                    <div class="comm-pre-next-box posi-abso clearfix">
                        <a href="javascript:void(0);" class="comm-pnb-pre fl active"></a>
                        <a href="javascript:void(0);" class="comm-pnb-next fl mlr10 active"></a>
                    </div>
                </div> -->
                <div class="div-w-h-com">
                    <div class="cont-h1 plr30 mt20 bs h-x">
                        <ul class="div-ul-flfg prr30" id="lawList"></ul>
                        <div class="none-data-ext1 hide" id="lawListNone" style="height: calc(100% - 0.42rem);">
                            <img class="none-data-p1"
                                 src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${uiDomain}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${uiDomain}/js/layer/layer.js" type="text/javascript"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
<script>
    var coverData = [];
    var count = 0;

    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };

    function getLeftBottomList(catalogId, title, dom, dom2, none) {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${regionCode!''}",
                page: 1,
                rows: 5,
                catalogId: catalogId,
                isEndPubDate: 'no',
                isPic: 'yes',
                isPubOrg: 'no',
                isTop: 'yes'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    $(none).hide();
                    $(dom2).show();
                    var start = 0;
                    var first = data.rows[0];
                    if (first.fileName) {
                        start = 1;
                        $(dom).show();
                        $(dom).append(
                            '<div class="img-80-108 w-160 img100 fl" style="cursor: pointer;" ' +
                            '   onclick="showMore(\'' + catalogId + '\', \'' + title + '\', \'' + first.infoOpenId + '\')" >' +
                            '   <img src="${imgDomain!''}' + first.fileName + '"/>' +
                            '</div>' +
                            '<div class="div-w-gw-r div-w-gw-r-180 fr" style="cursor: pointer;" ' +
                            '   onclick="showMore(\'' + catalogId + '\', \'' + title + '\', \'' + first.infoOpenId + '\')" >' +
                            '   <p class="font-size-r16 col-333 font-bold text-line-c1" title="' + first.title + '">' + first.title + '</p>' +
                            '   <p class="font-size-r14 col-333 text-line-c3">' + first.pubDate.substr(0, 10) + '</p>' +
                            '</div>'
                        );
                        coverData.push(first);
                    } else {
                        $(dom).hide();
                    }
                    for (var i = start; i < data.rows.length; i++) {
                        var item = data.rows[i];
                        if (item.fileName) {
                            coverData.push(item);
                        }
                        $(dom2).append(
                            '<li style="cursor: pointer;" ' +
                            '   onclick="showMore(\'' + catalogId + '\', \'' + title + '\', \'' + item.infoOpenId + '\')" >' +
                            '   <p class="font-size-r14 plr10 col-333 pbr5 text-line-c1" title="' + item.title + '">' + item.title + '</p>' +
                            '   <p class="font-size-r12 plr10 col-ccc">' +
                            '       <span>' + item.pubDate.substr(0, 10) + '</span>' +
                            // '       <span>阅读量<em>10265</em></span>' +
                            '   </p>' +
                            '</li>'
                        );
                    }
                } else {
                    $(none).show();
                    $(dom).hide();
                    $(dom2).hide();
                }
                count++;
                loadCover();
            },
        });
    }

    getLeftBottomList('10000013', '乡村法治-普法教育', '#popularizingLawEducation1', '#popularizingLawEducation2', '#popularizingLawEducationNone');
    getLeftBottomList('10000012', '乡村法治-以案释法', '#caseList1', '#caseList2', '#caseListNone');

    function loadCover() {
        if (count === 2) {
            if (coverData.length > 0) {
                for (var i = 0; i < coverData.length; i++) {
                    var item = coverData[i];
                    var title = item.catalogId == '10000013' ? '乡村法治-普法教育' : '乡村法治-以案释法';
                    $('#coverList').append(
                        '<div class="swiper-slide" style="cursor: pointer;">' +
                        '   <div class="h100 flex flex-jc flex-ac posi-rela" style="cursor: pointer;" ' +
                        '       onclick="showMore(\'' + item.catalogId + '\', \'' + title + '\', \'' + item.infoOpenId + '\')" >' +
                        '       <img style="max-width:100%;max-height:100%;display:block;" src="${imgDomain!''}' + item.fileName + '" />' +
                        '       <p class="font-size-r14 col-fff bs plr20 prr20 text-line-c1">' + item.title + '</p>' +
                        '   </div>' +
                        '</div>'
                    );
                }
                new Swiper(".xcfz-swiper1.swiper-container", {
                    loop: true,
                    slidesPerView: 'auto',
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: false,
                        disableOnInteraction: false,
                    },
                    pagination: {
                        el: ".xcfz-swiper1 .swiper-pagination",
                    },
                });
            } else {
                $('#coverList').append(
                    '<div class="swiper-slide">' +
                    '   <div class="h100 flex flex-jc flex-ac posi-rela">' +
                    '       <img style="max-width:100%;max-height:100%;display:block;" src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png"/>' +
                    '   </div>' +
                    '</div>'
                );
            }
        }
    }

    var lawPageSize = 100;
    var lawAllPage = 1;
    var lawPage = 1;
    function getLawList() {
        $('#lawList').empty();
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${regionCode!''}",
                page: lawPage,
                rows: lawPageSize,
                catalogId: '10000026',
                isEndPubDate: 'no',
                isPic: 'yes',
                isPubOrg: 'no',
                isTop: 'yes'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    $('#lawListNone').hide();
                    $('#lawList').show();
                    var rows = data.rows;
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i];
                        $('#lawList').append(
                            '<li onclick="showMore(\'10000026\', \'乡村法治-法律法规\', \'' + item.infoOpenId + '\')" style="cursor: pointer;">' +
                            '    <p>' +
                            '        <span class="font-size-r14 col-333 font-bold fl text-line-c1" title="' + item.title + '">' + item.title + '</span>' +
                            '        <span class="font-size-r14 col-999 fr">' + item.pubDate.substr(0, 10) + '</span>' +
                            '    </p>' +
                            '</li>'
                        );
                    }
                } else {
                    $('#lawListNone').show();
                    $('#lawList').hide();
                }
            },
        });
    }
    getLawList();

    function getExpertList() {
        $('#expertList').empty();
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/ruralLaw/getExpertList.json',
            data: {
                regionCode: "${regionCode!''}",
                page: 1,
                rows: 2,
            },
            dataType: 'json',
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    $('#expertListNone').hide();
                    $('#expertList').show();
                    var rows = data.rows;
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i];
                        $('#expertList').append(
                            '<li class="clearfix mbr20 w-33 plr30 prr30 bs fl" style="cursor: pointer;" ' +
                            '   onclick="showMore(\'\', \'乡村法治-法律服务\', \'' + item.hashId + '\', \'legal_adviser\')">' +
                            '    <div class="img100 box-tox text-align-c">' +
                            '        <img src="' + (item.photoPath ? "${imgDomain!''}" + item.photoPath : "${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/xcfz/img0.png") + '"/>' +
                            '    </div>' +
                            '    <div class="box-nr">' +
                            '        <p class="font-size-r20 mtr20 text-align-c cor-333 font-bold">' + item.name + '</p>' +
                            '        <p class="font-size-r16 text-align-c line-height-r28 mtr10 text-line-c1">' + (item.postName || '') + '</p>' +
                            '        <p class="font-size-r16 line-height-r28  text-line-c2">' + (item.personalInfo || '') + '</p>' +
                            '    </div>' +
                            '</li>'
                        );
                    }
                } else {
                    $('#expertListNone').show();
                    $('#expertList').hide();
                }
            },
        });
    }
    getExpertList();

    // function changePage(num) {
    //     var newPage = lawPage + num;
    //     if (newPage >= 1 && newPage <= lawAllPage) {
    //         lawPage = newPage;
    //         getLawList();
    //     }
    // }

    function showMore(catalogId, title, infoOpenId, module) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=' +
            catalogId + '&module=' + (module || 'ztdr') + '&title=' +
            encodeURI(title) + '&infoOpenId=' + infoOpenId
        );
    }

    var MAP_MODULE = {
        'coverDiv': '52',
        'popularizingLawEducationDiv': '53',
        'caseDiv': '52',
        'lawDiv': '51',
        'expertDiv': '54',
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
    bindRightMouse('popularizingLawEducationDiv');
    bindRightMouse('caseDiv');
    bindRightMouse('expertDiv');
    bindRightMouse('coverDiv');
    bindRightMouse('lawDiv');

    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true,
    });
    // 动画结束 后执行
    document.querySelector('body').addEventListener("animationend", function () {
        $('.h-x').scroll().size();
    });
</script>
<#include "/dcl/szsh/more_function.ftl" />
</body>
</html>