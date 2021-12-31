function setMaxCodeLength() {
    $('[maxcodelength]').on('input', function (e) {
        var $that =  $(this);
        var  limitLen = $that.attr("maxcodelength");//定义所需字节数
        $that.attr('maxlength',limitLen);
        setTimeout(function(){
            var value =  $that.val();
            var markNum = 0; 
            for (var i=0; i<value.length; i++) {
                if (value.charCodeAt(i)>127 || value.charCodeAt(i)==94) {
                	limitLen -= 2;  
                 }else{
                	limitLen --;  
                }
                if(limitLen < 0)
                	markNum ++;
            }
            if(limitLen<=0){
                var finalLen = value.length-markNum;
                value = value.substring(0,finalLen);
                $that.attr('maxlength',0);
                $that[0].value = value;
            }
        },0);
    });	
}

$(function(){	
	/*------------------tab导航------------------*/
    $(".tab-nav li").on('click', function () {
        $(".sideline").stop(true);
        $(".sideline").animate({ left: $(this).position().left }, 400);
        $(this).addClass("find-nav-cur").siblings().removeClass("find-nav-cur");
    });
    setMaxCodeLength();
});

//表达提交判断
function formValidation(){
	var isToF = true;//返回值
	$.each($('[appValidation]'), function(i, item) {
		var value = $(this).val();
		var text = $(this).text();
		//判空验证
		var isNotEmpty = $(this).attr('isNotEmpty');
		if(!isEmpty(isNotEmpty)){
			if(isEmpty(value)&&isEmpty(text)){
				layer.msg($(this).attr('isNotEmpty'));
				isToF = false;
				return false;
			}
		}
		//手机验证
		var isPhone = $(this).attr('isPhone');
		if(!isEmpty(isPhone)){
			if(!isEmpty(value)){
				if(!(isMobile(value) || isPhones(value))){
					layer.msg($(this).attr('isPhone'));
					isToF = false;
					return false;
				}
			}else if(!isEmpty(text)){
				if(!(isMobile(value) || isPhones(value))){
					layer.msg($(this).attr('isPhone'));
					isToF = false;
					return false;
				}
			}
		}
	
		
		
		//身份证验证
		var isManCar = $(this).attr('isManCar');
		if(!isEmpty(isManCar)){
			if(!isEmpty(value)){
				if(!isIdCardNo(value)){
					layer.msg($(this).attr('isManCar'));
					isToF = false;
					return false;
				}
			}else if(!isEmpty(text)){
				if(!isIdCardNo(value)){
					layer.msg($(this).attr('isManCar'));
					isToF = false;
					return false;
				}
			}
		}
		//邮箱验证
		var Email = $(this).attr('Email');
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(!isEmpty(Email)){
			if(!isEmpty(value)){
				if(!myreg.test(value)){
					layer.msg($(this).attr('Email'));
					isToF = false;
					return false;
				}
			}else if(!isEmpty(text)){
				if(!myreg.test(text)){
					layer.msg($(this).attr('Email'));
					isToF = false;
					return false;
				}
			}
		}
		
		//字符长度判断
		var Codelength = $(this).attr('Codelength');
		if(!isEmpty(Codelength)){
			Codelength = eval ("(" + Codelength + ")");
			var maxLength='';
			var minLength='';
			if(!isEmpty(Codelength[0].maxLength)){
				maxLength=Codelength[0].maxLength;
			}else{
				maxLength=9999999999999999;
			}
			if(!isEmpty(Codelength[0].minLength)){
				minLength=Codelength[0].minLength;
			}else{
				minLength=0;
			}
			if(!isEmpty(value)){
				var sureValue=0;
				if(!isEmpty(Codelength[0].isChar)&&Codelength[0].isChar==='true'){
				 for (var i=0; i<value.length; i++) {
		                if (value.charCodeAt(i)>127 || value.charCodeAt(i)==94) {
		                	sureValue += 2;  
		                 }else{
		                	 sureValue ++;  
		                }
		            }
				}else{
					sureValue=value.length;
				}
				if(minLength>sureValue||sureValue>maxLength){
					layer.msg(Codelength[0].prompt);
					isToF = false;
					return false;
				}
			}else if(!isEmpty(text)){
				var sureValue=0;
				if(!isEmpty(Codelength[0].isChar)&&Codelength[0].isChar==='true'){
				 for (var i=0; i<text.length; i++) {
		                if (text.charCodeAt(i)>127 || text.charCodeAt(i)==94) {
		                	sureValue += 2;  
		                 }else{
		                	 sureValue ++;  
		                }
		            }
				}else{
					sureValue=text.length;
				}
				if(minLength>sureValue||sureValue>maxLength){
					layer.msg(Codelength[0].prompt);
					isToF = false;
					return false;
				}
			}
		}
		
    });

	//限制输入英文数字
	var EnglishAndUnmber = $(this).attr('EnglishAndUnmber');
	var myreg = /^([0-9A-Z]{18})+$/;
	if(!isEmpty(EnglishAndUnmber)){
		if(!isEmpty(value)){
			if(!myreg.test(value)){
				layer.msg($(this).attr('EnglishAndUnmber'));
				isToF = false;
				return false;
			}
		}else if(!isEmpty(text)){
			if(!myreg.test(text)){
				layer.msg($(this).attr('EnglishAndUnmber'));
				isToF = false;
				return false;
			}
		}
	}

return isToF;
}


function isPhones(s){
	var regu = /^1\d{10}$/; 
	if(new RegExp(regu).test(s)){
		return true; 
	} else {
		return false;
	}   
}
function isMobile(s){
	var regu = /^((\(|\（)\d{3,4}(\)|\）)|\d{3,4}-)?\d{7,8}$/;
	if (new RegExp(regu).test(s)) {   
		return true;   
	}else{   
		return false;   
	}   
}

//身份证校验
function isIdCardNo(code) {
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;
    var isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
 
    if(!code){
        tip = "请输入身份证号！";
        pass = false;
    }
    else if(code!="" && !/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/i.test(code)){
        tip = "身份证号格式错误";
        pass = false;
    }
    else if(code!="" && !city[code.substr(0,2)]){
        tip = "地址编码错误";
        pass = false;
    }
    else{
        //18位身份证需要验证最后一位校验位
        if(code.length == 18){
            code = code.toUpperCase();
            code = code.split('');
            //加权因子
            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
            //校验位
            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++)
            {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if(last != code[17]){
                tip = "校验位错误";
                pass =false;
            }
        }
    }
    return pass;
}

//长按与点击事件
var topendTime = null;	
var topstartTime = null;
var toptimeOutEvent = 0;
var startopx = null;
var startopy = null;
var endtopx = null;
var endtopy = null;
var scrollx = null;
var scrolly = null;
function initLis(allid,delfun,detfun,keywor){
	
	$("#"+allid+" li").unbind('touchstart');
	$("#"+allid+" li").unbind('touchend');
	$("#"+allid+" li").unbind('touchmove');
	$("#"+allid+" li").on({
		touchstart : function(e){
			topstartTime = new Date().getTime();
			toptimeOutEvent = setTimeout(delfun+"("+$(this).attr(keywor)+")" ,1000);
			var touch = e.touches[0]; //获取第一个触点
			startopx = parseInt(Number(touch.pageX)); //页面触点X坐标
			startopy= parseInt(Number(touch.pageY)); //页面触点Y坐标
        },
        touchmove : function(e){
			var touch = e.touches[0]; //获取第一个触点
			endtopx = parseInt(Number(touch.pageX)); //页面触点X坐标
			endtopy= parseInt(Number(touch.pageY)); //页面触点Y坐标
			clearTimeout(toptimeOutEvent);
		},
        touchend : function(){
        	clearTimeout(toptimeOutEvent);
        	if(isEmpty(endtopx)){
        		endtopx=startopx;
        	}
        	if(isEmpty(endtopy)){
        		endtopy=startopy;
        	}
        	if (endtopx != startopx || endtopy != startopy) {
        		endtopx = null;
        		endtopy = null;
				return false;
			}
        	topendTime = new Date().getTime();
        	if (topendTime - topstartTime < 850) {
        		endtopx = null;
        		endtopy = null;
        		var  func=eval(detfun);
        	    new func($(this).attr(keywor));
        	}
        }
    });
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

//日期时间原型增加格式化方法

Date.prototype.Format = function (formatStr) {
    var str = formatStr;
    var Week = ['日', '一', '二', '三', '四', '五', '六'];

    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/yy|YY/, (this.getYear() % 100) > 9 ? (this.getYear() % 100).toString() : '0' + (this.getYear() % 100));
    var month = this.getMonth() + 1;
    str = str.replace(/MM/, month > 9 ? month.toString() : '0' + month);
    str = str.replace(/M/g, month);

    str = str.replace(/w|W/g, Week[this.getDay()]);

    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    str = str.replace(/d|D/g, this.getDate());

    str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
    str = str.replace(/h|H/g, this.getHours());
    str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
    str = str.replace(/m/g, this.getMinutes());

    str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
    str = str.replace(/s|S/g, this.getSeconds());
    return str;
}

//判断是否是空串
function isEmpty(str){
	if(str==undefined || str=="" || str==null){
		return true;
	}
	return false;
}
//截取字符串
function subStr(str,len){
	if(str!=null && str!='null' && typeof(str) !='undefined'){
		if(str.length>len){
			return str.substring(0,len)+"...";
		}else{
			return str;
		}
	}
	return "";
}

//地址选择器

//关闭与弹出 
var addrescho=new Array();//地址选择器集合
var addreschonone=new Array();//地址选择器集合
var addreschoind=0;//地址选择器角标
var addrenowshow = '';//当前显示的地址选择器
var addscrol='';//记入当前滑块位置
var alltokenkey='';
var alluserOrgCode='';
var allpath='';
var addreCode='';
var addreName='';
var addtype='';
var addreCallbackall="";
var morenorgCode='';
var maxaddrescenji=1;
var minaddrescenji=6;
var qrcodeCode=true;//是否打开二维码扫描
var showserchaddbiaoz="open";//标准地址开关

/**
 *
 * @param path 当前域名
 * @param token 用户
 * @param userOrgcode 用户
 * @param className 渲染的组件ID
 * @param addreCallback 回调
 * @param typeName 类型  grid  xiejing
 * @param orgCode 网格ID
 */
function showAddres(path,token,userOrgcode,className,addreCallback,typeName,orgCode,addreparm) {
	
	if(isEmpty(className)){
		alert("请添加新元素id名");
		return;
	}
	addreCallbackall=addreCallback;
	if(isEmpty(orgCode)){
		orgCode=userOrgcode;
	}
	if(!isEmpty(addreparm)){
		if(!isEmpty(addreparm[0].maxaddrescenji)){
			maxaddrescenji=addreparm[0].maxaddrescenji;
		}else{
			maxaddrescenji=1;
		}
		if(!isEmpty(addreparm[0].minaddrescenji)){
			minaddrescenji=addreparm[0].minaddrescenji;
		}else{
			minaddrescenji=6;
		}
		if(!isEmpty(addreparm[0].showserchadd)){
			showserchaddbiaoz=addreparm[0].showserchadd;
		}else{
			showserchaddbiaoz="open";
		}
	}else{
		maxaddrescenji=1;
		minaddrescenji=6;
		showserchaddbiaoz="open";
	}
	morenorgCode=orgCode;
	addtype=typeName;
	alltokenkey=token;
	alluserOrgCode=userOrgcode;
	allpath=path;
	var addreschoindex = addrescho.indexOf(className);
	var addbiaos=false;//是否存在当前地址选择器
	if (addreschoindex > -1) {
		addbiaos=true;
	}
	if(!addbiaos){
	var addreschocneji=new Array();
	addreschocneji[0]='<div class="form-line">'
							+'<label>省份</label>'
							+'<input type="hidden" name="provinceCode" id="provinceCode'+className+'"/>'
							+'<label id="orgid1'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'provinceCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="province'+className+'">请选择</span><i id="orgimg1'+className+'" class="right-icon"></i></label>'
							+'<select style="display: none;" id="provinceId'+className+'"></select>'
						+'</div>';
	addreschocneji[1]='<div class="form-line">'
							+'<label>城市</label>'
							+'<input type="hidden" name="cityCode" id="cityCode'+className+'"/>'
							+'<label id="orgid2'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'cityCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="city'+className+'">请选择</span><i id="orgimg2'+className+'" class="right-icon"></i></label>'
						 	+'<select style="display: none;" id="cityId'+className+'"></select>'
						 +'</div>';
	addreschocneji[2]= '<div class="form-line">'
							+'<label>区(县)</label>'
						    +'<input type="hidden" name="countyCode" id="countyCode'+className+'"/>'
						    +'<label id="orgid3'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'countyCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="county'+className+'">请选择</span><i id="orgimg3'+className+'" class="right-icon"></i></label>'
						 	+'<select style="display: none;" id="countyId'+className+'"></select>'
						 +'</div>';
	addreschocneji[3]= '<div class="form-line">'
						    +'<label>街(镇)</label>'
						    +'<input type="hidden" name="streetCode" id="streetCode'+className+'"/>'
						    +'<label id="orgid4'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'streetCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="street'+className+'">请选择</span><i id="orgimg4'+className+'" class="right-icon"></i></label>'
						 	+'<select style="display: none;" id="streetId'+className+'"></select>'
						 +'</div>';
	addreschocneji[4]= '<div class="form-line">'
						   	+'<label>社区(村)</label>'
						    +'<input type="hidden" name="communityCode" id="communityCode'+className+'"/>'
						    +'<label id="orgid5'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'communityCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="community'+className+'">请选择</span><i id="orgimg5'+className+'" class="right-icon"></i></label>'
						 	+'<select style="display: none;" id="communityId'+className+'"></select>'
						 +'</div>';
	addreschocneji[5]= '<div class="form-line">'
						   	+'<label>网格</label>'
						    +'<input type="hidden" name="lastgridCode" id="lastgridCode'+className+'"/>'
						    +'<label id="orgid6'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'lastgridCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="lastgrid'+className+'">请选择</span><i id="orgimg6'+className+'" class="right-icon"></i></label>'
						 	+'<select style="display: none;" id="lastgridId'+className+'"></select>'
						 +'</div>';
	$("body").append('<div class="wrap_pop" id="gird'+className+'" hidden>'
			+'<input type="hidden" id="'+className+'val"/>'
			+'<input type="hidden" id="'+className+'Name"/>'
			+'<input type="hidden" id="'+className+'searName"/>'
			+'<input type="hidden" id="'+className+'browserRefres"/>'
			+'<div class="wrap_pop_bg" style="background-color: white;"></div>'
			+'<div class="wrapper">'
			  	+'<div class="wrap-box" id="searchossUl'+ className +'" style="height: 100%;">'
				  	+'<div id="searchoost'+ className +'" style="background-color: white;width:98%; position: fixed;border-bottom: 2px solid #f0f0f0;z-index: 10;">'

					   +'</div>'
					+'</div>'
					
				 	+'<div class="footer-bar">'
						+'<div class="footer-wrap mix-btn btn-3">'
				   			+'<a href="javascript:void(0);" onclick="addresSure(\''+addreCallback+'\')" class="btn-blue">确定</a>'
				   			+'<a href="javascript:void(0);" onclick="addresReset()">重置</a>'
					       +'<a href="javascript:void(0);" onclick="showAddres(\''+path+'\',\''+token+'\',\''+userOrgcode+'\',\''+className+'\');" >关闭</a>'
						+'</div>'
					+'</div>'
				+'</div>'
			+'</div>');
	 $.each(addreschocneji, function(i, item) {
		 if(maxaddrescenji<(i+2)&&i<minaddrescenji){
			 $("#searchoost"+className).append(item);
		 }
     });

	if(typeName=="grid"){
		getGridlist(className,orgCode);
	}else if(typeName=="xiejing"){
		getaddresslist('provinceId'+className+'','1','');
		if(showserchaddbiaoz=="open"){
			$("#searchoost"+className).append('<div class="search-box">'+
								'<div>'+
									'<i class="search-icon"></i>'+
									'<a href="javascript:addressserachList(1,\''+ addreCallback +'\')" class="go-btn green" style="height: 35px; top: 0px;"></a>'+
									'<a href="javascript:toshowQraddr()" class="go-qrserch green" style="right:50px;"></a>'+
							       	'<input type="text" id="addsearchKwor'+ className +'" readonly="readonly"  onclick="inputaddsecr()" placeholder="详细地址" class="search-input" />'+
								'</div>'+
							'</div>');
			$("#searchossUl"+className).append('<div style="top:325px;background-color: white;">'
											   		+'<ul id="addsearlist'+ className +'">'
													+'</ul> '
													+'<div class="drag-hide" id="addserchnum'+className+'" value="1">'
									            		+'<a onclick="addressserachListto(\''+addreCallback+'\')">点击加载更多</a>'
									            	+'</div> '
									            	+'<div class="drag-hide" style="display: none;" id="addserchnomore'+className+'" value="1">'
									            		+'<a onclick="">没有更多数据</a>'
									            	+'</div> '
									            	+'<div class="drag-hide" style="display: none;" id="addserchnomoreloading'+className+'">'
									            		+'<a onclick=""><i style="display: inline-block;margin-right: 5px; width: 20px;height: 20px;background: url(../../../css/app/img/loading.gif) no-repeat; background-size: 100%; vertical-align: -4px;"></i>加载中</a>'
									            	+'</div> '
									            	+'<div style="height:70px;"></div>'
												+'</div>');
		}
		getmorenaddresslist(orgCode);
	}else{
		getaddresslist('provinceId'+className+'','1','');
		if(showserchaddbiaoz=="open"){
			$("#searchoost"+ className).append('<div class="search-box">'+
													'<div>'+
														'<i class="search-icon"></i>'+
														'<a href="javascript:addressserachList(1,\''+ addreCallback +'\')" class="go-btn green"></a>'+
														'<a href="javascript:toshowQraddr()" class="go-qrserch green" style="right:50px;"></a>'+
												       	'<input type="text" placeholder="详细地址" readonly="readonly" onclick="inputaddsecr()" id="addsearchKwor'+ className +'" class="search-input" />'+
													'</div>'+
												'</div>');
			$("#searchossUl"+ className).append('<div style="top:325px;background-color: white;">'
											   		+'<ul id="addsearlist'+ className +'">'
													+'</ul> '
													+'<div class="drag-hide" id="addserchnum'+className+'" value="1">'
									            		+'<a onclick="addressserachListto(\''+addreCallback+'\')">点击加载更多</a>'
									            	+'</div> '
									            	+'<div class="drag-hide" style="display: none;" id="addserchnomore'+className+'" value="1">'
									            		+'<a onclick="">没有更多数据</a>'
									            	+'</div> '
									            	+'<div class="drag-hide" style="display: none;" id="addserchnomoreloading'+className+'">'
									            		+'<i class="loading_icon"></i>加载中'
									            	+'</div> '
									            	+'<div style="height:70px;"></div>'
												+'</div>');
		}
		getmorenaddresslist(orgCode);
	}
	addrescho[addreschoind]=className;
	addreschoind++;
	}
	if(!isEmpty(landscapeCss)){
		$("#searchoost"+className).css("overflow","scroll");
		$("#searchoost"+className).css("height","84%");
	}
	var id = 'gird'+className;
	var id1='';
	var sdp = $("#"+id).css("display");
	if (sdp == "none") {
		$("#"+className+"browserRefres").val(browserRefreshType);
		browserRefreshType=false;
		nowbrowserRefreshtype=false;
		onPageFinished();
		setupWebViewJavascriptBridge(function(bridge) {
			bridge.callHandler('setBackButton',{
			'isListenerBack':true},function(data) {
				showAddres(path,token,userOrgcode,className);
			});
		});
		addscrol= $(window).scrollTop(); 
		addrenowshow=className;
		$("body").animate({scrollTop:0},0);
		$.each($("body").children(), function(i, item) {
			addreschonone[i]=$("body").children()[i].style.display;
			$("body").children()[i].style.display= 'none';
		});
		$("#"+id).show();
	} else {
		browserRefreshType=$("#"+className+"browserRefres").val();
		nowbrowserRefreshtype=browserRefreshType;
		onPageFinished();
//		setupWebViewJavascriptBridge(function(bridge) {
//			bridge.callHandler('setBackButton',{
//			'isListenerBack':shutdownwinType},function(data) {setupWebViewJavascriptBridge(function(bridge) {
//				bridge.callHandler('quit');
//			});
//			});
//		});
		$.each($("body").children(), function(i, item) {
			$("body").children()[i].style.display= addreschonone[i];
		});
		$("#"+id).hide();
		$(document).scrollTop(addscrol);
	}
}
//二维码扫描功能
function toshowQraddr(){
	if(qrcodeCode){
		setupWebViewJavascriptBridge(function(bridge) {
			bridge.callHandler('toQRAddress',{
			'isListenerBack':true},function(data) {
				toQRAddress(data);
			});
		});
	}
}
function toQRAddress(data){
	if(!isEmpty(data)){
		var index = data.indexOf("v=");
		if(index>-1){
				data=data.substr(index + 2,data.length);
				var url = allpath+"/api/v4/common/LocateListDfData.json?userOrgCode="+alluserOrgCode+"&tokenKey="+alltokenkey;
				var addresindexLoadsearsc = layer.load(1);
				$.post(url,{
					qrcode :data,
					addrtype:2,
				}, function(data) {
					layer.close(addresindexLoadsearsc);
					if(isEmpty(data)||isEmpty(data.data)||data.data.itemList.length==0||data.data.totalSize==0){
						layer.msg("未查询到相关地址");
						return;
					}
					var str=JSON.stringify(data.data.itemList[0]);
		        	var name = strInfo(data.data.itemList[0].addressPathName);
		        	var divisionCod = strInfo(data.data.itemList[0].regionCode);
		        	divisionCod=alluserOrgCode;
					browserRefreshType=$("#"+addrenowshow+"browserRefres").val();
					nowbrowserRefreshtype=browserRefreshType;
					onPageFinished();
//					setupWebViewJavascriptBridge(function(bridge) {
//						bridge.callHandler('showBackButton',{
//						'isListenerBack':shutdownwinType},function(data) {setupWebViewJavascriptBridge(function(bridge) {
//							bridge.callHandler('quit');
//						});
//						});
//					});
					$.each($("body").children(), function(i, item) {
						$("body").children()[i].style.display= addreschonone[i];
					});
					$("#gird"+addrenowshow).hide();
					$(document).scrollTop(addscrol);
					var func=eval(addreCallbackall);
				    new func(name,divisionCod,addrenowshow);
					
				},'json');
		}
	}
}

function selectDicttosure(type,path){
	switch(type){
    case "provinceCode":
    	selectDict(path,'provinceId'+addrenowshow,'provinceCode'+addrenowshow,'province'+addrenowshow,'provinceCallback');
      break;
    case "cityCode":
    	if($("#province"+addrenowshow).text()=="请选择"){
    		layer.msg("请先选择上级");
    		break;
    	}
    	selectDict(path,'cityId'+addrenowshow,'cityCode'+addrenowshow,'city'+addrenowshow,'cityCallback');
    	break;
    case "countyCode":
    	if($("#city"+addrenowshow).text()=="请选择"){
    		layer.msg("请先选择上级");
    		break;
    	}
    	selectDict(path,'countyId'+addrenowshow,'countyCode'+addrenowshow,'county'+addrenowshow,'countyCallback');
    	break;
    case "streetCode":
    	if($("#county"+addrenowshow).text()=="请选择"){
    		layer.msg("请先选择上级");
    		break;
    	}
    	selectDict(path,'streetId'+addrenowshow,'streetCode'+addrenowshow,'street'+addrenowshow,'streetCallback');
        break;
    case "communityCode":
    	if($("#street"+addrenowshow).text()=="请选择"){
    		layer.msg("请先选择上级");
    		break;
    	}
    	selectDict(path,'communityId'+addrenowshow,'communityCode'+addrenowshow,'community'+addrenowshow,'communityCallback');
        break;
    case "lastgridCode":
    	if($("#community"+addrenowshow).text()=="请选择"){
    		layer.msg("请先选择上级");
    		break;
    	}
    	selectDict(path,'lastgridId'+addrenowshow,'lastgridCode'+addrenowshow,'lastgrid'+addrenowshow,'lastgridCallback');
        break;
    default:
      break;
  }
}

function inputaddsecr(){
	layer.prompt({
		title: '请输入地址', 
		formType: 0,
		value:$("#addsearchKwor"+addrenowshow).val(),
		yes:function(index,layero){
			var value = layero.find(".layui-layer-input").val();
			layer.close(index);
			$("#addsearchKwor"+addrenowshow).val(value);
		}
	});
}

function addressserachListto(addreCallbacknam){
	var numbe=$("#addserchnum"+addrenowshow).val();
	addressserachList(numbe,addreCallbacknam);
}

function addressserachList(num,addreCallbacknam){
	var url = allpath+"/api/v4/common/LocateListDfData.json?userOrgCode="+alluserOrgCode+"&tokenKey="+alltokenkey;
	$("#addserchnomoreloading"+addrenowshow).show();
	$("#addserchnum"+addrenowshow).hide();
	$("#addserchnomore"+addrenowshow).hide();
	$.post(url,{
		pageNum : num,
		addrtype:1,
		searchStr :$("#addsearchKwor"+addrenowshow).val(),
		regionCode:$("#"+addrenowshow+"val").val(),
	}, function(data) {
		$("#addserchnomoreloading"+addrenowshow).hide();
		if(num==1){
			$("#addsearlist"+addrenowshow).empty();
			$("#addserchnum"+addrenowshow).val(1);
		}
		if(data!=null&&data.data!=null&&data.data.itemList!=null){
			//解析数组
//			data.data.itemList=eval('(' + data.data.itemList + ')');
			if(data.data.itemList.length==0||data.data.totalSize==0){
				$("#addserchnum"+addrenowshow).hide();
				$("#addserchnomore"+addrenowshow).show();
			}else{
				$("#addserchnum"+addrenowshow).show();
				$("#addserchnomore"+addrenowshow).hide();
			}
			var newnumb=Number(num) + Number(1);
			$("#addserchnum"+addrenowshow).val(newnumb);
	        $.each(data.data.itemList, function(i, item) {
	        	var str=JSON.stringify(item);
	        	var name = strInfo(item.addressName);
	        	var divisionCod = strInfo(item.addressStreetCode);
	        	$("#addsearlist"+addrenowshow).append('<li onclick="selectaddseracLi($(this),\''+ addreCallbacknam +'\')" style="line-height: 45px;border-bottom: 1px solid #ebebeb;padding-right: 10px;">'+
	        												'<div hidden addserachdiv=\''+str+'\'></div>'+
	        												'<a class="db-detail-a">'+
												            	name+
														    '</a>'+
														    
														'</li>');
	        });
		}
	},'json');
}

function selectaddseracLi(thisli,addreCallbacknam){
	var itemdata=JSON.parse(thisli.children(0).attr('addserachdiv'));
	$("#"+addrenowshow+"val").val(itemdata.addressStreetCode);
	$("#"+addrenowshow+"searName").val(itemdata.addressName);
	addresSure(addreCallbacknam,1);
}

//地址选择确认返回
function addresSure(addreCallback,typ){
	browserRefreshType=$("#"+addrenowshow+"browserRefres").val();
	nowbrowserRefreshtype=browserRefreshType;
	onPageFinished();
//	setupWebViewJavascriptBridge(function(bridge) {
//		bridge.callHandler('showBackButton',{
//		'isListenerBack':shutdownwinType},function(data) {setupWebViewJavascriptBridge(function(bridge) {
//			bridge.callHandler('quit');
//		});
//		});
//	});
	$.each($("body").children(), function(i, item) {
		$("body").children()[i].style.display= addreschonone[i];
	});
	$("#gird"+addrenowshow).hide();
	$(document).scrollTop(addscrol);
	addreCode=$("#"+addrenowshow+"val").val();
	var addreJson = $("#"+addrenowshow+"option"+addreCode).attr('jsonval');
	if(typ==1){
		addreName=$("#"+addrenowshow+"searName").val();
	}else{
		addreName=$("#"+addrenowshow+"Name").val()+strInfo($("#addsearchKwor"+addrenowshow).val(),"");
	}
	console.log(addreJson);
	var func=eval(addreCallback);
    new func(addreName,addreCode,addrenowshow,addreJson);
}

//重置按钮事件
function addresReset(){
	lastOptionsId="";
	$("#provinceCode"+addrenowshow).val("");
	$("#cityCode"+addrenowshow).val("");
	$("#countyCode"+addrenowshow).val("");
	$("#streetCode"+addrenowshow).val("");
	$("#communityCode"+addrenowshow).val("");
	$("#lastgridCode"+addrenowshow).val("");
	
	$("#cityId"+addrenowshow).empty(); 
	$("#countyId"+addrenowshow).empty(); 
	$("#streetId"+addrenowshow).empty(); 
	$("#communityId"+addrenowshow).empty(); 
	$("#province"+addrenowshow).html("请选择");
	$("#province"+addrenowshow).removeAttr("style");
	$("#city"+addrenowshow).html("请选择");
	$("#city"+addrenowshow).removeAttr("style");
	$("#county"+addrenowshow).html("请选择");
	$("#county"+addrenowshow).removeAttr("style");
	$("#street"+addrenowshow).html("请选择");
	$("#street"+addrenowshow).removeAttr("style");
	$("#community"+addrenowshow).html("请选择");
	$("#community"+addrenowshow).removeAttr("style");
	$("#lastgrid"+addrenowshow).html("请选择");
	$("#lastgrid"+addrenowshow).removeAttr("style");
	if(addtype=="grid"){
		getGridlist(addrenowshow,alluserOrgCode);
	}else{
		$("#"+addrenowshow+"val").val("");
		$("#"+addrenowshow+"Name").val("");
	}
}



function provinceCallback(name,value){
	$("#regionCode"+addrenowshow).val(value);
	$("#"+addrenowshow+"val").val(value);
	$("#"+addrenowshow+"Name").val(name);
	$("#province"+addrenowshow).attr("style", "color:#000");
	resSelect(1);
	if(addtype=="xiejing"){
	getaddresslist('cityId'+addrenowshow+'','2',value);
	if(showserchaddbiaoz=="open"){
		addressserachList(1,addreCallbackall);
	}
	}else if(addtype=="grid"){
		findgridList("cityId"+addrenowshow+"",value,'cityCode'+addrenowshow+'','city'+addrenowshow+'');
	}else{
		getaddresslist('cityId'+addrenowshow+'','2',value);
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}
	
}

function cityCallback(name,value){
	$("#regionCode"+addrenowshow).val(value);
	$("#city"+addrenowshow).attr("style", "color:#000");
	if(addtype=="xiejing"){
	name=$("#province"+addrenowshow).text()+name;
	}
	$("#"+addrenowshow+"val").val(value);
	$("#"+addrenowshow+"Name").val(name);
	resSelect(2);
	if(addtype=="xiejing"){
		getaddresslist('countyId'+addrenowshow+'','3',value);
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}else if(addtype=="grid"){
		findgridList("countyId"+addrenowshow+"",value,'countyCode'+addrenowshow+'','county'+addrenowshow+'');
	}else{
		getaddresslist('countyId'+addrenowshow+'','3',value);
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}
	
}

function countyCallback(name,value){
	$("#regionCode"+addrenowshow).val(value);
	$("#county"+addrenowshow).attr("style", "color:#000");
	if(addtype=="xiejing"){
	name=$("#province"+addrenowshow).text()+$("#city"+addrenowshow).text()+name;
	}
	$("#"+addrenowshow+"val").val(value);
	$("#"+addrenowshow+"Name").val(name);
	resSelect(3);
	if(addtype=="xiejing"){
	getaddresslist('streetId'+addrenowshow+'','4',value);
	if(showserchaddbiaoz=="open"){
		addressserachList(1,addreCallbackall);
	}
	}else if(addtype=="grid"){
		findgridList("streetId"+addrenowshow+"",value,'streetCode'+addrenowshow+'','street'+addrenowshow+'');
	}else{
		getaddresslist('streetId'+addrenowshow+'','4',value);
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}
}

function streetCallback(name,value){
	$("#regionCode"+addrenowshow).val(value);
	$("#street"+addrenowshow).attr("style", "color:#000");
	if(addtype=="xiejing"){
		name=$("#province"+addrenowshow).text()+$("#city"+addrenowshow).text()+$("#county"+addrenowshow).text()+name;
	}
	$("#"+addrenowshow+"val").val(value);
	$("#"+addrenowshow+"Name").val(name);
	resSelect(4);
	if(addtype=="xiejing"){
	getaddresslist('communityId'+addrenowshow+'','5',value);
	if(showserchaddbiaoz=="open"){
		addressserachList(1,addreCallbackall);
	}
	}else if(addtype=="grid"){
		findgridList("communityId"+addrenowshow+"",value,'communityCode'+addrenowshow+'','community'+addrenowshow+'');
	}else{
		getaddresslist('communityId'+addrenowshow+'','5',value);
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}
	
}

function communityCallback(name,value){
	$("#regionCode"+addrenowshow).val(value);
	$("#community"+addrenowshow).attr("style", "color:#000");
	if(addtype=="xiejing"){
		name=$("#province"+addrenowshow).text()+$("#city"+addrenowshow).text()+$("#county"+addrenowshow).text()+$("#street"+addrenowshow).text()+name;
		}
	$("#"+addrenowshow+"val").val(value);
	$("#"+addrenowshow+"Name").val(name);
	resSelect(5);
	if(addtype=="xiejing"){
	getaddresslist('lastgridId'+addrenowshow+'','6',value);
	if(showserchaddbiaoz=="open"){
		addressserachList(1,addreCallbackall);
	}
	}else if(addtype=="grid"){
		findgridList("lastgridId"+addrenowshow+"",value,'lastgridCode'+addrenowshow+'','lastgrid'+addrenowshow+'');
	}else{
		getaddresslist('lastgridId'+addrenowshow+'','6',value);
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}
	
}

function lastgridCallback(name,value){
	$("#lastgridCode"+addrenowshow).val(value);
	$("#lastgrid"+addrenowshow).attr("style", "color:#000");
	if(addtype=="xiejing"){
		name=$("#province"+addrenowshow).text()+$("#city"+addrenowshow).text()+$("#county"+addrenowshow).text()+$("#street"+addrenowshow).text()+$("#community"+addrenowshow).text()+name;
		}
	$("#"+addrenowshow+"val").val(value);
	$("#"+addrenowshow+"Name").val(name);
	if(addtype!="grid"){
		if(showserchaddbiaoz=="open"){
			addressserachList(1,addreCallbackall);
		}
	}
}


function resSelect(num){
	$("#lastgridId"+addrenowshow).empty(); 
	$("#lastgrid"+addrenowshow).html("请选择");
	$("#lastgrid"+addrenowshow).removeAttr("style");
	if(num == 1){
		$("#cityId"+addrenowshow).empty(); 
		$("#countyId"+addrenowshow).empty(); 
		$("#streetId"+addrenowshow).empty(); 
		$("#city"+addrenowshow).html("请选择");
		$("#city"+addrenowshow).removeAttr("style");
		$("#county"+addrenowshow).html("请选择");
		$("#county"+addrenowshow).removeAttr("style");
		$("#street"+addrenowshow).html("请选择");
		$("#street"+addrenowshow).removeAttr("style");
		$("#communityId"+addrenowshow).empty(); 
		$("#community"+addrenowshow).html("请选择");
		$("#community"+addrenowshow).removeAttr("style");
	}else if(num == 2){
		$("#countyId"+addrenowshow).empty(); 
		$("#streetId"+addrenowshow).empty(); 
		$("#county"+addrenowshow).html("请选择");
		$("#county"+addrenowshow).removeAttr("style");
		$("#street"+addrenowshow).html("请选择");
		$("#street"+addrenowshow).removeAttr("style");
		$("#communityId"+addrenowshow).empty(); 
		$("#community"+addrenowshow).html("请选择");
		$("#community"+addrenowshow).removeAttr("style");
	}else if(num == 3){
		$("#streetId"+addrenowshow).empty(); 
		$("#street"+addrenowshow).html("请选择");
		$("#street"+addrenowshow).removeAttr("style");
		$("#communityId"+addrenowshow).empty(); 
		$("#community"+addrenowshow).html("请选择");
		$("#community"+addrenowshow).removeAttr("style");
	}else if(num == 4){
		$("#communityId"+addrenowshow).empty(); 
		$("#community"+addrenowshow).html("请选择");
		$("#community"+addrenowshow).removeAttr("style");
	}
}

//获取地址集列表
function getaddresslist(selectId,level,divisionPcd){
	if(isEmpty(divisionPcd)){
		divisionPcd='-1';
	}
	var url = allpath+"/api/v4/common/geoAddressForJsonp.json?level="+level+"&source=XIEJING&userOrgCode="+alluserOrgCode+"&tokenKey="+alltokenkey+"&divisionPcod="+divisionPcd;
	var addresindexLoad = layer.load(1);
	$.getJSON(url, function(data) {
		layer.close(addresindexLoad);
		var rows = data.data.nodes;
		if(data.data.nodes!=null){
			//解析数组
	        $.each(data.data.nodes, function(i, item) {
	        	var name = strInfo(item.name);
	        	var str=JSON.stringify(item);
	        	var divisionCod = strInfo(item.divisionCod);
	        	$("#"+selectId).append('<span hidden jsonval='+ str +' id="'+ addrenowshow +'option'+divisionCod+'"></span>');
	        	$("#"+selectId).append('<option value="'+divisionCod+'">' + name + '</option>');
	        });
		}
	});
}

//获取地址集列表
function getmorenaddresslist(morenpcd){
	if(!isEmpty(morenpcd)){
		var morenpcdlengt=morenpcd.length/2;
			getaddmorenhuoqu(1,-1,morenpcd.substring(0, 2),morenpcd);
		}
}

function getaddmorenhuoqu(level,pcode,nowcode,morenpcd){
	if(level<=6){
	var url = allpath+"/api/v4/common/geoAddressForJsonp.json?level="+level+"&source=XIEJING&userOrgCode="+alluserOrgCode+"&tokenKey="+alltokenkey+"&divisionPcod="+pcode;
	var addresindexLoad = layer.load(1);
	$.getJSON(url, function(data) {
		layer.close(addresindexLoad);
		var rows = data.data.nodes;
		if(data.data.nodes!=null){
			//解析数组
	        $.each(data.data.nodes, function(i, item) {
	        	if(nowcode==item.divisionCod){
		        	var name = strInfo(item.name);
		        	var divisionCod = strInfo(item.divisionCod);
		        	tosetmorlies(level,name,divisionCod);
		        	return false;
	        	}
	        });
	        var newlevel=level+1;
	        if(newlevel>3){
	        	getaddmorenhuoqu(newlevel,nowcode,morenpcd.substring(0,nowcode.length+3),morenpcd);
	        }else{
	        	getaddmorenhuoqu(newlevel,nowcode,morenpcd.substring(0,nowcode.length+2),morenpcd);
	        }
		}
	});
	}
}
function tosetmorlies(level,name,divisionCod){
	switch(level)
	{
	case 1:
		$("#provinceCode"+addrenowshow).val(divisionCod);
		$("#province"+addrenowshow).text(name);
		provinceCallback(name,divisionCod);
	  break;
	case 2:
		$("#cityCode"+addrenowshow).val(divisionCod);
		$("#city"+addrenowshow).text(name);
		cityCallback(name,divisionCod);
	  break;
	case 3:
		$("#countyCode"+addrenowshow).val(divisionCod);
		$("#county"+addrenowshow).text(name);
		countyCallback(name,divisionCod);
		break;
	case 4:
		$("#streetCode"+addrenowshow).val(divisionCod);
		$("#street"+addrenowshow).text(name);
		streetCallback(name,divisionCod);
		 break;
	case 5:
		$("#communityCode"+addrenowshow).val(divisionCod);
		$("#community"+addrenowshow).text(name);
		communityCallback(name,divisionCod);
		 break;
	case 6:
		$("#lastgridCode"+addrenowshow).val(divisionCod);
		$("#lastgrid"+addrenowshow).text(name);
		lastgridCallback(name,divisionCod)
		 break;
	default:
	}
}


var setid='';
//获取组织信息
function getGridlist(className,orgCode) {
	var url = allpath+"/api/v4/common/defaultAddr.json?dataType=grid&tokenKey="+alltokenkey+"&userOrgCode="+ alluserOrgCode +"&orgCode="+orgCode;
	var addresindexLoad = layer.load(1);
	$.getJSON(url, function(data) {
		var rows = data.data.address;
		layer.close(addresindexLoad);
		if(data.data.address != null){
			//解析数组
	        $.each(data.data, function(i, item) {
	        	var provinceCode = strInfo(item.provinceCode);
	        	var province = strInfo(item.province,"请选择");//省
	        	var cityCode = strInfo(item.cityCode);//市
	        	var city = strInfo(item.city,"请选择");//市
	        	var countyCode = strInfo(item.countyCode);//县区
	        	var county = strInfo(item.county,"请选择");//县区
	        	var streetCode = strInfo(item.streetCode);//镇
	        	var street = strInfo(item.street,"请选择");//镇
	        	var communityCode = strInfo(item.communityCode);//村
	        	var community = strInfo(item.community,"请选择");//村
	        	var lastgridCode = strInfo(item.gridCode);//网格
	        	var lastgrid = strInfo(item.grid,"请选择");//网格
	        	var divisionCod = "";
	        	$("#provinceCode"+className).val(provinceCode);
	        	if(provinceCode != ""&& item.province !='' && item.province!=null){
	        		$("#"+addrenowshow+"Name").val(item.province);
	        		$("#orgid1"+className).attr("href","javascript:void(0);");
	        		$("#orgid1"+addrenowshow).attr("onclick","");
	        		$("#regionCode"+className).val(provinceCode);
	        		$("#orgimg1"+className).removeClass("right-icon");
	        		$("#province"+className).addClass("ftcolor");
	        		divisionCod = strInfo(provinceCode);
	        		setid = "cityId"+className;
	        	}else{
	        		$("#province"+className).removeClass("ftcolor");
	        	}
	        	$("#cityCode"+className).val(cityCode);
	        	if(cityCode != ""&& item.city !='' && item.city!=null){
	        		$("#"+addrenowshow+"Name").val(item.city);
	        		if(cityCode.length>alluserOrgCode.length){
	        			findgridList(setid,divisionCod,'','');
	        		}
	        		$("#city"+className).addClass("ftcolor");
	        		$("#regionCode"+className).val(cityCode);
	        		divisionCod = strInfo(cityCode);
	        		setid = "countyId"+className;
	        		if(cityCode.length<=alluserOrgCode.length){
	        			$("#orgid2"+className).attr("href","javascript:void(0);");
		        		$("#orgid2"+addrenowshow).attr("onclick","");
		        		$("#orgimg2"+className).removeClass("right-icon");
	        		}else{
	        			findgridList(setid,divisionCod,'','');
	        		}
	        	}else{
	        		$("#city"+className).removeClass("ftcolor");
	        	}
	        	$("#countyCode"+className).val(countyCode);
	        	if(countyCode != ""&& item.county !='' && item.county!=null){
	        		$("#"+addrenowshow+"Name").val(item.county);
	        		if(countyCode.length>alluserOrgCode.length){
	        			findgridList(setid,divisionCod,'','');
	        		}
	        		$("#county"+className).addClass("ftcolor");
	        		$("#regionCode"+className).val(countyCode);
	        		divisionCod = strInfo(countyCode);
	        		setid = "streetId"+className;
	        		if(countyCode.length<=alluserOrgCode.length){
		        		$("#orgid3"+className).attr("href","javascript:void(0);");
		        		$("#orgid3"+addrenowshow).attr("onclick","");
		        		$("#orgimg3"+className).removeClass("right-icon");
	        		}else{
	        			findgridList(setid,divisionCod,'','');
	        		}
	        	}else{
	        		$("#county").removeClass("ftcolor");
	        	}
	        	$("#streetCode"+className).val(streetCode);
	        	if(streetCode != ""&& item.street !='' && item.street!=null){
	        		$("#"+addrenowshow+"Name").val(item.street);
	        		if(streetCode.length>alluserOrgCode.length){
	        			findgridList(setid,divisionCod,'','');
	        		}
	        		$("#street"+className).addClass("ftcolor");
	        		$("#regionCode"+className).val(streetCode);
	        		divisionCod = strInfo(streetCode);
	        		setid = "communityId"+className;
	        		if(streetCode.length<=alluserOrgCode.length){
		        		$("#orgid4"+className).attr("href","javascript:void(0);");
		        		$("#orgid4"+addrenowshow).attr("onclick","");
		        		$("#orgimg4"+className).removeClass("right-icon");
	        		}else{
	        			findgridList(setid,divisionCod,'','');
	        		}
	        	}else{
	        		$("#street"+className).removeClass("ftcolor");
	        	}
	        	$("#communityCode"+className).val(communityCode);
	        	
	        	if(communityCode != ""&& item.community !='' && item.community!=null){
	        		$("#"+addrenowshow+"Name").val(item.community);
	        		if(communityCode.length>alluserOrgCode.length){
	        			findgridList(setid,divisionCod,'','');
	        		}
	        		$("#community"+className).addClass("ftcolor");
	        		$("#communityCode"+className).val(communityCode);
	        		divisionCod = strInfo(communityCode);
	        		setid = "lastgridId"+className;
	        		if(communityCode.length<=alluserOrgCode.length){
		        		$("#orgid5"+className).attr("href","javascript:void(0);");
		        		$("#orgid5"+addrenowshow).attr("onclick","");
		        		$("#orgimg5"+className).removeClass("right-icon");
	        		}else{
	        			findgridList(setid,divisionCod,'','');
	        		}
	        	}else{
	        		$("#community"+className).removeClass("ftcolor");
	        	}
	        	
	        	$("#lastgridCode"+className).val(lastgridCode);
	        	
	        	if(lastgridCode != ""&& item.grid !='' && item.grid!=null){
	        		$("#"+addrenowshow+"Name").val(item.grid);
	        		if(lastgridCode.length>alluserOrgCode.length){
	        			findgridList(setid,divisionCod,'','');
	        		}
	        		$("#lastgrid"+className).addClass("ftcolor");
	        		$("#lastgridCode"+className).val(lastgridCode);
	        		divisionCod = strInfo(lastgridCode);
	        		setid = "nofansdes"+className;
	        		if(lastgridCode.length<=alluserOrgCode.length){
		        		$("#orgid6"+className).attr("href","javascript:void(0);");
		        		$("#orgid6"+addrenowshow).attr("onclick","");
		        		$("#orgimg6"+className).removeClass("right-icon");
	        		}else{
	        			findgridList(setid,divisionCod,'','');
	        		}
	        	}else{
	        		$("#lastgrid"+className).removeClass("ftcolor");
	        	}
	        	
	        	$("#province"+className).html(province);
	        	$("#city"+className).html(city);
	        	$("#county"+className).html(county);
	        	$("#street"+className).html(street);
	        	$("#community"+className).html(community);
	        	$("#lastgrid"+className).html(lastgrid);
	        	
	        	$("#"+addrenowshow+"val").val(item.divisionCod);
	        	findgridList(setid,divisionCod,'','');
	        });
		}
	});
}

//获取组织子集列表
function findgridList(id,divisionPcd,id1,id2){
	if(id != "" && divisionPcd != ""){
		var url = allpath+"/api/v4/common/address.json?tokenKey="+ alltokenkey +"&userOrgCode="+alluserOrgCode+"&dataType=grid&divisionPcd="+divisionPcd;
		$.getJSON(url, function(data) {
			var rows = data.data.nodes;
			if(data.data.nodes!=null){
				$("#"+id).empty();
				//解析数组
		        $.each(data.data.nodes, function(i, item) {
		        	var name = strInfo(item.name);
		        	var divisionCod = strInfo(item.divisionCod);
		        	$("#"+id).append('<option value="'+divisionCod+'">' + name + '</option>');
		        });
			}
		});
	}
}

var newWindowscrol=0;
//弹窗功能
function popupNewWindow(content,truefun,falsefun,jsond,id){
	nowbrowserRefreshtype=false;
	onPageFinished();
	newWindowscrol= $(window).scrollTop(); 
	$("body").append('<div class="pop-box" id="commnewWind">'+
	    '<div class="pop-bg" id="commnewWindte"></div>'+
	    '<div class="pop-mid-wrap">'+
	        '<div class="pop-infor">'+
	            '<p class="wrap-tit-only">'+content+'</p>'+
	        '</div>'+
	        '<div class="pop-btn" id="winchioese">'+
	        '</div>'+
	    '</div>'+
	'</div>');
	$("#commnewWind").css("height",window.screen.availHeight);
	$("#commnewWindte").css("height",window.screen.availHeight);
	$(document).scrollTop(0);
	 if(!isEmpty(jsond)){
		 
     }else{
    	 $("#winchioese").append('<a onclick="newWindow('+falsefun+')" class="btn-border">取消</a>'+
    			 '<a onclick="newWindow('+truefun+',\''+id+'\')" class="btn-bg btn-blue">确认</a>');
     }
	document.body.style.overflow = 'hidden';
	window.addEventListener('touchmove', _preventDefault);

}

function _preventDefault(e) { e.preventDefault(); }
function newWindow(tyepwind,id){
	nowbrowserRefreshtype=browserRefreshType;
	onPageFinished();
	document.body.style.overflow = 'auto';
	window.removeEventListener('touchmove', _preventDefault);

	$("#commnewWind").remove();
	$(document).scrollTop(newWindowscrol);
	if(!isEmpty(tyepwind)){
		var func=eval(tyepwind);
	    new func(id);
	}
}

/*********************************************通用的字典 开始******************************************************/
var callback;
var hideId="";
var showId="";
var path="";
var isMore=false;//是否多选
var lastOptionsId;//记录最后一个窗口的optionsId,optionsId不变时，将不会再次创建窗口对象
//通用的字典选择方法
function selectDict(pathurl,optionsId,hid,sid,dictCallback){//pathurl:上下文路径   optionsId：存放字典option的options所对应的ID  hid:隐藏域参数        sid:显示参数  callback 回调
	callback = dictCallback;
	hideId=hid;
	showId=sid;
	path=pathurl;
	isMore=false;
	showWindow(optionsId);//弹框  参数：1:表示从顶部开始  空或其他表示偏中间位置显示
}
//通用的字典多选
function selectDicts(pathurl,optionsId,hid,sid,dictCallback){//pathurl:上下文路径   optionsId：存放字典option的options所对应的ID  hid:隐藏域参数        sid:显示参数  callback 回调
	callback = dictCallback;
	hideId=hid;
	showId=sid;
	path=pathurl;
	isMore=true;
	showWindow(optionsId);
}
var nowbrowserRefreshtype=false;
//显示半屏弹框
function showWindow(optionsId){
	nowbrowserRefreshtype=false;
	onPageFinished(false);
	if(lastOptionsId==optionsId){ //optionsId不变，不需要重新初始化窗口
		if ($("#"+hideId).val() == null || $("#"+hideId).val()=='' || $("#"+hideId).val()==undefined)
			$(".list_ul li").removeClass("curr_sel");
		//回填值
		$(".list_ul li").removeClass("curr_sel");
		var vals = $("#"+hideId).val();
		var v = vals.split(",");
		for(var i in v){
			$("li[val='"+v[i]+"']").addClass("curr_sel");
		}
		$("#dictWin").show();
	}else{
		//设置弹框
		$("#dictWin").remove();
		
		//居中选项弹窗
		if(!isMore){
			$("body").append('<div class="fixed-container" style="display:none;" id="dictWin"><div class="fixed-bg"></div><div class="fixed-data-3"><h3 class="pop-list-tit">请选择</h3><ul class="pop-list-ul list_ul"></ul><a href="javascript:void(0);" onclick="winHide();" class="pop-close"></a></div></div>');
		}else{
			$("body").append('<div class="fixed-container" style="display:none;" id="dictWin"><div class="fixed-bg"></div><div class="fixed-data-3"><h3 class="pop-list-tit">请选择</h3><ul class="pop-list-ul list_ul"></ul><h3 class="pop-list-btn sure"><a href="javascript:void(0);" onclick="moreSure();">确定</a></h3><a href="javascript:void(0);" onclick="winHide();" class="pop-close"></a></div></div>');
		}
		if(!isEmpty(landscapeCss)){
			$(".fixed-data-3").css("height","93%");
			$(".pop-list-ul").css("max-height","220px");
		}
		setDictLi(optionsId);
		//回填值
		var vals = $("#"+hideId).val();
		var v = vals.split(",");
		for(var i in v){
			$("li[val='"+v[i]+"']").addClass("curr_sel");
		}
		
		lastOptionsId = optionsId;
		
		//计算弹出窗的高度，并设置居中
		center($(".pop_mid_wrap"));
		
		$("#dictWin").show();
	}
}
//弹出框隐藏
function winHide(){
	nowbrowserRefreshtype=browserRefreshType;
	onPageFinished();
	$("#dictWin").hide();
}
//清空数据
function clearWin(){
	$(".list_ul li").removeClass("curr_sel");
	$("#"+hideId).val("");
	var $show = $("#"+showId); 
	if($show.is('span')){
		$show.html("");
	}else{
		$show.val("");
	}
	if(callback && typeof callback != 'undefined' && callback != undefined){
		var  func=eval(callback);
	    new func("","");
	}
	$("#dictWin").hide();
}


//设置列表项
function setDictLi(optionsId){
	$(".list_ul").html("");
	//当前的值
	$("#"+optionsId+" option").each(function(){
		var value = $(this).attr("value");
		var name = $(this).text();
		$(".list_ul").append('<li val="'+value+'" nam="'+name+'" onclick="selectedDict(this);">'+name+'</li>');
	});
}
//设置值
function selectedDict(node){
	nowbrowserRefreshtype=browserRefreshType;
	onPageFinished();
	var name = $(node).attr("nam");
	var value = $(node).attr("val");
	
	//如果是单选
	if(!isMore){
		$(".list_ul li").removeClass("curr_sel");
		$(node).addClass("curr_sel");
		
		$("#"+hideId).val(value);
		var $show = $("#"+showId); 
		if($show.is('span')){
			$show.html(name);
		}else{
			$show.val(name);
		}
		$("#dictWin").hide();
		if(callback && typeof callback != 'undefined' && callback != undefined){
			var  func=eval(callback);
		    new func(name,value);
		}
		
	}else{
		if($(node).hasClass("curr_sel")){
			$(node).removeClass("curr_sel");
		}else{
			$(node).addClass("curr_sel");
		}
	}
}

//选择更多
function moreSure(){
	nowbrowserRefreshtype=browserRefreshType;
	onPageFinished();
	var names = [];
	var vals = [];
	$(".list_ul li").each(function(){
		if($(this).hasClass("curr_sel")){
			var name = $(this).attr("nam");
			var value = $(this).attr("val");
			names.push(name);
			vals.push(value);
		}
	});
	
	$("#"+hideId).val(vals.join(","));
	var $show = $("#"+showId); 
	if($show.is('span')){
		$show.html(names.join(";"));
	}else{
		$show.val(names.join(";"));
	}
	$("#dictWin").hide();
	if(callback && typeof callback != 'undefined' && callback != undefined){
		var  func=eval(callback);
	    new func(names.join(";"),vals.join(","));
	}
	
}

//居中 
function center(obj) { 
	var ch = $(window).height();
	var ph = obj.height();
	var scrolltop = $(document).scrollTop(); 
	obj.css("margin-top",scrolltop+90+"px");
	
	//浏览器窗口大小改变时 
	$(window).resize(function() { 
		ch = $(window).height();
		ph = obj.height();
		scrolltop = $(document).scrollTop(); 
		obj.css("margin-top",scrolltop+90+"px");
	}); 
	//浏览器有滚动条时的操作、 
	$(window).scroll(function() { 
		ch = $(window).height();
		ph = obj.height();
		offH = (ch-ph)/2;
		scrolltop = $(document).scrollTop(); 
		obj.css("margin-top",scrolltop+90+"px");
	}); 
} 

//创建cookie
function setCookie(key, value, expireHours) {
	var exdate = new Date();
	exdate.setTime(exdate.getTime() + expireHours * 3600 * 1000);
	document.cookie = key + "=" + escape(value) + ((expireHours == null) ? ";path=/" : ";path=/;expires=" + exdate.toGMTString());
}
// 获取cookie
function getCookie(key) {
	if (document.cookie.length > 0) {
		var start = document.cookie.indexOf(key + "=")
		if (start != -1) { 
			start = start + key.length + 1; 
		    var end = document.cookie.indexOf(";", start);
		    if (end == -1) {
		    	end = document.cookie.length;
		    }	
		    return unescape(document.cookie.substring(start, end));
		} 
	}
	return "";
}

//调取原生控件
function connectWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) {
        callback(WebViewJavascriptBridge);
    } else {
        document.addEventListener(
            'WebViewJavascriptBridgeReady'
            , function() {
                callback(WebViewJavascriptBridge);
            },
            false
        );
    }
}

connectWebViewJavascriptBridge(function(bridge) {
    bridge.init(function(message, responseCallback) {
        console.log('JS got a message', message);
        var data = {
            'Javascript Responds': '测试中文!'
        };
        console.log('JS responding with', data);
        responseCallback(data);
    });

    bridge.registerHandler("functionInJs", function(data, responseCallback) {
        document.getElementById("show").innerHTML = ("data from Java: = " + data);
        var responseData = "Javascript Says Right back aka!";
        responseCallback(responseData);
    });
});

function setupWebViewJavascriptBridge(callback) {
	if (window.WebViewJavascriptBridge) { return callback(WebViewJavascriptBridge); }
	if (window.WVJBCallbacks) { return window.WVJBCallbacks.push(callback); }
	window.WVJBCallbacks = [callback];
	var WVJBIframe = document.createElement('iframe');
	WVJBIframe.style.display = 'none';
	WVJBIframe.src = 'wvjbscheme://__BRIDGE_LOADED__';
	document.documentElement.appendChild(WVJBIframe);
	setTimeout(function() { document.documentElement.removeChild(WVJBIframe); }, 0);
}
//是否允许下拉刷新
var browserRefreshType=false;
var browserRefreshBack="";
function browserRefreshforWin(enabled,back){
	browserRefreshType=enabled;
	nowbrowserRefreshtype=browserRefreshType;
	browserRefreshBack=back;
	onPageFinished();
}
//返回键设置为关闭浏览器
var shutdownwinType=false;
var shutdownwinBack="";
function shutDownWin(enabled,back){
	shutdownwinType=enabled;
	shutdownwinBack=back;
	onPageFinished();
}
//app加载完成后自动调用该方法(旧)
function browserRefresh(){
	onPageFinished();
}
//设置横屏
var landscapeType=false;
var landscapeBack="";
var landscapeCss='';
function landscapeWin(enabled,back){
	landscapeType=enabled;
	landscapeBack=back;
	onPageFinished();
}
//app加载完成后自动调用该方法
function onPageFinished(){
	setupWebViewJavascriptBridge(function(bridge) {
		bridge.callHandler('setRefreshEnabled',{
		'enabled':nowbrowserRefreshtype},function(data) {if(!isEmpty(browserRefreshBack)){
			var func=eval(browserRefreshBack);
		    new func();
		}});
	});
	setupWebViewJavascriptBridge(function(bridge) {
		bridge.callHandler('setBackButton',{
		'isListenerBack':shutdownwinType},function(data) {setupWebViewJavascriptBridge(function(bridge) {
			bridge.callHandler('quit');
		});});
		});
	setupWebViewJavascriptBridge(function(bridge) {
		bridge.callHandler('setScreenChange',{
		'isHorizontal':landscapeType},function(data) {
			if(landscapeType){
				landscapeCss="true";
			}
			if(!isEmpty(landscapeBack)){
				var func=eval(landscapeBack);
			    new func();
			}
		});
	});
}
function getbrowserupdownYN(){
	setupWebViewJavascriptBridge(function(bridge) {
		bridge.callHandler('getRefreshEnabled',{
		'enabled':type},function(data) {return data;});
});
}

/*********************************************通用的字典 结束******************************************************/
