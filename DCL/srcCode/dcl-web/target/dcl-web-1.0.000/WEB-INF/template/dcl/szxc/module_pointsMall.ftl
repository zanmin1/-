<#-- 积分商城。 -->
<script>
    findNoticeList();
    function findNoticeList() {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/admin/integralCommodity/listDataForJsonp.json?jsonpcallback=""',
            data: {
                page: 1,
                rows: 20,
                regionCode: ${regionCode!''}
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    var rows = data.rows;
                    showArticle('${infoOpenId}' == '' ? rows[0].commodityId : '${infoOpenId}');
                    var countImg = 0;
                    for (let i = 0; i < rows.length; i++) {
                        var item = rows[i];
                        if (item.imgPath) {
                            countImg ++;
                            $('#imgList').append(
                                '<div class="swiper-slide">' +
                                '   <div class="w100 h100 img100">' +
                                '       <img src="${FILE_URL!''}' + item.imgPath + '" alt="" onclick="showArticle(' + item.commodityId + ')">' +
                                '   </div>' +
                                '</div>'
                            );
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
                        '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + rows[0].commodityId + ')" style="cursor: pointer;">' +
                        '       <div class="w100 clearfix">' +
                        '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + rows[0].commodityName + '">' + rows[0].commodityName + '</span>' +
                        '               <span class="fr font-size-r14 cor-999 let-sp1">' + rows[0].createTime.substring(0, 10) + '</span>' +
                        '           </div>' +
                        '       <p class="text-line-c1 font-size-r14 cor-666 mtr10" title="' + rows[0].integral + '积分' + '">' + rows[0].integral + '积分' + '</p>' +
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
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.commodityId + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + rows[0].commodityName + '">' + item.commodityName + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.createTime.substring(0, 10) + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10" title="' + rows[0].integral + '积分' + '">' + item.integral + '积分' + '</p>' +
                                '   </li>' +
                                '</div>'
                            );
                        } else {
                            $('#parentList').append(
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.commodityId + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + rows[0].commodityName + '">' + item.commodityName + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.createTime.substring(0, 10) + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10" title="' + rows[0].integral + '积分' + '">' + item.integral + '积分' + '</p>' +
                                '   </li>'
                            );
                        }

                        // 详情初始化。
                        if ('${infoOpenId!''}' == item.commodityId) {
                            showArticle(item.commodityId);
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

    function showArticle(commodityId) {
        layer.load();
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/admin/integralCommodity/viewForJsonp.jhtml?jsonpcallback=""',
            data: {
                id: commodityId,
                regionCode: ${regionCode!''}
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                    let image = '<img src="${UI_DOMAIN!''}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png">';
                    if (data.imgPath) {
                        image = '<img src="${FILE_URL!''}' + data.imgPath + '" style="width:1000px; height:500px;">';
                    }

                    var str='<div class="font-size-r14 cor-666 mtr10">图片：</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" style="text-align:center;">' + image + '</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;width:50%;">积分：'+ data.integral +'</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;width:50%;">数量：'+ data.num +'</div>'
                        +'<div class="font-size-r14 cor-666 mtr10">已兑换数量：'+ data.redeemedNum +'</div>'
                        +'<div class="font-size-r14 cor-666 mtr10">备注：'+ data.remake +'</div>';
                    $('#content').html(str);
                    $('#title').html(data.commodityName);
                    $('#source').html('<em>' + data.createTime + '</em>');
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