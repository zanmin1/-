
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>政务公开</title>
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/common/css/animate.v4.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${UI_DOMAIN}/web-assets/_big-screen/35-xiangcunzhenxing/css/djyl.css" />
    <script>
        window.oncontextmenu = function (e) {
            //取消默认的浏览器自带右键 请勿删
            e.preventDefault();
        };

        var winW, whdef, rem;
        function fullPage() { //将页面等比缩放
            if (window.self === window.top) {
                winW = window.innerWidth;
            } else {
                winW = window.parent[0].innerWidth;
            }
            whdef = 100 / 1920;
            rem = winW * whdef; // 以默认比例值乘以当前窗口宽度,得到该宽度下的相应FONT-SIZE值
            document.querySelector('html').style.fontSize = rem + 'px';
        }
        fullPage();
        window.onresize = fullPage;
    </script>
</head>
<style>
.djyl-dj-ul::before{
    width: 100%;
    left: 0;
    background-size: 0% 0%;
}
.djyl-zwgk-li-span{
max-width: calc(95% - 1.5rem);
}
.djyl-zwgk-li-span02 {
    max-width: calc(85% - 2.6rem);
}
</style>
<body>
    <div class="h100 djyl-bj02 djyl-bj-padd02 bs">
        <div class="h100 prr25 bs clearfix h-x posi-rela">
             <!-- 左右结构 -->
             <!-- 左 -->
    <div class="contextMenu" id="myMenu2" style="display:none;">
	  <ul>
	    <li id="item_1">栏目配置</li>
	    <li id="item_2">刷新</li>
	  </ul>
	</div>
             <div class="fl djyl-zwgk-w">
                <!-- 轮播 -->
                <div id="cqfcD" class="w100 djyl-h636 djyl-zwgk-bor posi-rela mbr18">
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-b"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-b"></i>
                    <!-- swiper -->
                    <!-- 图片 -->
                    <div class="swiper-container swiper01 w100 h100">
                        <div class="swiper-wrapper" id="imgPan">
                        </div>
                        <div class="swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
                    </div>
                </div>
                <!-- 村情介绍 -->
                <div id="cqjsD" class="w100 djyl-h309 djyl-zwgk-bor djyl-bj03 posi-rela">
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-b"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-b"></i>
                    <!-- 内容 -->
                    <div class="plr20 prr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="clearfix mtr15">
                            <p class="fl djyl-zwgk-title color-red01 font-size-r18 posi-rela font-bold plr10 prr60">
                                村情介绍
                            </p>
                        </div>
                        <!-- 左右结构 -->
                        <div class="mtr35 djyl-zwgk-nr-h clearfix plr10 posi-rela">
                            <!-- 左 -->
                            <div class="fl">
                                <!-- img -->
                                <div class="img100 djyl-zwgk-img bor" id="cqjspic">
                                </div>
                            </div>
                            <!-- 右 -->
                            <div class="h100 fr djyl-zwgk-cxjs-w">
                                <div class="djyl-zwgk-text-h h-x">
                                    <p class="font-size-r16 cor-333 let-sp1 line-height-r24 h-x" id="cqjs"></p>
                                </div>
                                <!-- 更多 -->
                                <!-- 更多功能 -->
                                    <p class="mtr10 font-bold clearfix">
                                        <em class="font-size-r15 cor-333 fl">更多功能</em>
                                        <span class="fr djyl-span-bot-bor-w"></span>
                                    </p>
                                    <ul class="mtr10 djyl-ul-gdgn clearfix">
                                        <li class="fl" id="getpan">
                                            <a href="Javascript:;" class="font-size-r18 color-red01 font-bold">三务公开></a>
                                            <ul class="djyl-dj-ul plr20 prr20" hidden id="getpan0">
                                                <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c" onclick="openpage('${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000007');">
                                                    	党务公开</li>
                                                <li class="djyl-zwgk-bottom-bor ptr10 pbr10 text-align-c" onclick="openpage('${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000003');">
                                                    	村务公开</li>
                                                <li class="text-align-c ptr10 pbr10" onclick="openpage('${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000008');">
                                                    	财务公开</li>
                                            </ul>
                                        </li>
                                        <li class="fl">
                                            <a href="Javascript:;" class="font-size-r18 color-red01 font-bold" onclick="openpage('${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000009');">村规民约></a>
                                        </li>
                                        <li class="fl">
                                            <a href="Javascript:;" class="font-size-r18 color-red01 font-bold" onclick="openpage('${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000010');">家风家训></a>
                                        </li>
                                        <li class="fl">
                                            <a href="Javascript:;" class="font-size-r18 color-red01 font-bold" onclick="openpage('${gbpDomain!''}/gbp/commonInfoOpen/index.jhtml?catalogId=10000011');">移风易俗></a>
                                        </li>
                                    </ul>
                            </div>
                        </div>
                    </div>

                </div>
             </div>
             <!-- 右 -->
             <div id="cwgkD" class="fr djyl-zwgk-w534">
                <!-- 村务公开 -->
                <div class="w100 djyl-h309 djyl-zwgk-bor djyl-bj03 posi-rela mbr18">
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-b"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-b"></i>
                    <!-- 内容 -->
                    <div class="plr20 prr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="clearfix mtr15">
                            <p class="fl djyl-zwgk-title color-red01 font-size-r18 posi-rela font-bold plr10 prr60" onclick="openpage('${rc.getContextPath()}/system/setindex.jhtml?type=2');">
                                村务公开
                            </p>
                            <!-- 
                            <a href="Javascript:;" class="fr prr15 djyl-zwgk-title-a mtr5 posi-rela" onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/managePage.jhtml?type=2');">维护</a>
                            <a href="Javascript:;" class="fr prr15 djyl-zwgk-title-a mtr5 posi-rela" onclick="refresh();">刷新</a>
                            -->
                            <a href="Javascript:;" class="fr prr15 djyl-zwgk-title-a mtr5 posi-rela" onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000003&module=ztdr&title=村务公开&regionCode=${regionCode!''}');">更多</a>
                        </div>
                        <!-- 内容数据 -->
                        <ul class="mtr20 djyl-zwgk-nr-h plr10 h-x" id="cwgk">
                        </ul>
                    </div>
                </div>
                <!-- 政策宣传 -->
                <div id="zcxcD" class="w100 djyl-h309 djyl-zwgk-bor djyl-bj03 posi-rela mbr18">
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-b"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-b"></i>
                    <!-- 内容 -->
                    <div class="plr20 prr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="clearfix mtr15">
                            <p class="fl djyl-zwgk-title color-red01 font-size-r18 posi-rela font-bold plr10 prr60">
                                政策宣传
                            </p>
                            <a href="Javascript:;" class="fr prr15 djyl-zwgk-title-a mtr5 posi-rela" onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000006&module=ztdr&title=政策宣传&regionCode=${regionCode!''}');">更多</a>
                        </div>
                        <!-- 内容数据 -->
                        <ul class="mtr20 djyl-zwgk-nr-h plr10 prr5 h-x" id="zcxc">
                        </ul>
                    </div>
                </div>
                <!-- 办事指南 -->
                <div id="bsznD" class="w100 djyl-h309 djyl-zwgk-bor djyl-bj03 posi-rela">
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-t"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-l-b"></i>
                    <i class="djyl-zwgk-bor-i djyl-zwgk-bor-r-b"></i>
                    <!-- 内容 -->
                    <div class="plr20 prr20 h100 posi-rela">
                        <!-- 标题 -->
                        <div class="clearfix mtr15">
                            <p class="fl djyl-zwgk-title color-red01 font-size-r18 posi-rela font-bold plr10 prr60">
                                	办事指南</p>
                            <a href="Javascript:;" class="fr prr15 djyl-zwgk-title-a mtr5 posi-rela" onclick="openpage('${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=bszn&title=办事指南&regionCode=${regionCode!''}');">更多</a>
                        </div>
                        <!-- 内容数据 -->
                        <ul class="mtr20 djyl-zwgk-nr-h plr10 prr5 h-x" id="bszn">
                        </ul>
                    </div>
                </div>
             </div>
        </div>
    </div>
    <script src="${UI_DOMAIN}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
    <script src="${UI_DOMAIN}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
	<script type="text/javascript" src="${uiDomain!''}/js/layer/layer.js"></script>
	<script src="${rc.getContextPath()}/js/jquery.contextmenu.r2.js"></script>
    <script>
        // 滚动条
        $('.h-x').niceScroll({
            cursorcolor: "#dfa29d",
            cursoropacitymax: 1,
            cursorwidth: ".03rem",
            cursorborderradius: ".04rem",
            cursorborder: 'none',
            autohidemode: true,
        });
        
		bindRightMouse('cqfcD');
		bindRightMouse('cqjsD');
		bindRightMouse('cwgkD');
		bindRightMouse('zcxcD');
		bindRightMouse('bsznD');
        
	// 绑定右键
	function bindRightMouse(id) {
		            var type=6;
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
		            	// 党员情况
					    case 'cqfcD':
					        type=6;
					        break;
					    // 图文统计情况
					    case 'cqjsD':
					        type=7;
					        break;
					    // 基本情况
					    case 'cwgkD':
					        type=8;
					        break;
					    // 领导班子
					    case 'zcxcD':
					        type=9;
					        break;
					    // 党建动态
					    case 'bsznD':
					        type=10;
					        break;
					    default:
					        type=6;
					} 
				window.open('${rc.getContextPath()}/system/setindex.jhtml?type='+type);
		        },
		        'item_2': function(t) {
        			location.reload();
		        }
		    }
		});
	}
	
        xcPictureList();
        function xcPictureList() {
            $.ajax({
                type: 'POST',
                url: '${rc.getContextPath()}/dcl/xcBigScreen/xcPictureList.jhtml?id=${gridInfo.gridId}',
            	dataType: 'json',
                success: function(data) {
                	var str='';
    				for(i=0;i<data.length;i++){
                       str+='<div class="swiper-slide img100">'
                                +'<img src="${FILE_URL}'+data[i].filePath+'" alt="">'
                            +'</div>';
    				}
    				$('#imgPan').html(str);
    				
		if(data.length>1){
        var mySwiper = new Swiper('.swiper01', {
            speed:2000,
            autoplay: {
                delay: 3000,
                stopOnLastSlide: true,
                disableOnInteraction: false,
            },//可选选项，自动滑动
                spaceBetween: 20,
                loop: true,
            pagination: {
                el: '.swiper-pagination',
                clickable :true,
            },
                // direction: 'vertical',
                observer: true, //修改swiper自己或子元素时，自动初始化swiper
                observeParents: true //修改swiper的父元素时，自动初始化swiper
        })
        }
        
                },
                error: function(data) {
                    console.log("获图片数据连接超时！");
                },
                complete : function() {
                }
            });
        }
        
        findNoticeList('10000003');
        findNoticeList('10000005');
        findNoticeList('10000006');
        findNoticeList(1);
        function findNoticeList(catalogId) {
        	var map={orgCode: "${regionCode!''}",
						page: 1,
						rows: 10
						};
        		map.catalogId = catalogId;
        		map.isEndPubDate = 'no';
        		map.isPic = 'yes';
        		map.isPubOrg = 'no';
        		map.isTop = 'yes';
        	var	url='${gbpDomain!''}/gbp/commonInfoOpen/findReleaseListForJsonp.json?jsonpcallback=""';
        	if(catalogId==1){
        		url='${WECHAT_DOMAIN!''}/cct/handlingMatters/listDataForJsonp.json?jsonpcallback=""';
        		map={orgCode: "${regionCode!''}",
						page: 1,
						rows: 10
						};
        	}else if(catalogId=='10000005'){
        		map.onlyShowMyOrg = 'yes';
				map.otherpage = 1;
        	}else if(catalogId=='10000003'){
        		map.onlyShowMyOrg = 'yes';
				map.otherpage = 1;
        	}
            $.ajax({
                type: 'POST',
                url: url,
                data : map,
            	dataType: 'jsonp',
    			jsonp: "jsoncallback",
                success: function(data) {
    				var str = '';
    				var list=data.rows;
                	var dateStr = '';
    				if(catalogId=='10000003'){
    				for(i=0;i<list.length;i++){
    					dateStr=list[i].pubDate;
        				str+='<li class="clearfix mtr15" style="cursor:pointer;" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000003&module=ztdr&title=村务公开&regionCode=${regionCode!''}&infoOpenId='+list[i].infoOpenId+'\');">'
                                +'<span class="font-size-r14 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span" title="'+list[i].title+'">'
                                +list[i].title+'</span>'
                                +'<span class="fr font-size-r14 cor-666 let-sp1">'+dateStr.substring(0,10)+'</span>'
                            +'</li>';
    				}
    				$('#cwgk').html(str);
    				}else if(catalogId=='10000005'){
    					if(list.length == 0){
    					return;
    					}
    					if(list[0].fileName!="" && list[0].fileName!=null){
    					$('#cqjspic').html('<img src="${FILE_URL}'+list[0].fileName+'" alt="">');
    					}
    					noticeDetail(catalogId , list[0].infoOpenId);
    				}else if(catalogId=='10000006'){
    					for(i=0;i<list.length;i++){
    					dateStr=list[i].pubDate;
    						if(list[i].fileName!="" && list[i].fileName!=null){
    					//	str+='<li class="clearfix mtr15 pbr15 djyl-zwgk-bottom-bor djyl-h82" style="cursor:pointer;" onclick="showNotice('+list[i].infoOpenId+',\''+list[i].staticUrl+'\')">'
    						str+='<li class="clearfix mtr15 pbr15 djyl-zwgk-bottom-bor djyl-h82" style="cursor:pointer;" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000006&module=ztdr&title=政策宣传&regionCode=${regionCode!''}&infoOpenId='+list[i].infoOpenId+'\');">'
								+'<div class="djyl-zwgk-li-img mbr10 img100 fl">'
                                +'<img src="${FILE_URL}'+list[i].fileName+'" alt="">'
                                +'</div>'
        						+'<span class="font-size-r14 cor-333 let-sp1 fl text-line-c2 djyl-zwgk-li-span-po djyl-zwgk-li-span02 line-height-r34 mlr15" title="'+list[i].title+'">'
        						+list[i].title+'</span>'
                                +'<span class="fr font-size-r14 cor-666 let-sp1 djyl-zwgk-li-span-po">'+dateStr.substring(0,10)+'</span>'
                            	+'</li>';
    						}else{
    					//	str+='<li class="clearfix mtr15 pbr15 djyl-zwgk-bottom-bor" style="cursor:pointer;" onclick="showNotice('+list[i].infoOpenId+',\''+list[i].staticUrl+'\')">'
    						str+='<li class="clearfix mtr15 pbr15 djyl-zwgk-bottom-bor" style="cursor:pointer;" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&catalogId=10000006&module=ztdr&title=政策宣传&regionCode=${regionCode!''}&infoOpenId='+list[i].infoOpenId+'\');">'
                                +'<span class="font-size-r14 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span" title="'+list[i].title+'">'
								+list[i].title+'</span>'
                                +'<span class="fr font-size-r14 cor-666 let-sp1">'+dateStr.substring(0,10)+'</span>'
                            	+'</li>';
    						}
    					}
    					$('#zcxc').html(str);
    				}else if(catalogId==1){
    					for(i=0;i<list.length;i++){
    					//	str+='<li class="clearfix mtr15 pbr10 plr35 posi-rela djyl-zwgk-shouzhi" style="cursor:pointer;" onclick="showNotice('+list[i].hmId+',\'\','+catalogId+')">'
    						str+='<li class="clearfix mtr15 pbr10 plr35 posi-rela djyl-zwgk-shouzhi" style="cursor:pointer;" onclick="openpage(\'${rc.getContextPath()}/dcl/xcBigScreen/xcIndex.jhtml?type=3&module=bszn&title=办事指南&regionCode=${regionCode!''}&infoOpenId=' + list[i].hmId + '\');">'
                                +'<span class="font-size-r14 cor-333 let-sp1 fl text-line-c1 djyl-zwgk-li-span" title="'+list[i].mattersName+'">'
                                +list[i].mattersName+'</span>'
                                +'<span class="fr font-size-r14 cor-666 let-sp1">'+list[i].createTimeStr+'</span>'
                            +'</li>';
    					}
    					$('#bszn').html(str);
    				}
    				
                },
                error: function(data) {
                    console.log("获取列表数据连接超时！");
                },
                complete : function() {
                }
            });
        }
        
        function showNotice(id,staticUrl,catalogId) {
        	var	url='${gbpDomain!''}/gbp/commonInfoOpen/homeShow.jhtml?mode=view&noTop=1&infoOpenId='+id;
        	if(staticUrl!=null && staticUrl!=''){
        	url=staticUrl;
        	}
        	if(catalogId==1){
        		url='${WECHAT_DOMAIN!''}/cct/handlingMatters/view.mhtml?remark=1&hmId='+id;
        	}
			var pages=layer.open({
			    type: 2, //page层
			    //id:"mask-eventID",
			    area: ['1000px', '620px'],
			    title: '信息详情',
			    closeBtn: 1,
			    maxmin: false,
			    shade: 0.6, //遮罩透明度
			    shift: 2, //0-6的动画形式，-1不开启
			    content: url,
			    cancel: function(){
			    }
			});
        }
        
        function noticeDetail(catalogId,infoOpenId) {
        	var map={};
        		map.infoOpenId = infoOpenId;
        		map.mode = 'view';
        		map.orgCode = '${orgCode!''}';
        	var	url='${gbpDomain!''}/gbp/commonInfoOpen/detailForJsonp.json?jsonpcallback=""';
            $.ajax({
                type: 'POST',
                url: url,
                data : map,
            	dataType: 'jsonp',
    			jsonp: "jsoncallback",
                success: function(data) {
    				var overView=data.overView;
    				overView=overView.replaceAll("<strong>","");
    				overView=overView.replaceAll("</strong>","");
    				overView=overView.replaceAll("<p>","");
    				overView=overView.replaceAll("</p>","");
    				overView=overView.replaceAll("\n","");
    				overView=overView.replaceAll("\t","");
    				overView=overView.replaceAll(" ","");
    				$('#cqjs').html(overView);
                },
                error: function(data) {
                    console.log("获取村情介绍数据连接超时！");
                },
                complete : function() {
                }
            });
        }
        
        $("#getpan").mouseover(function(){
        	$("#getpan0").show();})
        $("#getpan").mouseout(function(){
        	$("#getpan0").hide();})
        
        function openpage(url) {
		window.open(url);
        }
        
        function refresh() {
        location.reload();
        }
        
            setInterval(function(){
        		findNoticeList('10000003');
        		findNoticeList('10000006');
        		findNoticeList(1);
            }, 15000);
            
            
            
    </script>
</body>
</html>