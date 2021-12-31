<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">
<%--    <title>文化旅游</title>--%>
    <title>乡村特色</title>

    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/search.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/form.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/list.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/layer.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css" />

    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index1.css" />

    <style>
        /* 头部图片分页器（白色）。 */
        .swiper-list-ext1 .swiper-pagination-bullet-active {
            background: #fff;
        }
        /* 一村一品分页器（浅蓝）。 */
        .swiper-list-ext2 .swiper-pagination-bullet {
            background: lightblue;
        }
    </style>
</head>

<body class="bg-cor-f5">
    <div class="layui-contain">
        <div class="layui-row bg-fff">
            <div class="layui-col-xs12 pt20 index-top-lvyou">
                <div class="pl15 pr15 bs">
                    <!-- 轮播 -->
                    <ul class="index-lunbo-box posi-rela">
                        <div class="swiper-container swiper-list-ext1 w100">
                            <div class="swiper-wrapper" id="headPicture">
                                
                            </div>
                            <div class="swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
                        </div>
                    </ul>
                </div>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 pt15 pl15 pr15 pb5" id="headButton">

            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-xs12 pl15 pr15 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac mt10">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15"><i class="notic-bar-ext1"></i>乡村景点</p>
                </div>
                <div class="layui-col-xs12 pt15">
                    <div class="layui-row" id="ruralAttractions">

                    </div>
                </div>
            </div>

            <div class="layui-col-xs12 pl15 pr15 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15"><i class="notic-bar-ext1"></i>乡村农家乐</p>
                </div>
                <div class="layui-col-xs12">
                    <div class="layui-row" id="agritainment">

                    </div>
                </div>
            </div>

            <div class="layui-col-xs12 pl15 pr15 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac mt10">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15"><i class="notic-bar-ext1"></i>乡村民宿</p>
                </div>
                <div class="layui-col-xs12 pt15">
                    <div class="layui-row" id="ruralHomestay">

                    </div>
                </div>
            </div>

            <div class="layui-col-xs12 pl15 pr15 pb10">
                <div class="layui-col-xs12 flex flex-jb flex-ac mt10">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15"><i class="notic-bar-ext1"></i>一村一品</p>
                </div>
                <div class="layui-col-xs12 pt15">
                    <div class="swiper-container swiper-list-ext2 swiper-list-ext3" id="oneVillageOneProduct">

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${uiDomain}/js/layer/layer.js"></script>

<script>
    $.fn.extend({
        // 页面高度计算
        heightC: function () {
            var _this = this;
            var paddingT = $('.layer-hd').outerHeight();
            var navCH = $(window).outerHeight() - paddingT;
            $(_this).css({ 'paddingTop': paddingT + 'px' });
            $('.nav-chidren-h1').css({ 'height': navCH + 'px' });
        },
        closeL: function () {
            $(this).on('click', function () {
                $('.layer-bd-cont').slideUp(300).siblings().fadeOut(300);
                setTimeout(function () {
                    $('.layer-bd').addClass('hide');
                }, 300);
            });
        },
    });



    // 头部图片。
    getHeadPictureData();
    function getHeadPictureData() {
        let platform = isWeChat();

        $('#headPicture').empty();

        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                regionCode: '${regionCode}',   // 区域编码。
                useType: 'xcts',   // 使用场景：乡村特色。
                type: '3',   // 模块类型：轮播图。
                platform: platform   // 使用平台。
            },
            success: function(data) {
                let noPictureHtml = '<div class="swiper-slide">' +
                                    '<li class="bs w100 img100">' +
                                    '<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">' +
                                    '</li>' +
                                    '</div>';

                // 一个主题。
                if (data) {
                    let html = '';
                    let dvModular = data.dvModulars;   // 多个模块，只取第一个。

                    if (dvModular) {
                        dvModular = dvModular[0];
                        let imgNum = 0;
                        let modularContents = dvModular.modularContents;   // 多个模块内容。

                        if (modularContents) {
                            for (let i = 0; i < modularContents.length; i++) {
                                let attList = modularContents[i].attList;   // 多个附件，只取第一个。

                                <%--if (attList) {--%>
                                <%--    attList = attList[0];--%>

                                <%--    html += '<div class="swiper-slide">' +--%>
                                <%--           '<li class="bs w100 img100">' +--%>
                                <%--           '<img src="' + '${imgDomain}' + attList.filePath + '" onerror="javascript:this.src=\'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png\';">' +--%>
                                <%--           '</li>' +--%>
                                <%--           '</div>';--%>
                                <%--    imgNum++;--%>
                                <%--}--%>

                                for(var j=0;j<attList.length;j++){
                                    html += '<div class="swiper-slide">' +
                                        '<li class="bs w100 img100">' +
                                        '<img src="' + '${imgDomain}' + attList[j].filePath + '" onerror="javascript:this.src=\'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png\';">' +
                                        '</li>' +
                                        '</div>';
                                    imgNum++;
                                }
                            }
                        }

                        $('#headPicture').html(html);

                        // 循环轮播。
                        if (imgNum > 1) {
                            let swiperList1 = new Swiper('.swiper-list-ext1', {
                                spaceBetween: 5,
                                pagination: {
                                    el: '.swiper-list-ext1 .swiper-pagination'
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
                            let swiperList1 = new Swiper('.swiper-list-ext1', {
                                spaceBetween: 5,
                                pagination: {
                                    el: '.swiper-list-ext1 .swiper-pagination'
                                },
                                direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
                                loop: true,//是否可循环
                                observer: true,
                                observeParents: true,
                                observeSlideChildren: true
                            });
                        } else {
                            $('#headPicture').html(noPictureHtml);
                        }
                    } else {
                        $('#headPicture').html(noPictureHtml);
                    }
                } else {
                    $('#headPicture').html(noPictureHtml);
                }
            },
            error: function(data) {
            },
            complete: function() {
            }
        });
    }

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
                useType: 'xcts',   // 使用场景：乡村特色。
                orgCode: '${regionCode}',   // 区域编码。
                type: '7',   // 模块类型：导航栏。
                platform: platform   // 使用平台。
            },
            success: function(data) {
                let noDataHtml = '<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                                 '<p class="font-size-14 cor-ccc text-lh1">暂无按钮</p>' +
                                 '</div>';

                if (data) {
                    let dvModulars = data.dvModulars;

                    if (dvModulars) {
                        for(let i = 0; i < dvModulars.length; i ++) {
                            let useType = dvModulars[i].useType;

                            if (useType === 'xcts') {
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
            error: function(data) {
            },
            complete : function() {
            }
        });
    }

    function setHeadButtonHtml(modularContents, idName) {
        let html = '';

        for (let i = 0; i < modularContents.length; i++) {
            let url = modularContents[i].url || '';


            url =  getCountUrl(url);

            let picUrl = modularContents[i].attList.length > 0 ? '${imgDomain}' + modularContents[i].attList[0].filePath : '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon42.png';
            let name = modularContents[i].name || '';

            // 一行四个：第一个。
            if (i % 4 === 0) {
                html += '<div class=" layui-col-xs12 index-ann-box">';
            }

            html += '<a href="Javascript:;" onclick="jumpPage(\'' + url + '\')">' +
                    '<div class="index-ann-box-icon img100">' +
                    '<img src="' + picUrl + '" alt="">' +
                    '</div>' +
                    '<p class="font-size-12 cor-666 text-align-c text-line-c1 mt5">' + name + '</p>' +
                    '</a>';

            // 一行四个：第四个/最后一个。
            if (i % 4 === 3 || (i === modularContents.length -1)) {
                html += '</div>';
            }
        }

        $('#' + idName).html(html);
    }

    let currentPage = 1;
    let pageSize = 3;
    let regionCode = '${regionCode}';


    // 传入 地域  url ,判断是否修改域名
    function getCountUrl(str){

        var	nowDomain =	'${mainTit}';

        if(str == null || ""==str|| str.indexOf("cn")==-1 ){
            return str;
        }

        //截取域名部门
        var  domain =	str.substring(7,str.indexOf("cn"));

        var count = 0;
        var index = 0;
        while((index=domain.indexOf(".",index))!=-1){
            index = index+".".length;
            count++;
        }
        //有公众号域名头
        if(count==3){
            //无公众号域名头
        }else if(count==2){
            //只改gbp
            //       if(domain.indexOf("gbp")!=-1){
            //尝试从当前地域中获取 域名
            if(nowDomain!=null&&nowDomain!=''){
                return  "http://" + nowDomain +"."+ str.substring(7);
            }
            //     }

        }

        return str;
    }


    // 乡村景点。
    getRuralAttractionsData();
    function getRuralAttractionsData() {
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/article/listData.jhtml',
            data: {
                page: currentPage,
                rows: pageSize,
                orgCode: regionCode,
                issuStatus: '1'
            },
            success: function(data) {
                let noDataHtml = '<div class="height-p85 flex flex-clm flex-jc flex-ac">' +
                                 '<div class="data-none-ext1 img-p100">' +
                                 '<img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">' +
                                 '</div>' +
                                 '<p class="font-size-17 cor-999 mt35">暂无数据</p>' +
                                 '</div>';

                if (data) {
                    let listData = data.rows;

                    if (listData.length > 0) {
                        let html = '';

                        for (let i = 0; i < listData.length; i++) {
                            // 第二个开始的样式。
                            let divCss = '';
                            if (listData.length > 1) {
                                divCss = 'mt15'
                            }
                            let uuid = listData[i].uuid;

                            // 收费类型。
                            let chargeTypeName = listData[i].chargeTypeName || '暂无类型';
                            let chargeTypeColor = '';
                            if (chargeTypeName === '免费') {
                                chargeTypeColor = 'i-bg-green'
                            } else {
                                chargeTypeColor = 'i-bg-red';
                            }

                            // 主图。
                            let picUrlCss = listData[i].picUrl ? 'img100' : '';
                            let picUrlStyle = listData[i].picUrl ? 'style="width:100%; height:188.65px;"' : '';
                            let picUrl = listData[i].picUrl ? '<img src="${imgDomain}' +  listData[i].picUrl + '" ' + picUrlStyle + '>' : '<div class="pic-wrap-c posi-rela">' +
                                                                                                                                          '<div class="posi-abso gzh-default-pic flex flex-ac flex-jc">' +
                                                                                                                                          '<i class="gzh-dp-icon1"></i>' +
                                                                                                                                          '</div>' +
                                                                                                                                          '</div>';

                            // 名称。
                            let attractionsName = listData[i].attractionsName || '暂无名称';
                            // 类型。
                            let attractionsTypeName = listData[i].attractionsTypeName || '暂无类型';
                            // 地址。
                            let address = listData[i].address || '暂无地址';

                            html += '<div class="layui-col-xs12 ' + divCss + '" onclick="jumpPage(\'<%=path%>/public/wap/article/mobileView.jhtml?id=' + uuid + '\')">' +
                                    '                            <div class="layui-col-xs12 bg-fff border-radius-4 posi-rela pb10">' +
                                    '                                <i class="cor-fff font-size-12 ' + chargeTypeColor + '">' + chargeTypeName + '</i>' +
                                    '                                <div class="swiper-container swiper-list-ext2">' +
                                    '                                    <div class="swiper-wrapper">' +
                                    '                                        <div class="swiper-slide">' +
                                    '                                            <div class="pic-wrap-ext1 notice-s6 ' + picUrlCss + '">' +
                                    picUrl +
                                    '                                            </div>' +
                                    '                                        </div>' +
                                    '                                    </div>' +
                                    '                                    <div class="swiper-pagination"></div>' +
                                    '                                </div>' +
                                    '                                <div class="font-size-12">' +
                                    '                                    <div class="flex flex-ac flex-jb pl10 pr15 mt10 mb10">' +
                                    '                                        <p class="font-size-14 cor-4d cor-red5" style="width:70%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">' + attractionsName + '</p>' +
                                    '                                        <p class="font-size-14 cor-ff8400 flex flex-ac"><i class="icon-house-ext1-lvy mr5"></i><em class="pt3">' + attractionsTypeName + '</em></p>' +
                                    '                                    </div>' +
                                    '                                    <p class="font-size-12 cor-999 flex flex-ac pl10 mt10"><i class="icon-pos-ext3 mr5"></i>' + address + '</p>' +
                                    '                                   ' +
                                    '                                </div>' +
                                    '                            </div>' +
                                    '                        </div>';
                        }
                        $('#ruralAttractions').html(html);

                    } else {
                        $('#ruralAttractions').html(noDataHtml);
                    }
                } else {
                    $('#ruralAttractions').html(noDataHtml);
                }
            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }

    // 农家乐。
    getAgritainmentData();
    function getAgritainmentData() {
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/agritainment/listData.jhtml',
            data: {
                page: currentPage,
                rows: pageSize,
                orgCode: regionCode,
                issuStatus: '01'
            },
            success: function(data) {
                let noDataHtml = '<div class="height-p85 flex flex-clm flex-jc flex-ac">' +
                                 '<div class="data-none-ext1 img-p100">' +
                                 '<img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">' +
                                 '</div>' +
                                 '<p class="font-size-17 cor-999 mt35">暂无数据</p>' +
                                 '</div>';

                if (data) {
                    let listData = data.rows;

                    if (listData.length > 0) {
                        let html = '';

                        for (let i = 0; i < listData.length; i++) {
                            let uuid = listData[i].uuid;

                            // 主图。
                            let picUrl = listData[i].picUrl
                                ?
                                '<div class="pic-wrap-c">' +
                                '<div class="pic-wrap-i border-radius-2">' +
                                '<img src="${imgDomain}' + listData[i].picUrl + '">' +
                                '</div>' +
                                '</div>'
                                :
                                '<div class="pic-wrap-c posi-rela">' +
                                '<div class="posi-abso gzh-default-pic flex flex-ac flex-jc">' +
                                '<i class="gzh-dp-icon1"></i>' +
                                '</div>' +
                                '</div>';

                            // 名称。
                            let farmhouseName = listData[i].farmhouseName || '暂无名称';
                            // 服务介绍。
                            let serviceDesc = listData[i].serviceDesc ? listData[i].serviceDesc.replace(/<[^>]+>/g, '') : '暂无介绍';
                            // 人均消费。（实体类字段为String）
                            let perCapitaConsum = listData[i].perCapitaConsum;
                            if (perCapitaConsum) {   // 判空。
                                perCapitaConsum = !isNaN(perCapitaConsum) ? Number(perCapitaConsum) : 0;   // 判断是否为数字。
                                perCapitaConsum = perCapitaConsum > 0 ? perCapitaConsum.toFixed(2) : '-';   // 截取小数点位数，最多两位。
                            } else {
                                perCapitaConsum = '-';
                            }

                            html += '<div class="layui-col-xs12 bg-fff border-radius-4 flex mt15" onclick="jumpPage(\'<%=path%>/public/wap/agritainment/view.json?uuId=' + uuid + '\')">' +
                                '                            <div class="width-120">' +
                                '                                <div class="pic-wrap-ext1 notice-s7">' +
                                picUrl +
                                '                                </div>' +
                                '                            </div>' +
                                '                            <div class="flex1">' +
                                '                                <p class="font-size-14 cor-4d pl15 mt10">' + farmhouseName + '</p>' +
                                '                                <p class="font-size-12 cor-666 text-line-c2 pl15 pr10 mt10">' + serviceDesc + '</p>' +
                                '                                <div class="flex flex-ac flex-jb pl15 pr15 mt12">' +
                                '                                    <p class="font-size-12 text-lh1 cor-b3"><em class="font-size-14 cor-red5 mr5">￥' + perCapitaConsum + '</em>/人</p>' +
                                // '                                    <p class="font-size-12 cor-999 flex flex-ac pt3"><i class="icon-pos-ext3 mr5"></i>5.6km</p>' +
                                '                                </div>' +
                                '                            </div>' +
                                '                        </div>';
                        }
                        $('#agritainment').html(html);

                    } else {
                        $('#agritainment').html(noDataHtml);
                    }
                } else {
                    $('#agritainment').html(noDataHtml);
                }
            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }

    // 乡村民宿。
    getRuralHomestayData();
    function getRuralHomestayData() {
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/homestayManagementApp/listData.jhtml',
            data: {
                currentPage: currentPage,
                pageSize: pageSize,
                orgCode: regionCode,
                issuStatus: '01'
            },
            success: function(data) {
                let noDataHtml = '<div class="height-p85 flex flex-clm flex-jc flex-ac">' +
                                 '<div class="data-none-ext1 img-p100">' +
                                 '<img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">' +
                                 '</div>' +
                                 '<p class="font-size-17 cor-999 mt35">暂无数据</p>' +
                                 '</div>';

                if (data) {
                    let listData = data.data;

                    if (listData.length > 0) {
                        let html = '';

                        for (let i = 0; i < listData.length; i++) {
                            // 第二个开始的样式。
                            let divCss = '';
                            if (listData.length > 1) {
                                divCss = 'mt15'
                            }
                            let uuid = listData[i].uuid;

                            // 主图。
                            let picUrlCss = listData[i].picUrl ? 'img100' : '';
                            let picUrlStyle = listData[i].picUrl ? 'style="width:100%; height:188.65px;"' : '';
                            let picUrl = listData[i].picUrl ? '<img src="${imgDomain}' +  listData[i].picUrl + '" ' + picUrlStyle + '>' : '<div class="pic-wrap-c posi-rela">' +
                                                                                                                                          '<div class="posi-abso gzh-default-pic flex flex-ac flex-jc">' +
                                                                                                                                          '<i class="gzh-dp-icon1"></i>' +
                                                                                                                                          '</div>' +
                                                                                                                                          '</div>';

                            // 名称。
                            let homestayName = listData[i].homestayName || '暂无名称';
                            // 住宿标准。
                            let accommodationName = listData[i].accommodationName || '暂无类型';
                            // 地址。
                            let address = listData[i].address || '暂无地址';

                            html += '<div class="layui-col-xs12 ' + divCss + '" onclick="jumpPage(\'<%=path%>/public/wap/homestayManagementApp/appView.jhtml?uuid=' + uuid + '\')">' +
                                    '                            <div class="layui-col-xs12 bg-fff pb10 border-radius-4">' +
                                    '                                <div class="swiper-container swiper-list-ext2">' +
                                    '                                    <div class="swiper-wrapper">' +
                                    '                                        <div class="swiper-slide">' +
                                    '                                            <div class="pic-wrap-ext1 notice-s6' + picUrlCss + '">' +
                                    picUrl +
                                    '                                            </div>' +
                                    '                                        </div>' +
                                    '                                    </div>' +
                                    '                                    <div class="swiper-pagination"></div>' +
                                    '                                </div>' +
                                    '                                <div class="font-size-12">' +
                                    '                                    <div class="flex flex-ac flex-jb pl10 pr15 mt10 mb10">' +
                                    '                                        <p class="font-size-14 cor-4d">' + homestayName + '</p>' +
                                    '                                        <p class="font-size-14 cor-blue3 flex flex-ac"><i class="icon-house-ext1 mr5"></i><em class="pt3">' + accommodationName + '</em></p>' +
                                    '                                    </div>' +
                                    '                                    <p class="font-size-12 cor-999 flex flex-ac pl10 mt10"><i class="icon-pos-ext3 mr5"></i>' + address + '</p>' +
                                    '                                </div>' +
                                    '                            </div>' +
                                    '                        </div>';
                        }
                        $('#ruralHomestay').html(html);

                    } else {
                        $('#ruralHomestay').html(noDataHtml);
                    }
                } else {
                    $('#ruralHomestay').html(noDataHtml);
                }
            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }

    //  一村一品。
    getOneVillageOneProductData();
    function getOneVillageOneProductData() {
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/villageProductApp/listData.jhtml',
            data: {
                page: currentPage,
                limit: pageSize,
                regionCode: regionCode,
                shelf: 1   // 上架情况：上架-1，下架-0。
            },
            success: function(data) {
                let noDataHtml = '<div class="height-p85 flex flex-clm flex-jc flex-ac">' +
                                 '<div class="data-none-ext1 img-p100">' +
                                 '<img src="${uiDomain}/app-assets/_wangge/zongzhi-mdjf/images/icon/icon-data-none-ext1.png">' +
                                 '</div>' +
                                 '<p class="font-size-17 cor-999 mt35">暂无数据</p>' +
                                 '</div>';

                if (data) {
                    let listData = data.data;

                    if (listData.length > 0) {
                        let html = '';

                        html += '<div class="swiper-wrapper">';
                        for (let i = 0; i < listData.length; i++) {
                            let uuid = listData[i].uuid;

                            // 主图。
                            let picUrlCss = listData[i].picUrl ? 'img100' : '';
                            let picUrlStyle = listData[i].picUrl ? 'style="width:100%; height:131.25px;"' : '';
                            let picUrl = listData[i].picUrl ? '<img src="${imgDomain}' +  listData[i].picUrl + '" ' + picUrlStyle + '>' : '<div class="pic-wrap-c posi-rela">' +
                                                                                                                                          '<div class="posi-abso gzh-default-pic flex flex-ac flex-jc">' +
                                                                                                                                          '<i class="gzh-dp-icon1"></i>' +
                                                                                                                                          '</div>' +
                                                                                                                                          '</div>';

                            // 名称。
                            let goodsName = listData[i].goodsName || '暂无名称';
                            // 市场参考价最低。marketPriceHigh
                            let marketPriceLow = listData[i].marketPriceLow && listData[i].marketPriceLow > 0 ? listData[i].marketPriceLow.toFixed(2) : '-';
                            // 市场参考价最高。
                            let marketPriceHigh = listData[i].marketPriceHigh && listData[i].marketPriceHigh > 0 ? listData[i].marketPriceHigh.toFixed(2) : '-';
                            // 地址。
                            let address = listData[i].address || '暂无地址';
                            // 类型。
                            let goodsTypeName = listData[i].goodsTypeName || '暂无类型';

                            html += '<div class="swiper-slide" onclick="jumpPage(\'<%=path%>/public/wap/villageProductApp/view.jhtml?uuid=' + uuid + '\')">' +
                                '                                <div class="layui-col-xs12 bg-fff border-radius-4">' +
                                '                                    <div class="pic-wrap-ext1 notice-s3 ' + picUrlCss + '">' +
                                picUrl +
                                '                                        <p class="font-size-14 cor-4d text-line-c1 pl10 pr10 mt5">' + goodsName + '</p>' +
                                '                                        <p class="font-size-12 cor-b3 pl10 pr10 mt5"><em class="cor-red5 mr8">￥' + marketPriceLow + ' - ' + marketPriceHigh + '</em>/斤</p>' +
                                '                                        <div class="flex flex-ac flex-jb pl10 pr10 mt5 mb10">' +
                                '                                            <p class="font-size-12 cor-blue3 flex1 flex flex-ac pt3 overflow-h"><i class="icon-pos-ext1 icon-pos-ext1-lvyou mr10"></i><em class="flex1 text-line-c1">' + address + '</em></p>' +
                                '                                            <p class="list-tag-ext3 font-size-12 cor-green3">' + goodsTypeName + '</p>' +
                                '                                        </div>' +
                                '                                    </div>' +
                                '                                </div>' +
                                '                            </div>';
                        }
                        html += '</div>' +
                                '<div class="swiper-pagination"></div>';

                        $('#oneVillageOneProduct').html(html);

                        let swiperList3 = new Swiper('.swiper-list-ext3', {
                            slidesPerView: 2,
                            spaceBetween: 10,
                            pagination: {
                                el: '.swiper-list-ext3 .swiper-pagination'
                            }
                        });
                    } else {
                        $('#oneVillageOneProduct').html(noDataHtml);
                    }
                } else {
                    $('#oneVillageOneProduct').html(noDataHtml);
                }
            },
            error: function(data) {
            },
            complete : function() {
            }
        });
    }



    // 判断为微信公众号或是App。
    function isWeChat() {
        let ua = navigator.userAgent.toLowerCase();

        let type = ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram';
        if (type) {
            return 'spt';
        } else {
            return 'xygj';
        }
    }

    // 跳转页面。
    function jumpPage(url) {
        if (!url) {
            layer.msg('暂未开放！', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return;
        }

        let flag = isWeChat();
        let isApp = '';
        if (flag =='xygj') {
            isApp = 'token=${token}&app=app';
        }
        if (url.indexOf("?") == -1) {   //链接没有带参数
            location.href = url + '?' + isApp;
        } else {
            location.href = url + '&' + isApp;
        }
    }
</script>

</html>