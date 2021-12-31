<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>积分银行</title>
    <#include "/component/layuiCommonHead.ftl" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-cun-comm.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/subject-xiangcunzhili-jfyh.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/mask-taocan.css" />

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
<div class="h100 plr20 ptr20 pbr25 bs">
    <div class="h100 prr20 clearfix h-x posi-rela">
        <!-- 左 -->
        <div class="jfyh-left cun-box-bg-ext2 fl bs plr28 prr40">
            <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
            <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
            <div class="jfyh-l-top plr12 bs mtr40 clearfix posi-rela" id="jfgz">
                <div class="jfyh-lt-pic fl img100 posi-rela">
                    <div class="jfyh-lt-pic fl img100 posi-rela" id="integralRuleImage">

                    </div>
                    <!-- <img src="../../../../../statics/web-assets/_big-screen/00-shuzishenghuo/images/subject/jfyh/jfyh-pic1.png"> -->
                </div>
                <div class="jfyh-lt-text fr h-x prr5 bs" id="integralRule">
                    <p class="font-size-r20 font-bold cor-333 mt15">积分规则</p>

                </div>
            </div>
            <div class="jfyh-l-bottom bs mtr30" id="hd">
                <div class="comm-title-ext1 clearfix bs posi-rela">
                    <div class="comm-te1-item h100 bs plr5 prr5 fl posi-rela active">
                        <p class="font-size-r20 font-bold cor-333 line-height-r59">乡村活动</p>
                    </div>
<#--                    <div class="comm-te1-item h100 bs plr5 prr5 fl posi-rela mlr30">-->
<#--                        <p class="font-size-r20 font-bold cor-333 line-height-r59 text-align-c">志愿者活动</p>-->
<#--                    </div>-->
<#--                    <div class="comm-pre-next-box posi-abso clearfix">-->
<#--                        <a href="javascript:void(0);" class="comm-pnb-pre fl active"></a>-->
<#--                        <a href="javascript:void(0);" class="comm-pnb-next fl mlr10 active"></a>-->
<#--                    </div>-->
                </div>
                <div class="jfyh-lb-content">
                    <!-- 乡村活动 -->
                    <div class="jfyh-lbc-item clearfix" id="villageActivities">
                    </div>

                </div>
            </div>
        </div>
        <!-- 右 -->
        <div class="jfyh-right fr">
            <div class="jfyh-r-top cun-box-bg-ext2">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <!-- 标题 -->
                <div class="flex flex-jc box-title-ext1">
                    <div class="box-title-ext1-contet h100 bs flex flex-jc">
                        <p class="font-size-r18 font-bold text-align-c line-height-r32">积分排名</p>
                    </div>
                </div>
<#--                <div class="jfyh-rt-show mtr30 bs plr40 prr40">-->
<#--                    <div class="swiper-container jfyh-swiper1 w100 h100">-->
<#--                        <div class="swiper-wrapper">-->
<#--                            <div class="swiper-slide swiper-no-swiping">-->
<#--                                <div class="h100 flex flex-ac jfyh-s-item">-->
<#--                                    <i class="jfyh-rts-icon"></i>-->
<#--                                    <p class="font-size-r14 font-bold line-height-r24 mlr10 cor-fff">江村</p>-->
<#--                                    <p class="font-size-r14 font-bold line-height-r24 mlr5 cor-ffe8e7">刚刚使用60积分兑换电饭煲一个</p>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                            <div class="swiper-slide swiper-no-swiping">-->
<#--                                <div class="h100 flex flex-ac jfyh-s-item">-->
<#--                                    <i class="jfyh-rts-icon"></i>-->
<#--                                    <p class="font-size-r14 font-bold line-height-r24 mlr10 cor-fff">张安</p>-->
<#--                                    <p class="font-size-r14 font-bold line-height-r24 mlr5 cor-ffe8e7">刚刚使用10积分兑换热水壶一个</p>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                            <div class="swiper-slide swiper-no-swiping">-->
<#--                                <div class="h100 flex flex-ac jfyh-s-item">-->
<#--                                    <i class="jfyh-rts-icon"></i>-->
<#--                                    <p class="font-size-r14 font-bold line-height-r24 mlr10 cor-fff">王石庭</p>-->
<#--                                    <p class="font-size-r14 font-bold line-height-r24 mlr5 cor-ffe8e7">4分钟前使用10积分兑换热水壶一个</p>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
                <div class="jfyh-rt-ranking mtr30 plr40 prr40 bs">
                    <div class="jfyh-rtr-top">
                        <table class="jfyh-table-ext1">

                            <colgroup>
                                <col style="width: 1.5rem;">
                                <col style="width: auto;">
                                <#--                                    <col style="width: 1.5rem;">-->
                                <col style="width: 1.5rem;">
                                <col style="width: 2rem;">
                            </colgroup>

                            <thead>
                            <th>排名</th>
                            <#--                                    <th>姓名</th>-->
                            <th>手机号</th>
                            <th>积分</th>

                            <th>积分明细</th>
                            </thead>

                            <tbody id="scoreRanking">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="jfyh-r-bottom cun-box-bg-ext2 mtr10" id="jfsc">
                <i class="cun-box-bg-item2 cun-box-bg-item2-lt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rt"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-lb"></i>
                <i class="cun-box-bg-item2 cun-box-bg-item2-rb"></i>
                <div class=" plr20 prr20 bs">
                    <!-- 标题 -->
                    <div class="flex flex-jc box-title-ext1">
                        <div class="box-title-ext1-contet h100 bs flex flex-jc">
                            <p class="font-size-r18 font-bold text-align-c line-height-r32">积分商城</p>
                        </div>
                        <a href="Javascript:void(0);" class="flex flex-ac box-more-ext1 posi-abso">
                            <p class="font-size-r14 text-lh1 let-sp1" onclick="turnToView('pointsMall', '')">更多</p>
                            <i></i>
                        </a>
                    </div>
                </div>
                <div class="jfyh-rb-content clearfix plr40 mtr15 posi-rela" id="pointsMall">

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 弹窗 -->
<div class="jfyh-tc hide" style="z-index: 9999999 !important;">
    <div class="jfyh-tc-div">
        <p class="jfyh-tc-div-p line-height-r42 font-size-0 clearfix">
            <em class="font-size-r14 cor-fff plr20 fl">积分详情</em>
            <!-- 关闭 -->
            <a href="Javascript:;" class="jfyh-tc-div-p-a fr mrr10 j-click-lost">
                <i></i>
            </a>
        </p>
        <div class="jfyh-tc-div-box ptr10 pbr10 plr10 prr10 bs">
            <div class="jfyh-tc-div-box-nr-tab h100 ptr20 pbr15 plr10 prr10 bs">
                <!-- 头部 -->
                <div class="jfyh-tc-div-box-nr">
                    <table class="w100">
                        <colgroup>
                            <col width="5%">
                            <col width="15%">
                            <col width="15%">
                            <col width="20%">
                            <col width="25%">
                            <col width="20%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td></td>
                            <td>年度</td>
                            <td>时间</td>
                            <td>积分类型</td>
                            <td>积分说明</td>
                            <td>积分</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 内容 -->
                <div class="jfyh-tc-div-box-nr02">
                    <table class="w100">
                        <colgroup>
                            <col width="5%">
                            <col width="15%">
                            <col width="15%">
                            <col width="20%">
                            <col width="25%">
                            <col width="20%">
                        </colgroup>
                        <tbody id="rankList">

                        </tbody>
                    </table>
                </div>
            </div>
            <!--  -->
            <div id="fenye" >

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

<!-- 提示套餐弹窗 -->
<div class="mask mask-taocan02 hide " id="tipsPopup">
    <div class="mask-bg"></div>
    <div class="div-taocan-com plr100 prr100 bs">
        <div class="mc-close flex flex-ac flex-jc" id="tipsCloseButton"><i class="i1 mrr5"></i><em>关闭</em></div>
        <div class="font-size-r18">
            <p class="text-align-c mtr50 mbr30"><img class="img-557-36" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/title2.png"/></p>
            <p class="text-align-c font-size-r24 cor-80" id="packageVersionText">&nbsp;</p>
        </div>
        <div class="div-tc mtr60">
            <div class="tc-item-text fl" id="tipsBasicEdition">
                <div class="tc-item">
                    <div class="h-80 div-jc w100 clearfix">
                        <p class="font-size-r20 cor-fff font-bold text-align-c ptr10 pbr5">基础版</p>
                        <p class="font-size-r13 cor-fff text-align-c"><em class="em-rem"></em><em class="font-size-r20 font-bold mrr5 mlr5">1200</em><em>元</em><em class="mlr5 mrr5">/</em><em>年</em></p>
                    </div>
                    <div class="font-size-r14 w100 mtr30 ">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 bor-radius20">享4大专题，3大应用，24项功能</span>
                        </p>
                    </div>
                    <div class="h-130 mbr20">
                        <div class=" h100 font-size-r14 cor-333 posi-rela">
                            <div class="w100 posi-ab ">
                                <div class="w50 fl text-align-c">工作台</div>
                                <div class="w50 fl text-align-c">村务通知</div>
                                <div class="w50 fl text-align-c">疫情防控</div>
                                <div class="w50 fl text-align-c">村务政务</div>
                            </div>
                        </div>
                    </div>

                    <div class="font-size-r14 w100">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 span-yyb">通知语音包（500分钟/月）</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="tc-item-text fl mlr40 mrr40" id="tipsStandardEdition">
                <div class="tc-item">
                    <div class="h-80 div-bz w100 clearfix">
                        <p class="font-size-r20 cor-fff font-bold text-align-c ptr10 pbr5">标准版</p>
                        <p class="font-size-r13 cor-fff text-align-c"><em class="em-rem"></em><em class="font-size-r20 font-bold mrr5 mlr5">3600</em><em>元</em><em class="mlr5 mrr5">/</em><em>年</em></p>
                    </div>
                    <div class="font-size-r14 w100 mtr30 ">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 bor-radius20">享6大专题，3大应用，34项功能</span>
                        </p>
                    </div>
                    <div class="h-130 mbr20">
                        <div class="w100 h100 font-size-r14 cor-333  posi-rela">
                            <div class="w100 posi-ab plr30 prr30 bs">
                                <div class="w33 fl text-align-c">工作台</div>
                                <div class="w33 fl text-align-c">村务通知</div>
                                <div class="w33 fl text-align-c">平安乡村</div>
                                <div class="w33 fl text-align-c">疫情防控</div>
                                <div class="w33 fl text-align-c">村务政务</div>
                                <div class="w33 fl text-align-c">智慧党建</div>
                            </div>
                        </div>
                    </div>

                    <div class="font-size-r14 w100">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 span-yyb">通知语音包（1500分钟/月）</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="tc-item-text  fl">
                <div class="tc-item">
                    <div class="h-80 div-jx w100 clearfix">
                        <p class="font-size-r20 cor-fff font-bold text-align-c ptr10 pbr5">尊享版</p>
                        <p class="font-size-r13 cor-fff text-align-c"><em class="em-rem"></em><em class="font-size-r20 font-bold mrr5 mlr5">18000</em><em>元</em><em class="mlr5 mrr5">/</em><em>年</em></p>
                    </div>
                    <div class="font-size-r14 w100 mtr30 ">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 bor-radius20">享10大专题，3大应用，52项功能</span>
                        </p>
                    </div>
                    <div class="h-130 ptr30 bs mbr20">
                        <div class=" h100 font-size-r14 cor-333 posi-rela">
                            <div class="w100 posi-ab plr30 prr30 bs">
                                <div class="w33 fl text-align-c">工作台</div>
                                <div class="w33 fl text-align-c">村务通知</div>
                                <div class="w33 fl text-align-c">平安乡村</div>
                                <div class="w33 fl text-align-c">疫情防控</div>
                                <div class="w33 fl text-align-c">村务政务</div>
                                <div class="w33 fl text-align-c">智慧党建</div>
                                <div class="w33 fl text-align-c">乡村特色</div>
                                <div class="w33 fl text-align-c">积分银行</div>
                                <div class="w33 fl text-align-c">三农服务</div>
                                <div class="w33 fl text-align-c">乡村三资</div>
                            </div>

                        </div>
                    </div>

                    <div class="font-size-r14 w100">
                        <p class="text-align-c">
                            <span class="font-size-r14 cor-666 span-yyb">通知语音包（10000分钟/月）</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="div-kxb flex">
            <div class="div-kxb-l fl mrr30">
                <p class="font-size-r18 font-bold cor-d61e1e ptr5">可<br>选<br>包</p>
            </div>
            <div class="flex1">
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-01.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">视频监控</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-02.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">智慧音箱</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-03.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">乡村VR</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-04.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">语音包</p>
                </div>
                <div class="kxb-item font-size-0 fl mlr40 mrr40 mtr5">
                    <p class="text-align-c"><img class="img-57-57" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/mask-taocan/yy-05.png"/></p>
                    <p class="font-size-r16 text-align-c cor-d27900 mtr5">更多</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var partPage = 1;//分页参数
    var partRows = 10;//每页条数
    var pageTotal = 1;//总页数


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
    // 点击  关闭弹窗
    $('.j-click-lost').on('click',function(){
        $('.jfyh-tc').fadeOut(300)
    })

    // 打开  弹窗
    $('.j-click-lookxq').on('click',function(){

        var id =   $(this).data("id");


        partPage = 1;//分页参数
        getRankDetail(id);

        $('.jfyh-tc').fadeIn(300)
    })



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


    layui.use(['form', 'table', 'laydate', 'laytpl', 'element','layer','laypage'], function () {
        var form = layui.form,
            laytpl = layui.laytpl,
            element = layui.element,
            layer = layui.layer;

        findNoticeList('10000016');   // 积分规则。

    });


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
                    }else {
                        $('#integralRuleImage').parent().parent().html('<div class="none-data-ext1">' +
                            '<img class="none-data-p1" style="margin-top:0;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                            '<p class="none-data-t1">暂无数据</p>' +
                            '</div>');
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

        // 三级穿透。
        url += '&regionCode=${regionCode!''}';

        window.open(url);   // 打开新窗口。
    }

    // 积分排名。
    getScoreRankingData();   // 积分排名。
    function getScoreRankingData() {
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
                                '<td>' + (data[i].mobile || '未绑定手机号') + '</td>' +  // 手机号。
                                '<td>' + data[i].scoreTotal + '</td>' +   // 积分。
                                 ' <td><em data-id="'+data[i].userId+'" class="j-click-lookxq">查看详情</em></td>'+
                                '</tr>';
                        } else {
                            break;
                        }
                    }

                    $('#scoreRanking').empty();
                    $('#scoreRanking').html(str);

                }else {
                    $('#scoreRanking').parent().parent().parent().append('<div class="none-data-ext1">' +
                        '<img class="none-data-p1" style="margin-top:0;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>');
                }
                // else{
                //
                //    var str = '<tr>' +
                //         '<td>NO.</td>' +
                //         // '<td>' + data[i].nickname + '</td>' +  // 姓名。
                //         '<td></td>' +  // 手机号。
                //         '<td></td>' +   // 积分。
                //         '<td >1</td>' +   // 参与活动次数。
                //         ' <td><em data-id="5" class="j-click-lookxq">查看详情</em></td>'+
                //         '</tr>';
                //
                //     $('#scoreRanking').empty();
                //     $('#scoreRanking').html(str);
                // }

                $('.j-click-lookxq').on('click',function(){

                    var id =   $(this).data("id");
                    partPage = 1;//分页参数
                    getRankDetail(id);

                    $('.jfyh-tc').fadeIn(300)
                })


            },
            error: function(err) {
                console.log("获取积分排名数据连接超时！");
            },
            complete: function() {
            }
        });
    }

    var selectId = null;


    function getRankDetail(id) {

        selectId =id;

        $("#rankList").empty();

        var html ="";

        var year =new Date().getFullYear();

        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/integral/listViewData.jhtml',
            data: {
                userId: id,
                statType: '1',
                statDate: year,
                currentPage : partPage,
                pageSize :partRows,
                regionCode: '${regionCode!''}'
            },
            success: function(data) {
                $("#fenye").empty();

                if(   data!=null){

                    if( data.data!=null&&data.data.length>0){

                        pageTotal = Math.ceil( Number(data.count)  / partRows);

                        console.log(pageTotal);

                    $.each(data.data,function (i,val) {

                        var interalDateStartStr =val.interalDateStartStr||"";
                        var submodularName =val.submodularName||"";
                        var interalReason =val.interalReason||"";
                        var interal =val.interal||"";

                        html+="                        <tr>\n" +
                            "                            <td><em class=\"cor-666\">"+(i+Number(1))+"</em></td>\n" +
                            "                            <td><em class=\"cor-4d4d4d\">"+year+"</em></td>\n" +
                            "                            <td><em class=\"cor-4d4d4d\">"+interalDateStartStr+"</em></td>\n" +
                            "                            <td><em class=\"cor-4d4d4d\">"+submodularName+"</em></td>\n" +
                            "                            <td><em class=\"cor-4d4d4d\">"+interalReason+"</em></td>\n" +
                            "                            <td><em class=\"cor-669eff font-bold\">"+interal+"</em></td>\n" +
                            "                        </tr>";

                    })

                 var fenye =       "            <div  class=\" mask-fenye jfyh-tc-div-nav flex flex-ac\">\n" +
                        "            </div>"
                      $("#fenye").html(fenye);


                        $('.mask-fenye').create({
                            pageCount: pageTotal,//总页数
                            current: partPage,//当前页码
                            backFn: function (p) {
                                searchData(p)
                            }//回调函数
                        })



                    }else{
                        html+="                        <tr>\n" +
                            "                            <td colspan='6'><em class=\"cor-4d4d4d\">暂无数据</em></td>\n" +
                            "                        </tr>";
                    }

                }else{
                    html+="                        <tr>\n" +
                        "                            <td colspan='6'><em class=\"cor-4d4d4d\">暂无数据</em></td>\n" +
                        "                        </tr>";
                }

                $("#rankList").html(html);

            },
            error: function(err) {
                console.log("获取积分排名数据连接超时！");
            },
            complete: function() {
            }
        });
    }

    //分页查询方法
    function searchData(curPage) {
        if(curPage==null){
            curPage = partPage;
        }

        getRankDetail(selectId);
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
                if (data != null) {

                        let listData = data.result;

                        if (listData && listData.length > 0) {
                            let str = '';

                            for (let i = 0; i < listData.length; i++) {
                                // 框间距。
                                if (i === 0) {   // 第一个活动。
                                    str += '<div class="jfyh-lbci-itme fl" onclick="turnToView(\'' + type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                                } else if (i >= 1 && i <= 2) {   // 第二到三个活动。
                                    str += '<div class="jfyh-lbci-itme fl mlr30" onclick="turnToView(\'' + type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                                } else if (i === 3) {   // 第四个活动。
                                    str += '<div class="jfyh-lbci-itme fl mtr40" onclick="turnToView(\'' + type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
                                } else {   // 第五个活动。
                                    str += '<div class="jfyh-lbci-itme fl mlr30 mtr40" onclick="turnToView(\'' + type + '\', \'' + listData[i].id + '\')" style="cursor:pointer;">';
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
                                str += '<div class="jfyh-lbci-itme fl mlr30" onclick="turnToView(\'' + type + '\', \'\')">';
                            } else if (listData.length === 3) {   // 第三个活动。
                                str += '<div class="jfyh-lbci-itme fl mtr40" onclick="turnToView(\'' + type + '\', \'\')">';
                            } else {   // 第四到五个活动。
                                str += '<div class="jfyh-lbci-itme fl mlr30 mtr40" onclick="turnToView(\'' + type + '\', \'\')">';
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

                        } else {
                            $('#villageActivities').html('<div class="none-data-ext1">' +
                                '<img class="none-data-p1" style="margin-top:0;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                                '<p class="none-data-t1">暂无数据</p>' +
                                '</div>');
                        }
                } else {
                    $('#villageActivities').html('<div class="none-data-ext1">' +
                        '<img class="none-data-p1" style="margin-top:0;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>');
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
                let listData = data.rows;

                if(listData!=null){

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
                } else {
                    $('#pointsMall').html('<div class="none-data-ext1">' +
                        '<img class="none-data-p1" style="margin-top:7%;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>');
                }
            } else {
                    $('#pointsMall').html('<div class="none-data-ext1">' +
                        '<img class="none-data-p1" style="margin-top:7%;" src="${uiDomain!''}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/comm/icon-nonedata-ext1.png">' +
                        '<p class="none-data-t1">暂无数据</p>' +
                        '</div>');
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


        //分页器代码
        //扩展jquery封装函数
        $.fn.create=function(option){
    //
    //      extend函数：当调用create时，如果传了参数option
    //      则使用传入的参数，否则使用预定义的参数
    //
            var arg=$.extend({
                pageCount:10,
                current:1,
                backFn:function(cur){
                    searchData(cur)
                }
            },option)
            init(this,arg);
        }

        //入口函数
        function init(dom,arg){
        console.log(arg);
            //判断传入的页码是否符合标准
            if(arg.current <= arg.pageCount || arg.pageCount==0){
                fillhtml(dom,arg);
                bindEvent(dom,arg);
            }else{
                layer.msg('请输入正确的页码！');

            }
        }

        //动态构建网页内容
        function fillhtml(dom,arg){
            //清空页面布局
            dom.empty();
            //大体分三部分：上一页，中间页码，下一页
            //上一页
            //上一页又分为可点击与不可点击两种

         //   console.log(arg.current);



            if(arg.current > 1){

         //       dom.append('<a href="Javascript:;" class="mrr15  pre-one mask-fenye-bj fl"><i class="mask-fenye-left"></i></a>');

                 dom.append('<i class="jfyh-tc-div-nav-i pre-one cursor  jfyh-tc-div-nav-i01 mrr5"></i>');
                // dom.append('<a href="javascript:void(0);" class="pre-one page-pre fl mrr10 bor-blue"></a>');
            }else {
                dom.remove('.pre-one');
                // dom.append('<span class="noPre">上一页</span>');
            }
            //中间页码
            //中间页码又分为中间可显示的5个页码与...与两端的页码
            //第一页
       //     dom.append('<div class="fl">');

            if(arg.current != 1 && arg.current > 3){
            //    dom.append('<a class="tcdNum mrr10 mask-fenye-bj fl " href="#">1</a>');
                dom.append('<a class="tcdNum" href="Javascript:;" >1</a>');
            }
            //判断当前页面是否距离第一页大于3，是则需要...
            if(arg.current-3 > 1){
              //  dom.append('<a class="mrr10 mask-fenye-bj fl" href="javascript:void(0);">...</a>');
                dom.append(' <a href="Javascript:;">...</a>');

            }
            //判断中间需要显示的页码
            var start = Number(arg.current)-Number(2);
            var end = Number(arg.current)+Number(2);


            for(;start <= end;start++){
                //判断开始页面是否大于1且是否小于最大页码
                if(start >= 1 && start <= arg.pageCount){

                    //判断是否是选中页面
                    if(start == arg.current){
                      //  dom.append('<a class="active mrr10 mask-fenye-bj fl"  href="#">'+start+'</a>');
                        dom.append('<a class="active" href="Javascript:;">'+start+'</a>');


                    } else {
                     //   dom.append('<a class="tcdNum mrr10 mask-fenye-bj fl" href="#">'+start+'</a>');
                        dom.append('<a class="tcdNum" href="Javascript:;">'+start+'</a>');
                    }
                }
            }

            //后置的...
            if(arg.current+3 < arg.pageCount){
              //  dom.append('<a class="mrr10 mask-fenye-bj fl" href="javascript:void(0);">...</a>');
                dom.append(' <a href="Javascript:;">...</a>');
            }
            //最后一页
            if(arg.current != arg.pageCount && arg.current < arg.pageCount-2){
              //  dom.append('<a class="tcdNum mrr10 mask-fenye-bj fl" href="#">'+arg.pageCount+'</a>');
                dom.append('<a class="tcdNum" href="Javascript:;">'+arg.pageCount+'</a>');
            }

        //    dom.append('</div');
            //下一页
            //下一页与上一页类似
            if(arg.current < arg.pageCount){

              //  dom.append('<a href="Javascript:;" class="next-one mrr10 mask-fenye-bj fl "><i class=" mask-fenye-right"></i></a>');
                dom.append('<i class="next-one cursor jfyh-tc-div-nav-i mlr5"></i>');

              //  dom.append('<a href="javascript:void(0);" class="next-one page-next fl mlr10"></a>');
                // dom.append('<a href="javascript:void(0);" class="page-next  page-next2 fl mlr10"></a>');
            }else {
                dom.remove('.next-one');
                // dom.append('<span class="noPre">下一页</span>')
            }

            var html = ""


            html+=   " <div class=\"mlr20 flex flex-ac font-size-r12 cor-999\">\n" +
            "           <em>到第</em>\n" +
            "           <input id=\"jumpPage\" type=\"text\" value=\"1\" class=\"input-num input-num02 mlr10 mrr10 plr5 prr5 bs\">\n" +
            "           <em>页</em>\n" +
            "           </div>\n" +
            "           <button class=\"input-num quedin cursor mlr10 mrr10\">确定</button>"


            dom.append(html);
            $("#jumpPage").val(partPage)


            $('.pageClick').on('click', function () {

             //   console.log(123)

                $(this).toggleClass('active')
                $(this).children('ul').slideToggle(300)
                setTimeout(function () {
                    $('.h-x').getNiceScroll().resize();
                }, 500)
            });

        }

        //处理点击事件
        function bindEvent(dom,arg){
            //分为点击上一页，点击页码与点击下一页
            //点击上一页
            dom.on('click','.pre-one',function(){
                partPage--
                fillhtml(dom,{'current':partPage,'pageCount':arg.pageCount});
                if(typeof arg.backFn=='function'){
                    searchData(partPage);
                }
            })

            //点击页码
            //获得点击页码，调用fillhtml重绘页面
            dom.on('click','.tcdNum',function(){
                var cur=parseInt($(this).text());
                partPage = cur;
                fillhtml(dom,{'current':cur,'pageCount':arg.pageCount});
                if(typeof arg.backFn=='function'){
                    searchData(cur);
                }
            })


            dom.on('click','.quedin',function(){
                var jumpPage = $("#jumpPage").val();
                if(jumpPage>0 && jumpPage<=pageTotal){
                    partPage = jumpPage;
                    fillhtml(dom,{'current':partPage,'pageCount':arg.pageCount});
                    if(typeof arg.backFn=='function'){
                        searchData(partPage);
                    }
                }else {
                    layer.msg('请输入正确的页码！');
                }
            })
            //点击下一页
            //获得当前页面，+1 然后调用fillhtml重绘页面
            dom.on('click','.next-one',function(){
                partPage++
                fillhtml(dom,{'current':partPage,'pageCount':arg.pageCount});
                if(typeof arg.backFn=='function'){
                    searchData(partPage);
                }
            })

        }

    // 设置提示弹窗内容并打开。
    function setTipsPopupContent(functionName) {
        let positionCode = '${positionCode!''}';
        let packageVersionText = $('#packageVersionText');

        if (positionCode) {
            if (positionCode === '00001') {   // 福建省基础版。
                let text = '';
                if (functionName === '智慧党建' || functionName === '平安乡村') {
                    text = '标准版&尊享版';
                } else {
                    text = '尊享版';
                }
                packageVersionText.html('该功能属于<span class="mlr5 mrr5 cor-ff4848 font-bold">' + text + '</span>，需联系当地电信分局升级为下方对应版本后方可激活。');
                $('#tipsBasicEdition').addClass('active');
                $('#tipsStandardEdition').removeClass('active');

            } else if (positionCode === '00002') {   // 福建省标准版。
                packageVersionText.html('该功能属于<span class="mlr5 mrr5 cor-ff4848 font-bold">尊享版</span>，需联系当地电信分局升级为下方对应版本后方可激活。');
                $('#tipsBasicEdition').removeClass('active');
                $('#tipsStandardEdition').addClass('active');

            } else {
                packageVersionText.html('当前账号未开通下方套餐，需联系当地电信分局开通后方可使用。');
                $('#tipsBasicEdition').removeClass('active');
                $('#tipsStandardEdition').removeClass('active');
            }
        } else {
            packageVersionText.html('当前账号未开通下方套餐，需联系当地电信分局开通后方可使用。');
            $('#tipsBasicEdition').removeClass('active');
            $('#tipsStandardEdition').removeClass('active');
        }

        $('.mask-taocan02').addClass('show');
    }
</script>
</body>
</html>