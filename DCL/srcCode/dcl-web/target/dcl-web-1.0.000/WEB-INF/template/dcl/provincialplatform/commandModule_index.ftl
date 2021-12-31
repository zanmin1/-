
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>福建智慧乡村大数据分析</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/css/reset.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/common/fonts/css/font-base64.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/index-comm.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/subject-zhsy.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/subject.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/mb-index.css" />
    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/mb-index1.css" />

    <link rel="stylesheet" href="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/css/cun-v1.css" />
    <!-- rem缩放 -->
    <script src="${uiDomain}/web-assets/common/js/calc-rem.js"></script>
</head>
<body>
<div class="container posi-rela">
    <div class="mb-content mb-content-h100 main-bg h-o">
        <div class="mb-top j-mb-top">
            <div class="mb-t-bg">
                <img src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/mb-top.png">
            </div>
            <div class="mb-t-title logo-img img100">
                <!-- <p>珪后村乡村振兴驾驶舱</p> -->
                <img class="" src="${uiDomain}/web-assets/_big-screen/35-xiangcunzhenxing/images/cun-v1/logo.png">
            </div>
            <div class="mb-t-left cursor clearfix">
                <i></i>
                <p>
                	<a target="_blank" href="${UAM_DOMAIN}/admin/szxc_index">管理后台</a>
                </p>
            </div>
            <div class="mb-t-right mb-t-right-l clearfix">
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/commandModule/subjectIndex.jhtml?type=${type!''}" class="mb-tr-management-background mb-tr-management-background2 active fl">首页</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=1" class="mb-tr-management-background fl">智慧党建</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=2" class="mb-tr-management-background fl">村务政务</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/convenient/index.jhtml" class="mb-tr-management-background fl">便民服务</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/beautifulVillage/index.jhtml" class="mb-tr-management-background fl">美丽乡村</a>
            </div>
            <div class="mb-t-right clearfix">
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/gridManage/index.jhtml" class="mb-tr-management-background fl">网格管理</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/ruralLaw/index.jhtml" class="mb-tr-management-background fl">乡村法制</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/integralBank/index.jhtml" class="mb-tr-management-background fl">积分银行</a>
                <a href="javascript:void(0);" data-iframe="${rc.getContextPath()}/dcl/threeCapital/index.jhtml" class="mb-tr-management-background fl">三资管理</a>
            </div>
        </div>
        <div class="mb-c-content clearfix bs">

            <!-- 首页 -->
            <iframe id="subject-cun-v1" src=""  frameborder="0" width="100%" height="100%" scrolling="no"></iframe>


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
    $('.j-mb-top .mb-t-right a').on('click',function(){
        $('.j-mb-top .mb-t-right a').removeClass('active');
        $(this).addClass('active');
        
        var param = '?screen=' + winW;
        
	    var dataIframe = $(this).data('iframe');
	    if (dataIframe) {
	    	if (dataIframe.indexOf("?") > -1) {
	    		param = '&screen=' + winW;
	    	}
	    	
	        $(this).addClass('active').siblings().removeClass('active');
	        document.getElementById('subject-cun-v1').src = dataIframe + param;
	    }
    })

	window.onload = function () {
	    $(".mb-t-right-l").find("a:first").click();
	};


    // 滚动条美化
    $('.h-x').niceScroll({
        cursorcolor: "#ffea98",
        cursoropacitymax: 1,
        cursorwidth: ".04rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: false,
    });

</script>
</body>
</html>