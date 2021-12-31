<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>美丽乡村</title>
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-comm.css"/>
    <link rel="stylesheet" type="text/css"
          href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-1.css"/>
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
<div class="contextMenu" id="myMenu2" style="display:none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>
<!-- 更多功能 start -->
<#--<div class="szsh-more posi-abso">-->
<#--    <div class="szsh-m-box hide">-->
<#--        <div class="w100 h100  flex flex-ac flex-jc">-->
<#--            <p class="szsh-mb-text">更多<br>功能</p>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="szsh-mb-content posi-abso bs">-->
<#--        <div class="szsh-mbc-title">-->
<#--            <p>更多功能</p>-->
<#--        </div>-->
<#--        <div class="szsh-mbc-content flex flex-clm">-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-crcm.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">村容村貌</p>-->
<#--            </div>-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc active">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-xcly.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">乡村旅游</p>-->
<#--            </div>-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-ycyp.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">一村一品</p>-->
<#--            </div>-->
<#--        </div>-->
<#--        <a href="javascript:void(0);" class="flex flex-ac szsh-more-closed flex-jc">-->
<#--            <p>收起</p>-->
<#--            <i></i>-->
<#--        </a>-->
<#--    </div>-->
<#--</div>-->
<!-- 更多功能 end -->
<div class="h100 szsh-bj plr20 ptr20 pbr20 bs">
    <div class="h100 prr20 h-x posi-rela">
        <!-- 上 -->
        <div class="mlxc-h564 clearfix">
            <!-- 左 -->
            <div class="main-div-box mlxc-top-l h100 fl plr30 prr30 bs">
                <!-- 大标题 -->
                <div class="comm-div-title-big flex flex-ac">
                    <#--                    <a href="javascript:void(0);" class="fl comm-back-ext1 flex flex-ac">-->
                    <#--                        <i></i>-->
                    <#--                        <p class="font-size-r18 cor-d62a1e fl text-lh1" onclick="window.history.back();">返回</p>-->
                    <#--                    </a>-->
                    <#--                    <i class="comm-line-ext1"></i>-->
                    <div class="comm-subject-title-ext1 plr5 bs">
                        <p class="font-size-r20 line-height-r48 text-align-c plr10 prr10 bs cor-fff font-bold">美丽乡村</p>
                    </div>
                </div>
                <!-- 内容 -->
                <div class="plr10 prr10 mtr30 mlxc-img-box" id="rcqcm">
                    <div class="swiper-container mlxc-swiper01 w100 h100">
                        <div class="swiper-wrapper" id="swiperData">

                        </div>
                        <div class="swiper-pagination"></div><!--分页器。如果放置在swiper外面，需要自定义样式。-->
                    </div>
                </div>
            </div>
            <!-- 右 -->
            <div class="main-div-box mlxc-top-r h100 fr" id="rxxb">
                <!-- 标题 -->
                <div class="comm-div-title font-size-0">
                    <em class="font-size-r16 cor-d62a1e font-bold plr15">乡贤榜</em>
                </div>
                <!-- 内容 -->
                <div class="mlxc-top-r-box mlxc-top-r-box-60 ">
                    <div class="swiper-container mlxc-swiper2 w100 h100">
                        <div class="swiper-wrapper" id="xxb">

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
            <!-- 下 -->
            <div class="mlxc-h352 mtr10">
                <!-- 左 -->
                <div class="main-div-box mlxc-bottom-l h100 fl" id="rxcly">
                    <!-- 小标题 -->
                    <div class="clearfix">
                        <div class="comm-div-title font-size-0 fl">
                            <em class="font-size-r16 cor-d62a1e font-bold plr15">乡村旅游</em>
                        </div>
                    </div>
                    <div class="mtr30 plr40 prr40 mlxc-bl-conntent bs">
                        <div class="mlxc-blc-box w100 h100 bs">
                            <div class="swiper-container mlxc-swiper2 w100 h100">
                                <div class="swiper-wrapper" id="xcly">

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 右 -->
                <div class="main-div-box mlxc-bottom-r h100 fr" id="rycyp">
                    <!-- 小标题 -->
                    <div class="clearfix">
                        <div class="comm-div-title font-size-0 fl">
                            <em class="font-size-r16 cor-d62a1e font-bold plr15">一村一品</em>
                        </div>
                        <span class="font-size-r14 cor-d62a1e font-bold prr15 mtr10 fr cursor"
                              onclick="ycypMore('一村一品')"><em>更多</em><i class="comm-jt mlr5"></i></span>
                    </div>
                    <div class="mtr30 plr40 prr10 clearfix" id="ycyp">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>

<script>
    $(function () {
        //村情村貌
        findNoticeList("10000116")
        //乡贤榜
        findNoticeList("10000022")
        //乡村旅游
        // findNoticeList("10000015")
        showAttractions()
        //一村一品
        getVillageProj()

        bindRightMouse('rcqcm')
        bindRightMouse('rxxb')
        bindRightMouse('rxcly')
        bindRightMouse('rycyp')
    })

    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true,
    })
    // 动画结束 后执行
    document.querySelector('body').addEventListener("animationend", function () {
        $('.h-x').scroll().size()
    })


    function findNoticeList(catalogId) {
        var map = {
            orgCode: "${regionCode!''}",
            page: 1,
            rows: 20,
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
                var str = '';
                var list = data.rows;
                if (list) {
                    //左上角轮播图 村情村貌
                    if (catalogId == '10000116') {
                        for (let i = 0; i < list.length; i++) {
                            // 点击数据，查看详情。
                            var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'
                            if (list[i].fileName) {
                                photo = "${$IMG_DOMAIN}" + list[i].fileName
                            }
                            str += "<div class=\"swiper-slide\" style=\"cursor: pointer\" onclick='showMore(" + catalogId + ",\"村情村貌\"," + list[i].infoOpenId + ")'>\n" +
                                "                                <div class=\"img100 h100 posi-rela\">\n" +
                                    "<span class='mlxc-swiper-shadow'></span>"+
                                "                                    <div class=\"mlxc-swiper-nr\">\n" +
                                "                                        <p class=\"font-size-r24 mbr35 text-line-c1 font-bold cor-fff\">" + list[i].title + "</p>\n" +
                                "                                        <p class=\"font-size-r18 cor-fff mlxc-swiper-nr-p\">" + list[i].subject + "</p>\n" +
                                "                                    </div>\n" +
                                "                                    <img src=\"" + photo + " \"  alt=\"\">\n" +
                                "                                </div>\n" +
                                "                            </div>"

                        }
                        $('#swiperData').html(str)

                        // 循环轮播。
                        if (list && list.length > 1) {
                            // 放在外面轮播会失效。
                            var swiper = new Swiper(".mlxc-swiper01", {
                                autoplay: {
                                    delay: 3000,
                                    stopOnLastSlide: false,
                                    disableOnInteraction: false,
                                },
                                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                                pagination: {
                                    el: '.mlxc-swiper01 .swiper-pagination',
                                },
                                spaceBetween: 5,
                                loop: true,//是否可循环
                                observer: true,
                                observeParents: true,
                                observeSlideChildren: true
                            });
                            // 循环。
                        }
                    }

                    //右侧乡贤榜
                    if (catalogId == '10000022') {
                        let html = '';
                        for (let i = 0; i < list.length; i++) {
                            if ((i + 1) % 3 === 1) {
                                html += '<div class="swiper-slide">' +
                                    '<ul class="plr30 mtr25 prr30">';
                            }
                            let photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png';
                            if (list[i].fileName) {
                                photo = "${$IMG_DOMAIN}" + list[i].fileName
                            }
                            html += '<li class="clearfix mbr20"  style="cursor: pointer" onclick="showMore(' + catalogId + ', \'乡贤榜\', ' + list[i].infoOpenId + ')">' +
                                '<div class="img100 mlxc-top-r-box-tox fl">' +
                                '<img src="' + photo + '" alt="">' +
                                '</div>' +
                                '<div class="mlxc-top-r-box-nr fr">' +
                                '<p class="font-size-r20 cor-333 font-bold">' + list[i].title || '' + '</p>' +
                                '<p class="font-size-r18 line-height-r28 mtr10 text-line-c3">' + list[i].subject + '</p>' +
                                '</div>' +
                                '</li>';
                            if ((i + 1) % 3 === 0) {
                                html += '</ul>' +
                                    '</div>';
                            }
                        }
                        $('#xxb').html(html);

                    }

                    //左下乡村旅游

                }
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function showAttractions() {
        var url = '${rc.getContextPath()}/dcl/beautifulVillage/showAttractions.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                orgCode: ${regionCode!''},
                issuStatus: 1,
                page: 1,
                rows: 20

            },
            success: function (data) {
                var str = '';
                var list = data.rows;
                if (list && list.length > 0) {
                    for (let i = 0; i < list.length; i++) {
                        var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'
                        if (list[i].picUrl) {
                            photo = "${$IMG_DOMAIN}" + list[i].picUrl
                        }
                        var desc = ''
                        if (list[i].attractionsDesc) {
                            desc = list[i].attractionsDesc.replace(/<[^>]+>/g, '')
                        }
                        str += "<div class=\"swiper-slide\" style=\"cursor: pointer\"  onclick='xclyMore(\"乡村旅游\",\"" + list[i].uuid + "\")'>\n" +
                            "                                    <div class=\"mlxc-blc-item clearfix bs w100 h100 plr30 prr20 ptr25\">\n" +
                            "                                        <div class=\"mlxc-blci-pic fl img100\">\n" +
                            "                                            <img src=\"" + photo + "\" >\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"mlxc-blci-text prr10 fr\">\n" +
                            "                                            <p class=\"mlxc-blcit-text1\">\n" +
                            "                                                " + desc + "</p>\n" +
                            // "                                                "+list[i].attractionsName+"</p>\n" +
                            "                                        </div>\n" +
                            "                                    </div>\n" +
                            "                                </div>"

                    }
                    $('#xcly').html(str)
                    var mlxcSwiper2 = new Swiper('.mlxc-swiper2', {
                        pagination: {
                            el: '.mlxc-swiper2 .swiper-pagination',
                        },
                        autoplay: {
                            delay: 3000,
                            stopOnLastSlide: false,
                            disableOnInteraction: false,
                        },
                        direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                        spaceBetween: 5,
                        loop: true,//是否可循环
                        observer: true,
                        observeParents: true,
                        observeSlideChildren: true
                    })
                }
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    function showMore(catalogId, title, infoOpenId) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=' +
            catalogId + '&module=ztdr&title=' + encodeURI(title) + '&infoOpenId=' + infoOpenId + '&regionCode=${regionCode!}'
        );
    }

    function ycypMore(title, id) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3' + '&infoOpenId=' + id + '&module=village_product&title=' + encodeURI(title) + 'regionCode=${regionCode!}'
        );
    }

    function xclyMore(title, id) {
        window.open(
            '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=4' + '&infoOpenId=' + id + '&module=xcly&title=' + encodeURI(title) + 'regionCode=${regionCode!}'
        );
    }

    //一村一品
    function getVillageProj() {
        <#--var url = '${$WECHAT_DOMAIN!''}/web/villageProduct/listDataForJsonp.json?jsoncallback=jsoncallback';-->
        var url = '${rc.getContextPath()}/dcl/beautifulVillage/getVillageProj.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                regionCode: ${regionCode!''},
                // regionCode: '430725113218',
                shelf: '1',
                page: 1,
                limit: 3
            },
            success: function (data) {
                var str = '';
                var list = data.data;
                if (list && list.length > 0) {
                    for (let i = 0; i < list.length; i++) {
                        var photo = '${uiDomain}web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'
                        if (list[i].picUrl) {
                            photo = "${$IMG_DOMAIN}" + list[i].picUrl
                        }
                        var desc = ''
                        if (list[i].goodsDesc) {
                            desc = list[i].goodsDesc.replace(/<[^>]+>/g, '')
                        }
                        str += "<div class=\"mlxc-br-item fl\" style=\"cursor: pointer\"  onclick='ycypMore(\"一村一品\",\"" + list[i].uuid + "\")'>\n" +
                            "                        <div class=\"mlxc-bri-pic img100\">\n" +
                            "                            <img src=\"" + photo + "\" \">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"mlxc-bri-bottom bs\">\n" +
                            "                            <p class=\"cor-333 text-lh1 mlxc-brib-text1\">" + list[i].goodsName + "</p>\n" +
                            "                            <p class=\"font-size-r17 cor-333 line-height-r25 text-line-c2 mlxc-brib-text2\">\n" +
                            "                               " + desc + "</p>\n" +
                            "                        </div>\n" +
                            "                    </div>"
                    }
                    $("#ycyp").html(str)
                }
            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        });
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
                        // 村情村貌
                        case 'rcqcm':
                            type = 31;
                            break;
                        // 乡贤榜
                        case 'rxxb':
                            type = 32;
                            break;
                        // 乡村旅游
                        case 'rxcly':
                            type = 33;
                            break;
                        // 一村一品
                        case 'rycyp':
                            type = 34;
                            break;
                        default:
                            type = 31;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);

                },
                'item_2': function (t) {
                    location.reload();
                }
            }
        });
    }
</script>
<#include "/dcl/szsh/more_function.ftl" />
</body>
</html>
