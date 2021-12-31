<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>积分银行</title>
    
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-comm.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-3.css" />

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>

    <!-- “更多”配置。 -->
    <#include "/dcl/szsh/more_function.ftl" />

    <script>
        var winW, whdef, rem;
        function fullPage() { //将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef; // 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }
        fullPage();
        window.onresize = fullPage;
    </script>
</head>

<body>
    <div class="h100  szsh-bj plr20 ptr20 pbr20 bs">
        <div class="h100 prr20 clearfix h-x posi-rela">
            <!-- 积分规则 + 活动。 -->
            <div class="h926 jfyh-left main-div-box fl bs plr28 prr40">
                <!-- 大标题 -->
                <div class="comm-div-title-big flex flex-ac">
<#--                    <a href="javascript:void(0);" class="fl comm-back-ext1 flex flex-ac">-->
<#--                        <i></i>-->
<#--                        <p class="font-size-r18 cor-d62a1e fl text-lh1"  onclick="window.history.back();">返回</p>-->
<#--                    </a>-->
<#--                    <i class="comm-line-ext1"></i>-->
                    <div class="comm-subject-title-ext1 plr5 bs">
                        <p class="font-size-r20 line-height-r48 text-align-c plr10 prr10 bs cor-fff font-bold">积分银行</p>
                    </div>
                </div>

                <!-- 积分规则。 -->
                <div class="jfyh-l-top plr12 bs mtr40 clearfix posi-rela" id="jfgz">
                    <div class="jfyh-lt-pic fl img100 posi-rela" id="integralRuleImage">
                        
                    </div>
                    <div class="jfyh-lt-text fr h-x prr5 bs" id="integralRule">
                        <p class="font-size-r20 font-bold cor-333">积分规则</p>

                    </div>
                </div>

                <!-- 活动。 -->
                <div class="jfyh-l-bottom bs mtr30" id="hd">
                    <div class="comm-title-ext1 clearfix bs posi-rela">
                        <div class="comm-te1-item h100 bs plr5 prr5 fl posi-rela active" style="cursor: default">
                            <p class="font-size-r20 font-bold cor-333 line-height-r59">乡村活动</p>
                        </div>
<#--                        <div class="comm-te1-item h100 bs plr5 prr5 fl posi-rela mlr30">-->
<#--                            <p class="font-size-r20 font-bold cor-333 line-height-r59 text-align-c">志愿者活动</p>-->
<#--                        </div>-->
<#--                        <div class="comm-pre-next-box posi-abso clearfix">-->
                    </div>
                    <div class="jfyh-lb-content">
                        <!-- 乡村活动 -->
                        <div class="jfyh-lbc-item clearfix" id="villageActivities">

                        </div>
<#--                        <!-- 志愿者活动 &ndash;&gt;-->
<#--                        <div class="jfyh-lbc-item clearfix hide" id="volunteerActivities">-->

<#--                        </div>-->
                    </div>
                </div>
            </div>

            <!-- 积分排名。 -->
            <div class="h926 jfyh-right fr">
                <div class="jfyh-r-top main-div-box">
                    <!-- 小标题 -->
                    <div class="clearfix">
                        <div class="comm-div-title font-size-0 fl">
                            <em class="font-size-r16 cor-d62a1e font-bold plr15">积分排名</em>
                        </div>
                    </div>
                    <div class="jfyh-rt-ranking mtr30 plr40 prr40 bs">
                        <div class="jfyh-rtr-top">
                            <table class="jfyh-table-ext1">
                                <colgroup>
                                    <col style="width: 1.5rem;">
                                    <col style="width: auto;">
<#--                                    <col style="width: 1.5rem;">-->
                                    <col style="width: 2rem;">
                                    <col style="width: 2rem;">
                                </colgroup>
                                
                                <thead>
                                    <th></th>
<#--                                    <th>姓名</th>-->
                                    <th>手机号</th>
                                    <th>积分</th>
                                    <th>参与活动次数</th>
                                </thead>
                                
                                <tbody id="scoreRanking">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 积分商城。 -->
                <div class="jfyh-r-bottom main-div-box mtr10" id="jfsc">
                    <!-- 小标题 -->
                    <div class="clearfix">
                        <div class="comm-div-title font-size-0 fl">
                            <em class="font-size-r16 cor-d62a1e font-bold plr15">积分商城</em>
                        </div>
                        <span class="font-size-r14 cor-d62a1e font-bold prr15 mtr10 fr cursor" onclick="turnToView('pointsMall', '')"><em>更多</em><i class="comm-jt mlr5"></i></span>
                    </div>
                    <div class="jfyh-rb-content clearfix plr40" id="pointsMall">

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="contextMenu" id="rightClickMenu" style="display:none;">
        <ul>
            <li id="item_1">栏目配置</li>
            <li id="item_2">刷新</li>
        </ul>
    </div>

<script>
    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };
    // 更多功能点击事件
    $('.szsh-mbc-content').on('click', '.szsh-mbcc-item', function() {
        $(this).addClass('active').siblings().removeClass('active');
    });
    // 更多功能收起和展开事件
    $('.szsh-more-closed').click(function() {
        $(this).parents('.szsh-mb-content').animate({right:"-1.14rem"}, 'linear', function() {
            $('.szsh-m-box').removeClass('hide');
        })
    });
    $('.szsh-m-box').click(function() {
        $('.szsh-m-box').addClass('hide');
        $(this).siblings('.szsh-mb-content').animate({right:".1rem"}, 'linear')
    });

    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: false
    });
    $('.comm-title-ext1').on('click', '.comm-te1-item', function() {
        $(this).addClass('active').siblings('.comm-te1-item').removeClass('active');
        var itemIndex = $(this).index();
        $('.jfyh-lb-content').children('.jfyh-lbc-item').eq(itemIndex).removeClass('hide').siblings().addClass('hide');
    });

    findNoticeList('10000016');   // 积分规则。
    function findNoticeList(catalogId) {
        let	url = '${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';

        let map = {
            orgCode: '${regionCode!''}',
            page: 1,
            rows: 1
        };
        map.catalogId = catalogId;
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';

        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                let listData = data.rows;

                // 积分规则。
                if (catalogId === '10000016') {
                    if (listData.length > 0) {
                        // 积分规则图片。
                        let image = '<div class="posi-abso w100 h100 comm-zwtp flex flex-ac flex-jc">' +
                                    '<img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp.png">' +
                                    '</div>';
                        if (listData[0].fileName) {
                            image = '<img src="${imgDomain}' + listData[0].fileName + '">';
                        }

                        $('#integralRuleImage').html(image);

                        // 获取积分规则内容。
                        let ids = listData[0].infoOpenId;
                        getIntegralRuleContentData(ids, listData);
                    }
                }
            },
            error: function(err) {
                console.log("获取积分规则列表数据连接超时！");
            },
            complete: function() {
            }
        });
    }

    // 积分规则内容。
    function getIntegralRuleContentData(ids, listData) {
        $.ajax({
            type: 'POST',
            url: '${gbpDomain!''}/gbp/commonInfoOpen/getOverViewByIdsForJsonp.json',
            data: {
                ids: ids,
                regionCode: '${regionCode!''}'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                let overViewList = [];
                for (let j in data) {
                    overViewList.push(data[j]);
                }

                let overView = overViewList[0];
                overView = overView ? overView.replace(/<[^>]+>/g, '') : '暂无内容。';

                // 积分规则内容，更多。
                let html = '<p class="font-size-r14 cor-3b3b3b line-height-r22 mtr15"><span class="cor-222222 font-bold">' + strInfo(listData[0].title) +
                    '：</span>' + overView + '<a href="javascript:void(0);" class="jfyh-text-more" ' +
                    'onclick="turnToView(\'integralRule\', \'' + listData[0].infoOpenId + '\')">[更多]</a></p>';
                $('#integralRule').append(html);
            },
            error: function(data) {
                console.log('获取积分规则内容数据连接超时！');
            },
            complete: function() {
            }
        });
    }

    // 更多。
    function turnToView(type, infoOpenId) {
        let url;

        // 积分规则。
        if (type === 'integralRule') {
            url = '${gbpDomain!''}/gbp/commonInfoOpen/homeShow.jhtml?catalogId=10000016&infoOpenId=' + infoOpenId;

        // 乡村活动。
        } else if (type === 'villageActivities') {
            url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=乡村活动&module=' + type + '&infoOpenId=' + infoOpenId;

        // 志愿者活动。
        } else if (type === 'volunteerActivities') {
            url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=志愿者活动&module=' + type + '&infoOpenId=' + infoOpenId;

        // 积分商城。
        } else if (type === 'pointsMall') {
            url = '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&title=积分商城&module=' + type + '&infoOpenId=' + infoOpenId;
        }

        window.open(url);   // 打开新窗口。
    }

    // 积分排名。
    function getScoreRankingData(activitiesNumber) {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/integralBank/getScoreRankingData.jhtml',
            data: {
                orderNum: '5',   // 前几。
                type: '1',   // 1-月度，2-年度。
                tableType: 'ZONE_USER_INTEGRAL',   // 模块编码。
                orgCode: '${regionCode!''}',   // 地域编码。
                setSearchDate: new Date().getFullYear()   // 查询时间段。
            },
            success: function(data) {
                if (data.length > 0) {
                    let str = '';
                    
                    for (let i = 0; i < data.length; i++) {
                        // 第二次限制，只取前五条。
                        if (i <= 4) {
                            str += '<tr>' +
                                '<td>NO.' + (i + 1) + '</td>' +
                                // '<td>' + data[i].nickname + '</td>' +  // 姓名。
                                '<td>' + data[i].mobile + '</td>' +  // 手机号。
                                '<td>' + data[i].scoreTotal + '</td>' +   // 积分。
                                '<td>' + activitiesNumber + '</td>' +   // 参与活动次数。
                                '</tr>';
                        } else {
                            break;
                        }
                    }

                    $('#scoreRanking').empty();
                    $('#scoreRanking').html(str);
                }
            },
            error: function(err) {
                console.log("获取积分排名数据连接超时！");
            },
            complete: function() {
            }
        });
    }

    // 乡村活动，志愿者活动。
    getActivitiesData('villageActivities');
    // getActivitiesData('volunteerActivities');
    function getActivitiesData(type) {
        let url;
        if (type === 'villageActivities') {
            url = '${weChatDomain!''}/web/volunteer/activity/getActivityPageDataForJsonp.json?jsonpcallback=""';
        } else if (type === 'volunteerActivities') {
            url = '${weChatDomain!''}/web/volunteer/activity/getActivityPageDataForJsonp.json?jsonpcallback=""';
        }

        let map = {
            actType: '3',
            page: 1,
            rows: 5,
            regionCode: '${regionCode!''}'
        };

        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                if (data) {
                    let listData = data.list;

                    getScoreRankingData(listData.length || 0);   // 积分排名。

                    if (listData.length > 0) {
                        let str = '';

                        for (let i = 0; i < listData.length; i++) {
                            // 框间距。
                            if (i === 0) {   // 第一个活动。
                                str += '<div class="jfyh-lbci-itme fl" onclick="turnToView(\''+ type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                            } else if (i >= 1 && i <= 2) {   // 第二到三个活动。
                                str += '<div class="jfyh-lbci-itme fl mlr30" onclick="turnToView(\''+ type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                            } else if (i === 3) {   // 第四个活动。
                                str += '<div class="jfyh-lbci-itme fl mtr40" onclick="turnToView(\''+ type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                            } else {   // 第五个活动。
                                str += '<div class="jfyh-lbci-itme fl mlr30 mtr40" onclick="turnToView(\''+ type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                            }

                            // 活动图片。
                            let image = '<div class="posi-abso w100 h100 comm-zwtp1 flex flex-ac flex-jc">' +
                                '<img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp1.png">' +
                                '</div>';
                            if (listData[i].attPath) {
                                image = '<img src="' + '${imgDomain}' + listData[i].attPath + '">';
                            }

                            str += '<div class="jfyh-lbcii-pic w100 img100 posi-rela">' +
                                image +
                                '</div>' +
                                '<p class="jfyh-lbcii-text font-size-r16 cor-333 text-lh1 text-line-c1 plr5 prr5 bs" title="' + strInfo(listData[i].title) + '">' + strInfo(listData[i].title) + '</p>' +
                                '</div>';
                        }

                        // 查看全部活动。
                        if (listData.length >= 1 && listData.length <= 2) {   // 第一到二个活动。
                            str += '<div class="jfyh-lbci-itme fl mlr30" onclick="turnToView(\''+ type + '\', \'\')">';
                        } else if (listData.length === 3) {   // 第三个活动。
                            str += '<div class="jfyh-lbci-itme fl mtr40" onclick="turnToView(\''+ type + '\', \'\')">';
                        } else {   // 第四到五个活动。
                            str += '<div class="jfyh-lbci-itme fl mlr30 mtr40" onclick="turnToView(\''+ type + '\', \'\')">';
                        }
                        str += '<div class="jfyh-lbcii-all w100 img100">' +
                            '<p>查看全部活动</p>' +
                            '</div>' +
                            '</div>';

                        if (type === 'villageActivities') {
                            $('#villageActivities').empty();
                            $('#villageActivities').html(str);
                        } else if (type === 'volunteerActivities') {
                            $('#volunteerActivities').empty();
                            $('#volunteerActivities').html(str);
                        }
                    }
                }
            },
            error: function(err) {
                console.log("获取活动列表数据连接超时！");
            },
            complete: function() {
            }
        });
    }

    // 积分商城。
    getPointsMallData();
    function getPointsMallData() {
        let url = '${gbpDomain!''}/admin/integralCommodity/listDataForJsonp.json?jsonpcallback=""';

        let map = {
            page: 1,
            rows: 5,
            regionCode: '${regionCode!''}'
        };

        $.ajax({
            type: 'POST',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function(data) {
                if (data) {
                    let listData = data.rows;

                    if (listData.length > 0) {
                        let str = '';

                        for (let i = 0; i < listData.length; i++) {
                            // 商品图片。
                            let image = '<div class="posi-abso w100 h100 comm-zwtp1 flex flex-ac flex-jc">' +
                                '<img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/zwtp1.png">' +
                                '</div>';
                            if (listData[i].imgPath) {
                                image = '<img src="' + '${imgDomain}' + listData[i].imgPath + '">';
                            }

                            // 商品积分。
                            let integral = listData[i].integral || 0;

                            str += '<div class="mtr20 mrr40 jfyh-rbc-item fl bs" onclick="turnToView(\'pointsMall\', \'' + listData[i].commodityId + '\')" style="cursor:pointer;">' +
                                '<div class="jfyh-rbci-pic img100 posi-rela">' +
                                image +
                                '</div>' +
                                '<div class="plr10 prr10 bs jfyh-rbci-bottom flex flex-clm flex-jc">' +
                                '<p class="font-size-r14 w100 text-lh1 cor-333 text-line-c1" title="' + strInfo(listData[i].commodityName) + '">' + strInfo(listData[i].commodityName) + '</p>' +
                                '<p class="jfyh-rbcib-text2 font-size-r14 w100 text-lh1 cor-d52a1e">' + integral + '积分</p>' +
                                '</div>' +
                                '</div>';
                        }

                        $('#pointsMall').empty();
                        $('#pointsMall').html(str);
                    }
                }
            },
            error: function(err) {
                console.log("获取积分商城列表数据连接超时！");
            },
            complete: function() {
            }
        });
    }

    // 处理字符串
    function strInfo(str, str1) {
        if (str != null && str != 'null' && typeof (str) != 'undefined') {
            return str;
        } else {
            if (str1 != null && str1 != undefined) {
                return str1;
            } else {
                return "";
            }
        }
    }

    // 积分规则。
    bindRightMouse('jfgz');
    // 活动。
    bindRightMouse('hd');
    // 积分商城。
    bindRightMouse('jfsc');

    // 绑定右键
    function bindRightMouse(id) {
        var type;
        $('#' + id).contextMenu('rightClickMenu', { //菜单样式
            menuStyle: {
                border: 'none',
                width: 'auto',
                padding: '0',
                borderRadius: '4px'

            }, //菜单项样式
            itemStyle: {
                fontSize: '14px',
                color: '#666',
                padding: '5px 15px',
                fontWeight: 'normal',
                border: 'none',
                borderRadius: '4px',
                backgroundColor: 'rgba(189, 173, 173, 0.3)',
                marginTop: '2px'
            }, //菜单项鼠标放在上面样式
            itemHoverStyle: {
                color: '#333 ',
                fontWeight: 'bold',
                backgroundColor:'none',
                border: 'none'
            }, //事件
            bindings: {
                'item_1': function(t) {
                    switch(t.id) {
                        // 积分规则 + 活动。
                        case 'jfgz':
                            type = 21;
                            break;

                        // 活动。
                        case 'hd':
                            type = 22;
                            break;

                        // 积分商城。
                        case 'jfsc':
                            type = 23;
                            break;

                        default:
                            type = 2;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                },
                'item_2': function(t) {
                    location.reload();
                }
            }
        });
    }
</script>
</body>
</html>