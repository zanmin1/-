<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>福建智慧乡村大数据分析</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/css/cun-new1.css" />

    <!-- rem缩放 -->
    <script src="${uiDomain}/web-assets/common/js/calc-rem.js"></script>

    <style>
        .logo-img {
            width: 3.74rem !important;
            height: 0.43rem !important;
        }
        .nav-ext1 {
            width: 2.55rem !important;
            background-size: 100% 85.5% !important;
        }
        .nav-ext1-cont {
            top: 12.5% !important;
        }
    </style>
</head>

<body>
    <div class="container posi-rela">
        <div class="mb-content mb-content-h100 main-bg h-o">
            <div class="mb-top j-mb-top" id="navigationBar">
                <div class="mb-t-bg">
                    <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/mb-top.png">
                </div>
                <div class="mb-t-title logo-img img100">
                    <img class="" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/subject-cun/images/frame/logo.png">
                </div>
                <div class="mb-t-left cursor clearfix">
                    <i></i>
                    <p><a target="_blank" style="color:#fff;" href="${UAM_DOMAIN}/admin/szxc_index" id="managementBackground">管理后台</a></p>
                </div>

<#--                <div class="mb-t-right mb-t-right-l clearfix flex flex-ac flex-jr">-->
<#--                    <a id="homePage" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/commandModule/subjectIndex.jhtml?type=${type!''}&regionCode=${regionCode!''}" class="mb-tr-management-background mb-tr-management-background2 active " data-name="subject-index">首页</a>-->
<#--                    <a id="smartPartyBuildingTop" href="javascript:void(0);" data-iframe="" class="mb-tr-management-background xczl" data-name="subject-xiangcunzhili-djyl" data-if="2">党建引领</a>-->
<#--                    <a id="safeComprehensiveTreatment" target="_blank" href="${GIS_DOMAIN}/gis/showAllEquipt/index.jhtml?type=2&regionCode=${regionCode!''}" data-iframe="" class="mb-tr-management-background " data-name="">平安综治</a>-->
<#--                    <a id="ecologicallyLivable" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/hospitableEcologyProvince/index.jhtml?regionCode=${regionCode!''}" class="mb-tr-management-background " data-name="subject-shengtaiyiju">生态宜居</a>-->
<#--                </div>-->
<#--                <div class="mb-t-right clearfix flex flex-ac flex-jr">-->
<#--                    <a id="culturalTourism" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/culturalTourism/index.jhtml?regionCode=${regionCode!''}" class="mb-tr-management-background fl" data-name="subject-wenhualvyou">文化旅游</a>-->
<#--                    <a id="ruralECommerce" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/ncBigScreen/index.jhtml?regionCode=${regionCode!''}" class="mb-tr-management-background fl" data-name="subject-nongcundianshang">农村电商</a>-->
<#--                    <a id="threeRuralServices" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/threeRuralServices/index.jhtml?regionCode=${regionCode!''}" class="mb-tr-management-background fl" data-name="subject-sannongfuwu">三农服务</a>-->
<#--                </div>-->

                <div class="mb-t-right mb-t-right-l clearfix flex flex-ac flex-jr">
                    <a id="homePage" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/commandModule/subjectIndex.jhtml?type=${type!''}&regionCode=${regionCode!''}&positionCode=${positionCode!''}" class="mb-tr-management-background mb-tr-management-background2 active " data-name="subject-index">首页</a>
                    <a id="smartPartyBuilding" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/provincialPlatform/index.jhtml?type=1&regionCode=${regionCode!''}&positionCode=${positionCode!''}" class="mb-tr-management-background xczl" data-name="subject-xiangcunzhili-djyl" data-if="">智慧党建</a>
                    <a id="epidemicPreventionAndControl" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/epidemicPreventionAndControl/index.jhtml?type=2&regionCode=${regionCode!''}&positionCode=${positionCode!''}" class="mb-tr-management-background" data-name="">疫情防控</a>
                    <a id="safeComprehensiveTreatment" target="_blank" href="${GBP_DOMAIN!''}/gbp/globalEyes/globalEyesBigScreen/sudokuPlay.jhtml?orgCode=${regionCode!''}" data-iframe="" class="mb-tr-management-background" data-name="" data-if="3">平安乡村</a>
                </div>
                <div class="mb-t-right clearfix flex flex-ac flex-jr">
                    <a id="villageAdministration" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/provincialPlatform/index.jhtml?type=2&regionCode=${regionCode!''}&positionCode=${positionCode!''}" class="mb-tr-management-background fl" data-name="subject-cunwuzhengwu" data-if="1">村务政务</a>
                    <a id="ruralCharacteristics" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/culturalTourism/index.jhtml?regionCode=${regionCode!''}&positionCode=${positionCode!''}" class="mb-tr-management-background fl" data-name="subject-xiangcuntese" data-if="2">乡村特色</a>
                    <a id="threeRuralServices" href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/threeRuralServices/index.jhtml?regionCode=${regionCode!''}&positionCode=${positionCode!''}" class="mb-tr-management-background fl" data-name="subject-sannongfuwu">三农服务</a>
                </div>
            </div>
            <div class="mb-c-content clearfix bs ">
                <!-- 首页 -->
                <iframe id="subject-cun-v1" name="subject-cun-v1" src="" frameborder="0" width="100%" height="100%" scrolling="no">

                </iframe>
            </div>

            <!-- 乡村治理二级菜单 -->
            <div class="nav-ext1 hide">
                <div class="nav-ext1-cont">
                    <i class="nav-ext1-i1 btn-icon1"></i>
                    <button class="j-nav-arrow nav-ext1-arrow btn-icon1"></button>

<#--                    <div class="nav-ext1-tt clearfix">-->
<#--                        <p class="font-size-r24 font-bold color-d61e1e plr20 pbr20 fl">乡村治理</p>-->
<#--                    </div>-->
<#--                    <ul class="j-nav nav-ext1-w mlr20 mtr20" id="leftMenu">-->
<#--                        <li class="active"><a id="smartPartyBuildingLeft" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/provincialPlatform/index.jhtml?type=1&regionCode=${regionCode!''}');">党建引领</a></li>-->
<#--                        <li><a id="villageAdministration" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/provincialPlatform/index.jhtml?type=2&regionCode=${regionCode!''}');">村务政务</a></li>-->
<#--                        <li><a id="gridManagement" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/gridManageProvince/index.jhtml?regionCode=${regionCode!''}');">网格管理</a></li>-->
<#--                        <li><a id="ruralLegalSystem" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/ruralLaw/index.jhtml?regionCode=${regionCode!''}');">乡村法制</a></li>-->
<#--                        <li><a id="integralBank" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/integralBankProvince/index.jhtml?regionCode=${regionCode!''}');">积分银行</a></li>-->
<#--                        <li><a id="epidemicPreventionAndControl" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/epidemicPreventionAndControl/index.jhtml?regionCode=${regionCode!''}');">疫情防控</a></li>-->
<#--                        <li><a id="threeCapitalManagement" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/threeCapitalProvince/index.jhtml?orgCode=${regionCode!''}');">三资管理</a></li>-->
<#--                    </ul>-->

                    <div id="villageAdministrationLeftMenu" class="hide">
                        <div class="nav-ext1-tt clearfix">
                            <p class="font-size-r24 font-bold color-d61e1e plr20 pbr20 fl">村务政务</p>
                        </div>
                        <ul class="j-nav nav-ext1-w mlr20 mtr20">
                            <li class="active"><a id="cunwuzhengwu" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/provincialPlatform/index.jhtml?type=2&regionCode=${regionCode!''}&positionCode=${positionCode!''}');">村务政务</a></li>
                            <li><a id="integralBank" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/integralBankProvince/index.jhtml?regionCode=${regionCode!''}&positionCode=${positionCode!''}');">积分银行</a></li>
                            <li><a id="ruralThreeCapital" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/threeCapitalProvince/index.jhtml?orgCode=${regionCode!''}&positionCode=${positionCode!''}');">乡村三资</a></li>
                        </ul>
                    </div>

                    <div id="ruralCharacteristicsLeftMenu" class="hide">
                        <div class="nav-ext1-tt clearfix">
                            <p class="font-size-r24 font-bold color-d61e1e plr20 pbr20 fl">乡村特色</p>
                        </div>
                        <ul class="j-nav nav-ext1-w mlr20 mtr20">
                            <li class="active"><a id="culturalTourism" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/culturalTourism/index.jhtml?regionCode=${regionCode!''}&positionCode=${positionCode!''}');">文化旅游</a></li>
                            <li><a id="oneVillageOneProduct" href="javascript:void(0);" onclick="toUrl('${rc.getContextPath()}/dcl/ncBigScreen/index.jhtml?regionCode=${regionCode!''}&positionCode=${positionCode!''}');">一村一品</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
    <script src="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>

    <script>
        $(window).on('load', function () {
	    	$(".mb-t-right-l").find("a:first").click();
        });
        $('.j-mb-top .mb-t-right a').on('click',function() {
            // 升级指南套餐权限。
            if ('${type!''}' && '${type!''}' === '3') {
                let innerText = $(this)[0].innerText;

                if ('${positionCode!''}') {
                    if ('${positionCode!''}' === '00001') {
                        if (innerText !== '工作台' && innerText !== '疫情防控' && innerText !== '村务政务') {
                            return;
                        }
                    } else if ('${positionCode!''}' === '00002') {
                        if (innerText !== '工作台' && innerText !== '疫情防控' && innerText !== '村务政务' &&
                            innerText !== '智慧党建' && innerText !== '平安乡村') {
                            return;
                        }
                    }
                } else {
                    if (innerText !== '工作台') {
                        return;
                    }
                }
            }

            $('.j-mb-top .mb-t-right a').removeClass('active');
	        $(this).addClass('active');
            let dataIf = $(this).data('if');

            let param = '?screen=' + winW;

            let dataIframe = $(this).data('iframe');

		    if (dataIframe) {
		    	if (dataIframe.indexOf("?") > -1) {
		    		param = '&screen=' + winW;
		    	}
		    	
		        $(this).addClass('active').siblings().removeClass('active');
		        document.getElementById('subject-cun-v1').src = dataIframe + param;
		    }

		    // 村务政务左侧菜单。
            if (dataIf == '1') {
                $('.nav-ext1').removeClass('hide');
                $('#villageAdministrationLeftMenu').removeClass('hide');
                $('#ruralCharacteristicsLeftMenu').addClass('hide');

                // 收起左侧菜单。
                $('.nav-ext1').removeClass('nav-ext1-on');
                $('.nav-ext1-arrow').removeClass('btn-icon2').addClass('btn-icon1');
                $('.nav-ext1').css('left', '-1.95rem');

            // 乡村特色左侧菜单。
            } else if (dataIf == '2') {
                $('.nav-ext1').removeClass('hide');
                $('#villageAdministrationLeftMenu').addClass('hide');
                $('#ruralCharacteristicsLeftMenu').removeClass('hide');

                // 收起左侧菜单。
                $('.nav-ext1').removeClass('nav-ext1-on');
                $('.nav-ext1-arrow').removeClass('btn-icon2').addClass('btn-icon1');
                $('.nav-ext1').css('left', '-1.95rem');

            // 平安乡村。
            } else if (dataIf == '3') {

            // 隐藏左侧菜单。
            } else {
                $('.nav-ext1').removeClass('nav-ext1-on');
                $('.nav-ext1-arrow').removeClass('btn-icon2').addClass('btn-icon1');
                $('.nav-ext1').css('left', '-1.95rem');
                $('.nav-ext1').addClass('hide');
            }
        });
        
        // 乡村治理二级菜单
        // 菜单切换
        $('.j-nav').on('click', 'li', function() {
            // 升级指南套餐权限。
            if ('${type!''}' && '${type!''}' === '3') {
                if ('${positionCode!''}') {
                    let innerText = $(this)[0].innerText;

                    if ('${positionCode!''}' === '00001' || '${positionCode!''}' === '00002') {
                        if (innerText !== '村务政务') {
                            return;
                        }
                    }
                }
            }

            $(this).addClass('active').siblings().removeClass('active');
        });

        // 菜单抽屉
        $('.j-nav-arrow').on('click', function() {
            if($('.nav-ext1').hasClass('nav-ext1-on')) {
                $('.nav-ext1').removeClass('nav-ext1-on');
                $(this).removeClass('btn-icon2').addClass('btn-icon1');
                $('.nav-ext1').css('left', '-1.95rem');
            } else {
                $('.nav-ext1').addClass('nav-ext1-on');
                $(this).addClass('btn-icon2').removeClass('btn-icon1');
                $('.nav-ext1').css('left', '0rem');
            }
        });

        // 乡村治理二级菜单跳转
        function toUrl(url) {
	        let param = '?screen=' + winW;
		    if (url) {
		    	if (url.indexOf('?') > -1) {
		    		param = '&screen=' + winW;
		    	}
		    }
		    document.getElementById('subject-cun-v1').src = url + param;
		    if ($('.nav-ext1').hasClass('nav-ext1-on')) {
		    	$('.j-nav-arrow').click();
		    }
        }

        // 滚动条美化
        $('.h-x').niceScroll({
            cursorcolor: "#ffea98",
            cursoropacitymax: 1,
            cursorwidth: ".04rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: false
        });



        // 升级指南套餐权限。
        if ('${type!''}' && '${type!''}' === '3') {
            let homePage = $('#homePage');   // 工作台。
            let epidemicPreventionAndControl = $('#epidemicPreventionAndControl');   // 疫情防控。
            let villageAdministration = $('#villageAdministration');   // 村务政务。
            let smartPartyBuilding = $('#smartPartyBuilding');   // 智慧党建。
            let safeComprehensiveTreatment = $('#safeComprehensiveTreatment');   // 平安乡村。
            let ruralCharacteristics = $('#ruralCharacteristics');   // 乡村特色。
            let threeRuralServices = $('#threeRuralServices');   // 三农服务。
            let integralBank = $('#integralBank');   // 积分银行。
            let ruralThreeCapital = $('#ruralThreeCapital');   // 乡村三资。
            let managementBackground = $('#managementBackground');   // 管理后台。

            // 添加锁的样式。
            homePage.addClass('suo');
            epidemicPreventionAndControl.addClass('suo');
            villageAdministration.addClass('suo');
            smartPartyBuilding.addClass('suo');
            safeComprehensiveTreatment.addClass('suo');
            ruralCharacteristics.addClass('suo');
            threeRuralServices.addClass('suo');
            integralBank.addClass('suo');
            ruralThreeCapital.addClass('suo');

            // 首页切换为工作台。
            homePage.html('工作台');
            homePage.attr('data-iframe', '${rc.getContextPath()}/dcl/workBench/index.jhtml?&positionCode=${positionCode!''}');

            if ('${positionCode!''}') {
                // 删除不符合当前套餐的元素属性。
                if ('${positionCode!''}' === '00001') {   // 福建省基础版。
                    smartPartyBuilding.attr('data-iframe', '');   // 智慧党建。
                    smartPartyBuilding.attr('data-if','');
                    safeComprehensiveTreatment.removeAttr('href');   // 平安乡村。
                    safeComprehensiveTreatment.addClass('cursor');

                    ruralCharacteristics.attr('data-iframe', '');   // 乡村特色。
                    ruralCharacteristics.attr('data-if','');
                    threeRuralServices.attr('data-iframe', '');   // 三农服务。
                    integralBank.attr('onclick', '');   // 积分银行。
                    ruralThreeCapital.attr('onclick', '');   // 乡村三资。

                    // 移除锁的样式。
                    homePage.removeClass('suo');
                    epidemicPreventionAndControl.removeClass('suo');
                    villageAdministration.removeClass('suo');

                } else if ('${positionCode!''}' === '00002') {   // 福建省标准版。
                    ruralCharacteristics.attr('data-iframe', '');   // 乡村特色。
                    ruralCharacteristics.attr('data-if','');
                    threeRuralServices.attr('data-iframe', '');   // 三农服务。
                    integralBank.attr('onclick', '');   // 积分银行。
                    ruralThreeCapital.attr('onclick', '');   // 乡村三资。

                    // 移除锁的样式。
                    homePage.removeClass('suo');
                    epidemicPreventionAndControl.removeClass('suo');
                    villageAdministration.removeClass('suo');
                    smartPartyBuilding.removeClass('suo');
                    safeComprehensiveTreatment.removeClass('suo');

                } else if ('${positionCode!''}' === '00003') {   // 福建省尊享版。
                    // 移除锁的样式。
                    homePage.removeClass('suo');
                    epidemicPreventionAndControl.removeClass('suo');
                    villageAdministration.removeClass('suo');
                    smartPartyBuilding.removeClass('suo');
                    safeComprehensiveTreatment.removeClass('suo');
                    ruralCharacteristics.removeClass('suo');
                    threeRuralServices.removeClass('suo');

                    integralBank.removeClass('suo');
                    ruralThreeCapital.removeClass('suo');

                } else {
                    epidemicPreventionAndControl.attr('data-iframe', '');   // 疫情防控。
                    villageAdministration.attr('data-iframe', '');   // 村务政务。
                    villageAdministration.attr('data-if','');

                    smartPartyBuilding.attr('data-iframe', '');   // 智慧党建。
                    smartPartyBuilding.attr('data-if','');
                    safeComprehensiveTreatment.removeAttr('href');   // 平安乡村。
                    safeComprehensiveTreatment.addClass('cursor');

                    ruralCharacteristics.attr('data-iframe', '');   // 乡村特色。
                    ruralCharacteristics.attr('data-if','');
                    threeRuralServices.attr('data-iframe', '');   // 三农服务。

                    managementBackground.removeAttr('href');   // 管理后台。
                }
            } else {
                epidemicPreventionAndControl.attr('data-iframe', '');   // 疫情防控。
                villageAdministration.attr('data-iframe', '');   // 村务政务。
                villageAdministration.attr('data-if','');

                smartPartyBuilding.attr('data-iframe', '');   // 智慧党建。
                smartPartyBuilding.attr('data-if','');
                safeComprehensiveTreatment.removeAttr('href');   // 平安乡村。
                safeComprehensiveTreatment.addClass('cursor');

                ruralCharacteristics.attr('data-iframe', '');   // 乡村特色。
                ruralCharacteristics.attr('data-if','');
                threeRuralServices.attr('data-iframe', '');   // 三农服务。

                managementBackground.removeAttr('href');   // 管理后台。
            }

            // 点击导航栏判断套餐权限。
            $('#navigationBar a').click(function() {
                let iframe = $(this).data('iframe');
                let href = $(this).attr('href');

                if (!iframe && (!href || href === 'javascript:void(0);')) {
                    // 显示和隐藏提示弹窗。
                    let functionName = $(this)[0].innerText;
                    showAndHideTipsPopup(functionName);
                }
            });

            // 点击左侧菜单判断套餐权限。
            $('#villageAdministrationLeftMenu a').click(function() {   // 村务政务左侧菜单。
                let onclick = $(this).attr('onclick');

                if (!onclick) {
                    // 显示和隐藏提示弹窗。
                    let functionName = $(this)[0].innerText;
                    showAndHideTipsPopup(functionName);
                }
            });
            $('#ruralCharacteristicsLeftMenu a').click(function() {   // 乡村特色左侧菜单。
                let onclick = $(this).attr('onclick');

                if (!onclick) {
                    // 显示和隐藏提示弹窗。
                    let functionName = $(this)[0].innerText;
                    showAndHideTipsPopup(functionName);
                }
            });
        }

        // 显示和隐藏提示弹窗。
        function showAndHideTipsPopup(functionName) {
            $("#subject-cun-v1")[0].contentWindow.setTipsPopupContent(functionName);   // 设置提示弹窗内容并打开。

            $($(window.frames['subject-cun-v1'].document).find('#tipsCloseButton')).click(function() {
                $(window.frames['subject-cun-v1'].document).find('#tipsPopup').removeClass('show');
            });
        }
    </script>
</body>

</html>