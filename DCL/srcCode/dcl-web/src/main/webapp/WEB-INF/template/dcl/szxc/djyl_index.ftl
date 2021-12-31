<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>党建引领</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/css/djyl.css"/>
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
<style>
    .djyl-dj-ul::before {
        width: 100%;
        left: 0;
        background-size: 0% 0%;
    }
</style>
<body>
<div class="h100 djyl-bj djyl-bj-padd02 bs">
    <div class="h100 prr20 clearfix h-x">
        <!-- 左右结构 -->
        <!-- 左 -->
        <div class="contextMenu" id="myMenu2" style="display:none;">
            <ul>
                <li id="item_1">栏目配置</li>
                <li id="item_2">刷新</li>
            </ul>
        </div>
        <div class="fl djyl-w932 h-o" style="width: calc(50% - 0.075rem);">
            <!-- 党员情况  -->
            <div id="dyqk" class="djyl-div-box w100 djyl-h346 mbr15">
                <!-- 公共标题 -->
                <div class="djyl-div-title font-size-0">
                    <em class="font-size-r16 color-red01 font-bold plr15">党员情况 </em>
                </div>
                <!-- 内容 -->
                <div class="clearfix mtr30">
                    <div class="fl plr35">
                        <!-- 数量 -->
                        <div class="clearfix">
                            <!-- 男性数量 -->
                            <div class="fl djyl-w230">
                                <div class="fl djyl-icon img100 mtr5">
                                    <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon01.png"
                                         alt="">
                                </div>
                                <div class="fl mlr20">
                                    <p class="color-red01 font-bold font-size-r18"><em
                                                class="font-size-r28 mrr5 font-oswald" id="mannum">0</em>人</p>
                                    <p class="cor-666 font-size-r15">男性数量</p>
                                </div>
                            </div>
                            <!-- 女性数量 -->
                            <div class="fl djyl-w230 mlr5">
                                <div class="fl djyl-icon img100 mtr5">
                                    <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon02.png"
                                         alt="">
                                </div>
                                <div class="fl mlr20">
                                    <p class="color-huang01 font-bold font-size-r18"><em
                                                class="font-size-r28 mrr5 font-oswald" id="womannum">0</em>人</p>
                                    <p class="cor-666 font-size-r15">女性数量</p>
                                </div>
                            </div>
                        </div>
                        <!-- 占比 -->
                        <div class="clearfix mtr50">
                            <div class="djyl-echarts01 img100 fl" id="sexpan">
                                <!-- #ec0501 #ff7e00
                                    <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/echarts01.png" alt="">-->
                            </div>
                            <div class="mlr30 fl mtr20">
                                <p class="font-oswald font-bold font-size-r16" id="sexp"><em class="font-size-r46 mrr5"
                                                                                             id="sexper">50</em>%</p>
                                <p class="font-size-r15 cor-333" id="sextag">男女占比相同</p>
                            </div>
                        </div>
                    </div>
                    <div class="fr prr60 djyl-echarts02 img100 ptr20 bs" style="margin-left:-50px;widht:240px;"
                         id="agepan">
                        <!-- 柱颜色 #ed2315 #feac00 #ffd499 #fbf20c #e5c5c3 -->
                        <!-- 字体颜色 #333333
                            <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/echarts02.png" alt="">-->
                    </div>
                </div>
            </div>
            <!-- 图文统计情况 -->
            <div id="twtjqk" class="djyl-div-box w100 djyl-h285 mbr15">
                <!-- 公共标题 -->
                <div class="djyl-div-title font-size-0">
                    <em class="font-size-r16 color-red01 font-bold plr15">图文统计情况</em>
                </div>
                <!-- 内容 -->
                <ul class="mtr35 plr5 prr5">
                    <li class="line-height-r24 font-size-0 clearfix mbr30">
                        <span class="djyl-span-w120 text-line-c1 font-size-r15 cor-333 text-align-r mrr5 fl">先锋模范</span>
                        <em class="djyl-em-w50 text-align-r text-line-c1 font-oswald color-red01 font-bold font-size-r22 mrr10 fl"
                            id="unitnum">0</em>
                        <p class="djyl-p-w200 djyl-p-jd fl">
                            <span class="jindu" data-per="80" id="unitper"></span>
                        </p>
                    </li>
                    <li class="line-height-r24 font-size-0 clearfix mbr30">
                        <span class="djyl-span-w120 text-line-c1 font-size-r15 cor-333 text-align-r mrr5 fl">党务公开</span>
                        <em class="djyl-em-w50 text-align-r text-line-c1 font-oswald color-red01 font-bold font-size-r22 mrr10 fl"
                            id="dwnum">0</em>
                        <p class="djyl-p-w200 djyl-p-jd fl">
                            <span class="jindu" data-per="100" id="dwper"></span>
                        </p>
                    </li>
                    <li class="line-height-r24 font-size-0 clearfix mbr30">
                        <span class="djyl-span-w120 text-line-c1 font-size-r15 cor-333 text-align-r mrr5 fl">组织生活会</span>
                        <em class="djyl-em-w50 text-align-r text-line-c1 font-oswald color-red01 font-bold font-size-r22 mrr10 fl"
                            id="meetnum">0</em>
                        <p class="djyl-p-w200 djyl-p-jd fl">
                            <span class="jindu" data-per="10" id="meetper"></span>
                        </p>
                    </li>
                    <li class="line-height-r24 font-size-0 clearfix">
                        <span class="djyl-span-w120 text-line-c1 font-size-r15 cor-333 text-align-r mrr5 fl">党建新闻</span>
                        <em class="djyl-em-w50 text-align-r text-line-c1 font-oswald color-red01 font-bold font-size-r22 mrr10 fl"
                            id="newnum">0</em>
                        <p class="djyl-p-w200 djyl-p-jd fl">
                            <span class="jindu" data-per="30" id="newper"></span>
                        </p>
                    </li>
                </ul>
            </div>
            <!-- 基本情况 -->
            <div id="jbqk" class="djyl-div-box w100 djyl-h285">
                <!-- 公共标题 -->
                <div class="djyl-div-title font-size-0">
                    <em class="font-size-r16 color-red01 font-bold plr15">基本情况</em>
                </div>
                <!-- 内容 -->
                <div class="clearfix plr35 prr35 bs">
                    <div class="djyl-div-jbxx-box mtr50 fl">
                        <div class="fl djyl-icon02 img100 mtr5">
                            <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon03.png"
                                 alt="">
                        </div>
                        <div class="fl mlr20">
                            <p class="color-red01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-oswald"
                                                                               id="populationCount">0</em>人</p>
                            <p class="cor-666 font-size-r15">总人口数量</p>
                        </div>
                    </div>
                    <div class="djyl-div-jbxx-box mtr50 fl">
                        <div class="fl djyl-icon02 img100 mtr5">
                            <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon05.png"
                                 alt="">
                        </div>
                        <div class="fl mlr20">
                            <p class="color-huang01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-oswald"
                                                                                 id="managernum">0</em>个
                            </p>
                            <p class="cor-666 font-size-r15">党支部管理人员数量</p>
                        </div>
                    </div>
                    <div class="djyl-div-jbxx-box mtr50 fl">
                        <div class="fl djyl-icon02 img100 mtr5">
                            <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon07.png"
                                 alt="">
                        </div>
                        <div class="fl mlr20">
                            <p class="color-red01 font-bold font-size-r18"><em
                                        class="font-size-r28 mrr5 font-oswald" id="dxznum">0</em>个</p>
                            <p class="cor-666 font-size-r15">党小组数量</p>
                        </div>
                    </div>
                    <div class="djyl-div-jbxx-box mtr50 fl">
                        <div class="fl djyl-icon02 img100 mtr5">
                            <img src="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/icon08.png"
                                 alt="">
                        </div>
                        <div class="fl mlr20">
                            <p class="color-huang01 font-bold font-size-r18"><em class="font-size-r28 mrr5 font-oswald"
                                                                                 id="dynum">0</em>人</p>
                            <p class="cor-666 font-size-r15">党员</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右 -->
        <div class="fr djyl-w932 h-o" style="width: calc(50% - 0.075rem);">
            <!-- 领导班子 -->
            <div id="ldbz" class="djyl-div-box w100 djyl-h346 mbr15">
                <!-- 公共标题 -->
                <div class="djyl-div-title font-size-0">
                    <em class="font-size-r16 color-red01 font-bold plr15">领导班子</em>
                </div>
                <!-- 内容 -->
                <ul class="clearfix djyl-li-tox mtr30 plr50 prr50">
                    <!-- 照片 -->
                    <div class="swiper-container swiper01 w100 h100">
                        <div class="swiper-wrapper" id="manpan">
                        </div>
                        <div class="swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
                    </div>
                </ul>
            </div>
            <!-- 党建动态 -->
            <div id="djdt" class="djyl-div-box w100 djyl-h586">
                <!-- 公共标题 -->
                <div class="clearfix">
                    <div class="djyl-div-title font-size-0 fl">
                        <em class="font-size-r16 color-red01 font-bold plr15">党建新闻</em>
                    </div>
                    <a class="fr prr15 djyl-zwgk-title-a mtr10 posi-rela mrr35" style="cursor: pointer"
                       onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=djxw&title=党建新闻&regionCode=${regionCode!''}');">更多</a>
                </div>
                <!-- 内容 -->
                <div class="mtr30 plr35 prr35 djyl-div-box-nr">
                    <!-- 动态新闻 -->
                    <div class="djyl-div-box-new">
                        <div class="swiper-container swiper02 w100 h100">
                            <div class="swiper-wrapper h-x" id="noticePan">
                            </div>
                        </div>
                        <!-- 更多功能 -->
                        <p class="mtr30 font-bold clearfix">
                            <em class="font-size-r15 cor-333 fl">更多功能</em>
                            <span class="fr djyl-span-bot-bor-w"></span>
                        </p>
                        <ul class="mtr30 djyl-ul-gdgn clearfix">
                            <li class="fl">
                                <a href="Javascript:;"
                                   onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000007&module=ztdr&title=主题党日&regionCode=${regionCode!''}');"
                                   class="font-size-r18 color-red01 font-bold">主题党日></a>
                            </li>
                            <li class="fl">
                                <a href="Javascript:;" onclick="openpage('${djDomain!''}/dj/bizMeeting/index.jhtml');"
                                   class="font-size-r18 color-red01 font-bold">组织生活会></a>
                            </li>
                            <li class="fl" id="getpan">
                                <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">在线学习></a>
                                <ul class="djyl-dj-ul plr20 prr20" hidden id="getpan0">
                                    <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c"
                                        onclick="openpage('${djDomain!''}/dj/trainCourse/indexNew.jhtml');">
                                        课程管理
                                    </li>
                                    <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c"
                                        onclick="openpage('${djDomain!''}/dj/courseware/indexNew.jhtml?system_privilege_code=kjgl');">
                                        课件管理
                                    </li>
                                </ul>
                            </li>
                            <li class="fl" id="getpan1">
                                <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">在线考试></a>
                                <ul class="djyl-dj-ul plr20 prr20" hidden id="getpan10">
                                    <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c"
                                        onclick="openpage('${djDomain!''}/dj/trainPaper/index.jhtml');">
                                        试卷库管理
                                    </li>
                                    <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c"
                                        onclick="openpage('${djDomain!''}/dj/questionDepot/index.jhtml');">
                                        试题库管理
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
    <script src="${uiDomain!''}/web-assets/common/js/echarts4.2.0.min.js"></script>
    <script type="text/javascript" src="${uiDomain!''}/js/layer/layer.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
    <script>

        window.oncontextmenu = function (e) {
            //取消默认的浏览器自带右键 请勿删
            e.preventDefault();
        };

        $(function () {
            // 党员情况
            bindRightMouse('dyqk');
            // 图文统计情况
            bindRightMouse('twtjqk');
            // 基本情况
            bindRightMouse('jbqk');
            // 领导班子
            bindRightMouse('ldbz');
            // 党建动态
            bindRightMouse('djdt');
        });


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
                            // 党员情况
                            case 'dyqk':
                                type = 1;
                                break;
                            // 图文统计情况
                            case 'twtjqk':
                                type = 2;
                                break;
                            // 基本情况
                            case 'jbqk':
                                type = 3;
                                break;
                            // 领导班子
                            case 'ldbz':
                                type = 4;
                                break;
                            // 党建动态
                            case 'djdt':
                                type = 5;
                                break;
                            default:
                                type = 1;
                        }
                        window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);

                    },
                    'item_2': function (t) {
                        location.reload();
                    }
                }
            });
        }

        // 滚动条
        $('.h-x').niceScroll({
            cursorcolor: "#dfa29d",
            cursoropacitymax: 1,
            cursorwidth: ".03rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: true,
        });

        findNoticeList();

        function findNoticeList() {
            var map = {
                orgCode: "${regionCode!''}",
                page: 1,
                rows: 7,
                isSend: 2
            };
            var url = '${djDomain!''}/dj/news/listDataForJsonp.json?jsonpcallback=""';
            $.ajax({
                type: 'POST',
                url: url,
                data: map,
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    var str = '';
                    var list = data.rows;
                    var dateStr = '';
                    for (i = 0; i < list.length; i++) {
                        //      str += '<div class="swiper-slide" onclick="showNotice(' + list[i].id + ')">'
                        dateStr = list[i].createDate;
                        str += '<div class="swiper-slide" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=djxw&title=党建新闻&regionCode=${regionCode!''}&infoOpenId=' + list[i].id + '\')">'
                            + '<div class="font-size-0 h100 clearfix line-height-r46">'
                            + '<span class="fl font-size-r15 cor-333 text-line-c1 sw-span" title="' + list[i].title + '">'
                            + list[i].title + '</span>'
                            + '<em class="fr font-size-r15 cor-999">' + dateStr.substring(0, 19) + '</em>'
                            + '</div>'
                            + '</div>';
                    }
                    $('#noticePan').html(str);

                    var isLoop = false;
                    //if(list.length>7){  要刷新就都不轮播了
                    //	isLoop=true;
                    //}
                    // 党建动态
                    var mySwiper02 = new Swiper('.swiper02', {
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: true,
                            disableOnInteraction: false,
                        },//可选选项，自动滑动
                        direction: 'vertical',
                        loop: isLoop,
                        slidesPerView: 7,
                        // direction: 'vertical',
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true //修改swiper的父元素时，自动初始化swiper
                    })
                    //鼠标放上暂停轮播
                    $('.djyl-div-box-new').hover(function () {
                        mySwiper02.autoplay.stop();
                    }, function () {
                        mySwiper02.autoplay.start();
                    });

                },
                error: function (data) {
                    console.log("获取三务数据连接超时！");
                },
                complete: function () {
                }
            });
        }

        function showNotice(id) {
            var url = '${djDomain!''}/dj/news/detail.jhtml?id=' + id;
            var pages = layer.open({
                type: 2, //page层
                //id:"mask-eventID",
                area: ['900px', '620px'],
                title: '信息详情',
                closeBtn: 1,
                maxmin: false,
                shade: 0.6, //遮罩透明度
                shift: 2, //0-6的动画形式，-1不开启
                content: url,
                cancel: function () {
                }
            });
        }

        getPopulationData();

        function getPopulationData() {
            $.ajax({
                type: 'POST',
                url: '${rsDomain}/cirs/findRsCountForJsonp.jhtml?jsonpcallback=""&regionCode=${regionCode!''}&orgCode=${regionCode!''}',
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    if (data != null) {
                        $("#populationCount").html(data.populationCount);
                        //          $("#registerCount").html(data.registerCount);
                    }
                    if ("${regionCode!''}" == '660201004001') {
                        $("#populationCount").html(3100);
                        //          $("#registerCount").html(1367);
                    }
                },
                error: function (data) {
                    console.log("获人口数据连接超时！");
                }
            });
        }


        getDwnum();
        var dwnum;

        function getDwnum() {
            var url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';
            var map = {
                orgCode: "${regionCode!''}",
                page: 1,
                rows: 1
            };
            map.catalogId = '10000007';
            map.isEndPubDate = 'no';
            map.isPic = 'yes';
            map.isPubOrg = 'no';
            map.isTop = 'yes';
            $.ajax({
                type: 'POST',
                url: url,
                data: map,
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    dwnum = data.total;
                    getPmData();//先获得dwnum再执行
                },
                error: function (data) {
                    console.log("获取三务数据连接超时！");
                },
                complete: function () {
                }
            });
        }

        function getPmData() {
            $.ajax({
                type: 'POST',
                url: '${djDomain!''}/dj/partymember/pmInfo/getPmForJsonp.jhtml?jsonpcallback=""&regionCode=${regionCode!''}&orgCode=${orgCode!''}',
                dataType: 'jsonp',
                jsonp: "jsoncallback",
                success: function (data) {
                    var sexlist = data.sexlist;
                    var agelist = data.agelist;
                    var manlist = data.manlist;
                    $("#dxznum").html(data.dxznum);

                    var djlist = data.djlist;
                    var dynum = djlist.dynum;
                    var unitnum = djlist.unitnum;
                    var meetnum = djlist.meetnum;
                    var newnum = djlist.newnum;
                    var max = 0;
                    for (var key in djlist) {
                        //if(max<djlist[key] && key!='dynum'){
                        //	max=djlist[key];
                        //}
                        if (key != 'dynum') {
                            max += djlist[key];
                        }
                    }
                    max += dwnum;
                    //if(max<dwnum){
                    //	max=dwnum;
                    //}
                    var unitper = unitnum * 100 / max;
                    var meetper = meetnum * 100 / max;
                    var newper = newnum * 100 / max;
                    var dwper = dwnum * 100 / max;
                    $('#dynum').html(dynum);

                    $('#dwnum').html(dwnum);
                    $('#unitnum').html(unitnum);
                    $('#meetnum').html(meetnum);
                    $('#newnum').html(newnum);
                    $('#dwper').attr('data-per', dwper);
                    $('#unitper').attr('data-per', unitper);
                    $('#meetper').attr('data-per', meetper);
                    $('#newper').attr('data-per', newper);

                    $('.jindu').each(function (index, el) {
                        $(el).css('width', '0')
                        setTimeout(function () {
                            $(el).animate({
                                width: $(el).data('per') + '%',
                            }, 1500)
                        }, 1500)
                    })

                    var male = sexlist.male;
                    var female = sexlist.female;
                    var sexcolor = 'color-red01';
                    var sexper = 0;
                    var sextag = '';
                    if (male > female) {
                        sextag = '男性占比（最多占比）';
                        sexper = (male * 100 / (male + female)).toFixed(2);
                    } else if (male == female) {
                        sextag = '男女占比相同';
                        sexper = 50;
                    } else {
                        sextag = '女性占比（最多占比）';
                        sexper = (female * 100 / (male + female)).toFixed(2);
                        sexcolor = 'color-huang01';
                    }
                    $("#sexp").addClass(sexcolor);
                    $("#sexper").html(sexper);
                    $("#sextag").html(sextag);
                    $("#mannum").html(male);
                    $("#womannum").html(female);
                    var arrList = [];
                    var sexmap = {value: male, name: '男'};
                    arrList.push(sexmap);
                    sexmap = {value: female, name: '女'};
                    arrList.push(sexmap);
                    setOpection(arrList, 'sexpan');

                    var agedata = [agelist.AGE_LESS_30, agelist.AGE_30_49, agelist.AGE_50_69, agelist.AGE_70_89, agelist.AGE_MORE_90];
                    setOpection1(agedata, 'agepan');

                    var str = '';
                    $("#managernum").html(manlist.length);
                    for (i = 0; i < manlist.length; i++) {
                        var filePath = '${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/images/djyl/img05.png';
                        if (manlist[i].photo != '') {
                            filePath = "${FILE_URL}/" + manlist[i].photo;
                        }
                        str += '<div class="swiper-slide">'
                            + '<li class="h100">'
                            + '<div class="djyl-li-tox-img img100">'
                            + '<img src="' + filePath + '" alt="">'
                            + '</div>'
                            + '<p class="text-align-c color-red01 font-size-r24 font-bold mtr10">' + manlist[i].pmName + '</p>'
                            + '<p class="text-align-c cor-333 font-size-r15 mtr5">' + manlist[i].pmTypeName + '</p>'
                            + '</li>'
                            + '</div>';
                    }
                    $('#manpan').html(str);
                    var loop = false;
                    if (manlist.length > 5) {
                        loop = true;
                    }
                    // 领导班子
                    var mySwiper = new Swiper('.swiper01', {
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: true,
                            disableOnInteraction: false,
                        },//可选选项，自动滑动
                        spaceBetween: 20,
                        loop: loop,
                        slidesPerView: 5,
                        pagination: {
                            el: '.swiper-pagination',
                            clickable: true,
                        },
                        // direction: 'vertical',
                        observer: true, //修改swiper自己或子元素时，自动初始化swiper
                        observeParents: true //修改swiper的父元素时，自动初始化swiper
                    })
                    //鼠标放上暂停轮播
                    $('.djyl-li-tox').hover(function () {
                        mySwiper.autoplay.stop();
                    }, function () {
                        mySwiper.autoplay.start();
                    });

                },
                error: function (data) {
                    console.log("获取党建数据连接超时！");
                },
                complete: function () {
                }
            });
        }

        function setOpection1(valList, id) {
            var myChart = echarts.init(document.getElementById(id));
            option = {
                grid: {
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 20,
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    data: ['29岁\n以下', '30-\n49岁', '50-\n69岁', '70-\n89岁', '90岁\n以上'],
                    axisLine: {       //轴
                        show: false
                    },
                    axisTick: {       //轴刻度线
                        show: false
                    },
                },
                yAxis: {
                    show: false,
                    type: 'value'
                },
                series: [
                    {
                        name: '数量',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: function (params) {
                                    var colorList = [
                                        '#C1232B', '#B5C334', '#FCCE10', '#E87C25', '#27727B'
                                    ];
                                    return colorList[params.dataIndex]
                                },
                                label: {
                                    show: true,
                                    position: 'top',
                                    formatter: '{c}'
                                }
                            }
                        },
                        barWidth: 13,
                        data: valList,
                        type: 'bar'
                    }
                ]
            };
            //console.log(option);
            myChart.setOption(option);
            myChart.resize();
        }

        function setOpection(arrList, id) {
            var myChart = echarts.init(document.getElementById(id));
            option = {
                color: ['#d62a1e', '#ffac00'],
                tooltip: {
                    show: false,
                    trigger: 'item',
                    formatter: '{a} <br/>{b}: {c} ({d}%)'
                },
                legend: false,
                series: [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius: ['50%', '90%'],
                        center: ['45%', '50%'],
                        avoidLabelOverlap: false,
                        hoverAnimation: false,//不放大
                        label: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: false,
                        labelLine: {
                            show: false
                        },
                        data: arrList
                    }
                ]
            };
            //console.log(option);
            myChart.setOption(option);
            myChart.resize();
        }

        $("#getpan").mouseover(function () {
            $("#getpan0").show();
        })
        $("#getpan").mouseout(function () {
            $("#getpan0").hide();
        })
        $("#getpan1").mouseover(function () {
            $("#getpan10").show();
        })
        $("#getpan1").mouseout(function () {
            $("#getpan10").hide();
        })

        function openpage(url) {
            window.open(url);
        }

        function refresh() {
            location.reload();
        }

        setInterval(findNoticeList, 15000);
    </script>
</body>
</html>