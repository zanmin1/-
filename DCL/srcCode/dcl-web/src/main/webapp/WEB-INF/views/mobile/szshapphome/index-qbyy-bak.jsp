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
    <title> 全部应用</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/index.css" />

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

    <meta content="yes" name="apple-mobile-web-app-capable">

    <meta content="black" name="apple-mobile-web-app-status-bar-style">

    <meta content="telephone=no" name="format-detection">

</head>
<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 pt15 pb15 pl15 pr15 bs">
            <!-- 标题 -->
            <div class="layui-col-xs12 flex flex-jb flex-ac hide"  id="djylTitle">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>党建引领</p>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide"  id="djyl">


            </div>
            <!-- 标题 -->
            <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="xczlTitle" >
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>乡村治理</p>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="xczl">

            </div>
            <!-- 标题 -->
            <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="xctsTitle">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>乡村特色</p> <%--原 乡村特色--%>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="xcts">


            </div>
            <!-- 标题 -->
            <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="cwzwTitle">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>村务政务</p>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="cwzw">



            </div>
            <!-- 标题 -->
            <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="kjhnTitle">

                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>科技惠农</p> <%--原科技惠农--%>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="kjhn">








            </div>
            <!-- 标题 -->
            <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="xcfzTitle">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>乡村法制</p>
            </div>
            <!-- 内容 -->
            <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs  hide" id="xcfz">
            </div>
        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>

<script src="${uiDomain}/js/layer/layer.js"></script>
<script src="${uiDomain}/app-assets/extend/wap-group-select/js/ffcs.select.group.js"></script>
<script src="${uiDomain}/web-assets/extend/person-select/v1.0.0/js/custom_msgClient.js "></script>
<script>
    $(function () {
        orgCode = "${orgCode}";
        defaultOrgCode = "${orgCode}";
        <%--orgEntityPath = "${orgEntityPath}";--%>
        getButtonDiv()
    });

    var json = {
        'sjxx':'<%=path%>/public/wap/secretaryMailboxApp/index.jhtml',
        'ycyp':'<%=path%>/public/wap/villageProductApp/index.jhtml',
        'cwgk':'${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=cwgk&isTop=yes&isPic=yes&mode=view&openNewPager=true',
        'bszn':'${wechatDomain}/wap/handlingMatters/index.mhtml',
        'zcxc':'${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=zcxc&isTop=yes&isPic=yes&mode=view&openNewPager=true',
        'tzgg':'${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=tzgg&isTop=yes&isPic=yes&mode=view&openNewPager=true',
        'cqjs':'${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=cqjs&isTop=yes&isPic=yes&mode=view&openNewPager=true',
        'djdt':'${gbpDomain}/public/wap/appCommonInfoOpen/index.jhtml?tKey=djdt&isTop=yes&isPic=yes&mode=view&openNewPager=true',
    }

    function toNewHtml(type){
        var url = json[type];
        <%--if (type == 'sjxx'){--%>
        <%--    url = '<%=path%>/public/wap/public/wap/secretaryMailboxApp/index.jhtml'--%>
        <%--}else if (type == 'ycyp'){--%>
        <%--    url = '<%=path%>/public/wap/public/wap/villageProductApp/index.jhtml'--%>
        <%--}else if (type == 'cwgk'){--%>
        <%--    url = '${gbpDomain}/public/wap/public/wap/villageProductApp/index.jhtml'--%>
        <%--}else if (type == 'bszn'){//?????--%>
        <%--    url = '${gbpDomain}/public/wap/public/wap/villageProductApp/index.jhtml'--%>
        <%--}else if (type == 'zcxc')--%>
        <%--url ="<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml?tokenKey=${tokenKey}&userOrgCode=${userOrgCode}&orgCode=${userOrgCode}&partyId=${info.partyId}";--%>
        <%--url ="<%=path%>/public/wap/szshAppHome/indexqbyy.jhtml";--%>
        location.href = url;
    }


    function getButtonDiv(){

        var  platform =isWeChat()

        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                // page:1,
                // rows:20,
                // catalogId:'10000013',
                // isEndPubDate:'no',
                // isPic:'yes',
                // isPubOrg:'yes',
                // isTop:'yes',
                // tKey:'bannerManage',
                // useType:'index',
                orgCode:orgCode,
                type:'7',  //导航栏
                platform:platform
            },
            success: function(data) {


                var html =''

                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){
                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents
                            var useType= dvModulars[j].useType
                            if (useType=="djyl"||useType=="cwzw"||useType=="kjhn"||useType=="xcts"||useType=="xczl"||useType=="xcfz"){
                                setDiv(modularContents,dvModulars[j].useType)
                            }
                        }
                    }
                }

            },
            error: function(data) {

            },
            complete : function() {
            }
        });
    }

    function  setDiv(modularContents,div){
        var html=''

        for(var z=0;z<modularContents.length;z++){

            var picUrl=modularContents[z].attList.length>0? '${imgDomain}'+ modularContents[z].attList[0].filePath:'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon14.png'
            var url= modularContents[z].url

           // url = getCount(url);

            html+=
                '<a href="Javascript:;" class="layui-col-xs3 pt5 mb5">'+

                '<div class="index-ann-box-icon img100" onclick="jump(\'' + url + '\')">'+
                '<img src="'+picUrl+'" alt="">'+
                '</div>'+
                '<p class="font-size-12 cor-666 mt5 text-align-c text-line-c1">'+modularContents[z].name+'</p>'+
                '</a>'


        }
         $('#'+div).html(html);

        // if (showFlag){
            $('#'+div).addClass('show');
            $('#'+div+'Title').addClass('show');
        // }

    }


    function jump(url){
        console.log(url)
        if (url=='null'){
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }

        // location.href = url;
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