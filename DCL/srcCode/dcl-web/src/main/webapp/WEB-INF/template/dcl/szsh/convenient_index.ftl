<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>便民服务</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-comm.css" />
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-1.css" />
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
<div class="contextMenu" id="myMenu2" style="display:none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>

<div class="h100 szsh-bj plr20 ptr20 pbr20 bs">
    <div class="h100 prr20 clearfix">
        <!-- 左 -->
        <div class="h100 smfw-l-w main-div-box pbr50 bs fl" id="jbqk">
            <!-- 小标题 -->
            <div class="clearfix">
                <div class="comm-div-title font-size-0 fl">
                    <em class="font-size-r16 cor-d62a1e font-bold plr15">办事指南</em>
                </div>
                <span class="font-size-r14 cor-d62a1e font-bold prr15 mtr10 fr cursor"><em onclick="openMore()">更多</em><i class="comm-jt mlr5"></i></span>
            </div>
            <!-- 内容 -->
            <ul class="bmfw-box bmfw-box-li01 mtr40 plr30 prr30 h-x" id="leftList">
<#--                <li class="line-height-r48 plr30 prr30 font-size-0 clearfix">-->
<#--                    <span class="font-size-r14 cor-333 font-bold fl bmfw-box-nei text-line-c1">农合缴费开始了</span>-->
<#--                    <span class="font-size-r14 cor-999 fr">2021-11-1</span>-->
<#--                </li>-->
            </ul>
        </div>
        <!-- 右 -->
        <div class="h100 smfw-r-w main-div-box pbr50 bs fr" id="twtjqk">
            <!-- 小标题 -->
            <div class="clearfix">
                <div class="comm-div-title font-size-0 fl">
                    <em class="font-size-r16 cor-d62a1e font-bold plr15">办事分类</em>
                </div>
            </div>
            <!-- 内容 -->
            <ul class="bmfw-box bmfw-box-li02 mtr40 ptr5 plr30 prr30 clearfix h-x" id="rightList">
            </ul>
        </div>
    </div>
</div>
<script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
<script>
    window.oncontextmenu = function (e) {
        //取消默认的浏览器自带右键 请勿删
        e.preventDefault();
    };
    // 更多功能点击事件
    $('.szsh-mbc-content').on('click','.szsh-mbcc-item',function(){
        $(this).addClass('active').siblings().removeClass('active');
    })
    // 更多功能收起和展开事件
    $('.szsh-more-closed').click(function(){
        $(this).parents('.szsh-mb-content').animate({right:"-1.14rem"},'linear',function(){
            $('.szsh-m-box').removeClass('hide');
        })
    })
    $('.szsh-m-box').click(function(){
        $('.szsh-m-box').addClass('hide');
        $(this).siblings('.szsh-mb-content').animate({right:".1rem"},'linear')
    })

    // 滚动条
    $('.h-x').niceScroll({
        cursorcolor: "#dfa29d",
        cursoropacitymax: 1,
        cursorwidth: ".03rem",
        cursorborderradius: ".04rem",
        cursorborder: 'none',
        autohidemode: true,
    })
    // 动画结束 后执行
    document.querySelector('body').addEventListener("animationend", function() {
        $('.h-x').scroll().size()
    })
    var rows = 999;
    $(function (){
        getList();
        // modularContent();
         getModularContent();
        // 基本情况
        bindRightMouse('jbqk');
        bindRightMouse('twtjqk');
    });
    function getList(){
        var params = {
            page: 1,
            rows: rows,
            orgCode: ${regionCode}
        }
        $.ajax({
            type:'POST',
            url:"${WECHAT_DOMAIN}/cct/handlingMatters/listDataJsonP.mhtml?jsoncallback=setResturnees",
            data:params,
            dataType:'jsonp'
        });
    }
    function setResturnees(data) {
        var rows = data.rows;
        if(rows!=null && rows!=undefined){
            var str = '';
            for (let i = 0; i < rows.length; i++) {
                var mattersName = rows[i].mattersName;
                var updateTime = rows[i].updateTime;
                updateTime = updateTime.split(" ")[0];
                str+='  <li class="line-height-r48 plr30 prr30 font-size-0 clearfix" style="cursor:pointer" onclick="openMore('+rows[i].hmId+')"> '+
                     '<span class="font-size-r14 cor-333 font-bold fl bmfw-box-nei text-line-c1">'+mattersName+'</span>'+
                     '<span class="font-size-r14 cor-999 fr">'+updateTime+'</span>'+
                     '</li>';
            }
            $("#leftList").html(str);
        }

    }
    var type = '';
    var urlArr=[];
    function getModularContent(){
        var params = {
            currentPage: 1,
            pageSize: rows,
            orgCode: ${regionCode},
            modularName: '办事分类'
        }
        var url = '${rc.getContextPath()}/dcl/convenient/getModularContent.json';
        $.ajax({
            type: 'POST',
            url: url,
            data: params,
            dataType: 'json',
            success: function(data) {
                var str = '';
                for (let i = 0; i < data.data.length; i++) {
                    var subtitleName = data.data[i].name;
                    var attList = data.data[i].attList;
                    var img = '';
                    if(attList!=null && attList!=undefined ){
                        if(attList.length>0){
                             var attUrl = strInfo(data.data[i].attList[0].filePath);
                             if(attUrl!=''){
                                 img = '${FILE_URL}'+attUrl;
                             }
                        }
                    }
                    var url = strInfo(data.data[i].url);
                    urlArr[i]=url;
                    str += '<li class="main-div-box fl" style="cursor:pointer"  onclick="toOpen('+i+')">'+
                        '<p class="font-size-r18 font-bold cor-333 plr15 prr15 ptr10">'+strInfo(subtitleName)+'</p>'+
                        '<i class="img100">';
                        if(img!=''){
                            str += '<img src="'+img+'" alt="">';
                        }
                     str +='</i></li>';
                }
                $("#rightList").html(str);
            },
            error: function(data) {
                $.messager.alert('错误', '连接超时！', 'error');
            },
            complete : function() {
            }
        });
    }
    function toOpen(i){
        window.open(urlArr[i]);
    }

    function openMore(catalogId){
       var url = "${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=convenient&title=办事指南&catalogId="+catalogId;
        window.open(url);
    }

    //处理字符串
    function strInfo(str,replaceStr){
        if(str!=null && str!='null' && typeof(str) !='undefined'){
            return str;
        }else{
            if(replaceStr!=null && typeof(str) !='undefined'){
                return replaceStr;
            }
            return "";
        }
    }

    // 绑定右键
    function bindRightMouse(id) {
        var type=1;
        $('#' + id).contextMenu('myMenu2', { //菜单样式
            menuStyle: {
                border: 'none',
                width:'auto',
                padding:'0',
                borderRadius:'4px'

            }, //菜单项样式
            itemStyle: {
                fontSize: '14px',
                color: '#666',
                padding:'5px 15px',
                fontWeight: 'normal',
                border: 'none',
                borderRadius:'4px',
                backgroundColor:'rgba(189,173,173,0.3)',
                marginTop:'2px'
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
                        // 办事指南
                        case 'dyqk':
                            type=11;
                            break;
                        // 办事分类
                        case 'twtjqk':
                            type=12;
                            break;
                        default:
                            type=11;
                    }
                    window.open('${rc.getContextPath()}/system/setindex.jhtml?type='+type);

                },
                'item_2': function(t) {
                    location.reload();
                }
            }
        });
    }
</script>
<#include "/dcl/szsh/more_function.ftl" />
</body>
</html>