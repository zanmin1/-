<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>乡村模范</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />

    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css" />

    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index1.css" />
</head>
<body>
    <div class="layui-contain">
        <div class="layui-row">
            <div class="layui-col-xs12">

                <div class="posi-rela ml15 mr15 mb10" id="Div">
           <%--         <!-- 列表 -->
                    <div class="div-xcmf-com">
                        <!-- 头像 -->
                        <div class="div-xcmf-tx l1">
                            <div class="div-xcmf-tx-t">
                                <img class="img-110-115" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-xiangxian.png"/>
                            </div>
                            <div class="div-xcmf-tx-b">
                                <p class="cor-fff font-size-13 text-align-c">荣誉称号</p>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="div-xcmf-com-t l1">
                            <p class="cor-ff6d2e font-size-18 font-bold">张春华</p>
                            <p class="cor-666 font-size-13 text-line-c1">福泉乡协星村党支部福泉乡协星村党支部</p>
                        </div>
                        <div class="div-xcmf-com-b pt10">
                            <p class="cor-333 font-size-12 text-line-c4">模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介。</p>
                        </div>
                    </div>
                    <!-- 列表 -->
                    <div class="div-xcmf-com">   <!-- 列表 -->
                        <!-- 头像 -->
                        <div class="div-xcmf-tx l1">
                            <div class="div-xcmf-tx-t">
                                <img class="img-110-115" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-xx-none.png"/>
                            </div>
                            <div class="div-xcmf-tx-b">
                                <p class="cor-fff font-size-13 text-align-c">荣誉称号</p>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="div-xcmf-com-t l1" >
                            <p class="cor-ff6d2e font-size-18 font-bold">张启明</p>
                            <p class="cor-666 font-size-13 text-line-c1">福泉乡协星村党支部福泉乡协星村党支部</p>
                        </div>
                        <div class="div-xcmf-com-b pt10">
                            <p class="cor-333 font-size-12 text-line-c4">模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介。</p>
                        </div>
                    </div>
                    <!-- 列表 -->
                    <div class="div-xcmf-com">   <!-- 列表 -->
                        <!-- 头像 -->
                        <div class="div-xcmf-tx l1">
                            <div class="div-xcmf-tx-t">
                                <img class="img-110-115" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-xx-none.png"/>
                            </div>
                            <div class="div-xcmf-tx-b">
                                <p class="cor-fff font-size-13 text-align-c">荣誉称号</p>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="div-xcmf-com-t l1">
                            <p class="cor-ff6d2e font-size-18 font-bold">张启明</p>
                            <p class="cor-666 font-size-13 text-line-c1">福泉乡协星村党支部福泉乡协星村党支部</p>
                        </div>
                        <div class="div-xcmf-com-b pt10">
                            <p class="cor-333 font-size-12 text-line-c4">模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介。</p>
                        </div>
                    </div>--%>
<%--                    <!-- 列表 -->--%>
<%--                    <div class="div-xcmf-com">--%>
<%--                        <!-- 头像 -->--%>
<%--                        <div class="div-xcmf-tx l1">--%>
<%--                            <div class="div-xcmf-tx-t">--%>
<%--                                <img class="div-xcmf-tx-t-img" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-xx-none.png"/>--%>
<%--                            </div>--%>
<%--                            <div class="div-xcmf-tx-b">--%>
<%--                                <p class="cor-fff font-size-13 text-align-c">荣誉称号</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- 内容 -->--%>
<%--                        <div class="div-xcmf-com-t l1">--%>
<%--                            <p class="cor-ff6d2e font-size-18 font-bold">张启明</p>--%>
<%--                            <p class="cor-666 font-size-13 text-line-c1">福泉乡协星村党支部福泉乡协星村党支部</p>--%>
<%--                        </div>--%>
<%--                        <div class="div-xcmf-com-b pt10">--%>
<%--                            <p class="cor-333 font-size-12 text-line-c4">模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介。</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                     <!-- 列表 -->--%>
<%--                     <div class="div-xcmf-com">--%>
<%--                        <!-- 头像 -->--%>
<%--                        <div class="div-xcmf-tx l1">--%>
<%--                            <div class="div-xcmf-tx-t">--%>
<%--                                <img class="div-xcmf-tx-t-img" src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/gzh-index1/icon-xx-none.png"/>--%>
<%--                            </div>--%>
<%--                            <div class="div-xcmf-tx-b">--%>
<%--                                <p class="cor-fff font-size-13 text-align-c">荣誉称号</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- 内容 -->--%>
<%--                        <div class="div-xcmf-com-t l1">--%>
<%--                            <p class="cor-ff6d2e font-size-18 font-bold">张启明</p>--%>
<%--                            <p class="cor-666 font-size-13 text-line-c1">福泉乡协星村党支部福泉乡协星村党支部</p>--%>
<%--                        </div>--%>
<%--                        <div class="div-xcmf-com-b pt10">--%>
<%--                            <p class="cor-333 font-size-12 text-line-c4">模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介模范简介。</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
         
        </div>
    </div>
    <script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script>
        $(function () {
            getData()

        });


        function getData(){
            $.ajax({
                type: 'POST',
                url: '<%=path%>/public/wap/PartyLeadingController/getExpertList.json',
                data: {
                    regionCode:'${orgCode}',
                    bizType:25,
                    page:1,
                    rows:10

                },
                dataType: 'json',

                success: function(data) {


                    if (data.total>0){
                        var str = '';
                        var list = data.rows;
                        for (let i = 0 ; i< list.length;i++){
                            let postName = list[i].postName || '';
                            let name = list[i].name || '';
                            let gridName = list[i].gridName || '';
                            let personalInfo = list[i].personalInfo || '暂无简介';

                            str+= '<div class="div-xcmf-com">'+

                                '<div class="div-xcmf-tx l1">'+
                                '<div class="div-xcmf-tx-t">'+
                                '<img class="img-110-115" src="${imgDomain}'+list[i].photoPath+'"/>'+
                                '</div>'+
                            '                      <div class="div-xcmf-tx-b">\n' +
                                '                                <p class="cor-fff font-size-13 text-align-c">' + postName + '</p>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                        <!-- 内容 -->\n' +
                                '                        <div class="div-xcmf-com-t l1">\n' +
                                '                            <p class="cor-ff6d2e font-size-18 font-bold">' + name + '</p>\n' +
                                '                            <p class="cor-666 font-size-13 text-line-c1">' + gridName + '</p>\n' +
                                '                        </div>\n' +
                                '                        <div class="div-xcmf-com-b pt10">\n' +
                                '                            <p class="cor-333 font-size-12 text-line-c4">' + personalInfo + '</p>\n' +
                                '                        </div>'+
                                '</div>'
                        }

                        $("#Div").html(str)

                    }else {
                        $("#Div").html('<div class="zwsj-box width-p100 height-p100 flex flex-ac flex-jc height-50">' +
                            '<p class="font-size-14 cor-ccc text-lh1">暂无数据</p>' +
                            '</div>')
                    }
                },
                error: function(data) {
                    console.log('获取数据连接超时！');
                },
                complete: function() {
                }
            });
        }

        function noData(data) {
            if (data==null){
                return "";
            }
        }
        
    </script>
</body>
</html>