<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>农业视频</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/search.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/list.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css"/>

    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
</head>

<body class="bg-cor-f5">
    <div class="layui-contain">
        <div class="layui-row">
            <div class="layui-col-xs12 pl15 pr15 pb10 mt10">
                <div class="layui-col-xs12 flex flex-jb flex-ac">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>农业视频</p>
                    <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"
                                                                               onclick="moreExperts()"></i></a>
                </div>
                <div class="layui-col-xs12 pt15">
                    <div class="layui-row" id="experts">

                    </div>
                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50 hide" id="expertsZwsj">
                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    $(function () {
        loadExperts();
    });

    var pageNum = 1;
    var lastPage = 1;
    var pageSize =6;

    //农业视频
    function loadExperts() {
        $('#expertsZwsj').addClass('hide');
        <%--var url = '<%=path%>/public/wap/techBenefitsFarmersApp/loadManageList.json';--%>
        var	url = '<%=path%>/public/wap/villageAdministrationApp/findReleaseListData.jhtml';
        var map = {
            orgCode: "${orgCode}",
            page: 1,
            rows: 3
        };
        //  map.catalogId = '10000027';
        map.catalogId = '10000029';
        map.isEndPubDate = 'no';
        map.isPic = 'yes';
        map.isPubOrg = 'no';
        map.isTop = 'yes';
        map.noTop = 1 ;
        $.ajax({
            type: 'GET',
            url: url,
            data: map,
            success: function (data) {

                if (data.total > 0) {
                    var rows = data.rows
                    var trainings = ''

                    for (let i = 0; i < rows.length; i++) {

                        var comp = `<video controls="controls" style="width: 100%;height: 100%;" autostart="false" loop="true" src="` + rows[i].staticUrl + `">`

                        if(rows[i].staticUrl==null||rows[i].staticUrl==''){
                            comp= `<img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext3.png">`
                        }


                        trainings += '<div  class="layui-col-xs12 mt15">\n' +
                            '                            <div class="layui-col-xs12 bg-fff border-radius-4">\n' +
                            '                                <div class="swiper-container swiper-list-ext2">\n' ;

                        trainings +=
                            '                                            <div class="pic-wrap-ext1 notice-s6">\n' +
                            '                                                <div class="pic-wrap-c">\n' +
                            '                                                    <div class="pic-wrap-i">\n' +
                            comp +
                            '                                                    </div>\n' +
                            '                                                </div>\n' ;
                        trainings +=  '                                    </div>\n' +
                            '                                <div onclick="openView(' + rows[i].infoOpenId + ')"  class="font-size-12">\n' +
                            '                                    <p class="font-size-14 cor-4d pb10 pl10 pr10 mt10">' + rows[i].title + '</p>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>'

                    }
                    $("#experts").html(trainings)
                } else {
                    $('#expertsZwsj').removeClass('hide');
                    $('#experts').hide();
                }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        })
    }

    //农业视频列表
    function moreExperts() {
        //

        openPage('/public/wap/appCommonInfoOpen/index.jhtml?tKey=agriculturalVideo&isTop=yes&isPic=yes&mode=view&openNewPager=true')
    }

    // 页面跳转。
    function openPage(url) {
        var rurl = '${gbpDomain}' + url;
        jump(rurl);
    }

    // 页面跳转。
    function openView(infoOpenId) {
        var url = '${gbpDomain}/public/wap/appCommonInfoOpen/homeShow.jhtml?infoOpenId=' + infoOpenId + '&tKey=jypx&isTop=yes&isPic=yes&mode=view&openNewPager=true';
        jump(url);
    }

    function jump(url){
        if (url=='null'){
            layer.msg('暂无详情', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }

        var flag =  isWeChat()
        var isapp=''

        if (flag =='xygj'){
            isapp='token=${token}&app=app'
        }
        if (url.indexOf("?")==-1){   //链接没有带参数
            location.href = url+'?'+isapp
        }else {
            location.href = url+'&'+isapp
        }
    }

    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var  type= ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type){
            return 'spt'
        }else {
            return 'xygj'
        }
    }


</script>
</body>
</html>