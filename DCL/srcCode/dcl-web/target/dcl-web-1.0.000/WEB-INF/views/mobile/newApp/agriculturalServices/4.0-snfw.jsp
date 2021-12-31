<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;

%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>三农服务</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css"/>
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>

    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/list.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css"/>

    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index2.css"/>
</head>
<body id="bodyDocm" class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row bg-fff">
        <div class="layui-col-xs12 pt20 index-top">
            <div class="pl15 pr15 bs">
                <!-- 轮播 -->
                <ul class="index-lunbo-box posi-rela">
                    <div class="swiper-container swiper01 w100">
                        <div id="tbbj" class="swiper-wrapper">
                            <%--                                <div class="swiper-slide">--%>
                            <%--                                    <li class="bs w100 img100">--%>
                            <%--                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index2/gzh-snfw-pic2.png" alt="">--%>
                            <%--                                    </li>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="swiper-slide">--%>
                            <%--                                    <li class="bs w100 img100">--%>
                            <%--                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj02.jpg" alt="">--%>
                            <%--                                    </li>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="swiper-slide">--%>
                            <%--                                    <li class="bs w100 img100">--%>
                            <%--                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj03.jpg" alt="">--%>
                            <%--                                    </li>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="swiper-slide">--%>
                            <%--                                    <li class="bs w100 img100">--%>
                            <%--                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj04.jpg" alt="">--%>
                            <%--                                    </li>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="swiper-slide">--%>
                            <%--                                    <li class="bs w100 img100">--%>
                            <%--                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/index/bj05.jpg" alt="">--%>
                            <%--                                    </li>--%>
                            <%--                                </div>--%>
                        </div>
                    </div>
                    <div class="fyq-lunbo swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
                </ul>
            </div>
        </div>
        <!-- 内容 -->
        <div id="headButton" class="layui-col-xs12 pt15 pl15 pr15 pb15">
            <!-- 按钮 -->
            <%--            <div class=" layui-col-xs12  flex flex-ac flex-jr">--%>
            <%--                <a onclick="jumpPage('bs')" href="Javascript:;">--%>
            <%--                    <div class="index-ann-box-icon img100">--%>
            <%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/snfw-bszn.png"--%>
            <%--                             alt="">--%>
            <%--                    </div>--%>
            <%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">办事指南</p>--%>
            <%--                </a>--%>
            <%--                &lt;%&ndash;                    <a onclick="jumpPage('bm')" href="Javascript:;">&ndash;%&gt;--%>
            <%--                &lt;%&ndash;                        <div class="index-ann-box-icon img100">&ndash;%&gt;--%>
            <%--                &lt;%&ndash;                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/snfw-bmcx.png" alt="">&ndash;%&gt;--%>
            <%--                &lt;%&ndash;                        </div>&ndash;%&gt;--%>
            <%--                &lt;%&ndash;                        <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">便民查询</p>&ndash;%&gt;--%>
            <%--                &lt;%&ndash;                    </a>&ndash;%&gt;--%>
            <%--                <a onclick="jumpPage('bk')" href="Javascript:;">--%>
            <%--                    <div class="index-ann-box-icon img100">--%>
            <%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/snfw-nybk.png"--%>
            <%--                             alt="">--%>
            <%--                    </div>--%>
            <%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">农业知识</p>--%>
            <%--                </a>--%>

            <%--                <a onclick="jumpPage('sp')" href="Javascript:;">--%>
            <%--                    <div class="index-ann-box-icon img100">--%>
            <%--                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/application/snfw-nysp.png"--%>
            <%--                             alt="">--%>
            <%--                    </div>--%>
            <%--                    <p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">农业视频</p>--%>
            <%--                </a>--%>
            <%--            </div>--%>
        </div>
    </div>

    <div class="layui-row">
        <div class="layui-col-xs12 pl15 pr15">
            <div class="layui-col-xs12 flex flex-jb flex-ac mt15">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农业视频</p>
                <%--                    <a href="javascript:;"  onclick="jumpPage('sp')" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>--%>
            </div>
            <div class="layui-col-xs12 pt15">
                <div id="jdDiv" class="layui-row ">

                </div>
                <div id="jdzw" class="layui-col-xs12 flex flex-clm flex-jc flex-ac hide">
                    <div class="data-none-ext1 img-p100">
                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                    </div>
                    <p class="font-size-17 cor-999 mt15">暂无数据</p>
                </div>
            </div>

        </div>
        <div class="layui-col-xs12 pl15 pr15 pb10">
            <div class="layui-col-xs12 flex flex-jb flex-ac mt10">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农业知识</p>
                <%--                    <a href="javascript:;"  onclick="jumpPage('bk')" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"></i></a>--%>
            </div>
            <div class="layui-col-xs12">

                <div id="trainings" class="layui-row">


                </div>


                <div id="bkzw" class="layui-col-xs12 flex flex-clm flex-jc flex-ac hide">
                    <div class="data-none-ext1 img-p100">
                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                    </div>
                    <p class="font-size-17 cor-999 mt15">暂无数据</p>
                </div>

            </div>

        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<%--<script type="text/javascript" src="${rc.getContextPath()}/js/weixin/jweixin-1.3.2.js?v=2"></script>--%>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"> </script>
<script>

    $(function () {

        // window.onload = function () {
        //
        //     // var bot = document.getElementById('bot');
        //     // bot.addEventListener('touchstart', function () {
        //     //     alert('touchstart');
        //     // });
        //
        // }

        // wx.config({
        //     debug: false,
        //     appId: '111',
        //     timestamp: '111',
        //     nonceStr: '111',
        //     signature: '111',
        //     jsApiList: []
        // })
        // wx.ready(()=> {
        //     let video = document.querySelectorAll("video")[0];
        //     video.play();
        //     setTimeout(function(){ video.pause() }, 300);
        // });

        loadExperts();
        getTrainings();
        getTbbjData();
    })


    // 轮播图渲染
    function getTbbjData() {
        var platform = isWeChat()

        $.ajax({
            type: 'get',
            <%--url: '<%=path%>/dcl/techBenefitsFarmersApp/getTbbjData.jhtml',--%>
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                regionCode: "${orgCode}",   // 区域编码。
                // regionCode: "660101001001",   // 区域编码。
                useType: "kjhn",   // 科技惠农。
                type: "3",   // 轮播图。
                platform: platform
            },
            success: function (data) {
                // 一个主题。
                if (data != null) {
                    var str = '';
                    var dvModular = data.dvModulars;   // 多个模块，只取第一个。

                    if (dvModular != null) {
                        dvModular = dvModular[0];
                        var imgNum = 0;
                        var modularContents = dvModular.modularContents;   // 多个模块内容。

                        if (modularContents != null) {
                            for (let i = 0; i < modularContents.length; i++) {
                                var attList = modularContents[i].attList;   // 多个附件，只取第一个。

                                if (attList != null) {
                                    for (var j = 0; j < attList.length; j++) {
                                        str += '<div class="swiper-slide">' +
                                            '<li class="bs w100 img100">' +
                                            '<img src="' + '${$IMG_DOMAIN}' + attList[j].filePath + '" onerror="javascript:this.src=\'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png\';">' +
                                            '</li>' +
                                            '</div>';
                                        imgNum++;
                                    }
                                }
                            }
                        } else {
                            str += '<div class="swiper-slide">' +
                                '<li class="bs w100 img100">' +
                                '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                                '</li>' +
                                ' </div>';
                        }
                    } else {

                        str += '<div class="swiper-slide">' +
                            '<li class="bs w100 img100">' +
                            '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                            '</li>' +
                            ' </div>';

                    }
                } else {

                    str += '<div class="swiper-slide">' +
                        '<li class="bs w100 img100">' +
                        '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                        '</li>' +
                        ' </div>';

                }

                $('#tbbj').html(str);
                var mySwiper = new Swiper('.swiper01', {
                    slidesPerView: 1,
                    spaceBetween: 10,
                    centeredSlides: true,
                    grabCursor: true,
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: false,
                        disableOnInteraction: false,
                    },
                    loop: true,//是否可循环
                    observer: true,
                    observeParents: true,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true,
                    },
                })


            },
            error: function (data) {
                console.log("获取头部背景数据连接超时！");
            },
            complete: function () {
            }
        });
    }


    var dictspMap = {"dcl008080": "手机助农", "dcl008079": "渔业", "dcl008078": "林业", "dcl008001": "畜牧业", "dcl008066": "农业"}

    var dictMap = {
        "dcl007002": "植保技术",
        "dcl007003": "农业知识",
        "dcl007004": "化肥知识",
        "dcl007005": "农资农机",
        "dcl007006": "种子知识"
    }

    //农业百科
    function getTrainings() {

        <%--var url = '<%=path%>/public/wap/techBenefitsFarmersApp/loadManageList.json';--%>
        var url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
        var map = {
            orgCode: "${orgCode}",
            page: 1,
            rows: 3
        };
        //  map.catalogId = '10000027';
        map.catalogId = '10000114';
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        map.noTop = 1;
        map.hasOverView = 'yes';

        $.ajax({
            type: 'GET',
            url: url,
            data: map,
            success: function (data) {

                if (data.total > 0) {
                    var rows = data.rows
                    var trainings = ''

                    for (let i = 0; i < rows.length; i++) {

                        //         <img src="${$imgDomain}` + rows[i].fileName + ` onerror="javascript:this.src='${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';"  ">

                        let img = rows[i].fileName;

                        let dictName = dictMap[rows[i].catalogCode] == undefined ? "" : dictMap[rows[i].catalogCode]
                        // 无图片。
                        if (!img) {
                            img = '<img style="height: 100% !important;" src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">';

                            // 信息发布管理 文章封面 有上传。
                        } else if (img.substr(0, 1) === '/') {
                            img = '<img style="height: 100% !important;"  src="${$imgDomain}' + img + '">';
                            // 对接数据。
                        } else {
                            img = '<img  style="height: 100% !important;" src="' + img + '">';
                        }

                        var text = getSimpleText(rows[i].overView);

                        trainings += "<div   onclick='openView(" + rows[i].infoOpenId + ")'  class=\"layui-col-xs12 bg-fff border-radius-4 flex mt15\">\n" +
                            "                            <div class=\"width-120\">\n" +
                            "                                <div class=\"pic-wrap-ext1 notice-s7\">\n" +
                            "                                    <div class=\"pic-wrap-c\">\n" +
                            "                                        <div class=\"pic-wrap-i border-radius-4\">\n" +
                            "                                             <!-- 默认图片 -->\n" +
                            "                                             <div class=\"posi-abso gzh-default-pic flex flex-ac flex-jc\">\n" +
                            img +
                            "                                            </div>\n" +
                            "                                        </div>\n" +
                            "                                    </div>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"flex1 overflow-h mr10\">\n" +
                            "                                <div class=\"flex flex-ac mt10\">\n" +
                            "                                    <p class=\"font-size-14 cor-4d pl15 flex1 text-line-c1 mr5\">" + rows[i].title + "</p>\n" +
                            "                                    <p class=\"font-size-12 cor-ff8b1a\">" + dictName + "</p>\n" +
                            "                                </div>\n" +
                            "                                <p class=\"font-size-12 cor-666 text-line-c2 pl15 pr10 mt10\">" + text + "</p>\n" +
                            "                                <div class=\"flex flex-ac pl15 pr15 mt12\">\n" +
                            // "                                    <p class=\"font-size-12 text-lh1 cor-b3 flex1\"><i class=\"icon-like-ext1 mr5\"></i>542</p>\n" +
                            "                                    <p class=\"font-size-12 cor-999 flex flex-ac pt3 flex1\"><i class=\"icon-see-ext1 mr5\"></i>" + rows[i].rateNo + "</p>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                        </div>"
//                                 trainings +=  ` <div class="layui-col-xs12 bg-fff border-radius-4 flex mt15" onclick="openView(` + rows[i].infoOpenId + `)"  >
//                                     <div class="width-120">
//                                         <div class="pic-wrap-ext1 notice-s7">
//                                             <div class="pic-wrap-c">
//                                                 <div class="pic-wrap-i border-radius-4">
//                                                     <!-- 默认图片 -->
//                                                     <div class="">
//                                                `+img+`
//                                                     </div>
//                                                 </div>
//                                             </div>
//                                         </div>
//                                     </div>
//                                     <div class="flex1 overflow-h mr10">
//                                         <div class="flex flex-ac mt10">
//                                             <p class="font-size-14 cor-4d pl15 flex1 text-line-c1 mr5">` + rows[i].title + `</p>
//                                             <p class="font-size-12 cor-ff8b1a">` +dictName  + `</p>
//                                         </div>
//                                         <p class="font-size-12 cor-666 text-line-c2 pl15 pr10 mt10">` + text + `</p>
//                                         <div class="flex flex-ac pl15 pr15 mt12">
// <!--                                            <p class="font-size-12 text-lh1 cor-b3 flex1"><i class="icon-like-ext1 mr5"></i>542</p>-->
//                                             <p class="font-size-12 cor-999 flex flex-ac pt3 flex1"><i class="icon-see-ext1 mr5"></i>` +rows[i].rateNo||0  + `</p>
//                                         </div>
//                                     </div>
//                                 </div>`;

                    }
                    $("#trainings").html(trainings)
                } else {
                    $('#bkzw').show();
                }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        })
    }

    //html剔除富文本标签，留下纯文本
    function getSimpleText(html) {
        if (typeof (html) == undefined || html == null) {
            return "";
        }

        var re1 = new RegExp("<.+?>", "g");//匹配html标签的正则表达式，"g"是搜索匹配多个符合的内容
        var msg = html.replace(re1, '');//执行替换成空字符
        return msg;
    }

    //农业视频
    function loadExperts() {

        <%--var url = '<%=path%>/public/wap/techBenefitsFarmersApp/loadManageList.json';--%>
        var url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
        var map = {
            orgCode: "${orgCode}",
            page: 1,
            rows: 3
        };
        //  map.catalogId = '10000027';
        map.catalogId = '10000029';
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        map.noTop = 1;
        $.ajax({
            type: 'GET',
            url: url,
            data: map,
            success: function (data) {
                // alert(data.rows)
                if (data.total > 0) {
                    var rows = data.rows
                    var trainings = ''

                    for (let i = 0; i < rows.length; i++) {


                        var comp = '';
                        comp = `<video id="video`+rows[i].infoOpenId+`" style="width: 100%;height: 100%;" webkit-playsinline="true" preload="metadata" controls src="` + rows[i].staticUrl + `#t=1">`;//给视频video属性poster设置值图片路径，即为视频展示的背景图片

                        if (rows[i].staticUrl == null || rows[i].staticUrl == '') {
                            comp = `<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">`
                        }

                        let dictName = dictspMap[rows[i].catalogCode] == undefined ? "" : dictspMap[rows[i].catalogCode]


                        trainings += '<div  class="layui-col-xs12 mt15">\n' +
                            '                            <div class="layui-col-xs12 bg-fff border-radius-4">\n' +
                            '                                <div class="swiper-container swiper-list-ext2">\n';
                        trainings +=
                            '                                            <div class="pic-wrap-ext1 notice-s6">\n' +
                            '                                                <div class="pic-wrap-c">\n' +
                            '                                                    <div class="pic-wrap-i">\n' +
                            comp +
                            '                                                    </div>\n' +
                            '                                                </div>\n';
                        trainings += '                                    </div>\n' +
                            '                                <div onclick="openView(' + rows[i].infoOpenId + ')"  class="font-size-12">\n' +
                            '                                    <p class="font-size-16 cor-4d pb10 pl10 pr10 mt10">' + rows[i].title + '</p>\n' +
                            '<div class="flex flex-ac flex-jb pl10 pr10 mb10">\n' +
                            '                                        <p class="font-size-14 cor-blue3  flex1 text-line-c1 mr5">' + dictName + '</p>\n' +
                            "                                    <p class=\"font-size-14 cor-999 flex flex-ac flex-je pt3 flex1 overflow-h\"><i class=\"icon-see-ext1 mr5\"></i>" + rows[i].rateNo + "</p>\n" +
                            '                                    </div>' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>'

                    }
                    $("#jdDiv").html(trainings)
                    for (let i = 0; i < rows.length; i++) {
                        const IS_IOS = !/(Android)/i.test(navigator.userAgent); //ios终端
                        if (IS_IOS) {
                            wx.config({
                                // 配置信息, 即使不正确也能使用 wx.ready
                                debug: false,
                                appId: '',
                                timestamp: 1,
                                nonceStr: '',
                                signature: '',
                                jsApiList: []
                            });
                            wx.ready(function() {
                                $("#video"+ rows[i].infoOpenId)[0].load();
                            });

                        }
                    }
          //          var bot = document.getElementById('video0');

                    // bot.addEventListener('touchstart', function () {
                    //     let videoplay = wx.createVideoContext('video0', this)
                    //     videoplay.play();
                    // });
                    //
                    // setTimeout(function(){   creatTouchstartEventAndDispatch(bot) }, 1000);
                    //
                    //
                    // function creatTouchstartEventAndDispatch (el) {
                    //     var event = document.createEvent('Events');
                    //     event.initEvent('touchstart', true, true);
                    //     el.dispatchEvent(event);
                    // }

                    // document.addEventListener("WeixinJSBridgeReady",function() {
                    //     alert(1)
                    //     bot.play();
                    // }, false);


                } else {
                    $('#jdzw').show()
                }

                // let videoVal = document.querySelectorAll("video")[0];
                // document.addEventListener("WeixinJSBridgeReady", function () {
                //     videoVal.play()
                //
                // alert(1);
                // }, false);


                //     var bodyDocm = document.getElementById('bodyDocm');
                // //    alert(audio);
                //
                //     document.addEventListener('touchstart', function () {
                //       //  alert(audio);
                //         function audioAutoPlay() {
                //             audio.play();
                //         //
                //         }
                //         audioAutoPlay();
                //     });
                //
                //
                //     creatTouchstartEventAndDispatch(bodyDocm);
                //
                //     function creatTouchstartEventAndDispatch (el) {
                //         var event = document.createEvent('Events');
                //         event.initEvent('touchstart', true, true);
                //         el.dispatchEvent(event);
                //     }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        })
    }

    // 页面跳转。
    function openView(infoOpenId) {
        var url = '${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + infoOpenId + '&tKey=jypx&isTop=yes&isPic=yes&mode=view&openNewPager=true';
        jump(url);
    }

    <%--function jumpPage(type) {--%>
    <%--    var url = '';--%>
    <%--    if (type == 'jd') {//景点--%>
    <%--        url = "<%=path%>/public/wap/article/mobileIndex.jhtml";--%>
    <%--    } else if (type == 'bk') {//农业百科--%>
    <%--        url = "${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=encyclopedias&isTop=yes&isPic=yes&mode=view&openNewPager=true";--%>
    <%--    } else if (type == 'bm') {//便民--%>
    <%--        url = "<%=path%>/public/wap/szshAppHome/bmcxIndex.jhtml";--%>
    <%--    } else if (type == 'bs') {//办事指南--%>
    <%--        url = "${wechatDomain}/wap/handlingMatters/index.mhtml";--%>
    <%--    } else if (type == 'sp') {//农业视频--%>
    <%--        url = "${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=agriculturalVideo&isTop=yes&isPic=yes&mode=view&openNewPager=true";--%>
    <%--    }--%>

    <%--    jump(url);--%>
    <%--}--%>


    // 头部按钮。
    getHeadButtonData();

    function getHeadButtonData() {
        let platform = isWeChat();

        let idName = 'headButton';
        $('#' + idName).empty();

        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType: 'snfw',   // 使用场景：三农服务。
                orgCode: '${regionCode}',   // 区域编码。
                type: '7',   // 模块类型：导航栏。
                platform: platform   // 使用平台。
            },
            success: function (data) {
                let noDataHtml = '<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                    '<p class="font-size-14 cor-ccc text-lh1">暂无按钮</p>' +
                    '</div>';

                if (data) {
                    let dvModulars = data.dvModulars;

                    if (dvModulars) {
                        for (let i = 0; i < dvModulars.length; i++) {
                            let useType = dvModulars[i].useType;

                            if (useType === 'snfw') {
                                let modularContents = dvModulars[i].modularContents;

                                if (modularContents) {
                                    setHeadButtonHtml(modularContents, idName);

                                } else {
                                    $('#' + idName).html(noDataHtml);
                                }
                            }
                        }
                    } else {
                        $('#' + idName).html(noDataHtml);
                    }
                } else {
                    $('#' + idName).html(noDataHtml);
                }
            },
            error: function (data) {
            },
            complete: function () {
            }
        });
    }

    function setHeadButtonHtml(modularContents, idName) {
        let html = '';

        for (let i = 0; i < modularContents.length; i++) {
            let url = modularContents[i].url || '';


            url = getCountUrl(url);

            let picUrl = modularContents[i].attList.length > 0 ? '${imgDomain}' + modularContents[i].attList[0].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png';
            let name = modularContents[i].name || '';

            // 一行四个：第一个。
            if (i % 4 === 0) {
                html += '<div class=" layui-col-xs12  flex flex-ac flex-jr ">';
            }

            html += '<a href="Javascript:;" onclick="jump(\'' + url + '\')">' +
                '<div class="index-ann-box-icon img100">' +
                '<img src="' + picUrl + '" alt="">' +
                '</div>' +
                '<p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">' + name + '</p>' +
                '</a>';

            // 一行四个：第四个/最后一个。
            if (i % 4 === 3 || (i === modularContents.length - 1)) {
                html += '</div>';
            }
        }

        $('#' + idName).html(html);
    }



    function jump(url) {
        console.log(url)
        if (url == 'null') {
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }

        var flag = isWeChat()
        var isapp = ''

        if (flag == 'xygj') {
            isapp = 'token=${token}&app=app'
        }
        if (url.indexOf("?") == -1) {   //链接没有带参数
            location.href = url + '?' + isapp
        } else {
            location.href = url + '&' + isapp
        }
    }

    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var type = ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type) {
            return 'spt'
        } else {
            return 'xygj'
        }
    }

</script>
</body>
</html>