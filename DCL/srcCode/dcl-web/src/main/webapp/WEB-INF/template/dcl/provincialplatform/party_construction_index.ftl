<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>智慧党建</title>
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-comm.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-1.css" />
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
    <style>
        .lyyx-div-four>div {
            margin-bottom: 0.2rem;
            margin-top: 0.2rem;
            height: 1.66rem;
        }
        .shyk-box-divs {
            min-width: 0.88rem;
            width: unset;
        }
    </style>
</head>
<body>
<div class="h100 plr30 prr30 ptr25 pbr25 szsh-bj bs clearfix">
    <!-- 左 -->
    <div class="bs sub-w460 h100 fl prr5 h-x posi-rela">
        <!-- 领导班子 -->
        <div class="sub-hei463 sub-zhdj-div h-o mbr10" id="moduleLeader">
            <!-- 标题 -->
            <div class="flex flex-ac">
                <div class="comm-subject-title-ext1 plr5 bs" style="cursor: auto;">
                    <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">领导班子</p>
                </div>
            </div>
            <!-- 内容 -->
            <div class="hyzt-hei-box plr20 prr20 ptr10 pbr10 bs posi-rela">
                <div class="swiper-container swiper04 w100 h100">
                    <div class="swiper-wrapper" id="leaderList" style="display: none;"></div>
                    <div class="none-data-ext1" id="leaderListNone">
                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                </div>
                <div class="swiper-pagination02 font-size-0"></div>
            </div>
        </div>
        <!-- 党员情况汇总 -->
        <div class="sub-hei455 sub-zhdj-div h-o" style="height: 5.5rem;" id="modulePM">
            <!-- 标题 -->
            <div class="flex flex-ac">
                <div class="comm-subject-title-ext1 plr5 bs" style="cursor: auto;">
                    <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">党员情况汇总</p>
                </div>
            </div>
            <!-- 背景01 -->
            <i class="zhdj-icon01"></i>
            <!-- 内容 -->
            <div class="plr20 prr20 ptr25" style="height: calc(100% - 0.55rem);">
                <!-- 党员数 -->
                <div class="zhdj-three-div bor-buttom-red clearfix pbr25">
                    <div class="fl">
                        <p class="text-align-c font-size-r30 cor-d62a1e font-bold" id="cardCarryingPM">0人</p>
                        <p class="text-align-c font-size-r14 cor-999">正式党员</p>
                    </div>
                    <div class="fl">
                        <p class="text-align-c font-size-r30 cor-d62a1e font-bold" id="probationaryPM">0人</p>
                        <p class="text-align-c font-size-r14 cor-999">预备党员</p>
                    </div>
                    <div class="fl">
                        <p class="text-align-c font-size-r30 cor-d62a1e font-bold" id="activist">0人</p>
                        <p class="text-align-c font-size-r14 cor-999">积极分子</p>
                    </div>
                </div>

                <div class="plr10 prr10 mtr25" style="height: calc(100% - 1.15rem);">
                    <!-- 支部男女比例 -->
                    <p class="cor-333 font-size-r14 font-bold">支部男女比例</p>
                    <div class="mtr20 clearfix">
                        <div class="echart-img01 fl img100" id="partyMemberSexChart"></div>
                        <div class="fl mlr15 plr10">
                            <p class="font-size-r12 cor-999">男党员</p>
                            <p class="font-size-r24 cor-ffac00 font-bold huang-icon-bf posi-rela" id="partyMemberMan">0人</p>
                        </div>
                        <div class="fl mlr15 plr10">
                            <p class="font-size-r12 cor-999">女党员</p>
                            <p class="font-size-r24 cor-d62a1e font-bold red-icon-bf posi-rela" id="partyMemberWoman">0人</p>
                        </div>
                    </div>

                    <!-- 党员年龄分布 -->
                    <p class="cor-333 font-size-r14 font-bold mtr30">党员年龄分布</p>
                    <div class="echar-img02" id="partyMemberAgeChart" style="height: calc(100% - 1.5rem); width: 100%;">
                        <div class="none-data-ext1" id="partyMemberAgeNone">
                            <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 中 -->
    <div class="bs sub-100-w460 h100 fl mlr10 prr5 h-x posi-rela">
        <!-- 党建新闻、两优一先 -->
        <div class="sub-h567 sub-zhdj-div h-o mbr10" style="height: 6.62rem;">
            <!-- 切换 -->
            <div class="flex flex-ac qh-middle j-click-div">
                <div class="flex flex-ac active mrr15">
                    <div class="comm-subject-title-ext1 plr5 bs">
                        <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">党建新闻</p>
                    </div>
                </div>
                <div class="flex flex-ac">
                    <div class="comm-subject-title-ext1 plr5 bs">
                        <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">两优一先</p>
                    </div>
                </div>
            </div>
            <!-- 内容 -->
            <div class="hyzt-hei-box bs plr20 prr20 ptr10">
                <!-- 党建新闻 -->
                <div class="h100 middle-top" id="moduleNews">
<#--                    <span class="font-size-r14 cor-d62a1e font-bold prr15 fr cursor djxw-gd01 hide"><em>更多</em><i class="comm-jt mlr5"></i></span>-->
                    <!-- 图集 -->
                    <div class="djxw-img">
                        <div class="swiper-container swiper05 w100 h100">
                            <div class="swiper-wrapper" id="newsImageList" style="display: none;"></div>
                            <div class="none-data-ext1" id="newsImageListNone">
                                <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                                <p class="none-data-t1">暂无数据</p>
                            </div>
                        </div>
                    </div>
                    <!-- 列表 -->
                    <div class="djxw-lieb mtr20 h-x posi-rela">
                        <ul class="div-ul-flfg prr5 hide" id="newsList"></ul>
                    </div>
                </div>
                <!-- 两优一先 -->
                <div class="h100 middle-top hide" id="moduleLyyx">
                    <!-- 背景01 -->
                    <i class="zhdj-icon01 zhdj-icon01-change"></i>
<#--                    <span class="font-size-r14 cor-d62a1e font-bold prr15 fr cursor djxw-gd02 hide"><em>更多</em><i class="comm-jt mlr5"></i></span>-->
                    <!-- 人物 -->
                    <div class="swiper-container swiper02 w100 h100">
                        <div class="none-data-ext1" id="lyyxNone">
                            <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                            <p class="none-data-t1">暂无数据</p>
                        </div>
                        <div class="swiper-wrapper" id="lyyx" style="display: none;"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 学习材料 -->
        <div class="sub-hei350 sub-zhdj-div" id="moduleLearningMaterial">
            <!-- 标题 -->
            <div class="flex flex-ac flex-jb">
                <div class="comm-subject-title-ext1 plr5 bs" style="cursor: auto;">
                    <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">学习材料</p>
                </div>
                <span class="font-size-r14 cor-d62a1e font-bold prr15 fr cursor hide"><em>更多</em><i class="comm-jt mlr5"></i></span>
            </div>
            <!-- 内容 -->
            <div class="hyzt-hei-box plr20 prr20 ptr20 pbr20 bs">
                <!-- 三块 -->
                <div class="zhdj-three-div02 clearfix" id="xxclt">
                    <div class="none-data-ext1" id="studentListNone" style="margin: auto;">
                        <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                        <p class="none-data-t1">暂无数据</p>
                    </div>
                </div>
                <!-- 数据内容 -->
                <div class="zhdj-xxcl-box mtr25 plr10 prr10 bs hide">
                    <div class="swiper-container swiper03 w100 h100">
                        <div class="swiper-wrapper" id="xxclb"></div>
                    </div>
                </div>
                <div class="none-data-ext1" id="studentListNone2" style="height: 1rem;">
                    <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                    <p class="none-data-t1">暂无数据</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 右 -->
    <div class="bs sub-w460 h100 fr prr5 h-x posi-rela">
        <!-- 三会一课 -->
        <div class="sub-hei283 sub-zhdj-div h-o mbr10" id="moduleShyk">
            <!-- 标题 -->
            <div class="flex flex-ac">
                <div class="comm-subject-title-ext1 plr5 bs" style="cursor: auto;">
                    <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">三会一课</p>
                </div>
            </div>
            <!-- 背景02 -->
            <i class="zhdj-icon02"></i>
            <i class="zhdj-icon03"></i>
            <!-- 内容 -->
            <div class="shyk-box" id="shyk">
                <div class="clearfix plr80 prr80 bs">
                    <div class="fl">
                        <div class="font-size-0 shyk-box-divs">
                            <em class="font-size-r14 font-bold">支部委员会</em>
                        </div>
                        <p class="text-align-c font-size-r26 font-bold" id="zbwyh">0次</p>
                    </div>
                    <div class="fr">
                        <div class="font-size-0 shyk-box-divs">
                            <em class="font-size-r14 font-bold">支部党员大会</em>
                        </div>
                        <p class="text-align-c font-size-r26 font-bold" id="zbdydh">0次</p>
                    </div>
                </div>
                <div class="clearfix plr80 prr80 bs mtr40">
                    <div class="fl">
                        <div class="font-size-0 shyk-box-divs">
                            <em class="font-size-r14 font-bold">党组小会</em>
                        </div>
                        <p class="text-align-c font-size-r26 font-bold" id="dzxh">0次</p>
                    </div>
                    <div class="fr">
                        <div class="font-size-0 shyk-box-divs">
                            <em class="font-size-r14 font-bold">党课</em>
                        </div>
                        <p class="text-align-c font-size-r26 font-bold" id="dk">0次</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 会议主题 -->
        <!-- sub-100-hei65 -->
        <div class="sub-hei274 sub-zhdj-div h-o mbr10" id="moduleMeetingTheme">
            <!-- 标题 -->
            <div class="flex flex-ac flex-jb">
                <div class="comm-subject-title-ext1 plr5 bs" style="cursor: auto;">
                    <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">会议主题</p>
                </div>
            </div>
            <!-- 背景03 -->
            <i class="zhdj-icon04"></i>
            <!-- 内容 -->
            <div class="hyzt-hei-box plr20 prr20 ptr10 pbr10 bs">
                <div class="swiper-container swiper01 w100 h100 hide" >
                    <div class="swiper-wrapper" id="hyzt"></div>
                </div>
                <div class="none-data-ext1" id="hyztNone">
                    <img class="none-data-p1" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">
                    <p class="none-data-t1">暂无数据</p>
                </div>
            </div>
        </div>
        <!-- 会议情况 -->
        <div class="sub-hei350 sub-zhdj-div h-o" id="moduleMeeting" style="height: 4.45rem;">
            <!-- 标题 -->
            <div class="flex flex-ac">
                <div class="comm-subject-title-ext1 plr5 bs" style="cursor: auto;">
                    <p class="font-size-r14 text-align-c plr10 prr10 bs cor-fff">会议情况</p>
                </div>
            </div>
            <!-- 背景03 -->
            <i class="zhdj-icon04"></i>
            <!-- 内容 -->
            <div class="hyzt-hei-box posi-rela bs">
                <!-- 切换按钮 -->
                <div class="font-size-0 hyqk-ann j-click-span">
                    <span class="active" id="one">一季度</span>
                    <span id="two">二季度</span>
                    <span id="three">三季度</span>
                    <span id="four">四季度</span>
                </div>
                <!-- 图表 -->
                <div class="echar-img03 img100 ptr30" id="meeting" style="height: 3.5rem;"></div>
                    <!-- 字 #999999 #3a3a3a #1c1c1c -->
                    <!-- #de544b #f2aa2b #376df5 #80e6ff #ececec -->
<#--                    <img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/zhdj/zhdj-icon07.png" alt="">-->

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
<script src="${uiDomain!''}/web-assets/common/js/echarts-4.9.0/echarts.min.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js" ></script>
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
    // 动画结束 后执行
    document.querySelector('body').addEventListener("animationend", function() {
        $('.h-x').scroll().size();
    });

    var partyMemberSexChart = echarts.init(document.getElementById('partyMemberSexChart'));
    var partyMemberAgeChart;
    // 领导班子 + 党员情况汇总-支部男女比例、党员年龄分布
    function loadPartyMember() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/partymember/pmInfo/getPmForJsonp.json?jsonpcallback=""&regionCode=${regionCode!''}&orgCode=${orgCode!''}',
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                    var leaders = data.manlist;
                    if (leaders && leaders.length > 0) {
                        var pageLeader = 0;
                        for (var i = 0; i < leaders.length; i++) {
                            var item = leaders[i];
                            var count = pageLeader;
                            if (i === (pageLeader * 6)) {
                                $('#leaderList').append(
                                    '<div class="swiper-slide bs">' +
                                    '   <div class="ldbz-box-nr zhdj-three-div02 ldbz-box-nr-three clearfix"" id="leaderList-' + count + '"></div>' +
                                    '</div>'
                                );
                            } else if (i === (pageLeader * 6 + 5)) {
                                pageLeader++;
                            }
                            var image = item.photo ? '${imgDomain}' + item.photo : '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';
                            $('#leaderList-' + count).append(
                                '<div class="fl">' +
                                '   <div class="img100 ldbz-toux">' +
                                '       <img src="' + image + '">' +
                                '   </div>' +
                                '   <p class="font-size-r14 cor-333 text-line-c1 text-align-c font-bold mtr5">' + (item.pmName || '') + '</p>' +
                                '   <p class="font-size-r14 cor-333 text-line-c1 text-align-c">' + (item.pmTypeName || '') + '</p>' +
                                '</div>'
                            );
                        }

                        $('#leaderList').show();
                        $('#leaderListNone').hide();

                        if ($('#leaderList').find('.swiper-slide').length > 1) {
                            var Swiper4 = new Swiper(".swiper04", {
                                slidesPerView : 1,
                                loop: true,
                                autoplay: {
                                    delay: 3000,
                                    stopOnLastSlide: false,
                                    disableOnInteraction: false,
                                },
                                pagination: {
                                    el: ".swiper-pagination02",
                                    clickable :true,
                                },
                                observer: true, //修改swiper自己或子元素时，自动初始化swiper
                                observeParents: true, //修改swiper的父元素时，自动初始化swiper
                            });
                            $('.swiper04').hover(function () {
                                Swiper4.autoplay.stop();
                            }, function () {
                                Swiper4.autoplay.start();
                            });
                        }
                    }

                    var sex = data.sexlist;
                    if (sex) {
                        $('#partyMemberSexChart').show();
                        var man = sex.male || 0;
                        var woman = sex.female || 0;
                        $('#partyMemberWoman').text(woman + '人');
                        $('#partyMemberMan').text(man + '人');
                        partyMemberSexChart.setOption({
                            series: [
                                {
                                    type: 'pie',
                                    radius: ['55%', '115%'],
                                    startAngle: 180,
                                    silent: true,
                                    center: ['45%', '83%'],
                                    roseType: 'radius',
                                    labelLine: {
                                        show: false,
                                    },
                                    label: {
                                        show: false,
                                    },
                                    data: [
                                        {
                                            value: man,
                                            itemStyle: {
                                                normal: {
                                                    color: '#FFAC00',
                                                },
                                            },
                                        },
                                        {
                                            value: woman,
                                            itemStyle: {
                                                normal: {
                                                    color: '#F14034',
                                                },
                                            },
                                        },
                                        {
                                            value: man + woman,
                                            name: '',
                                            itemStyle: {
                                                normal: {
                                                    color: 'transparent',
                                                    borderWidth: 0,
                                                    shadowBlur: 0,
                                                },
                                            },
                                        },
                                    ],
                                },
                                {
                                    type: 'pie',
                                    radius: ['55%', '130%'],
                                    startAngle: 180,
                                    silent: true,
                                    hoverAnimation: false,
                                    center: ['45%', '83%'],
                                    roseType: 'radius',
                                    labelLine: {
                                        show: false,
                                    },
                                    label: {
                                        show: false,
                                    },
                                    data: [
                                        {
                                            value: man,
                                            itemStyle: {
                                                normal: {
                                                    color: '#FFEECC',
                                                },
                                            },
                                        },
                                        {
                                            value: woman,
                                            itemStyle: {
                                                normal: {
                                                    color: '#FCD7D4',
                                                },
                                            },
                                        },
                                        {
                                            value: man + woman,
                                            name: '',
                                            label: {
                                                show: false,
                                            },
                                            labelLine: {
                                                show: false,
                                            },
                                            itemStyle: {
                                                normal: {
                                                    color: 'transparent',
                                                    borderWidth: 0,
                                                    shadowBlur: 0,
                                                    borderColor: 'transparent',
                                                    shadowColor: 'transparent',
                                                },
                                            },
                                        },
                                    ],
                                    z: -1,
                                },
                            ],
                        });
                        partyMemberSexChart.resize();
                    }

                    var ageStage = data.agelist;
                    if (ageStage) {
                        $("#partyMemberAgeChart").empty();

                        var age30 = ageStage.AGE_LESS_30 || 0;
                        var age49 = ageStage.AGE_30_49 || 0;
                        var age69 = ageStage.AGE_50_69 || 0;
                        var age70 = (ageStage.AGE_70_89 || 0) + (ageStage.AGE_MORE_90 || 0);
                        var ageSeries = [age30, age49, age69, age70];
                        var allAge = age30 + age49 + age69 + age70;//400;//
                        var yAxis = [0, 0, 0, 0];
                        if (allAge > 0) {
                            yAxis = [
                                (age30 * 100 / allAge).toFixed(0) + '%',
                                (age49 * 100 / allAge).toFixed(0) + '%',
                                (age69 * 100 / allAge).toFixed(0) + '%',
                                (age70 * 100 / allAge).toFixed(0) + '%'
                            ];
                        }
                        var partyMemberAgeChart = echarts.init(document.getElementById('partyMemberAgeChart'));
                        partyMemberAgeChart.setOption({
                            grid: {
                                left: '18%',
                                bottom: 30,
                                right: '15%',
                                top: 30,
                            },
                            yAxis: [
                                {
                                    inverse: false,
                                    data: ['30岁以下', '30-49岁', '50-69岁', '70以上'],
                                    axisLabel: {
                                        textStyle: {
                                            color: '#666666',
                                            align: 'right',
                                        },
                                    },
                                    offset: 0,
                                    splitLine: {
                                        show: false,
                                    },
                                    axisTick: {
                                        show: false,
                                    },
                                    axisLine: {
                                        show: false,
                                    },
                                },
                                {
                                    inverse: false,
                                    offset: 35,
                                    name: '（人）',
                                    nameGap: 5,
                                    nameLocation: 'start',
                                    nameTextStyle: {
                                        color: '#666666',
                                    },
                                    data: yAxis,
                                    axisLabel: {
                                        textStyle: {
                                            color: '#666666',
                                            align: 'right',
                                        },
                                    },
                                    splitLine: {
                                        show: false,
                                    },
                                    axisTick: {
                                        show: false,
                                    },
                                    axisLine: {
                                        show: false,
                                    },
                                },
                            ],
                            xAxis: {
                                minInterval: 1,
                                axisTick: {
                                    show: false,
                                },
                                axisLine: {
                                    show: false,
                                },
                                axisLabel: {
                                    textStyle: {
                                        color: '#666666',
                                    },
                                },
                            },
                            series: [
                                {
                                    type: 'bar',
                                    barGap: '-100%',
                                    silent: true,
                                    barWidth: 15,
                                    color: '#ffe8e7',
                                    data: [allAge, allAge, allAge, allAge],
                                },
                                {
                                    type: 'bar',
                                    data: ageSeries,
                                    barWidth: 15,
                                    silent: true,
                                    itemStyle: {
                                        normal: {
                                            color: new echarts.graphic.LinearGradient(0, 0, 1, 0,
                                                ['#fca401', '#ffac00'].map((color, offset) => ({
                                                    color,
                                                    offset,
                                                }))
                                            ),
                                        },
                                    },
                                },
                            ],
                        });
                        partyMemberAgeChart.resize();
                    }
                }
            },
        });
    }
    loadPartyMember();

    // 党员情况汇总-党员类型
    function loadPartyMemberType() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/partymember/pmInfo/countByPmTypeForJsonp.json?jsonpcallback=""&regionCode=${regionCode!''}',
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.list && data.list.length > 0) {
                    for (var i = 0; i < data.list.length; i++) {
                        var item = data.list[i];
                        if (item.PM_TYPE == '正式党员') {
                            $('#cardCarryingPM').text((item.COUNT_ || 0) + '人');
                        } else if (item.PM_TYPE == '预备党员') {
                            $('#probationaryPM').text((item.COUNT_ || 0) + '人');
                        } else if (item.PM_TYPE == '积极分子') {
                            $('#activist').text((item.COUNT_ || 0) + '人');
                        }
                    }
                }
            },
        });
    }
    loadPartyMemberType();

    // 党建新闻
    function loadNews() {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${regionCode!''}",
                catalogId: '10000035',
                isEndPubDate: 'no',
                isPic: 'yes',
                isPubOrg: 'no',
                isTop: 'yes',
                onlyShowMyOrg: 'yes',
                otherpage: 1,
                page: 1,
                rows: 10
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {

                    var images = [];
                    for (var i = 0; i < data.rows.length; i++) {
                        var item = data.rows[i];
                        if (item.fileName) {
                            images.push(item);
                        }
                        $('#newsList').append(
                            '<li onclick="showNews(\'' + item.infoOpenId + '\')" style="cursor: pointer">' +
                            '   <p>' +
                            '       <span class="font-size-r14 col-333 font-bold fl text-line-c1">' + (item.title || '') + '</span>' +
                            '       <span class="font-size-r14 col-999 fr">' + (item.pubDate ? item.pubDate.substr(0, 10) : '') + '</span>' +
                            '   </p>' +
                            '</li>'
                        );
                    }
                    $('#newsList').show();

                    var len = images.length;
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            var item = images[i];
                            $('#newsImageList').append(
                                '<div class="swiper-slide img100" style="cursor: pointer" onclick="showNews(\'' + item.infoOpenId + '\')">' +
                                '   <img src="${imgDomain}' + item.fileName + '">' +
                                '</div>'
                            );
                        }

                        $('#newsImageListNone').hide();
                        $('#newsImageList').show();
                        if (len > 1) {
                            var swiper5 = new Swiper(".swiper05", {
                                slidesPerView: 1,
                                loop: true,
                                autoplay: {
                                    delay: 3000,
                                    stopOnLastSlide: false,
                                    disableOnInteraction: false,
                                },
                                observer: true, //修改swiper自己或子元素时，自动初始化swiper
                                observeParents: true, //修改swiper的父元素时，自动初始化swiper
                            });
                            $('.swiper05').hover(function () {
                                swiper5.autoplay.stop();
                            }, function () {
                                swiper5.autoplay.start();
                            });
                        }
                    }
                }
            },
        });
    }
    loadNews();

    function showNews(infoOpenId) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?' +
            'type=3&module=ztdr&regionCode=${regionCode!''}&infoOpenId=' + infoOpenId +
            '&catalogId=10000035&title=' + encodeURI('党建新闻')
        );
    }

    // 两优一先
    function loadLyyx() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/ruralLaw/getExpertList.json',
            data: {
                page: 1,
                rows: 9999,
                regionCode: '${regionCode!''}',
                bizType: '27',
            },
            dataType: 'json',
            success: function (data) {
                if (data.total > 0) {
                    var pageLyyx = 0;
                    for (var i = 0; i < data.rows.length; i++) {
                        var item = data.rows[i];
                        var count = pageLyyx;
                        if (i === (pageLyyx * 9)) {
                            $('#lyyx').append('<div class="swiper-slide lyyx-div-four bs clearfix" id="lyyx-' + count + '"></div>');
                        } else if (i === (pageLyyx * 9 + 8)) {
                            pageLyyx++;
                        }

                        var image = item.photoPath ? '${imgDomain}' + item.photoPath : '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';
                        $('#lyyx-' + count).append(
                            '<div class="fl" style="cursor: pointer;" onclick="showLyyx(\'' + item.hashId + '\')">' +
                            '   <div class="h100 sub-w130 img100 fl"><img src="' + image + '"></div>' +
                            '   <div class="fr sub-100-w140">' +
                            '       <div class="lyyx-div-name02 font-size-0">' +
                            '           <em class="font-size-r18 cor-fff font-bold">' + (item.name || '') + '</em>' +
                            '       </div>' +
                            '       <p class="font-size-r14 font-bold cor-666 text-align-c mtr15">' + (item.postName || '') + '</p>' +
                            '   </div>' +
                            '   <i class="zhdj-icon05"></i>' +
                            '</div>'
                        );
                    }
                    if (data.total > 9) {
                        // 两优一先
                        var Swiper2 = new Swiper(".swiper02", {
                            slidesPerView: 1,
                            loop: true,
                            autoplay: {
                                delay: 3000,
                                stopOnLastSlide: false,
                                disableOnInteraction: false,
                            },
                            observer: true, //修改swiper自己或子元素时，自动初始化swiper
                            observeParents: true, //修改swiper的父元素时，自动初始化swiper
                        });
                        $('.swiper02').hover(function () {
                            Swiper2.autoplay.stop();
                        }, function () {
                            Swiper2.autoplay.start();
                        });
                    }
                    $('#lyyxNone').hide();
                    $('#lyyx').show();
                }
            },
        });
    }
    loadLyyx();

    function showLyyx(infoOpenId) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?' +
            'type=3&regionCode=${regionCode!''}&module=legal_adviser&catalogId=27&' +
            'infoOpenId=' + infoOpenId + '&title=' + encodeURI('两优一先')
        );
    }

    // 三会一课 + 会议情况
    function loadThreeMeetsAClass() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/bizMeeting/countByTypeJSONP.json?jsoncallback=threeMeetsAClassJsonp',
            data:{
                beginDateStart:'${year}-01-01 00:00:00',
                beginDateEnd :'${year}-12-31 23:59:59',
                regionCode :'${regionCode!''}',
                countMonth :'1'
            },
            dataType: 'jsonp',
        })

    }

    function threeMeetsAClassJsonp(data) {
        var month=['01','02','03','04','05','06','07','08','09','10','11','12'];
        var firstQuarter =['1月','2月','3月'];
        var secondQuarter =['4月','5月','6月'];
        var thirdQuarter =['7月','8月','9月'];
        var fourthQuarter =['10月','11月','12月'];
        var zbdyhs=new Array(12).fill(0),zbdydhs=new Array(12).fill(0),dzxhs=new Array(12).fill(0),dks=new Array(12).fill(0);
        if (data.length > 0) {
            var zbdyhcount=0,zbdydhcount=0,dzxhcount=0,zkcount=0;
            for (let i = 0; i < data.length; i++) {
                var meetspilt=data[i].TYPE.split(',')
                for (let j = 0; j <meetspilt.length ; j++) {
                    if (data[i].TYPE === '2001' || meetspilt[j] ==='2001' ) {
                        zbdyhcount +=data[i].COUNT;
                        for (let k = 0; k < 12 ; k++) {
                            if (data[i].MONTH_.substr(5)===month[k]){
                                zbdyhs.splice(k,1,data[i].COUNT);
                            }
                            else {
                                zbdyhs.splice(k,1,0);
                            }
                        }
                    }
                    if (data[i].TYPE === '2602' || meetspilt[j] ==='2602') {
                        zbdydhcount +=data[i].COUNT;
                        for (let k = 0; k < 12 ; k++) {
                            if (data[i].MONTH_.substr(5)===month[k]){
                                zbdydhs.splice(k,1,data[i].COUNT);
                            }
                            else {
                                zbdydhs.splice(k,1,0);
                            }
                        }
                    }
                    if (data[i].TYPE === '2603' || meetspilt[j] ==='2603') {
                        dzxhcount +=data[i].COUNT;
                        for (let k = 0; k < 12 ; k++) {
                            if (data[i].MONTH_.substr(5)===month[k]){
                                dzxhs.splice(k,1,data[i].COUNT);
                            }
                            else {
                                dzxhs.splice(k,1,0);
                            }
                        }
                    }
                    if (data[i].TYPE === '2604' || meetspilt[j] ==='2604') {
                        zkcount +=data[i].COUNT;
                        for (let k = 0; k < 12 ; k++) {
                            if (data[i].MONTH_.substr(5)===month[k]){
                                dks.splice(k,1,data[i].COUNT);
                            }
                            else {
                                dks.splice(k,1,0);
                            }
                        }
                    }
                }
            }

            $('#zbwyh').html(zbdyhcount + '次');
            $('#zbdydh').html(zbdydhcount + '次');
            $('#dzxh').html(dzxhcount + '次');
            $('#dk').html(zkcount + '次');

        }

        $.ajax({
            type: 'GET',
            url: '${djDomain!''}/dj/threeAndOneSchedule/statisticsForJsonp.json',
            data: {
                startYear: '${year}',
                endYear:'${year}',
                regionCode: '${regionCode!''}',
                regionSubordinate: '1'
            },
            async: false,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                var branchCommitteeNums=new Array(12).fill(0),partyBranchMeetingNums=new Array(12).fill(0),
                    partyGroupMeetingNums=new Array(12).fill(0),partyLectureNums=new Array(12).fill(0);
                if (data && data.data && data.data.schedules && data.data.schedules.length > 0 ){
                    for (let i = 0; i <data.data.schedules.length ; i++) {
                        for (let k = 0; k < 12 ; k++) {
                            if (data.data.schedules[i].plannedTime.substr(5)!==month[k]){
                                continue;
                            }
                            if (data.data.schedules[i].plannedTime.substr(5)===month[k]){
                                branchCommitteeNums.splice(k,1,data.data.schedules[i].branchCommitteeNum);
                            }
                            else {
                                branchCommitteeNums.splice(k,1,0);
                            }
                            if (data.data.schedules[i].plannedTime.substr(5)===month[k]){
                                partyBranchMeetingNums.splice(k,1,data.data.schedules[i].partyBranchMeetingNum);
                            }
                            else {
                                partyBranchMeetingNums.splice(k,1,0);
                            }
                            if (data.data.schedules[i].plannedTime.substr(5)===month[k]){
                                partyGroupMeetingNums.splice(k,1,data.data.schedules[i].partyGroupMeetingNum);
                            }
                            else {
                                partyGroupMeetingNums.splice(k,1,0);
                            }
                            if (data.data.schedules[i].plannedTime.substr(5)===month[k]){
                                partyLectureNums.splice(k,1,data.data.schedules[i].partyLectureNum);
                            }
                            else {
                                partyLectureNums.splice(k,1,0);
                            }
                        }
                    }
                }

                var num1 =zbdyhs,num2 =zbdydhs,num3 =dzxhs,num4 =dks;
                var plan1=branchCommitteeNums, plan2=partyBranchMeetingNums, plan3=partyGroupMeetingNums, plan4=partyLectureNums;
                var xdata=firstQuarter;
                setOpection(xdata,plan1.slice(0,3),plan2.slice(0,3),plan3.slice(0,3),plan4.slice(0,3),
                    num1.slice(0,3),num2.slice(0,3),num3.slice(0,3),num4.slice(0,3));
                $('.j-click-span>span').on('click', function () {
                    $(this).addClass('active').siblings().removeClass('active');
                    if ($(this)[0].id === 'one') {
                        xdata=firstQuarter;
                        num1 =zbdyhs.slice(0,3),num2 =zbdydhs.slice(0,3),num3 =dzxhs.slice(0,3),num4 =dks.slice(0,3);
                        plan1 =branchCommitteeNums.slice(0,3),plan2 =partyBranchMeetingNums.slice(0,3),plan3 =partyGroupMeetingNums.slice(0,3),plan4 =partyLectureNums.slice(0,3);
                    }
                    else if ($(this)[0].id === 'two') {
                        xdata=secondQuarter;
                        num1 =zbdyhs.slice(3,6),num2 =zbdydhs.slice(3,6),num3 =dzxhs.slice(3,6),num4 =dks.slice(3,6);
                        plan1 =branchCommitteeNums.slice(3,6),plan2 =partyBranchMeetingNums.slice(3,6),plan3 =partyGroupMeetingNums.slice(3,6),plan4 =partyLectureNums.slice(3,6);

                    }
                    else if ($(this)[0].id === 'three') {
                        xdata=thirdQuarter;
                        num1 =zbdyhs.slice(6,9), num2 =zbdydhs.slice(6,9),num3 =dzxhs.slice(6,9),num4 =dks.slice(6,9);
                        plan1 =branchCommitteeNums.slice(6,9),plan2 =partyBranchMeetingNums.slice(6,9),plan3 =partyGroupMeetingNums.slice(6,9),plan4 =partyLectureNums.slice(6,9);

                    }
                    else if ($(this)[0].id === 'four') {
                        xdata=fourthQuarter;
                        num1 =zbdyhs.slice(9,12),num2 =zbdydhs.slice(9,12),num3 =dzxhs.slice(9,12), num4 =dks.slice(9,12);
                        plan1 =branchCommitteeNums.slice(9,12),plan2 =partyBranchMeetingNums.slice(9,12),plan3 =partyGroupMeetingNums.slice(9,12),plan4 =partyLectureNums.slice(9,12);

                    }
                    setOpection(xdata, plan1, plan2, plan3, plan4,num1,num2,num3,num4);

                });
            },
            error: function(err) {

            },
            complete: function() {
            }
        });
    }
    loadThreeMeetsAClass();



    // 会议主题
    function loadConferenceTheme() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/bizMeeting/listDataJSONP.json?jsoncallback=conferenceThemeJsonp',
            data:{
                regionCode :'${regionCode!''}',
                page: 1,
                rows: 9999,
            },
            dataType: 'jsonp',
        })
    }
    function conferenceThemeJsonp(data) {
        if (data && data.total > 0) {
            $('#hyztNone').hide();
            $('#hyzt').parent().show();

            var pageHyzt = 0;
            for (var i = 0; i < data.rows.length; i++) {
                var item = data.rows[i];
                var count = pageHyzt;
                if (i === (pageHyzt * 6)) {
                    $('#hyzt').append('<div class="swiper-slide" id="hyzt-' + count + '"></div>');
                } else if (i === (pageHyzt * 6 + 5)) {
                    pageHyzt++;
                }

                $('#hyzt-' + count).append(
                    '<div class="flex flex-ac flex-jb" style="height: 16.66%;" onclick="showDetails(' + item.id + ')">' +
                    '   <p class="font-size-r16 bs text-line-c1 plr15 posi-rela hyzt-p-bf">' +
                    '       <em class="mrr5 cor-ff0000">' + (item.typeName ? '[' + item.typeName + ']' : '') + '</em>' +
                    '       <span class="cor-333">' + (item.title || '') + '</span>' +
                    '   </p>' +
                    '   <span class="font-size-r12 cor-999">' + (item.lastModifyDate ? item.lastModifyDate.substr(0, 10) : '') +'</span>' +
                    '</div>'
                );
            }

            // 循环轮播。
            if (data.total > 6) {
                var swiper01 = new Swiper(".swiper01", {
                    direction : 'vertical',
                    slidesPerView: 1,
                    loop: true,
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: false,
                        disableOnInteraction: false,
                    },
                    observer: true, //修改swiper自己或子元素时，自动初始化swiper
                    observeParents: true, //修改swiper的父元素时，自动初始化swiper
                });
                //鼠标放上暂停轮播
                $('.swiper01').hover(function () {
                    swiper01.autoplay.stop();
                }, function () {
                    swiper01.autoplay.start();
                });
            }
        }

    }
    loadConferenceTheme();

    function showDetails(infoOpenId) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?' +
            'type=3&module=hyxq&regionCode=${regionCode!''}&infoOpenId=' + infoOpenId + '&title=' + encodeURI('会议主题')
        );
        // window.open("http://www.baidu.com/", "_blank");
    }


    //会议情况柱状图
    function setOpection(xdata, plan1, plan2, plan3, plan4, actually1, actually2, actually3, actually4) {
        var myChart = echarts.init(document.getElementById('meeting'));
        myChart.setOption({
            legend: {
                show: true,
                data: ['支部委员会', '支部党员大会', '党组小会', '党课'],
                selectedMode: false,
                left: 'center',
                bottom: 'bottom',
                itemHeight: 10,
                itemWidth: 10,
                orient: 'vertical',
            },
            grid: {
                left: '2%',
                right: '2',
                top: '45',
                bottom: '45',
                containLabel: true,
            },
            animation: false,
            xAxis: [
                {
                    type: 'category',
                    splitLine: {
                        //刻度线
                        show: false,
                    },
                    axisTick: {
                        //轴刻度线
                        show: false,
                    },
                    axisLine: {
                        //刻度线颜色
                        lineStyle: {
                            color: '#ECECEC',
                        },
                    },
                    axisLabel: {
                        //文本颜色
                        show: true,
                        textStyle: {
                            color: '#9B9B9B',
                        },
                    },
                    data: xdata,
                },
                {
                    type: 'category',
                    axisLine: {
                        show: false,
                    },
                    axisTick: {
                        show: false,
                    },
                    axisLabel: {
                        show: false,
                    },
                    splitArea: {
                        show: false,
                    },
                    splitLine: {
                        show: false,
                    },
                    data: xdata,
                },
            ],
            yAxis: {
                show: true,
                minInterval: 1,
                name: '次',
                nameTextStyle: {
                    color: '#9B9B9B',
                    fontSize: 12,
                    padding: [0, 0, 0, -30],
                },
                type: 'value',
                splitLine: {
                    lineStyle: {
                        color: '#F5F5F5',
                    },
                },
                axisTick: {
                    show: false,
                },
                axisLine: {
                    lineStyle: {
                        color: '#ECECEC',
                    },
                },
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#9B9B9B',
                    },
                },
            },
            series: [
                {
                    name: '计划1',
                    type: 'bar',
                    barWidth: '12%',
                    itemStyle: {
                        normal: {
                            color: 'rgba(180, 180, 180, 0.2)',
                        },
                    },
                    zlevel: 2,
                    data: plan1,
                },
                {
                    name: '计划2',
                    type: 'bar',
                    barWidth: '12%',
                    itemStyle: {
                        normal: {
                            color: 'rgba(180, 180, 180, 0.2)',
                        },
                    },
                    zlevel: 2,
                    data: plan2,
                },
                {
                    name: '计划3',
                    type: 'bar',
                    barWidth: '12%',
                    itemStyle: {
                        normal: {
                            color: 'rgba(180, 180, 180, 0.2)',
                        },
                    },
                    zlevel: 2,
                    data: plan3,
                },
                {
                    name: '计划4',
                    type: 'bar',
                    barWidth: '12%',
                    itemStyle: {
                        normal: {
                            color: 'rgba(180, 180, 180, 0.2)',
                        },
                    },
                    zlevel: 2,
                    data: plan4,
                },
                {
                    name: '支部委员会',
                    type: 'bar',
                    xAxisIndex: 1,
                    barWidth: '12%',
                    data:actually1 ,
                    zlevel: 3,
                    itemStyle: {
                        normal: {
                            color: '#DE544B',
                        },
                    },
                },
                {
                    name: '支部党员大会',
                    type: 'bar',
                    xAxisIndex: 1,
                    barWidth: '12%',
                    data: actually2,
                    zlevel: 3,
                    itemStyle: {
                        normal: {
                            color: '#F2AA2B',
                        },
                    },
                },
                {
                    name: '党组小会',
                    type: 'bar',
                    xAxisIndex: 1,
                    barWidth: '12%',
                    data: actually3,
                    zlevel: 3,
                    itemStyle: {
                        normal: {
                            color: '#376DF5',
                        },
                    },
                },
                {
                    name: '党课',
                    type: 'bar',
                    xAxisIndex: 1,
                    barWidth: '12%',
                    data: actually4,
                    zlevel: 3,
                    itemStyle: {
                        normal: {
                            color: '#80E6FF',
                        },
                    },
                },
            ],
        });
        myChart.resize();
    }


    // 学习材料 学习列表
    function loadLearningMaterial() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/trainCourse/listDataJSONP.json?jsoncallback=studentListJsonp',
            data:{
                regionCode :'${regionCode!''}',
                page: 1,
                rows: 9999,
            },
            dataType: 'jsonp',

        });

    }
    loadLearningMaterial();
    function studentListJsonp(data) {
        let dataList = data.rows;
        if (data.total > 0) {
            let html = '';
            for (let i = 0; i < dataList.length; i++) {
                var image = dataList[i].courseCover;
                html += '<div class="img100 fl">' +
                    '<img src="' + image + '" alt="">' +
                    '<div class="plr15 prr15 font-size-0 xxcl-buttom">' +
                    '<em class="font-size-r14 cor-fff text-line-c1">' + dataList[i].courseTitle+ '</em>' +
                    '</div>' +
                    '</div>'
            }
            $('#xxclt').html(html);
            $('#studentListNone').hide();
            $('#xxclt').show();
        }
    }

    // 学习材料 学习记录
    function loadLearningMaterial2() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/trainCourse/studyListDataJSONP.json?jsoncallback=learningRecordJsonp',
            data:{
                regionCode :'${regionCode!''}',
                page: 1,
                rows: 9999,
                studyStatus:1
            },
            dataType: 'jsonp',
            success: function (data) {
            }
        });
    }
    loadLearningMaterial2();

    function learningRecordJsonp(data) {
        let dataList = data.rows;
        if (data.total > 0) {
            let html = '';
            for (let i = 0; i < dataList.length; i++) {
                if ((i + 1) % 2 === 1) {
                    html += '<div class="swiper-slide">'
                }
                html += '<div class="flex flex-ac flex-jb mtr20">' +
                    '<p class="font-size-r16 bs text-line-c1 plr15 posi-rela hyzt-p-bf hyzt-p-bf02">' +
                    '<span class="cor-333">'+dataList[i].NAME + '学完了' +  dataList[i].COURSE_TITLE + '</span>' +
                    '</p>' +
                    '<span class="font-size-r12 cor-999">'+ dataList[i].LAST_SEEN_TIME + '</span>' +
                    '</div>'
                if ((i + 1) % 2 === 0) {
                    html += '</div>';
                }
            }
            $('#xxclb').html(html);
            $('#studentListNone2').hide();
            $('#xxclb').parent().parent().show();
            var Swiper3 = new Swiper(".swiper03", {
                slidesPerView: 2,
                spaceBetween: 10,
                loop: true,
                autoplay: {
                    delay: 3000,
                    stopOnLastSlide: false,
                    disableOnInteraction: false,
                },
                observer: true, //修改swiper自己或子元素时，自动初始化swiper
                observeParents: true, //修改swiper的父元素时，自动初始化swiper
            });
            $('.swiper03').hover(function () {
                Swiper3.autoplay.stop();
            }, function () {
                Swiper3.autoplay.start();
            });
        }
    }

    // 切换

    $('.j-click-div>div').on('click', function () {
        $(this).addClass('active').siblings().removeClass('active');
        $('.middle-top').eq($(this).index()).fadeIn(300).siblings('.middle-top').hide();
    });

    var MAP_MODULE = {
        'moduleLeader': '161', // 领导班子
        'modulePM': '162', // 党员情况汇总
        'moduleNews': '164', // 党建新闻
        'moduleLyyx': '165', // 两优一先

        'moduleLearningMaterial': '166', // 学习材料
        // 'moduleLearningHistory': '166', // 学习记录
        // 'studentListNone2': '166', //
        'moduleShyk': '163', // 三会一课

        'moduleMeetingTheme': '163', // 会议主题
        'moduleMeeting': '163', // 会议情况
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
    bindRightMouse('moduleLeader');
    bindRightMouse('modulePM');
    bindRightMouse('moduleNews');
    bindRightMouse('moduleLyyx');

    bindRightMouse('moduleLearningMaterial');
    // bindRightMouse('moduleLearningHistory');
    // bindRightMouse('studentListNone2');
    bindRightMouse('moduleShyk');

    bindRightMouse('moduleMeetingTheme');
    bindRightMouse('moduleMeeting');
</script>
</body>
</html>