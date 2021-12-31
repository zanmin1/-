<#--主题党日-->
<script>
    function findNoticeList() {
		$('.xq-lunbo-box').hide();
        $.ajax({
            type: 'POST',
			url : "${eventDomain}/zhsq/event/eventDisposal4OuterController/fetchEventData4Jsonp.json?jsonpcallback=?&t="+Math.random(),
            data: {
                infoOrgCode: "${orgCode!''}",
                page: 1,
                rows: 20
            },
            dataType: 'jsonp',
            success: function (data) {
                if (data && data.list && data.list.length > 0) {
                    var rows = data.list;
                    // 预加载一篇文章
                    showArticle(rows[0].eventId,rows[0].eventName);

                    $('#list').append(
                        '<div class="swiper-slide">' +
                        '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + rows[0].eventId + ',\''+ rows[0].eventName +'\')" style="cursor: pointer;">' +
                        '       <div class="w100 clearfix">' +
                        '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + rows[0].eventName + '</span>' +
                        '               <span class="fr font-size-r14 cor-999 let-sp1">' + rows[0].handleDateStr + '</span>' +
                        '           </div>' +
                        '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + rows[0].urgencyDegreeName + '</p>' +
                        '   </li>' +
                        '</div>'
                    );
                    console.log($('.djyl-100-h275').height());
                    console.log($('.djyl-100-h275').height());
                    var page = 7;
                   //var page = Math.ceil($('.djyl-100-h275').height() / $('.djyl-zwgk-bottom-bor').height());

                    $('#list').empty();
                    if (rows.length <= page) {
                        $('#parentList').empty();
                    }
                    for (var i = 0; i < rows.length; i++) {
                        if('${infoOpenId}' != ''){
                            if(rows[i].eventId == '${infoOpenId}')
                            showArticle(rows[i].eventId,rows[i].eventName);
                        }
                        var item = rows[i];
                        if (rows.length > page) {
                            $('#list').append(
                                '<div class="swiper-slide">' +
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.eventId + ',\''+ item.eventName +'\')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.eventName + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.handleDateStr + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.urgencyDegreeName + '</p>' +
                                '   </li>' +
                                '</div>'
                            );
                        } else {
                            $('#parentList').append(
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.eventId + ',\''+ item.eventName +'\')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.eventName + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.handleDateStr + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.urgencyDegreeName + '</p>' +
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
                            slidesPerView: 7,
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

    function showArticle(eventId,eventName) {
                        var str = '<iframe scrolling=\"auto\" allowtransparency=\"true\" '
                            + ' frameborder=\"0\" src=\"${eventDomain!''}/zhsq/event/eventDisposalController/detailEvent.jhtml?eventType=all&workFlowId=&eventId='+eventId+'&model=c&cachenum=0.7944021639335552" style=\"width:100%;height: 98%;\"></iframe>';
                        $('#content').html(str);
                    $('#title').html(eventName);
    }

</script>