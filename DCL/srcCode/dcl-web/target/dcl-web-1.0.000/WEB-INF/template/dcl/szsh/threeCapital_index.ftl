<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>三资管理</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-comm.css" />
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/css/subject/subject-wggl-2.css" />
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
<!-- 更多功能 start -->
<#--<div class="szsh-more posi-abso">-->
<#--    <div class="szsh-m-box hide">-->
<#--        <div class="w100 h100  flex flex-ac flex-jc">-->
<#--            <p class="szsh-mb-text">更多<br>功能</p>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="szsh-mb-content posi-abso bs">-->
<#--        <div class="szsh-mbc-title">-->
<#--            <p>更多功能</p>-->
<#--        </div>-->
<#--        <div class="szsh-mbc-content flex flex-clm">-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc active" name="zc">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-zcgl.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">资产管理</p>-->
<#--            </div>-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc" name="zj">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-zjgl.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">资金管理</p>-->
<#--            </div>-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc" name="zy">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-zygl.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">资源管理</p>-->
<#--            </div>-->
<#--            <div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc" name="ht">-->
<#--                <div class="szsh-mbcci-icon">-->
<#--                    <img src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/more-htgl.png">-->
<#--                </div>-->
<#--                <p class="szsh-mbcci-text">合同管理</p>-->
<#--            </div>-->
<#--        </div>-->
<#--        <a href="javascript:void(0);" class="flex flex-ac szsh-more-closed flex-jc">-->
<#--            <p>收起</p>-->
<#--            <i></i>-->
<#--        </a>-->
<#--    </div>-->
<#--</div>-->

    <div class=" h100  szsh-bj plr20 ptr20 pbr20 bs">
        <div class="h100 prr20 clearfix h-x ">
            <!-- 左 -->
            <div class="h926 smfw-l-w main-div-box fl bs plr30 prr40">
                <!-- 大标题 -->
                <div class="comm-div-title-big flex flex-ac">
<#--                    <a href="javascript:void(0);" class="fl comm-back-ext1 flex flex-ac">-->
<#--                        <i></i>-->
<#--                        <p class="font-size-r18 cor-d62a1e fl text-lh1" onclick="goback();">返回</p>-->
<#--                    </a>-->
<#--                    <i class="comm-line-ext1"></i>-->
                    <div class="comm-subject-title-ext1 plr5 bs">
                        <p class="font-size-r20 line-height-r48 text-align-c plr10 prr10 bs cor-fff font-bold">三资管理</p>
                    </div>
                </div>
                <div class="jfyh-l-top jfyh-l-top-h">
                    <div class="div-banner h-530 img100" id="szgl">
                        <div class="swiper-container szgl-swiper1 w100 h100">
                            <div class="swiper-wrapper" id="picDiv">
                                <#--                                <div class="swiper-slide">-->
<#--                                    <div class="h100 flex flex-ac img100">-->
<#--                                        <img class="" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/img01.png"/>-->
<#--                                    </div>-->
<#--                                </div> -->
<#--                                <div class="swiper-slide">-->
<#--                                    <div class="h100 flex flex-ac img100">-->
<#--                                        <img class="" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/img01.png"/>-->
<#--                                    </div>-->
<#--                                </div> -->
<#--                                <div class="swiper-slide">-->
<#--                                    <div class="h100 flex flex-ac img100">-->
<#--                                        <img class="" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/img01.png"/>-->
<#--                                    </div>-->
<#--                                </div> -->
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <div class=" h-100-600  clearfix bs">
                        <div class="h-100 w-33-20 fl " id="zjqk1">
                            <div class="comm-title-ext1">
                                <div class="comm-te1-item  w100 h100 bs plr5 prr5 fl posi-rela ">
                                    <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3">收入<em class="col-d62">情况</em></p>
                                    <span class="fr">
<#--                                        <i class="i-right"></i>-->
                                    </span>
                                </div>
                            </div>
                           
                            <div class="clearfix"></div>
                            <div class="div-t-com w100 mtr20  flex flex-ac ">
                                <div class="font-size-0"> <img class="img-w89-h97" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/icon-01.png"/></div>
                                <div class="mlr20">
                                    <p class="font-size-r18 col-d62"><em class="font-size-r38 font-bold mrr10 " id="sumIncome">0</em>万元</p>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 w-33-20 fl mlr30 mrr30" id="zjqk2">
                            <div class="comm-te1-item comm-title-ext1 w100 h100 bs plr5 prr5 fl posi-rela ">
                                <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3">支出<em class="col-d62">情况</em></p>
                                <span class="fr">
<#--                                    <i class="i-right"></i>-->
                                </span>
                            </div>
                            <div class="clearfix"></div>
                            <div class="div-t-com w100 mtr20 flex flex-ac ">
                                <div class="font-size-0"> <img class="img-w89-h97" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/icon-02.png"/></div>
                                <div class="mlr20">
                                    <p class="font-size-r18 col-d62"><em class="font-size-r38 font-bold mrr10 " id="sumPay">0</em>万元</p>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 w-33-20 fl " id="htqk">
                            <div class="comm-te1-item comm-title-ext1 w100 h100 bs plr5 prr5 fl posi-rela ">
                                <p class="font-size-r20 font-bold cor-333 line-height-r59 fl bor3">合同<em class="col-d62">总数</em></p>
                                <span class="fr">
<#--                                    <i class="i-right"></i>-->
                                </span>
                            </div>
                            <div class="clearfix"></div>
                            <div class="div-t-com w100 mtr20 flex flex-ac ">
                                <div class="font-size-0"> <img class="img-w89-h97" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/icon-03.png"/></div>
                                <div class="mlr20">
                                    <p class="font-size-r18 col-d62"><em class="font-size-r38 font-bold mrr10" id="contractCount">0</em>份</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- 右 -->
            <div class="h926 smfw-r-w  fr">
                <div class="smfw-r-top smfw-r-top-szgl main-div-box mbr10">
                    <div class="comm-div-title font-size-0">
                        <em class="font-size-r16 cor-d62a1e font-bold plr15">各类资源构成情况</em>
                    </div>
                    <div class="div-w-h-com" id="zygc">
                        <div class="div-w100-h100 plr30 prr30 ptr30 pbr30 img100 bs" id="columnarDiv">
                            <!-- #ed2315  字#333333 -->
<#--                            <img class="" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/bar01.png"/>-->
                        </div>
                    </div>
                </div>
                <div class="smfw-r-btn smfw-r-btn-szgl main-div-box ">
                    <div class="comm-div-title comm-div-title-w100 font-size-0 posi-rela">
                        <em class="font-size-r16 cor-d62a1e font-bold plr15">资产类型占比情况</em>
                    </div>
                    <div class="div-w-h-com" id="zczb">
                        <div class="div-w100-h100 plr30 prr30 ptr30 pbr30  bs h-x" id="pieDiv">
                            <!-- #fc645a #d94f43 #5fc8ff  #649abf #ffd05f #dba047 #ff895f #db6a47 #35dc87 #45a965  字#333333 -->
<#--                            <img class="imgmaxwh" src="${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/pie01.png"/>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="contextMenu" id="myMenu2" style="display:none;">
    <ul>
        <li id="item_1">栏目配置</li>
        <li id="item_2">刷新</li>
    </ul>
</div>
    <script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/swiper-6.4.15/swiper-master/package/swiper-bundle.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll-1.js"></script>
    <script src="${UI_DOMAIN}/web-assets/common/js/echarts4.2.0.min.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
    <script>

        // var urlJson = [
        //     {
        //         url:'http://gbp.zhxc.fzyzxxjs.cn/gbp/gbp/commonInfoOpen/index.jhtml?catalogId=10000116&system_privilege_action=5670'
        //     },
        //     {
        //         url:'2'
        //     },
        //     {
        //         url:'3'
        //     },
        //     {
        //         url:'4'
        //     },
        // ]

        // // 更多功能点击事件
        // $('.szsh-mbc-content').on('click','.szsh-mbcc-item',function(){
        //     $(this).addClass('active').siblings().removeClass('active');
        //     // var iIndex = $(this).index();
        //     // var url = urlJson[iIndex].url
        //     // window.location.href = url;
        // })
        // // 更多功能收起和展开事件
        // $('.szsh-more-closed').click(function(){
        //     $(this).parents('.szsh-mb-content').animate({right:"-1.14rem"},'linear',function(){
        //         $('.szsh-m-box').removeClass('hide');
        //     })
        // })
        // $('.szsh-m-box').click(function(){
        //     $('.szsh-m-box').addClass('hide');
        //     $(this).siblings('.szsh-mb-content').animate({right:".1rem"},'linear')
        // })

        window.oncontextmenu = function (e) {
            //取消默认的浏览器自带右键 请勿删
            e.preventDefault();
        };

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
        // var swiper = new Swiper(".szgl-swiper1.swiper-container", {
        //     // touchRatio : 0,
        //     loop: false,
        //     slidesPerView : 'auto',
        //     autoplay: {
        //         delay: 3000,
        //         stopOnLastSlide: false,
        //         disableOnInteraction: false,
        //     },
        //     pagination: {
        //         el: ".szgl-swiper1 .swiper-pagination",
        //     },
        // });

        $(function () {
            init()
        });

        function init() {
            initClickDiv();
            //轮播图
            initPic();
            //echars图数据
            initEchartsData();
            //柱状图
            // initColumnar();
            //饼图
            // initPie();
        }

        function initClickDiv(){
            // 特色乡村-村情村貌轮播图
            // bindRightMouse('lb');
            // 资金情况
            bindRightMouse('zjqk1');
            bindRightMouse('zjqk2');
            //合同情况
            bindRightMouse('htqk');

            bindRightMouse('szgl')
            // 各类资源构成情况
            bindRightMouse('zygc');
            // 资产类型占比情况
            bindRightMouse('zczb');
        }

        // 绑定右键
        function bindRightMouse(id) {
            var type = 0;
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
                            // 特色乡村-村情村貌轮播图
                            case 'szgl':
                                type = 41;
                                break;
                            // 资金情况
                            case 'zjqk1':
                                type = 42;
                                break;
                            // 资金情况
                            case 'zjqk2':
                                type = 42;
                                break;
                            // 合同情况
                            case 'htqk':
                                type = 43;
                                break;
                            // 各类资源构成情况
                            case 'zygc':
                                type = 44;
                                break;
                            // 资产类型占比情况
                            case 'zczb':
                                type = 45;
                                break;
                            default:
                                type = 0;
                        }
                        if (type != 0) {
                            window.open('${rc.getContextPath()}/system/setindex.jhtml?type=' + type);
                        }

                    },
                    'item_2': function(t) {
                        location.reload();
                    }
                }
            });
        }

        //echars图数据
        function initEchartsData() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/fundManagement/bunchData.jhtml',
                data: {
                    orgCode:'${orgCode!''}'
                },
                dataType: 'json',
                success: function (data) {
                    if (data != null && data != undefined){
                        if (data.sum != undefined){
                            $('#contractCount').text(data.sum.contractCount)
                            var sumIncome = (data.sum.sumIncome / 10000).toFixed(2)
                            $('#sumIncome').text(sumIncome)
                            var sumPay = (data.sum.sumPay / 10000).toFixed(2)
                            $('#sumPay').text(sumPay)
                        }
                        if (data.resList != undefined){
                            var nameList = []
                            var dataList = []
                            $.each(data.resList,function (i,val){
                                var name = val.typeName == null ? '' : val.typeName
                                nameList.push(name);
                                var json = {
                                    name: name,
                                    value: val.count == null ? 0 : val.count,
                                    itemStyle: {
                                        color: '#ed2315'
                                    },
                                }
                                dataList.push(json);
                            })
                            initColumnar(nameList,dataList)
                        }
                        if (data.assList != undefined){
                            var dataList = []
                            $.each(data.assList,function (i,val){
                                var json = {
                                    name: val.typeName == null ? '' : val.typeName,
                                    value: val.count == null ? 0 : val.count,
                                }
                                dataList.push(json);
                            })
                            initPie(dataList)
                        }
                    }
                    // console.log(data)
                },
                error: function (data) {
                    $.messager.alert('错误', '连接超时！', 'error');
                },
                complete: function () {
                    // modleclose(); //关闭遮罩层
                }
            });
        }

        //轮播图
        function initPic() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/threeCapital/getPzListData.jhtml',
                data: {
                    page:1,
                    rows:20,
                    catalogId:'10000116',
                    orgCode:'${orgCode!''}',
                    // isEndPubDate:'no',
                    // isPic:'yes',
                    // isPubOrg:'yes',
                    // isTop:'yes',
                    // tKey:'bannerManage',
                },
                success: function(data) {
                    $('#picDiv').empty()
                    if (data.rows != null && data.total > 0){
                        var html = '';
                        $.each(data.rows,function (i,val){
                            var pic = '${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/img01.png'
                            var fileName = val.fileName == null || val.fileName == undefined ? pic : '${FILE_URL}' + val.fileName
                            var infoOpenId = val.infoOpenId
                            html += '<div onclick="showMore(\'10000116\',\'村情村貌\',' + infoOpenId + ')" class="swiper-slide">\n' +
                                '        <div class="h100 flex flex-ac img100">\n' +
                                '           <img class="" style="cursor:pointer;" src="' + fileName + '"/>\n' +
                                '        </div>\n' +
                                '  </div> ';
                        })
                        $('#picDiv').append(html);
                        var swiper = new Swiper(".szgl-swiper1.swiper-container", {
                            // touchRatio : 0,
                            loop: false,
                            slidesPerView : 'auto',
                            autoplay: {
                                delay: 3000,
                                stopOnLastSlide: false,
                                disableOnInteraction: false,
                            },
                            pagination: {
                                el: ".szgl-swiper1 .swiper-pagination",
                            },
                        });
                    }else {
                        var pic = '${UI_DOMAIN}/web-assets/_big-screen/00-shuzishenghuo/images/subject/szgl/img01.png'
                        var html = '<div class="swiper-slide">\n' +
                            '        <div class="h100 flex flex-ac img100">\n' +
                            '           <img class="" src="' + pic + '"/>\n' +
                            '        </div>\n' +
                            '  </div> ';
                        $('#picDiv').append(html);
                    }
                },
                error: function(data) {

                },
                complete : function() {
                }
            });
        }

        function showMore(catalogId, title, infoOpenId) {
            window.open(
                '${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=' +
                catalogId + '&module=ztdr&title=' + encodeURI(title) + '&infoOpenId=' + infoOpenId
            );
        }

        //柱状图
        function initColumnar(nameList,dataList) {
            var myChart = echarts.init(document.getElementById('columnarDiv'));
            var option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { type: 'shadow' },
                },
                grid: {
                    left: '4%',
                    right: '4%',
                    bottom: '8%',
                    containLabel: true,
                },
                xAxis: [
                    {
                        type: 'category',
                        axisTick: { show: false },
                        axisLabel: {
                            textStyle: { fontSize: 0.14 * rem, color: '#4D4D4D' },
                            interval:0,
                            rotate:40
                        },
                        axisLine: {
                            lineStyle: { color: '#ed2315' },
                        },
                        data: nameList,
                    },
                ],
                yAxis: {
                    type: 'value',
                    show:false,
                    splitLine: {
                        show: false,
                    },
                    nameTextStyle: { fontSize: 0.14 * rem, color: '#4D4D4D' },
                    axisLabel: {
                        show: false,
                    },
                    axisTick: { show: false },
                    axisLine: {
                        lineStyle: { color: '#707070' },
                    },
                },
                series: [
                    {
                        name: '',
                        type: 'bar',
                        barWidth: '40%',
                        itemStyle: {
                            normal: {
                                barBorderRadius: [5, 5, 0, 0],
                                label: {
                                    show: true, //开启显示
                                    position: 'top', //在上方显示
                                    textStyle: {
                                        //数值样式
                                        color: 'black',
                                        fontSize: 0.16 * rem,
                                    },
                                },
                            },
                        },
                        data: dataList,
                    },
                ],
            };
            //console.log(option);
            myChart.setOption(option);
            myChart.resize();
        }

        //饼图
        function initPie(data) {
            var myChart = echarts.init(document.getElementById('pieDiv'));
            // var data = [{
            //     "name": "1111",
            //     "value": 10
            // }, {
            //     "name": "2222",
            //     "value": 10
            // }, {
            //     "name": "3333",
            //     "value": 10
            // }, {
            //     "name": "4444",
            //     "value": 10
            // }, {
            //     "name": "5555",
            //     "value": 10
            // }, {
            //     "name": "6666",
            //     "value": 20
            // }, {
            //     "name": "7777",
            //     "value": 30
            // }, ]

            // var a = ['#fc645a', '#d94f43', '#5fc8ff',  '#649abf', '#ffd05f', '#dba047', '#ff895f', '#db6a47', '#35dc87', '#45a965']

            var option = {

                color: ['#fc645a', '#5fc8ff', '#ffd05f', '#ff895f', '#35dc87','#A0CE3A', '#31C5C0', '#1E9BD1', '#0F347B', '#585247', '#7F6AAD', '#009D85', "rgba(250,250,250,0.3)"],
                grid: {
                    bottom: 1.5 * rem,
                    left: 1 * rem,
                    right: '10%'
                },
                legend: {
                    orient: 'vertical',
                    top: "middle",
                    right: "5%",
                    textStyle: {
                        fontSize: 0.15 * rem,

                    },
                    icon: 'circle',
                    data: data,
                },
                series: [
                    // 主要展示层的
                    {
                        radius: ['40%', '61%'],
                        center: ['35%', '50%'],
                        type: 'pie',
                        label: {
                            normal: {
                                show: true,
                                formatter: "{d}%",
                                textStyle: {
                                    fontSize: 0.3 * rem,

                                },
                                position: 'outside'
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        labelLine: {
                            normal: {
                                show: true,
                                length: 10,
                                length2: 10
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        name: "",
                        data: data,

                    },
                    // 边框的设置
                    {
                        radius: ['40%', '44%'],
                        center: ['35%', '50%'],
                        type: 'pie',
                        label: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: false
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: false
                            }
                        },
                        animation: false,
                        tooltip: {
                            show: false
                        },
                        data: [{
                            value: 1,
                            itemStyle: {
                                color: "rgba(250,250,250,0.3)",
                            },
                        }],
                    }
                ]
            };
            //console.log(option);
            myChart.setOption(option);
            myChart.resize();
        }

        function goback() {
            window.history.back();
        }

    </script>
<#include "/dcl/szsh/more_function.ftl" />
</body>
</html>