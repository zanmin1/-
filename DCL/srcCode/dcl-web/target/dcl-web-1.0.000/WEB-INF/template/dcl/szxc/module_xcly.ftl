<#--乡村法制-->
<script>
    function initListUseSwiper(rows) {
        var countImg = 0;
        $('#parentList').append(
            '<div class="swiper-container swiper02 w100 h100">' +
            '   <div class="swiper-wrapper" id="list"></div>' +
            '</div>'
        );
        for (let i = 0; i < rows.length; i++) {
            let item = rows[i];

            $('#list').append(
                '<div class="swiper-slide djyl-zwgk-bottom-bor">' +
                '   <li class="mtr15 pbr15" ' +
                //                        productName,productIntroduce,createTimeCN
                '       onclick="showArticle(\'' + item.uuid + '\')" style="cursor: pointer;">' +
                '       <div class="w100 clearfix">' +
                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.productName + '</span>' +
                // '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.pubDate.substr(0, 16) + '</span>' +
                '           </div>' +
                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.productIntroduce + '</p>' +
                '   </li>' +
                '</div>'
            );
            countImg++;
            var photo = '${uiDomain}web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'
            if (item.picUrl) {
                photo = "${$IMG_DOMAIN}" + item.picUrl
            }
            $('#imgList').append(
                '<div class="swiper-slide">' +
                '   <div class="w100 h100 img100">' +
                '       <img src="' + photo + '" alt="" style="cursor: pointer" onclick="showArticle(\'' + item.uuid + '\')">' +
                '   </div>' +
                '</div>'
            );
        }
        return countImg;
    }

    function initListNoUseSwiper(rows) {
        var countImg = 0;
        for (let i = 0; i < rows.length; i++) {
            let item = rows[i];
            var desc = ''
            if(item.attractionsDesc){
                desc = item.attractionsDesc.replace(/<[^>]+>/g, '')
            }
            $('#parentList').append(
                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(\'' + item.uuid + '\')" style="cursor: pointer;">' +
                '       <div class="w100 clearfix">' +
                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.attractionsName||'' + '</span>' +
                // '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.pubDate.substr(0, 16) + '</span>' +
                '           </div>' +
                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + desc + '</p>' +
                '   </li>'
            );
            countImg++;
            var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'
            if (item.picUrl) {
                photo = "${$IMG_DOMAIN}" + item.picUrl
            }
            $('#imgList').append(
                '<div class="swiper-slide">' +
                '   <div class="w100 h100 img100">' +
                '       <img src="' + photo + '" alt="" style="cursor: pointer" onclick="showArticle(\'' + item.uuid + '\')">' +
                '   </div>' +
                '</div>'
            );
        }
        return countImg;
    }

    function findNoticeList() {
        var url = '${rc.getContextPath()}/dcl/attractionsManagement/listData.jhtml'
        $.ajax({
            type: 'post',
            url: url,
            data: {
                orgCode: ${regionCode!''},
                // regionCode: '430725113218',
                issuStatus: 1,
                page: 1,
                rows: 999999
            },
            success: function (data) {
                if (data.rows && data.rows.length > 0) {
                    var rows = data.rows;
                    // 先添加一条记录，计算每条记录的高度
                    var desc = ''
                    if(rows[0].attractionsDesc){
                        desc = rows[0].attractionsDesc.replace(/<[^>]+>/g, '')
                    }
                    $('#list').append(
                        '<div class="swiper-slide">' +
                        '   <li class="mtr15 pbr15" onclick="showArticle(' + rows[0].uuid + ')" style="cursor: pointer;">' +
                        '       <div class="w100 clearfix">' +
                        '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + rows[0].attractionsName + '</span>' +
                        // '               <span class="fr font-size-r14 cor-999 let-sp1">' + rows[0].pubDate.substr(0, 16) + '</span>' +
                        '           </div>' +
                        '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + desc + '</p>' +
                        '   </li>' +
                        '</div>'
                    );
                    // 每个swiper-slide允许的最大记录条数
                    var pageSize = Math.ceil($('.djyl-100-h275').height() / ($('#list').find('li').height() + 24));

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
                    if('${infoOpenId!''}' != ''&& '${infoOpenId!''}' !='undefined') {
                        showArticle('${infoOpenId!''}')
                    }else{
                        showArticle(data.rows[0].uuid)
                    }
                }
            },
            error: function () {
                console.log("获取列表数据连接超时！");
            },
        });
    }

    findNoticeList();

    function showArticle(id) {
        layer.load();
        var url = '${rc.getContextPath()}/dcl/attractionsManagement/detail.json'
        $.ajax({
            type: 'get',
            url: url,
            data: {
                uuid: id
            },
            success: function (data) {
                if (data.bo) {
                    var val = data.bo
                    var photo = '${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png'
                    if (val.picUrl) {
                        photo = "${$IMG_DOMAIN}" + val.picUrl
                    }
                    var desc = ''
                    if(val.attractionsDesc){
                        desc = val.attractionsDesc.replace(/<[^>]+>/g, '')
                    }
                    var str='<div class="font-size-r14 cor-666 mtr10">图片：</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" style="text-align:center;"><img src="' + photo + '" style="width:900px; height:500px;"></div>'
                        +'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;width:50%;">类型：'+ val.attractionsTypeName +'</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;">收费类型：'+ val.chargeTypeName +'</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" >景点描述：</div>'
                        +'<div class="font-size-r14 cor-666 mtr10" >'+ desc +'</div>'
                    $('#content').html(str);
                    $('#title').html(val.attractionsName);
                    // $('#source').html('<em>' + val.createTimeCN + '</em>');//　来源: ' + item.infoOpenId + '
                }
                layer.closeAll();
            },
            error: function () {
                console.log("获取数据连接超时！");
            },
            complete: function () {
            }
        });

    }

</script>