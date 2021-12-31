<#include "/component/layuiCommonHead.ftl" />
<#include "/component/uploadFileCommon.ftl" />
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.css"/>
<link rel="stylesheet" type="text/css"
      href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css"
      href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css"/>
<link rel="stylesheet" type="text/css"
      href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css"/>
<link rel="stylesheet" type="text/css"
      href="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/css/modify-index.css"/>
<script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>

<script>
    findNoticeList();
    function findNoticeList() {
        $.ajax({
            type: 'POST',
            url: '${WECHAT_DOMAIN!''}/wap/xiongAn/CommonEvent/updaterListJsonp.mhtml',
            data: {
                page: 1,
                rows: 999,
                status: '99',//99是审核通过后所有状态的数据 98 是完结的数据
                fromType: '${catalogId}',//1 违章搭建2一键报抽3卫生曝光
                areaCode: "${regionCode!''}",
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    var rows = data.rows;
                    showArticle('${infoOpenId}' == '' ? rows[0].eventId : '${infoOpenId}');
                    var countImg = 0;

                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i];

                        // 获取图片
                        var files = item.imageList;
                        if (files && files.length > 0) {
                            for (var j = 0; j < files.length; j++) {
                                var pathArr = files[j].path.split('.');
                                if ("bmp|jpg|jpeg|png|gif".indexOf(pathArr[pathArr.length - 1].toLowerCase()) > -1) {
                                    countImg ++;
                                    $('#imgList').append(
                                        '<div class="swiper-slide">' +
                                        '   <div class="w100 h100 flex flex-jc flex-ac">' +
                                        '       <img style="max-width: 100%; max-height: 100%; display: block;" src="${FILE_URL!''}' + files[j].path + '" alt="" onclick="showArticle(' + item.eventId + ')">' +
                                        '   </div>' +
                                        '</div>'
                                    );
                                    break;
                                }
                            }
                        }
                    }

                    if (countImg < 2) {
                        $('.page-help').hide();
                    } else {
                        var mySwiper = new Swiper('.swiper01', {
                            autoplay: {
                                delay: 3000,
                                stopOnLastSlide: true,
                                disableOnInteraction: false,
                            },//可选选项，自动滑动
                            navigation: {
                                nextEl: '.xq-lunbo-qh-ri',
                                prevEl: '.xq-lunbo-qh-le',
                            },
                            spaceBetween: 10,
                            loop: true,
                            // direction: 'vertical',
                            observer: true, //修改swiper自己或子元素时，自动初始化swiper
                            observeParents: true //修改swiper的父元素时，自动初始化swiper
                        });
                        //鼠标放上暂停轮播
                        $('.xq-lunbo-box').hover(function () {
                            mySwiper.autoplay.stop();
                        }, function () {
                            mySwiper.autoplay.start();
                        });
                    }

                    $('#list').append(
                        '<div class="swiper-slide">' +
                        '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + rows[0].eventId + ')" style="cursor: pointer;">' +
                        '       <div class="w100 clearfix">' +
                        '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + (rows[0].hpAddr || '') + '">' + (rows[0].hpAddr || '') + '</span>' +
                        '           <span class="fr font-size-r14 cor-999 let-sp1">' + (rows[0].hpTimeStr || '') + '</span>' +
                        '       </div>' +
                        '       <p class="text-line-c1 font-size-r14 cor-666 mtr10" title="' + (rows[0].content || '') + '">' + (rows[0].content || '') + '</p>' +
                        '   </li>' +
                        '</div>'
                    );
                    var page = 7;
                   //var page = Math.ceil($('.djyl-100-h275').height() / $('.djyl-zwgk-bottom-bor').height());

                    $('#list').empty();
                    if (rows.length <= page) {
                        $('#parentList').empty();
                    }
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i];
                        if (rows.length > page) {
                            $('#list').append(
                                '<div class="swiper-slide">' +
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.eventId + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + (item.hpAddr || '') + '">' + (item.hpAddr || '') + '</span>' +
                                '           <span class="fr font-size-r14 cor-999 let-sp1">' + (item.hpTimeStr || '') + '</span>' +
                                '       </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10" title="' + (item.content || '') + '">' + (item.content || '') + '</p>' +
                                '   </li>' +
                                '</div>'
                            );
                        } else {
                            $('#parentList').append(
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.eventId + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + (item.hpAddr || '') + '">' + (item.hpAddr || '') + '</span>' +
                                '           <span class="fr font-size-r14 cor-999 let-sp1">' + (item.hpTimeStr || '') + '</span>' +
                                '       </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10" title="' + (item.content || '') + '">' + (item.content || '') + '</p>' +
                                '   </li>'
                            );
                        }

                        // 详情初始化。
                        if ('${infoOpenId!''}' == item.eventId) {
                            showArticle(item.eventId);
                        }
                    }
                    if (rows.length > page) {
                        var mySwiper02 = new Swiper('.swiper02', {
                            autoplay: {
                                delay: 3000,
                                stopOnLastSlide: true,
                                disableOnInteraction: false,
                            },//可选选项，自动滑动
                            direction: 'vertical',
                            loop: true,
                            slidesPerView: page,
                            observer: true, //修改swiper自己或子元素时，自动初始化swiper
                            observeParents: true //修改swiper的父元素时，自动初始化swiper
                        });
                        $('.djyl-100-h275').hover(function () {
                            mySwiper02.autoplay.stop();
                        }, function () {
                            mySwiper02.autoplay.start();
                        });
                    }
                }
            },
            error: function () {
                console.log("获取列表数据连接超时！");
            },
        });
    }

    var statusMap = {
        '1': '草稿',
        '2': '上报待审核',
        '3': '处理中',
        '4': '已处理',
        '5': '驳回',
        '9': '归档',
    };

    var galleryThumbs = null;
    var galleryThumbs2 = null;
    function showArticle(eventId) {
        layer.load();
        $.ajax({
            type: 'POST',
            url: '${WECHAT_DOMAIN!''}/wap/xiongAn/CommonEvent/updaterListDetail.mhtml',
            data: {
                id: eventId
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                    $('.pbr20.djyl-zwgk-bottom-bor.mrr50').remove();
                    if (galleryThumbs != null) {
                        galleryThumbs.destroy();
                        galleryThumbs = null;
                    }
                    if (galleryThumbs2 != null) {
                        galleryThumbs2.destroy();
                        galleryThumbs2 = null;
                    }

                    var files = {
                        ...data.bo.imageList,
                        ...data.attas,
                        ...data.attasAfter,
                    };

                    var fileShowArea = '';
                    var filePreview = '';
                    var hide = '';
                    if (files) {
                        for (var i in files) {
                            var pathArr = files[i].path.split('.');
                            if ("bmp|jpg|jpeg|png|gif".indexOf(pathArr[pathArr.length - 1].toLowerCase()) > -1) {
                                fileShowArea += '<div class="swiper-slide img100"><img src="${FILE_URL!''}' + files[i].path +'"></div>';
                                filePreview += '<div class="swiper-slide img100"><img src="${FILE_URL!''}' + files[i].path +'"></div>';
                            } else if ("mp4|mp3|wav".indexOf(pathArr[pathArr.length - 1].toLowerCase()) > -1) {
                                fileShowArea += (
                                    '<div class="swiper-slide img100">' +
                                    '   <video src="${FILE_URL!''}' + files[i].path +'"' +
                                    '       type="application/x-shockwave-flash"' +
                                    '       style="width: 100%; height: 100%;" controls="controls"' +
                                    '       autostart="false" loop="true"/>' +
                                    '</div>'
                                );
                                filePreview += ('<div class="swiper-slide img100"><img src="${uiDomain!''}/web-assets/_jzfp/shandong/pages/blue/images/sd-zwtp.png"></div>');
                            }
                        }
                    } else {
                        hide = ' display: none;';
                    }
                    $('#content').html(
                        '<div class="xc-details-top clearfix" style="width: calc(100% - 35px);' + hide + '">' +
                        '    <div class="xc-dt-left fl clearfix" style="width: 100%;">' +
                        '        <div class=" gallery-left fl" style="width: calc(100% - 100px);">' +
                        '            <div class="swiper-container" style="width: 50%; margin: auto;">' +
                        '                <div class="swiper-wrapper" id="fileShowArea">' + fileShowArea + '</div>' +
                        '            </div>' +
                        '        </div>' +
                        '        <div class="gallery-right fl">' +
                        '            <a href="javascript:void(0);" class="gallery-right-pre text-align-c">' +
                        '                <i class="layui-icon layui-icon-up cor-fff font-size-24"></i>' +
                        '            </a>' +
                        '            <a href="javascript:void(0);" class="gallery-right-next text-align-c">' +
                        '                <i class="layui-icon layui-icon-down cor-fff font-size-24"></i>' +
                        '            </a>' +
                        '            <div class="swiper-container">' +
                        '                <div class="swiper-wrapper" id="filePreview">' + filePreview + '</div>' +
                        '            </div>' +
                        '        </div>' +
                        '    </div>' +
                        '</div>' +
                        '<div class="standard-details-title-ext1 mt15 clearfix">' +
                        '    <i class="fl"></i>' +
                        '    <p class="font-size-18 cor-3d7be6 text-lh1 fl font-bold">基本信息</p>' +
                        '</div>' +
                        '<div class="mt15 check-table">' +
                        '    <table class="layui-table layui-table-nohover">' +
                        '        <colgroup>' +
                        '            <col width="180px">' +
                        '            <col width="auto">' +
                        '            <col width="180px">' +
                        '            <col width="auto">' +
                        '        </colgroup>' +
                        '        <tbody>' +
                        '        <tr>' +
                        '            <td>时间</td>' +
                        '            <td>' + (data.bo.hpTimeStr || '') + '</td>' +
                        '            <td>地址</td>' +
                        '            <td>' + (data.bo.hpAddr || '') + '</td>' +
                        '        </tr>' +
                        '        <tr>' +
                        '            <td>上报人</td>' +
                        '            <td>' + (data.bo.userName || '') + '</td>' +
                        '            <td>状态</td>' +
                        '            <td>' + (statusMap[data.bo.status] || '') + '</td>' +
                        '        </tr>' +
                        '        </tbody>' +
                        '    </table>' +
                        '</div>' +
                        '<div class="jd-introduce">' + (data.bo.content || '') + '</div>'
                    );

                    if (files) {
                        // 轮播图
                        galleryThumbs = new Swiper('.gallery-right .swiper-container', {
                            spaceBetween: 3,
                            slidesPerView: 4,
                            direction: 'vertical',
                            // freeMode: true,
                            watchSlidesVisibility: true,
                            watchSlidesProgress: true,
                        });
                        galleryThumbs2 = new Swiper('.gallery-left .swiper-container', {
                            spaceBetween: 3,
                            allowTouchMove: false,
                            direction: 'vertical',
                            navigation: {
                                nextEl: '.gallery-right-next',
                                prevEl: '.gallery-right-pre',
                                disabledClass: 'gallery-right-disabled',
                            },
                            thumbs: {
                                swiper: galleryThumbs
                            }
                        });
                    }
                }
                layer.closeAll();
            },
            error: function () {
                console.log("获取详情数据连接超时！");
            },
            complete: function () {
            }
        });
    }
</script>