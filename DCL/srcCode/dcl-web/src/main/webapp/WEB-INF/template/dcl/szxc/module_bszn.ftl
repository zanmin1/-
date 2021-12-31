<#--主题党日-->
<script>
    function findNoticeList() {
		$('.xq-lunbo-box').hide();
        $.ajax({
            type: 'POST',
			url :'${WECHAT_DOMAIN!''}/cct/handlingMatters/listDataForJsonp.json?jsonpcallback=""',
            data: {
                orgCode: "${orgCode!''}",
                page: 1,
                rows: 20
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && data.rows && data.rows.length > 0) {
                    var rows = data.rows;
                    showArticle('${infoOpenId}' == '' ? rows[0].hmId : '${infoOpenId}');

                    $('#list').append(
                        '<div class="swiper-slide">' +
                        '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + rows[0].hmId + ')" style="cursor: pointer;">' +
                        '       <div class="w100 clearfix">' +
                        '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + rows[0].mattersName + '</span>' +
                        '               <span class="fr font-size-r14 cor-999 let-sp1">' + rows[0].createTimeStr + '</span>' +
                        '           </div>' +
                        '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + rows[0].mattersTypeCN + '</p>' +
                        '   </li>' +
                        '</div>'
                    );
					var page = 7;
                   // var page = Math.ceil($('.djyl-100-h275').height() / $('.djyl-zwgk-bottom-bor').height());

                    $('#list').empty();
                    if (rows.length <= page) {
                        $('#parentList').empty();
                    }
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i];
                        if (rows.length > page) {
                            $('#list').append(
                                '<div class="swiper-slide">' +
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.hmId + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.mattersName + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.createTimeStr + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.mattersTypeCN + '</p>' +
                                '   </li>' +
                                '</div>'
                            );
                        } else {
                            $('#parentList').append(
                                '   <li class="mtr15 pbr15 djyl-zwgk-bottom-bor" onclick="showArticle(' + item.hmId + ')" style="cursor: pointer;">' +
                                '       <div class="w100 clearfix">' +
                                '           <span class="font-size-r17 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span font-bold">' + item.mattersName + '</span>' +
                                '               <span class="fr font-size-r14 cor-999 let-sp1">' + item.createTimeStr + '</span>' +
                                '           </div>' +
                                '       <p class="text-line-c1 font-size-r14 cor-666 mtr10">' + item.mattersTypeCN + '</p>' +
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

    function showArticle(hmId) {
        layer.load();
        $.ajax({
            type: 'POST',
            url: '${WECHAT_DOMAIN!''}/cct/handlingMatters/detailForJsonp.json?jsonpcallback=""',
            data: {
                hmId: hmId
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data) {
                	var str ='';
                	str='<div class="font-size-r14 cor-666 mtr10">事项大类：'+ data.mattersTypeCN +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">办理方式：'+ data.handleMethodCN +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">办理地点：'+ data.handleAddr +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">受理条件：'+ data.acceptingConditions +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">办理时间：'+ data.handleTimeDec +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">办理单位：'+ data.handleUnitName +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">办理流程：'+ data.handleProcess +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;width:50%;">办件类型：'+ data.dealTypeCN +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;">申请方式：'+ data.applyWayCN +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;width:50%;">处理时限：'+ data.processTime +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10" style="display:inline-block;">咨询电话：'+ data.telphone +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">申请材料：'+ data.applyMaterial +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">收费情况：'+ data.chargeSituation +'</div>'
                		+'<div class="font-size-r14 cor-666 mtr10">办理依据：'+ data.applyAccording +'</div>';
                    $('#content').html(str);
                    $('#title').html(data.mattersName);
                    $('#source').html('<em>' + data.createTimeStr + '</em>');
                }
                layer.closeAll();
            },
            error: function () {
                console.log("获取村情介绍数据连接超时！");
            },
            complete: function () {
            }
        });
    }

</script>