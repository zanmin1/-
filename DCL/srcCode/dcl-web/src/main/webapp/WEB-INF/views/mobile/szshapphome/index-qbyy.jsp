<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>全部应用</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css" />
</head>
<body class="bg-cor-f5">
    <div class="layui-contain">
        <div class="layui-row">
            <div class="layui-col-xs12 pt15 pb15 pl15 pr15 bs">

<%--                <div class="layui-col-xs12 flex flex-jb flex-ac">--%>
<%--                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>疫情防控</p>--%>
<%--                </div>--%>
<%--                <!-- 内容 -->--%>
<%--                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs" id="yqfk">--%>
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
<%--                </div>--%>


<%--                <div class="layui-col-xs12 flex flex-jb flex-ac mt15">--%>
<%--                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>村务通知</p>--%>
<%--                </div>--%>
<%--                <!-- 内容 -->--%>
<%--                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs" id="cwtz">--%>
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="layui-col-xs12 flex flex-jb flex-ac mt15">--%>
<%--                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>村务政务</p>--%>
<%--                </div>--%>
<%--                <!-- 内容 -->--%>
<%--                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs" id="cwzw">--%>
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="div-djyl">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>智慧党建</p>
                </div>
                <!-- 内容 -->
                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="djyl">
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
                </div>

                <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="div-xcts">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>乡村特色</p>
                </div>
                <!-- 内容 -->
                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="xcts">
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
                </div>

                <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="div-cwzw">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>村务政务</p>
                </div>
                <!-- 内容 -->
                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="cwzw">
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
                </div>

                <div class="layui-col-xs12 flex flex-jb flex-ac mt15 hide" id="div-snfw">
                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>三农服务</p>
                </div>
                <!-- 内容 -->
                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs hide" id="snfw">
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
                </div>

<%--                <div class="layui-col-xs12 flex flex-jb flex-ac mt15">--%>
<%--                    <p class="posi-rela text-lh1 font-size-15 cor-333 font-bold pl15 "><i class="notic-bar-ext1"></i>积分银行</p>--%>
<%--                </div>--%>
<%--                <!-- 内容 -->--%>
<%--                <div class="layui-col-xs12 bg-fff border-radius-4 mt15 pt15 pb10 pl10 pr10 bs" id="jfyh">--%>
<%--                    <div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">--%>
<%--                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>--%>
<%--                    </div>--%>
<%--                </div>--%>



            </div>
        </div>
    </div>
</body>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script>
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
    var orgCode,defaultOrgCode;
    $(function () {
        orgCode = "${orgCode}";
        defaultOrgCode = "${orgCode}";
        getButtonDiv()
    })

    function toNewHtml(type){
        var url = json[type];
        location.href = url;
    }

    function getButtonDiv(){

        var  platform =isWeChat()

        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                orgCode:orgCode,
                type:'7',  //导航栏
                platform:platform
            },
            success: function(data) {
                if(data!=null){
                    var dvModulars= data.dvModulars
                    if (dvModulars!=null){
                        for(var j=0;j<dvModulars.length;j++){
                            var  modularContents =dvModulars[j].modularContents
                            var useType= dvModulars[j].useType
                            // cwzw、djyl、xcts、
                            // yqfk、cwtz、snfw、jfyh
                            // if (useType=="cwzw"||useType=="djyl"||useType=="xcts"||useType=="yqfk"
                            //     || useType == 'cwtz' || useType == 'snfw' || useType == 'jfyh'){
                            //     setDiv(modularContents,dvModulars[j].useType)
                            // }
                            if (useType=="djyl"||useType=="xcts"||useType=="cwzw" || useType == 'snfw'){
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
        if (modularContents.length > 0){
            for(var z=0;z<modularContents.length;z++){

                var picUrl=modularContents[z].attList.length>0? '${imgDomain}'+ modularContents[z].attList[0].filePath:'${uiDomain}/app-assets/_jzfp/fujian-xczx/images/index/icon14.png'
                var url= modularContents[z].url

                url =    getCountUrl(url);

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
            $('#div-'+div).removeClass('hide');
            $('#'+div).removeClass('hide');
        } else {
            let noDataHtml = '<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                '<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>' +
                '</div>';
            $('#'+div).html(noDataHtml);
            $('#'+div).addClass('show');
            $('#'+div+'Title').addClass('show');
            $('#div-'+div).removeClass('hide');
            $('#'+div).removeClass('hide');
        }

        // }

    }


    // 传入 地域  url ,判断是否修改域名
    function getCountUrl(str){

        var	nowDomain =	'${mainTit}';

        if(str == null || ""==str|| str.indexOf("cn")==-1 ){
            return str;
        }

        //截取域名部门
        var  domain =	str.substring(7,str.indexOf("cn"));

        var count = 0;
        var index = 0;
        while((index=domain.indexOf(".",index))!=-1){
            index = index+".".length;
            count++;
        }
        //有公众号域名头
        if(count==3){
            //无公众号域名头
        }else if(count==2){
            //只改gbp
     //       if(domain.indexOf("gbp")!=-1){
                //尝试从当前地域中获取 域名
                if(nowDomain!=null&&nowDomain!=''){
                    return  "http://" + nowDomain +"."+ str.substring(7);
                }
       //     }

        }

        return str;
    }

    function jump(url){
        console.log(url)
        if (url=='null' || url == null || url == undefined || url == ''){
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
</html>