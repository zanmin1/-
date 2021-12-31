//关闭与弹出
var listchoosecho = new Array();//列表选择器集合
var listchoosechonone = new Array();//列表选择器集合
var listchooschoind = 0;//列表选择器角标
var listchooseshow = '';//当前显示的列表选择器
var listchooscrol = '';//记入当前滑块位置
var showOptionNow = '';
var showSearOption = '';
var allurl = '';
var nowchoosetype = "";
var showNameOptionNow = "";
var gendersear = "";
var chosrefromtype = "";
function showListChoose(url, className, searOption, showOption, addreCallback, showNameOption, placeholder) {
	if (isEmpty(className)) {
		alert("请添加新元素id名");
		return;
	}
	if (showOption[0] == "isPopcho") {
		nowchoosetype = "1";
		if (showOption.length > 1) {
			gendersear = showOption[1];
		} else {
			gendersear = "";
		}
	} else if (showOption[0] == "isBulicho") {
		nowchoosetype = "2";
	} else {
		nowchoosetype = "0";
	}
	if (!isEmpty(showOption[1])) {
		chosrefromtype = showOption[1];
	} else {
		chosrefromtype = "";
	}
	allurl = url;
	var listchoosechoindex = listchoosecho.indexOf(className);
	var listbiaos = false;//是否存在当前列表选择器
	if (listchoosechoindex > -1) {
		listbiaos = true;
	}
	showSearOption = searOption;
	showOptionNow = showOption;
	showNameOptionNow = showNameOption;
	listchooscrol = $(window).scrollTop();
	listchooseshow = className;
	if (!listbiaos) {
		var serckword;
		if (nowchoosetype == "1") {
			serckword = "请输入姓名或身份证";
		} else if (nowchoosetype == "2") {
			serckword = "请输入楼宇名称";
		} else {
			serckword = "请输入关键词";
		}
		if (placeholder != undefined) {
			serckword = placeholder;
		}

		if ($('#listchoose' + className).length == 0) {
			$("body").append(
				'<div class="wrap_pop" id="listchoose' + className + '" hidden>' +
				'	<input type="hidden" id="lisvalue' + className + '"/>' +
				'	<input type="hidden" id="lisNum' + className + '" value="1" />' +
				'	<div class="wrap_pop_bg" id="larer' + className + '"></div>' +
				'	<div class="search-box" style="position: fixed; z-index: 2; margin: 0; width: 100%; height: 60px; background-color: rgba(245, 245, 245, 0.95);">' +
				'		<div style="margin-top: 10px; width: 95%; margin-left: 2.5%;">' +
				'			<a href="javascript:searchChoose(\'' + url + '\',\'' + addreCallback + '\');" class="go-btn green"></a>' +
				'			<input type="text" class="search-input search-more" placeholder="' + serckword + '" id="' + searOption + className + '" onchange="searchChoose(\'' + url + '\',\'' + addreCallback + '\')"/>' +
				'		</div>' +
				'	</div>' +
				'	<div class="wrapper" style="top: 60px;">' +
				'		<div id="peoInfoNull' + className + '" class="default_wrap" hidden>' +
				'			<div class="text_infor">暂无数据</div>' +
				'		</div>' +
				'		<div class="list-wrap"  id="info' + className + '" style="margin-bottom: 60px;">' +
				'			<ul id="peoList' + className + '"></ul>' +
				'		</div>' +
				'	</div>' +
				'	<div class="drag-hide" style="display:none;" id="getchooseMore' + className + '">' +
				'		<a onclick="getChossemore(\'' + url + '\',\'' + addreCallback + '\')">点击加载更多</a>' +
				'	</div> ' +
				'	<div class="drag_hide">' +
				'		<span id="loading' + className + '"><i class="loading_icon"></i>加载中</span>' +
				'	</div>' +
				'	<div class="drag-hide" style="display:none;" id="bottomchoose' + className + '">' +
				'		<a>没有更多数据</a>' +
				'	</div>' +
				'</div>'
			);
		}
		listchoosecho[listchooschoind] = className;
		listchooschoind++;
		getChooselistData(url, 1, addreCallback, showOption);
	}
	var id = 'listchoose'+className;
	var id1='';
	var sdp = $("#"+id).css("display");
	if (sdp == "none") {
		nowbrowserRefreshtype=false;
		onPageFinishedJS(false);
		$("body").append('<a id="chooseUp'+className+'" onclick="gototop()" class="back-top" style="z-index: 100;"></a>');
		setupWebViewJavascriptBridge(function(bridge) {
			bridge.callHandler('setBackButton',{
			'isListenerBack':true},function(data) {
				showListChoose(url,className,searOption,showOption,addreCallback);
			});
		});
		$("html,body").animate({scrollTop:0},0);
		$.each($("body").children(), function(i, item) {
			listchoosechonone[i]=$("body").children()[i].style.display;
			$("body").children()[i].style.display= 'none';
		});
		$("#"+id).show();
	} else {
		nowbrowserRefreshtype=browserRefreshType;
		onPageFinishedJS();
		$("#chooseUp" + className).remove();
		$.each($("body").children(), function(i, item) {
			$("body").children()[i].style.display= listchoosechonone[i];
		});
		$("#" + id).hide();
		$(document).scrollTop(listchooscrol);
		if (!isEmpty(chosrefromtype) && "formaddadress" == chosrefromtype) {
			toaddbackfromotherjs();
		}
	}
}

$(function () {
    //返回顶部
    $(window).scroll(function () {
        if ($(window).scrollTop() <= 400) {
            $(".back-top").fadeOut();
        }
        else {
            $(".back-top").fadeIn();
        }
    });

});
function gototop(){
	//返回顶部
	 document.body.scrollTop = document.documentElement.scrollTop = 0;
}
function getChossemore(url,addreCallback){
	getChooselistData(url, $("#lisNum"+listchooseshow).val(),addreCallback,showOptionNow);
}
function searchChoose(url,addreCallback){
	getChooselistData(url,1,addreCallback,showOptionNow);
}

function getChooselistData(url,number,addreCallback,showOption){
	$("#loading"+listchooseshow).html('<i class="loading_icon"></i>加载中');
	$("#getchooseMore"+listchooseshow).hide();
	$("#peoInfoNull"+listchooseshow).hide();
	$("#bottomchoose"+listchooseshow).hide();
	var keyword=$("#"+showSearOption+listchooseshow).val();
	var params = {
        pageNum : number,
        q : keyword,
        gendersear:gendersear,
    };
	if(url.indexOf("/zhsq/wap/teamMember/getMemberList")>-1){
        delete params.q;
        params.name = keyword;
    }
	$.post(url,params, function(data) {
		if(data != null&&data.data!=null){
			var rows = data.data.itemList.length;
			var pageSize= data.data.pageSize;
			var total = data.data.totalSize;
			if(number == 1){
				lastpage = parseInt((total - 1) / rows) + 1;
				if(total == 0 || rows == 0){
					$("#getchooseMore"+listchooseshow).hide();
					$("#peoInfoNull"+listchooseshow).show();
				}
				$("#peoList"+listchooseshow).empty();
			}
			if(rows > 0){
				$("#peoInfoNull"+listchooseshow).hide();
				//解析数组
		        $.each(data.data.itemList, function(i, item) {
		        	var str=JSON.stringify(item);
		        	$("#peoList"+listchooseshow).append(
		        			'<li choosestrdata=\''+str+'\'>' +
				                '<div class="list-con no-avatar" onclick="selectChooseList($(this),\''+addreCallback+'\')">' +
					                '<div class="r-detail" id="'+listchooseshow+number+'howOption'+i+'" style="padding-right:0px; width:100%;">' +
					                '</div>' +
				                '</div>' +
				        	'</li>'			        			
				         );
		        	if(!isEmpty(showOption)){
		        		if(nowchoosetype=="1"){
		        			var sexcloor="";
					        if(item["genderCN"]=="女"||item["genderCN"]=="女性"){
					        	sexcloor="c-red"
					        }else if(item["genderCN"]=="男"||item["genderCN"]=="男性"){
					        	sexcloor="c-blue"
					        }else{
					        	sexcloor="c-orange"
					        }
					        var addressAllNameDeal = "";
					        if(url.indexOf('userOrgCode=36') == -1){
					        	addressAllNameDeal='<div class="minor-line">' +
		                    	'<input readonly="readonly" style="width:340px; color: #aaa;" value="户籍地址：' + strInfo(item["addressAllNameDeal"],"") + '">' +
			                    '</div>';
					        }
		        			 $("#"+listchooseshow+number+"howOption"+i).append('<div class="main-line" id="'+listchooseshow+number+'howOptiondiv0">' +
				                    	'<span class="name">' + strInfo(item["partyName"],"") + '</span>' +
				                    	'<span class="label-c '+sexcloor+'">' + strInfo(item["genderCN"],"") + '</span>' +
					                    '</div>'+
				                    	'<div class="minor-line">' +
				                    	'<p><span>身份证号：' + strInfo(item["identityCard"],"") + '</span></p>' +
					                    '</div>'+
					                    addressAllNameDeal);
		        		}else if(nowchoosetype=="2"){
		        			$("#"+listchooseshow+number+"howOption"+i).append('<div class="main-line" id="'+listchooseshow+number+'howOptiondiv0">' +
		        					'<input class="chosseaddresAllName" readonly="readonly" value="' + item["buildingName"] + '"></input>' +
//		        					'<span class="">' + strInfo(item["buildingName"],"") + '</span>' +
			                    	'<span class="label-c c-blue">' + strInfo(item["useNatureStr"],"") + '</span>' +
				                    '</div>'+
			                    	'<div class="minor-line">' +
			                    	'<input readonly="readonly" style="width:340px; color: #aaa;" value="楼宇地址：' + strInfo(item["buildingAddress"],"") + '">' +
				                    '</div>');
		        			$(".chosseaddresAllName").css({'width':'70%','margin-right': '6px'});
		        		}else{
		        			if(!isEmpty(showNameOptionNow)){
		        				$.each(showOption, function(showOptionindex, showOptionitem) {
				        			 if(showOptionindex==0){
				        			 $("#"+listchooseshow+number+"howOption"+i).append('<div class="main-line" id="'+listchooseshow+number+'howOptiondiv0">' +
				                    	'<span class="name">'+ strInfo(showNameOptionNow[showOptionindex],"") + strInfo(item[showOptionitem],"") + '</span>' +
				                    '</div>');
				        			 }else{
				        				 $("#"+listchooseshow+number+"howOption"+i).append('<div class="minor-line">' +
							                    	'<p><span>'+ strInfo(showNameOptionNow[showOptionindex],"") + strInfo(item[showOptionitem],"") + '</span></p>' +
								                    '</div>');
				        			 }
				        		 });
		        			}else{
			        			$.each(showOption, function(showOptionindex, showOptionitem) {
				        			 if(showOptionindex==0){
				        			 $("#"+listchooseshow+number+"howOption"+i).append('<div class="main-line" id="'+listchooseshow+number+'howOptiondiv0">' +
				                    	'<span class="name">' + strInfo(item[showOptionitem],"") + '</span>' +
				                    '</div>');
				        			 }else{
				        				 $("#"+listchooseshow+number+"howOption"+i).append('<div class="minor-line">' +
							                    	'<p><span>' + strInfo(item[showOptionitem],"") + '</span></p>' +
								                    '</div>');
				        			 }
				        		 });
		        			}
		        		}
		        	}
			        });
		        $("#getchooseMore"+listchooseshow).show();
		        if((parseInt(total)<parseInt(pageSize))){
					$("#getchooseMore"+listchooseshow).hide();
				}
		        number++;
		        $("#lisNum"+listchooseshow).val(number);
		        }else{
		        	layer.msg("没有更多数据");
		        	if($("#lisNum"+listchooseshow).val()<1){
		        			$("#bottomchoose"+listchooseshow).show();
		        	}
		        	$("#getchooseMore"+listchooseshow).hide();
		        }
			}
		$("#loading"+listchooseshow).html('');
		},'json');
	}



//列表确认返回
function selectChooseList(josn,addreCallback){
	nowbrowserRefreshtype=browserRefreshType;
	onPageFinishedJS();
	$("#chooseUp"+listchooseshow).remove();
//	setupWebViewJavascriptBridge(function(bridge) {
//		bridge.callHandler('setBackButton',{
//		'isListenerBack':false},function(data) {
//		});
//	});
	var itemdata=JSON.parse(josn.parent().attr('choosestrdata'));
	$.each($("body").children(), function(i, item) {
		$("body").children()[i].style.display= listchoosechonone[i];
	});
	$("#listchoose"+listchooseshow).hide();
	$(document).scrollTop(listchooscrol);
	if(!isEmpty(chosrefromtype)&&"formaddadress"==chosrefromtype){
		toaddbackfromotherjs();
	}
	var func=eval(addreCallback);
    new func(itemdata,listchooseshow);
    
    
}

/*********************************************通用的字典 结束******************************************************/
