<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <title>科技惠农</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/search.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css"/>

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
</head>
<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 bg-fff pb10">
            <i class="kjhn-top-bg posi-abso">
                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/kjhn-pic1.png">
            </i>

            <div class="pl15 pr15 mt15 zindex-5">
                <div class="pic-wrap-ext1 notice-s8 kjhn-top-pic border-radius-10">
                    <div class="pic-wrap-c">
                        <!-- 暂无数据 -->
                        <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc posi-abso posi-top-0"
                             id="tbbjZwsj">
                            <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                        </div>
                        <div class="pic-wrap-i border-radius-10" id="tbbjSj">
                            <div class="swiper-container swiper-list-ext2 height-p100">
                                <div class="swiper-wrapper" id="tbbj">

                                </div>
                                <!-- Add Pagination -->
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt10 pl15 pr15 flex" id="navigation">

            </div>
        </div>
        <div class="layui-col-xs12 mt10 pl15 pr15">
            <div class="flex flex-jb flex-ac">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农业百科</p>
                <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"
                                                                           onclick="moreTrainings()"></i></a>
            </div>
            <div class="layui-col-xs12 pt15">
                <!-- 暂无数据 -->
                <div class="hide height-p85 flex flex-clm flex-jc flex-ac" id="trainingsZwsj">
                    <div class="data-none-ext1 img-p100">
                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                    </div>
                    <p class="font-size-17 cor-999 mt15">暂无数据</p>
                </div>

                <div class="layui-row layui-col-space15" id="trainings">

                </div>
            </div>
        </div>
        <div class="layui-col-xs12 pl15 pr15 pb10 mt10">
            <div class="layui-col-xs12 flex flex-jb flex-ac">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农业视频</p>
                <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"
                                                                           onclick="moreExperts()"></i></a>
            </div>
            <div class="layui-col-xs12 pt15">
                <div class="layui-row" id="experts">

                </div>
                <div class="height-p85 flex flex-clm flex-jc flex-ac hide" id="expertsZwsj">
                    <div class="data-none-ext1 img-p100">
                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-data-none-ext1.png">
                    </div>
                    <p class="font-size-17 cor-999 mt15">暂无数据</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        loadExperts()
        getTbbjData();
        getNavigation();
        getTrainings()
    })
    <%--        设置本地测试域名--%>
    var gmisDomain = 'http://my.v6.aishequ.org:8130'

    function ExpertDetail(memberId) {
        var url = '<%=path%>/public/wap/techBenefitsFarmersApp/detailIndex.json?memberId=' + memberId;
        <%--var url = '<%=path%>/dcl/techBenefitsFarmersApp/detailIndex.json?memberId='+memberId;--%>
        jump(url)
    }

    //农业视频列表
    function moreExperts() {
        //

        openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=agriculturalVideo&isTop=yes&isPic=yes&mode=view&openNewPager=true')

    }

    //农业视频
    function loadExperts() {

        <%--var url = '<%=path%>/public/wap/techBenefitsFarmersApp/loadManageList.json';--%>
        var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
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
        map.noTop = 1 ;
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

                        var comp = `<video controls="controls" style="width: 100%;height: 100%;" autostart="false" loop="true" src="` + rows[i].staticUrl + `">`

                      if(rows[i].staticUrl==null||rows[i].staticUrl==''){
                          comp= `<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">`
                      }


                        trainings += '<div  class="layui-col-xs12 mt15">\n' +
                            '                            <div class="layui-col-xs12 bg-fff border-radius-4">\n' +
                            '                                <div class="swiper-container swiper-list-ext2">\n' ;

                        trainings +=
                                '                                            <div class="pic-wrap-ext1 notice-s6">\n' +
                                '                                                <div class="pic-wrap-c">\n' +
                                '                                                    <div class="pic-wrap-i">\n' +
                                              comp +
                                '                                                    </div>\n' +
                                '                                                </div>\n' ;
                        trainings +=  '                                    </div>\n' +
                            '                                <div onclick="openView(' + rows[i].infoOpenId + ')"  class="font-size-12">\n' +
                            '                                    <p class="font-size-14 cor-4d pb10 pl10 pr10 mt10">' + rows[i].title + '</p>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>'


                    }
                    $("#experts").html(trainings)
                } else {
                    $('#expertsZwsj').removeClass('hide');
                    $('#experts').hide();
                }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        })
    }

    // 页面跳转。
    function openPage(url) {
        var rurl = '${gbpDomain}' + url;
        jump(rurl);
    }

    // 页面跳转。
    function openView(infoOpenId) {
        var url = '${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + infoOpenId + '&tKey=jypx&isTop=yes&isPic=yes&mode=view&openNewPager=true';
        jump(url);
    }

    //更多培训
    function moreTrainings() {

     //   openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=jypx&isTop=yes&isPic=yes&mode=view&openNewPager=true&app=app&token=${token}')
        openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=encyclopedias&isTop=yes&isPic=yes&mode=view&openNewPager=true')

    }

var dictMap = {"dcl007002":"植保技术","dcl007003":"农业知识","dcl007004":"化肥知识","dcl007005":"农资农机","dcl007006":"种子知识"}

    //农业百科
    function getTrainings() {

        <%--var url = '<%=path%>/public/wap/techBenefitsFarmersApp/loadManageList.json';--%>
        var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
        var map = {
            orgCode: "${orgCode}",
            page: 1,
            rows: 6
        };
      //  map.catalogId = '10000027';
        map.catalogId = '10000114';
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        map.noTop = 1 ;
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

                                    //         <img src="${$IMG_DOMAIN}` + rows[i].fileName + ` onerror="javascript:this.src='${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png';"  ">

                                    let img = rows[i].fileName;

                                    let dictName =    dictMap[rows[i].catalogCode] ==undefined ? "":dictMap[rows[i].catalogCode]
                                    // 无图片。

                                    if (!img) {
                                        img = '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">';

                                        // 信息发布管理 文章封面 有上传。
                                    } else if (img.substr(0, 1) === '/') {
                                        img = '<img src="${$IMG_DOMAIN}' + img + '">';
                                        // 对接数据。
                                    } else {
                                        img = '<img src="' + img + '">';
                                    }
                                //    alert(JSON.stringify(rows[i]));

                                    trainings += `
                                    <div class="layui-col-xs6" onclick="openView(` + rows[i].infoOpenId + `)">
                                    <div class="layui-col-xs12 bg-fff border-radius-4">
                                        <div class="pic-wrap-ext1 notice-s4">
                                            <div class="pic-wrap-c">
                                                <div class="pic-wrap-i border-radius-2">
                                           `+img+`
                                                </div>
                                            </div>
                                            <p class="font-size-14 cor-4d text-line-c1 pl10 pr10 mt5">` + rows[i].title + `</p>
                                            <div class="flex flex-ac pl10 pr10 mt10 mb10">
                                                <p class="font-size-12 cor-blue3 text-line-c1 mr5 kjhn-text1">` +dictName  + `</p>
                                                <div class="flex flex-ac flex-je flex1 overflow-h">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    `
                                }
                                $("#trainings").html(trainings)
                            } else {
                                $('#trainingsZwsj').removeClass('hide');
                                $('#trainings').hide();
                            }

                        },
                        error: function (data) {
                            console.log("获取列表数据连接超时！");
                        },
                        complete: function () {
                        }
                    })
                }

                // 轮播图渲染
        function getTbbjData() {
                    var  platform =isWeChat()

                    $.ajax({
                        type: 'get',
                        <%--url: '<%=path%>/dcl/techBenefitsFarmersApp/getTbbjData.jhtml',--%>
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                regionCode: "${orgCode}",   // 区域编码。
                // regionCode: "660101001001",   // 区域编码。
                useType: "kjhn",   // 科技惠农。
                type: "3",   // 轮播图。
                platform:platform
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
                                    attList = attList[0];
                                    str += '<div class="swiper-slide">' +
                                        '<div class="pic-wrap-i cwzw-pic-box flex flex-ac flex-jc">' +
                                        '<img src="' + '${$IMG_DOMAIN}' + attList.filePath + '">' +
                                        '</div>' +
                                        ' </div>';

                                    imgNum++;
                                }
                            }
                        }

                        $('#tbbj').html(str);

                        // 循环轮播。
                        if (imgNum > 1) {
                            // 放在外面轮播会失效。
                            var swiperList1_1 = new Swiper('.swiper-list-ext2', {
                                spaceBetween: imgNum,
                                pagination: {
                                    el: '.swiper-pagination'
                                },
                                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                                autoplay: {
                                    delay: 3000,
                                    stopOnLastSlide: false,
                                    disableOnInteraction: false
                                },
                                loop: true,//是否可循环
                                observer: true,
                                observeParents: true,
                                observeSlideChildren: true
                            });

                            // 循环。
                        } else if (imgNum === 1) {
                            // 放在外面轮播会失效。
                            var swiperList1_2 = new Swiper('.swiper-list-ext2', {
                                spaceBetween: 5,
                                pagination: {
                                    el: '.swiper-pagination'
                                },
                                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                                loop: true,//是否可循环
                                observer: true,
                                observeParents: true,
                                observeSlideChildren: true
                            });

                            // 暂无数据。
                        } else {
                            $('#tbbjZwsj').removeClass('hide');
                            $('#tbbjSj').hide();
                        }
                    } else {
                        $('#tbbjZwsj').removeClass('hide');
                        $('#tbbjSj').hide();
                    }
                } else {
                    $('#tbbjZwsj').removeClass('hide');
                    $('#tbbjSj').hide();
                }
            },
            error: function (data) {
                console.log("获取头部背景数据连接超时！");
            },
            complete: function () {
            }
        });
    }

    //    导航渲染

    function getNavigation() {
        $.ajax({
            type: 'get',
            <%--url: '<%=path%>/dcl/techBenefitsFarmersApp/getTbbjData.jhtml',--%>
            url: '<%=path%>/public/wap/techBenefitsFarmersApp/getTbbjData.jhtml',
            data: {
                regionCode: "${orgCode}",   // 区域编码
                // regionCode: "660101001001",   // 区域编码
                useType: "kjhn",   // 科技惠农
                type: "7"   // 导航
            },
            success: function (data) {
                if (data != null) {
                    var str = '';
                    var list = data.dvModulars[0].modularContents;
                    for (let i = 0; i < list.length; i++) {
                        str +=
                            `               <a href="javascript:void(0);" onclick="jump('` + list[i].url + `')" class="flex1">
                            <div class="index-ann-box-icon img100">
                            <img src= ` + '${$IMG_DOMAIN}' + list[i].attList[0].filePath + ` alt="">
                            </div>
                            <p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">` + list[i].name + `</p>
                            </a>`
                    }
                    $("#navigation").html(str)

                }
            },
            error: function (data) {
                console.log("获取头部背景数据连接超时！");
            },
            complete: function () {
            }
        });
    }
    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type){
            return 'spt'
        }else {
            return 'xygj'
        }
    }

    function jump(url){
        console.log(url)
        if (url=='null'){
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }

        var flag =  isWeChat()
        var isapp=''

        if (flag =='xygj'){
            isapp='token=${token}&app=app'
        }
        if (url.indexOf("?")==-1){   //链接没有带参数
            location.href = url+'?'+isapp
        }else {
            location.href = url+'&'+isapp
        }
    }

</script>
</body>
</html>