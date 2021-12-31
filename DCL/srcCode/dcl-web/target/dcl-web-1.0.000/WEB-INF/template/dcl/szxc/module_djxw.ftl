<#--党建新闻-->
<script>

    function findNoticeList() {
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/news/listDataForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${regionCode!''}",
                page: 1,
                rows: 999,
                isSend: 2
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                // for (i = 0; i < list.length; i++) {
                //     str += '<div class="swiper-slide" onclick="showNotice(' + list[i].id + ')">'
                //         + '<div class="font-size-0 h100 clearfix line-height-r46">'
                //         + '<span class="fl font-size-r15 cor-333 text-line-c1 sw-span" title="' + list[i].title + '">'
                //         + list[i].title + '</span>'
                //         + '<em class="fr font-size-r15 cor-999">' + list[i].createDate + '</em>'
                //         + '</div>'
                //         + '</div>';
                // }
                // $('#noticePan').html(str);

                if (data && data.rows && data.rows.length > 0) {
                    var rows = data.rows;
                    showArticle('${infoOpenId}' == '' ? rows[0].id : '${infoOpenId}');
                    var countImg = 0;
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i];
                        if (item.coverPath) {
                            countImg ++;
                            $('#imgList').append(
                                '<div class="swiper-slide">' +
                                '   <div class="w100 h100 img100">' +
                                '       <img src="${FILE_URL!''}' + item.coverPath + '" alt="" onclick="showArticle(' + item.id + ')">' +
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
                        '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + rows[0].id + ')" style="cursor: pointer;">' +
                        '       <div class="w100 clearfix">' +
                        '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + rows[0].title + '</span>' +
                        '               <span class="fr font-size-r14 cor-999 let-sp1">' + rows[0].createDate.substr(0, 16) + '</span>' +
                        '           </div>' +
                        '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + rows[0].summary + '</p>' +
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
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.id + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.title + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.createDate.substr(0, 16) + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.summary + '</p>' +
                                '   </li>' +
                                '</div>'
                            );
                        } else {
                            $('#parentList').append(
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.id + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.title + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.createDate.substr(0, 16) + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.summary + '</p>' +
                                '   </li>'
                            );
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

    findNoticeList();

    function showArticle(id) {
        layer.load();
        $.ajax({
            type: 'POST',
            url: '${djDomain!''}/dj/news/noFilter/detail.json',
            data: {
                id: id
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.bo) {
                		var url=data.bo.linkUrl;
                		if(url==''){
                    		$('#content').html(data.bo.content);
                    		$('#title').html(data.bo.title);
                    		$('#source').html('<em>' + data.bo.createDate + '</em>');
                		}else{
                        	var str = '<iframe scrolling=\"auto\" allowtransparency=\"true\" '
                            + ' frameborder=\"0\" src=\"'+ url +'\" style=\"width:100%;height: 102%;\"></iframe>';
                        	$('#contentP').html(str);
                        	$('#contentP').removeClass('prr10');
                        	$('#contentP').removeClass('plr50');
                		}
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