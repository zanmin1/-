<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">
    <title>科技惠农-专家详情</title>

    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />

    <script src= "${uiDomain}/app-assets/extend/app-bridge/app-common-bridge.js" ></script>
    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="<%=path%>/js/html5media.min.js"></script>

    <style>
        .mr2 {
            margin-right: 2px;
        }
    </style>
</head>

<body>
    <div class="layui-contain">
        <div class="layui-row">
            <div class="layui-col-xs12 posi-rela">
                <div class="pic-wrap-ext1 notice-s4">
                    <div class="pic-wrap-c">
                        <div class="pic-wrap-i border-radius-2">
                            <div class="swiper-container swiper01 width-p100 height-p100">
                                <div id="fileList" class="swiper-wrapper">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posi-abso posi-right-0 posi-bottom-60 flex pr15 z-index">
                    <a href="javascript:;" class="display-inline layui-btn btn-bg-gray2 height-20 line-height-20 border-radius-20 font-size-12 cor-fff flex flex-ac ml10">
                        <i class="btn-icon-ext1 btn-icon-ext1-vedio mr2"></i>
                        <i class="btn-icon-ext1 btn-icon-ext1-picture mr8"></i>
                        <span class="sw-mun swiper-pagination-fraction">
                            <span class="swiper-pagination-current">0</span>/<span class="swiper-pagination-total">0</span>
                        </span>
                    </a>
                </div>
            </div>
            <div class="layui-col-xs12 pl15 pr15 posi-rela z-index">
                <div class="layui-col-xs12 border-radius-4 box-shadow-ext1 bg-fff notice-margin-ext1 pl15 pt10 pr15 pb15">
                    <p class="font-size-16 cor-333"><p id="name"></p></p>
                    <div class="flex flex-ac flex-jb mt5">
                        <div class="flex flex-ac" id="postName">

                        </div>
                    </div>
                    <div class="flex flex-jb flex-ac mt10">
                        <p class="font-size-12 cor-666 flex1">详细地址：<p id="addr"></p></p>
                    </div>
                </div>

                <div class="layui-col-xs12 pb25" id="personalInfo">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15 mt20" ><i class="notic-bar-ext1"></i>个人介绍</p>

                </div>
            </div>
        </div>
    </div>
</body>

<script>
    var gmisDomain = 'http://my.v6.aishequ.org:8130'
    // var url = gmisDomain + '/gmis/techBenefitsFarmersApp/getExpertByIdForJsonp.json'
    var url = '${gmisDomain}/public/wap/techBenefitsFarmersApp/getExpertByIdForJsonp.json'

$(function () {
    $.ajax({
        type: "GET",
        url: url,
        data: {
            'memberId': ${memberId}
            // $("#memberId").val()
        },
        dataType: 'jsonp',
        jsonp: "jsoncallback",
        success: function (data) {
            if(data!=null && data!=undefined){
                var html ='';
                console.log(data)
                var fileList = data.photoPath;
                if(fileList != null && fileList!=undefined && fileList!=''){
                        html =  "     <div class=\"swiper-slide img100\">\n" +
                            "    <img src=\"${$IMG_DOMAIN}" + fileList + "\">\n" +
                            "  </div>";
                }
                else {
                    html =  "  <div class=\"swiper-slide img100\">\n" +
                        "  <img src='http://gmis.zhxc.fzyzxxjs.cn/gmis/ui/images/untitled.png'/>\n" +
                        "  </div>";
                }
                $("#fileList").html(html);
                var swiper = new Swiper('.swiper01', {
                    spaceBetween: 5,
                    loop: true,//是否可循环
                    // autoplay: {
                    //     delay: 3000,
                    //     stopOnLastSlide: false,
                    //     disableOnInteraction: false,
                    // },
                    pagination: {
                        el: '.sw-mun',
                        type: 'fraction',
                    },
                    observer: true, //修改swiper自己或子元素时，自动初始化swiper
                    observeParents: true //修改swiper的父元素时，自动初始化swiper
                });
                $("#name").html(data.name)
                $("#addr").html(data.addr)
                $("#personalInfo").append(data.personalInfo)
                var labels =""
                var labs = data.postName.split(";")

                for(let k=0;k<labs.length;k++){
                    labels +=
                       ` <p class="list-tag-ext4 font-size-12 cor-fff" style="margin-right: 13px">`+labs[k]+`</p>`
                }
                $("#postName").html(labels)

            }

        }
    })
})

</script>
</html>