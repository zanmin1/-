<#-- 三会一课 -->
<style>
    .xq-neir-hei {
        height: 100% !important;
    }
</style>
<script>
    function initListUseSwiper(rows) {
        var countImg = 0;
        $('#parentList').append(
            '<div class="swiper-container swiper02 w100 h100">' +
            '   <div class="swiper-wrapper" id="list"></div>' +
            '</div>'
        );
        for (var i = 0; i < rows.length; i++) {
            var item = rows[i];
            $('#list').append(
                '<div class="swiper-slide djyl-zwgk-bottom-bor">' +
                '   <li class="mtr15 pbr15" ' +
                '       onclick="showArticle(\'' + item.id + '\')" style="cursor: pointer;">' +
                '       <div class="w100 clearfix">' +
                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + item.title + '">' + item.title + '</span>' +
                '               <span class="fr font-size-r14 cor-999 let-sp1"></span>' +
                '           </div>' +
                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + (item.typeName || '') + '</p>' +
                '   </li>' +
                '</div>'
            );
            if (item.attachement) {
                countImg++;
                $('#imgList').append(
                    '<div class="swiper-slide">' +
                    '   <div class="w100 h100 flex flex-jc flex-ac">' +
                    '       <img style="max-width:100%;max-height:100%;display:block;" src="${FILE_URL!''}' + item.photoPath + '" alt="" onclick="showArticle(\'' + item.id + '\')">' +
                    '   </div>' +
                    '</div>'
                );
            }
        }
        return countImg;
    }

    function initListNoUseSwiper(rows) {
        var countImg = 0;
        for (var i = 0; i < rows.length; i++) {
            var item = rows[i];
            $('#parentList').append(
                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(\'' + item.id + '\')" style="cursor: pointer;">' +
                '       <div class="w100 clearfix">' +
                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold" title="' + item.title + '">' + item.title + '</span>' +
                '               <span class="fr font-size-r14 cor-999 let-sp1"></span>' +
                '           </div>' +
                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + (item.typeName || '') + '</p>' +
                '   </li>'
            );
            if (item.attachement) {
                countImg++;
                $('#imgList').append(
                    '<div class="swiper-slide">' +
                    '   <div class="w100 h100  flex flex-jc flex-ac">' +
                    '       <img style="max-width:100%;max-height:100%;display:block;" src="${FILE_URL!''}' + item.photoPath + '" alt="" onclick="showArticle(\'' + item.id + '\')">' +
                    '   </div>' +
                    '</div>'
                );
            }
        }
        return countImg;
    }

    function findNoticeList() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/bizMeeting/listDataJSONP.json?jsoncallback=loadListData',
            data: {
                regionCode: "${regionCode!''}",
                page: 1,
                rows: 9999,
            },
            dataType: 'jsonp',
        });
    }

    findNoticeList();

    function loadListData(data) {
        if (data && data.rows && data.rows.length > 0) {
            var rows = data.rows;
            // 先添加一条记录，计算每条记录的高度
            $('#list').append(
                '<div class="swiper-slide">' +
                '   <li class="mtr15 pbr15" onclick="showArticle(\'' + rows[0].id + '\')" style="cursor: pointer;">' +
                '       <div class="w100 clearfix">' +
                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + rows[0].title + '</span>' +
                '               <span class="fr font-size-r14 cor-999 let-sp1"></span>' +
                '           </div>' +
                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + (rows[0].typeName || '') + '</p>' +
                '   </li>' +
                '</div>'
            );
            // 每个swiper-slide允许的最大记录条数
            var pageSize = 7;
            //var pageSize = Math.ceil($('.djyl-100-h275').height() / ($('#list').find('li').height() + 24));

            // 清空list，重新添加
            $('#list').empty();
            $('#parentList').empty();
            var countImg;
            if (rows.length <= pageSize) {
                countImg = initListNoUseSwiper(rows);
            } else {
                countImg = initListUseSwiper(rows);
                var mySwiper02 = new Swiper('.swiper02', {
                    autoplay: {
                        delay: 3000,
                        stopOnLastSlide: true,
                        disableOnInteraction: false,
                    },//可选选项，自动滑动
                    direction: 'vertical',
                    loop: true,
                    slidesPerView: pageSize,
                    observer: true, //修改swiper自己或子元素时，自动初始化swiper
                    observeParents: true //修改swiper的父元素时，自动初始化swiper
                });
                $('.djyl-100-h275').hover(function () {
                    mySwiper02.autoplay.stop();
                }, function () {
                    mySwiper02.autoplay.start();
                });
            }

            // 有两张及以上的图片，开启轮播
            if (countImg < 2) {
                $('.page-help').hide();
                if (countImg == 0) {
                    $('#imgList').append('<div class="swiper-slide">' +
                        '   <div class="w100 h100  flex flex-jc flex-ac">' +
                        '       <img style="max-width:100%;max-height:100%;display:block;" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png">' +
                        '   </div>' +
                        '</div>'
                    );
                }
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

            // 预加载一篇文章
            showArticle('${infoOpenId}' == '' ? rows[0].id : '${infoOpenId}');
        }
    }


    // function createIframe(id, url, width, height, onLoadCallback, timeOut, timeOutCallback) {
    //     var timeOutVar = setTimeout(function () {
    //         clearTimeout(timeOutVar);
    //         timeOutCallback.apply(this, arguments);
    //         return;
    //     }, timeOut);
    //     var iframe = document.createElement("iframe");
    //     iframe.id = id;
    //     iframe.width = width;
    //     iframe.height = height;
    //     iframe.src = url;
    //     if (iframe.attachEvent) {
    //         iframe.attachEvent("onload", function () {
    //             clearTimeout(timeOutVar);
    //             onLoadCallback.apply(this, arguments);
    //         });
    //     } else {
    //         iframe.onload = function () {
    //             clearTimeout(timeOutVar);
    //             onLoadCallback.apply(this, arguments);
    //         };
    //     }
    //     document.body.appendChild(iframe);
    //     return iframe;
    // }
    function showArticle(infoOpenId) {
        $('.pbr20.djyl-zwgk-bottom-bor.mrr50').hide();
        $('#contentP').removeClass('prr10').removeClass('plr50').removeClass('ptr30');
        $('#content').removeClass('prr40');
        $('#content').css({'height': '100%'});

        var contentSrc = '${djDomain!''}/dj/bizMeeting/detail.jhtml?type=xczx&id=' + infoOpenId;
        $('#content').html(
            '<iframe scrolling="auto" allowtransparency="true"  frameborder="0" id="contentIframe"' +
            '   style="width: 100%; height: 98%;" ></iframe>'
        );
        $('#contentIframe').attr('src', contentSrc);
    }

</script>