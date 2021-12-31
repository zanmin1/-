/** 可以参考 add_upload.jsp
 * 
 * <一> 微信上传(图片语音)组件
 *    页面中必须要有input id="accountId" 并传值过来
 *    上传图片: (1) <div id="uploadImgDiv"></div>       (2) initUploadImg(2,3);//参数可加可不加(一行显示一个，最多上传几张)
 *    上传语音: (1) <div id="uploadVoiceDiv"></div>     (2) initUploadVoice(9);//参数可加可不加(最多上传几个)
 *    共同步骤： 调 getJsSdkMsg() 加载sdk
 * 
 *    表单提交时要取上传到微信服务器的图片ID： $("#imageServerId").val();
 *    表单提交时要取上传到微信服务器的语音ID： $("#voiceServerId").val();
 * 
 * <二>使用图片和语音上传要注意事项：
 * 
 *    上传图片要注意事项：
 *      1.1 <li name="weixinPhoto"></li>     页面中不要定义这种li不然会影响图片数量统计
 *      1.2 页面中不要定义元素Id为： imageServerId,PictureListUl
 *  
 *    上传语音要注意事项：
 *      1.1 <li name="weixinVoice"></li>     页面中不要定义这种li不然会影响语音数量统计
 *      1.2 页面中不要定义元素Id为： VoiceUploadBtn,voiceServerId,VoiceListUl,uploadVoiceDialog
 *     
 * <三>查看页面（下载语音文件）
 *    (1) <div class="VoiceList"><ul id="downVoiceListUl" ></ul></div>  下载语音显示的div
 *    (2) 调 getJsSdkMsg() 加载sdk   
 *    (3) downloadVoiceInter(voiceServerId);//参数为语音serverId   多个用,隔开
 */

//加载sdk的遮罩层index
var loadSdkIndex;
//存放参数的数组对象
var wx_base_param_arr = [];
Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
	if (this[i] == val) return i;
	}
	return -1;
};

Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
	this.splice(index, 1);
	}
};

/**
 * 判断是不是微信浏览器
 * @returns {Boolean}
 */
function isweixin(){
  var ua = navigator.userAgent.toLowerCase();
  return ua.match(/MicroMessenger/i)=="micromessenger" || window.__wxjs_environment == 'miniprogram';
}


/**
 * 初始化参数对象(对象对应的id,一行放置的图片数量,最多能上传的图片数量)
 * @param config : {wx_id:attDivId_0,wx_lineimg_num:1,wx_maximg_num:1}
 */
function initWxUploadImg(config){
	var default_config = {
			wx_lineimg_num:3,
			wx_maximg_num:9,
			wx_imgs:{
				localId: [],
				serverId: [],
				cur_serverId:[]
			}
	};
	
	if(config == "" || config == undefined || config == null){
		alert("初始化参数对象不能为空");
	}
	
	if(config.wx_id == "" || config.wx_id == undefined || config.wx_id == null){
		alert("id不能为空");
	}
	
	//默认一行放置的图片数量为3
	if(config.wx_lineimg_num == "" || config.wx_lineimg_num == undefined || config.wx_lineimg_num == null){
		config.wx_lineimg_num=default_config.wx_lineimg_num;
	}
	
	//最多能上传的图片数量位9
	if(config.wx_maximg_num == "" || config.wx_maximg_num == undefined || config.wx_maximg_num == null){
		config.wx_maximg_num=default_config.wx_maximg_num;
	}
	
	//存放图片数组
	config.wx_imgs = default_config.wx_imgs;
	wx_base_param_arr.push(config);
	
}

/**
 * 选择图片(多张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function chooseWxImg(formId,base,funType,maxCount,callBackFunc){
try {
	var currentWxImgObj = getCurrentWxImgObject(formId);
    var nowImgNum=getWxUploadedImgNum(formId);
    // var canUploadNum=currentWxImgObj.wx_maximg_num-nowImgNum;
    var canUploadNum = 9 - $('.pic-li').length;
    if (canUploadNum == 0) {
		ffcs.alertMsg("最多上传9张照片");
		return
	}
	wx.chooseImage({
	      count: canUploadNum || 9, // 默认9
	      success: function (res) {
	    	    if(currentWxImgObj == undefined || currentWxImgObj == null){
	    	    	alert("该上传图片的控件没有初始化！！！");
	    	    }

	    	    currentWxImgObj.wx_imgs.localId = res.localIds;
	    	    updateWxBaseParamArr(currentWxImgObj);
	    	    
		        //alert('已选择 ' + res.localIds.length + ' 张图片');
		        //直接上传图片,并显示在页面上
		        uploadWxImageInt(formId,base,funType,callBackFunc);
	      },
		fail: function (res) {
			alert(JSON.stringify(res));
		}
	    });
} catch (e) {
	alert(e.message)
}
    
}
function getLocation(callBack){
	try {
		wx.getLocation({
			success: function (res) {
				//alert(JSON.stringify(res));
				if(typeof callBack == 'function'){
					callBack(res.longitude,res.latitude)
				}
			},
			fail: function (res) {
	            alert("定位功能未开启，请前往设置开启！");
	        }
		});
	} catch (e) {
		alert(e.message);
	}
	
}

/**
 * 选择图片(一张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function chooseWxImgOnlyOne(formId,base,funType){
	  wx.chooseImage({
		  count: 1, // 默认9
	      success: function (res) {
	    	    var currentWxImgObj = getCurrentWxImgObject(formId);
	    	    if(currentWxImgObj == undefined || currentWxImgObj == null){
	    	    	alert("该上传图片的控件没有初始化！！！");
	    	    }
	    	    
	    	    currentWxImgObj.wx_imgs.localId = res.localIds;
	    	    updateWxBaseParamArr(currentWxImgObj);
		        uploadWxImageIntOnlyOne(formId,base,funType);
	      }
	    });
}


/**
 * 获取当前选中的上传控件对象
 * 通过定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param formId
 * @returns
 */
function getCurrentWxImgObject(formId){
	 for(var i = 0;i < wx_base_param_arr.length;i++){
	    	if((wx_base_param_arr[i] != "" || wx_base_param_arr[i] != undefined || wx_base_param_arr[i] != null)
	    		&& (wx_base_param_arr[i].wx_id != "" || wx_base_param_arr[i].wx_id != undefined || wx_base_param_arr[i].wx_id != null)
	    		&& parseInt(wx_base_param_arr[i].wx_id) == parseInt(formId)){
	    		return wx_base_param_arr[i];
	    	}
	 }
	 return null;
}


/**
 * 更新全局数组中当前对象对应的数据
 * @param currentWxImgObj
 */
function updateWxBaseParamArr(currentWxImgObj){
	 for(var i = 0;i < wx_base_param_arr.length;i++){
	    	if((wx_base_param_arr[i] != "" || wx_base_param_arr[i] != undefined || wx_base_param_arr[i] != null)
	    		&& (wx_base_param_arr[i].wx_id != "" || wx_base_param_arr[i].wx_id != undefined || wx_base_param_arr[i].wx_id != null)
	    		&& (parseInt(wx_base_param_arr[i].wx_id) == parseInt(currentWxImgObj.wx_id))){
	    		//alert("wx_base_param_arr_"+i+"___"+wx_base_param_arr[i].wx_id+"___"+currentWxImgObj.wx_id+"__"+currentWxImgObj.wx_imgs.serverId.length);
	    		wx_base_param_arr[i]=currentWxImgObj;
	    		//alert("wx_base_param_arr_"+i+"___"+wx_base_param_arr[i].wx_imgs.serverId.length);
	    		return;
	    	}
	 }
}

/**
 * 获取已经上传的图片数量
 * @param formId 定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @returns {Number}
 */
function getWxUploadedImgNum(formId){
	var len = $("#attDiv_" + formId).find('input[name="filePath"]').length;
	return len ? len : $("#attDiv_" + formId).find('input[type="hidden"][class="form_atta"]').length;
}

/**
 * 上传图片，并显示在页面上(多张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function  uploadWxImageInt(formId,base,funType,callBackFunc){
		
	   var currentWxImgObj = getCurrentWxImgObject(formId);
	   
       if (currentWxImgObj.wx_imgs.localId.length == 0) {
	      ffcs.alertMsg("请先选择图片"); 
	      return;
	   }
       
	    var i = 0, length = currentWxImgObj.wx_imgs.localId.length;
	    //currentWxImgObj.wx_imgs.serverId = [];
	    
	    //获取已经上传的图片的数量
	    var nowImgNum=getWxUploadedImgNum(formId);
	    //alert("已经上传图片的数量为："+nowImgNum);
	    //计算还能上传的图片数量
	    var canUploadNum=currentWxImgObj.wx_maximg_num-nowImgNum;
	    //alert("还能上传的图片数量："+canUploadNum);
		//清空当前上传的图片记录
		currentWxImgObj.wx_imgs.cur_serverId.splice(0,currentWxImgObj.wx_imgs.cur_serverId.length);

	    function uploadWxImg(formId,base,funType) {
	      wx.uploadImage({
	        localId: currentWxImgObj.wx_imgs.localId[i],
	        success: function (res) {
		        i++;//记录着目前是第几张图片
				currentWxImgObj.wx_imgs.cur_serverId.push(res.serverId);
		        currentWxImgObj.wx_imgs.serverId.push(res.serverId);
		        //alert("上传成功的图片数量："+currentWxImgObj.wx_imgs.serverId.length);
			    updateWxBaseParamArr(currentWxImgObj);  
		        
	            if (i < length && i < canUploadNum) {//还有图片要上传  && 小于能允许上传的数量才能上传
				  uploadWxImg(formId,base,funType);//上传图片
	            }else{
	                if(funType != undefined && funType != null && "declare"==funType){
	                	wxImgfileUploadSpecial(formId,base,funType,callBackFunc);
	                }else{
	                	wxImgfileUploadCommon(formId,base,funType,callBackFunc);
	                }
	            	
	              return;
	            }
	        },
	        fail: function (res) {
	            alert(JSON.stringify(res));
	        }
	      });
	    }
	    
	    uploadWxImg(formId,base,funType);
}

/**
 * 上传图片，并显示在页面上(单张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function uploadWxImageIntOnlyOne(formId,base,funType){
	var currentWxImgObj = getCurrentWxImgObject(formId);
	   
    if (currentWxImgObj.wx_imgs.localId.length == 0) {
	      ffcs.alertMsg("请先选择图片"); 
	      return;
	   }
    
	    var i = 0, length = currentWxImgObj.wx_imgs.localId.length;
	    currentWxImgObj.wx_imgs.serverId = [];
	    
	    //获取已经上传的图片的数量
	    var nowImgNum=getWxUploadedImgNum(formId);
	    //alert("已经上传图片的数量为："+nowImgNum);
	    //计算还能上传的图片数量
	    var canUploadNum=currentWxImgObj.wx_maximg_num-nowImgNum;
	    //alert("还能上传的图片数量："+canUploadNum);
	    //清空当前上传的图片记录
		currentWxImgObj.wx_imgs.cur_serverId.splice(0,currentWxImgObj.wx_imgs.cur_serverId.length);

	   
	    function uploadWxImg(formId,base,funType) {
	      wx.uploadImage({
	        localId: currentWxImgObj.wx_imgs.localId[i],
	        success: function (res) {
		        i++;//记录着目前是第几张图片
				currentWxImgObj.wx_imgs.cur_serverId.push(res.serverId);
		        currentWxImgObj.wx_imgs.serverId.push(res.serverId);
		        //alert("上传成功的图片数量："+currentWxImgObj.wx_imgs.serverId.length);
			    updateWxBaseParamArr(currentWxImgObj);  
		        
			    if(funType != undefined && funType != null && "zone_binding"==funType){//个人中心绑定
			    	wxImgfileUploadCommonOnlyOne(formId,base,funType);
                }
                return;
	        },
	        fail: function (res) {
	            alert(JSON.stringify(res));
	        }
	      });
	    }
	    
	    uploadWxImg(formId,base,funType);
}


/**
 * 公用上传(多张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function wxImgfileUploadCommon(formId,base,funType,callBackFunc){
	var currentWxImgObj = getCurrentWxImgObject(formId);
	//var imgServerIds = currentWxImgObj.wx_imgs.serverId;
	var imgServerIds = currentWxImgObj.wx_imgs.cur_serverId;
	loadSdkIndex = ffcs.loading();
	$.ajax({
	    url: base + "/wap/imgupload/fileUpload.mhtml",
		type: "post",
		data : {
			imgServerIds:imgServerIds,
			funType:funType,
			type:'zhangzhou'
		},
		dataType:"json",
		success: function(data) {
			try {
				//将返回的数据转成json
				var domain = data.data.domain; //域名
				var chooseImgList = data.data.list; //图片列表信息
				for (var i = 0; i < chooseImgList.length; i++) {
					var path = chooseImgList[i].url;
					var url = domain + path;
					
					var lis = '';
					if (callBackFunc && typeof callBackFunc == "function") {
						lis = callBackFunc(path, url);
					} else {
						// var lis =
						// 	'<div class="evt-pic-upload" style="height: 107px;">' +
						// 	'<input type="hidden" name="wxFilePath" value="'+ path +'"/>'+
						// 	'<a href="#" onclick="previewImg(' + url + ')"><img style="min-width: 100%;min-height: 100%;" src="' + url + '" /></a>' +
						// 	// '<i class="close_btn" onclick="delOneImg(' + id + ');"><img src="'+base+'/images/help/close_icon.png" /></i>' +
						// 	'</div>';
						lis += '<li class="pic-li">'
						lis += '	<input type="hidden" name="wxFilePath" value="'+ path +'"/>'
						lis += '	<img onclick="previewImg(this,\''+ path +'\');" src="' + url + '">'
						lis += '	<i onclick="delImge(this)"></i>'
						lis += '</li>'
					}
					$('.evt-upload-defult').before(lis);
		            pathArr.push(path);
		            urlArr.push(url);
				}
				//设置图片高度
				//设置图片高度
				$('.idx-dyn-pic').each(function(){
					var _this=this;
					$(this).children('li').each(function(){
						console.log($(_this).children('li').eq(0).width());
						$(this).height(Number($(_this).children('li').eq(0).width()));
					});

				});
			    ffcs.alertMsg('图片上传成功');
				$('.mengceng-luyin').removeClass('mengceng-luyin-on');
				$('.mengcengImg').removeClass('mengcengImg-on');
				$('.mengceng-main').slideDown(300);
			 	layer.close(loadSdkIndex);//关闭遮罩层
			} catch (e) {

				alert(('错误【' + e.message + '】发生在【' +   e.lineNumber + '】行'));
			} finally{
				layer.close(loadSdkIndex);//关闭遮罩层
			}
		},
		error:function(data) {
			
			ffcs.alertMsg("连接超时！！！");
			layer.close(loadSdkIndex);//关闭遮罩层
		}
	});
}

function delImge(node){
	$(node).parents('.pic-li').remove();
}


function previewImg(node, path){
	var urls = [];
	$('#attDiv_0').find('img').each(function(){
		urls.push($(this).attr('src'));
	});
	var curr = imgDomain + path
	wx.previewImage({
		current : curr,
		urls : urls
	});
	// var src = $(obj).attr("src");
	// var html = '<img style="width:100%" src="'+src+'" >';
	// layer.open({
    //     title :false,
    //     type: 1,
    //     area: ['90%','95%'],
    //     content:html
    // });
}


/**
 * 公用上传(单张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function wxImgfileUploadCommonOnlyOne(formId,base,funType){
	var currentWxImgObj = getCurrentWxImgObject(formId);
	//var imgServerIds = currentWxImgObj.wx_imgs.serverId;
	var imgServerIds = currentWxImgObj.wx_imgs.cur_serverId;
	loadSdkIndex = ffcs.loading();
	$.ajax({
	    url: base + "/wap/imgupload/fileUpload.mhtml",
		type: "post",
		data : {
			imgServerIds:imgServerIds,
			funType:funType,
			type:'zhangzhou'
		},
		dataType:"json",
		success: function(data) {
			//将返回的数据转成json
			var domain = data.data.domain; //域名
			var chooseImgList = data.data.list; //图片列表信息
			for (var i = 0; i < chooseImgList.length; i++) {
				var path = chooseImgList[i].url;
				var url = domain + path;
				//原来清空
				$("#attDiv_" + formId).html("");
				//新的添加上去
				var lis = 
					'<li class="upload_box">' +
		            '    <a href="javascript:chooseImgHasWeiXin('+ formId +');">' +
		            '    <div class="img_box">' +
		            '    <input type="hidden" name="wx_img_path" value="'+ path +'"/>' +
		            '    <img src="'+ url +'"/>' +
		            '    </div>' +
		            '    </a>' +
		            '    <i class="close_btn" onclick="delImgOnlyOne(this,'+ formId +');"><img src="'+base+'/resources/images/help/close_icon.png" /></i>' +
		            '</li>';
				$("#attDiv_" + formId).append(lis);
			}
		    //设置图片高度
			var width = $("#attDiv_" + formId + " li a img").width();
		    $("#attDiv_" + formId + " li a img").height(width);
		    ffcs.alertMsg('图片上传成功');
		 	layer.close(loadSdkIndex);//关闭遮罩层
		},
		error:function(data) {
			ffcs.alertMsg("连接超时！！！");
			layer.close(loadSdkIndex);//关闭遮罩层
		}
	});
}


/**
 * 特殊需求上传(多张)
 * @param formId  定位上传图片控件的后缀id(比如页面上attDivId_0中的0)
 * @param base    上下文路径
 * @param funType 功能类型
 */
function wxImgfileUploadSpecial(formId,base,funType){
	var currentWxImgObj = getCurrentWxImgObject(formId);
	//var imgServerIds = currentWxImgObj.wx_imgs.serverId;
	var imgServerIds = currentWxImgObj.wx_imgs.cur_serverId;
	loadSdkIndex = ffcs.loading();
	$.ajax({
	    url: base + "/wap/imgupload/fileUpload.mhtml",
		type: "post",
		data : {
			imgServerIds:imgServerIds,
			funType:funType,
			type:'zhangzhou'
		},
		dataType:"json",
		success: function(data) {
			//将返回的数据转成json
			var domain = data.data.domain; //域名
			var chooseImgList = data.data.list; //图片列表信息
			for (var i = 0; i < chooseImgList.length; i++) {
				var id = chooseImgList[i].id;
				var path = chooseImgList[i].url;
				var url = domain + path;
				var lis =
					'<li id="li_' + id + '">' +
					'<input type="hidden" name="wx_img_path" value="'+ path +'"/>'+
		            '<a href="#" onclick="showWxUploadImage(\'' + url + '\')"><img name="' + formId + '" imageServiceId="' + id + '" src="' + url + '" /></a>' +
		            '<i class="close_btn" onclick="delOneImg(' + id + ');"><img src="'+base+'/images/help/close_icon.png" /></i>' +
		            '</li>';
				$("#attDiv_" + formId).append(lis);
			}
		    //设置图片高度
			var width = $("#attDiv_" + formId + " li a img").width();
		    $("#attDiv_" + formId + " li a img").height(width);
		    ffcs.alertMsg('图片上传成功');
		 	layer.close(loadSdkIndex);//关闭遮罩层
		},
		error:function(data) {
			ffcs.alertMsg("连接超时！！！");
			layer.close(loadSdkIndex);//关闭遮罩层
		}
	});
}

/**
 * body中动态添加图片弹窗窗口
 * @param title 窗口标题
 */
function bodyAppendImgDialog(title){
	var html = "";
	html+='<div class="modal fade" id="sourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
	html+='<div class="modal-dialog"  style="height:95%;box-sizing:border-box">';
	html+='<div class="modal-content"  style="height:100%;box-sizing:border-box;">';
	html+='<div class="modal-header"  style="background-color: #ccc;height:10%;box-sizing:border-box;">';
	html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
	html+='<h4 class="modal-title">'+title+'</h4>';
	html+='</div>';
	html+='<div class="modal-body" style="background-color: #ccc;height:90%;box-sizing:border-box;border-radius: 0 0 6px 6px;">';
	html+='<div style="text-align:center;height:100%;width:100%" id="mbody" >';
	html+='</div>';
	html+='</div>';
	html+='</div>';
	html+='</div>';
	$(document.body).append(html);
}


//获取附件路径
function getWxUploadImagePath(){
	var pathArr = new Array();
	$("input[name='wx_img_path']").each(function(){
	    var value = $(this).attr("value");
		pathArr.push(value);
	});
	return pathArr;
}

//获取附件路径(单张)
function getWxUploadImagePathOnlyOne(formId){
	var pathArr = new Array();
	$("#attDiv_"+formId+" input[name='wx_img_path']").each(function(){
	    var value = $(this).attr("value");
		pathArr.push(value);
	});
	return pathArr;
}

//显示具体
function showWxUploadImage(url){
	/**解决遮罩层后面的滚动条问题*/
	/*$("body").css("overflow","hidden");
	
	var html="";
	html+="<img height='100%' width='100%'  src='"+url+"' />";
	$("#mbody").html(html);
	$("#sourceModal").modal('show');*/
	
	$("body").css("overflow","hidden");
	
	var img = new Image();
	img.src = url;
	
	// 定时执行获取宽高(解决url未加载完成，图片高度和宽度为0 的问题)
	var check = function(){
	    // 只要任何一方大于0
	    // 表示已经服务器已经返回宽高
	    if(img.width>0 || img.height>0){
	        clearInterval(set);
	        AutoResizeImage($("#sourceModal").width()-60,$("#sourceModal").height()-100,img);
	    	var html="";
	    	html+='<img style="height:'+img.height+'px;width:'+img.width+'px;"  src="'+url+'"/>';
	    	$("#mbody").html(html);
	    	$("#sourceModal").modal('show');
	    }
	};
	var set = setInterval(check,40);
}

/**自动放大或者缩放到指定宽高*/
function AutoResizeImage(maxWidth,maxHeight,objImg){
	var img = new Image();
	img.src = objImg.src;
	var hRatio;
	var wRatio;
	var Ratio = 1;
	var w = img.width;
	var h = img.height;
	wRatio = maxWidth / w;
	hRatio = maxHeight / h;
	if (maxWidth ==0 && maxHeight==0){
	Ratio = 1;
	}else if (maxWidth==0){//
	if (hRatio<1) Ratio = hRatio;
	}else if (maxHeight==0){
	if (wRatio<1) Ratio = wRatio;
	}else if (wRatio<1 || hRatio<1){
	Ratio = (wRatio<=hRatio?wRatio:hRatio);
	}else if(wRatio>1 && hRatio>1){
	Ratio = (wRatio<=hRatio?wRatio:hRatio);
	}
	
	/*if (Ratio<1){
	w = w * Ratio;
	h = h * Ratio;
	}*/
	w = w * Ratio;
	h = h * Ratio;
	objImg.height = h;
	objImg.width = w;
}


//删除单张图片
function delWxOneImg(id,base,funType){
    ffcs.confirmMsg("确定删除该图片?",function startDelOneImg() {
    	loadSdkIndex = ffcs.loading();
    	$.ajax({
		    url: base + "/wap/imgupload/fileDel.mhtml",
			type: "post",
			data : {
				imgServerId: id,
				funType:funType
			},
			dataType:"json",
			success: function(data) {
			    if (data.result == "success") {
					$("#li_" + id).remove();
			 	} else {
			 		ffcs.alertMsg("删除失败");
			 	}
			 	layer.close(loadSdkIndex);//关闭遮罩层
			},
			error:function(data) {
				ffcs.alertMsg("连接超时！！！");
				layer.close(loadSdkIndex);//关闭遮罩层
			}
		});
      });
}


/****************************************加载微信的jsdk  start*******************************************/
//加载微信的jsdk
function getJsSdkMsg(jsTicketUrl,urlStr,accountAppId,orgCode,callBackFunction){
    var status; 
    var msg; 
	$.ajax({
        url: jsTicketUrl,
		type: "get",
		data:{
			 urlStr:urlStr,
	         accountAppId:accountAppId,
	         orgCode:orgCode
        },
        dataType:"jsonp",
		jsonp: "callback",
		jsonpCallback:"jsonpCallback1",
		success: function(data){
		     var result = data.result;
      	     if(result=="success"){
				 checkJsApiInter(data.appIdStr,data.timestamp,data.noncestr,data.signature);
				 status = "success";
				 msg="加载jssdk成功！！";
      	     }else{
      	    	 status = "error";
      	    	 msg="加载jssdk失败！！";
      	     }
      	     
      	     if(typeof(callBackFunction)=='function'){
 	    		callBackFunction(status,msg);
 	    	 }
		},
		error:function(data){
			status = "error";
  	    	msg="请求失败！！！";
  	    	
  	    	if(typeof(callBackFunction)=='function'){
 	    		callBackFunction(status,msg);
 	    	}
		}
	 });
}


//微信jsdk接口的连接
function checkJsApiInter(appId,timestamp,nonceStr,signature){

	wx.config({    
	debug: false,    
	appId: appId,    
	timestamp: timestamp,    
	nonceStr: nonceStr,    
	signature: signature,    
	jsApiList: [    
		'checkJsApi',    
		'translateVoice',    
		'startRecord',    
		'stopRecord',    
		'onRecordEnd',    
		'playVoice',    
		'pauseVoice',    
		'stopVoice',    
		'uploadVoice',    
		'downloadVoice',    
		'chooseImage',    
		'previewImage',    
		'uploadImage',    
		'downloadImage',    
		'getLocation'
	]    
	});//end wx.config
	
}

/****************************************加载微信的jsdk  end*******************************************/

//初始化微信语音(nowMaxVoiceNum)最多上传语音数量
function  initUploadVoice(nowMaxVoiceNum){
	if(nowMaxVoiceNum != undefined) {
		maxVoiceNum=nowMaxVoiceNum;
	}
	
	var htmlStr="";
	htmlStr+='<div class="VoiceUpload" id="VoiceUploadBtn" style="width:100%" onclick="startRecordInter();">';
	htmlStr+='<p style="text-align: center;font-size: 12px"><img class="yuyin-ly" src="'+uiDomain+'/app-assets/_wangge/zhangzhou-xc110/images/img110/icon-voice.png" style="width: 64px;height: 64px;"></p>'
	htmlStr+='<p style="line-height: 2; text-align: center;font-size: 12px;">语音</p>'
	//录音提示界面
	// var htmlStr2 = '';
	// htmlStr2+='<div id="uploadVoiceDialog" style="display:none;">  ';
	// htmlStr2+='   <div style="text-align:center;padding-top:10px;">';
	// htmlStr2+='      <i class="fa fa-spinner fa-spin fa-2x"></i>&nbsp;&nbsp;录音中。。。 ';
	// htmlStr2+='   </div>';
	// htmlStr2+='   <p><button type="button" class="btn_saveVoi" onclick="stopRecordInter();">结束录音并上传</button></p>';
	// htmlStr2+='   <div style="height:10px;"></div>';
	// htmlStr2+='</div>  ';
	// htmlStr2 +='<div class="mengceng-luyin">'
	// htmlStr2 +='	<p>正在录音中...</p>'
	// htmlStr2 +='	<p><img src="'+uiDomain+'/app-assets/_wangge/zhangzhou-xc110/images/icon-yuyin.gif"></p>'
	// htmlStr2 +='	<p><a href="#" onclick="stopRecordInter()" class="report-save report-save-yuyin">确&nbsp;&nbsp;&nbsp;&nbsp;定</a></p>'
	// htmlStr2 +='</div>'
	$("#uploadVoiceDiv").html(htmlStr);
	// $("#mengcengImg").append(htmlStr2);
	$('.yuyin-ly').click(function(){
		$('.mengcengImg').addClass('mengcengImg-on');
		$('.mengceng-main').slideUp(300);
		$('.mengceng-luyin').addClass('mengceng-luyin-on');
	});
}


var startVoiceDialog;
//打开提示对话框(提示是否录音)
function startRecordInter(){
	
	// var confirmVoiceDialog=layer.confirm('确定开始录音？', {
	//     btn: ['确定','取消'] //按钮
	// }, function(){
	//     layer.close(confirmVoiceDialog);
	// 	$('.mengcengImg').removeClass('mengcengImg-on');
	//     startVoiceDialog=ffcs.dialogWithHtml ('提示', $("#uploadVoiceDialog"),null,0);//填出录音中对话框

	    sureStartRecord();//调用录音接口正式开始录音
	// }, function(){
	//
	// });
}


//正式开始录音
function sureStartRecord(){
   wx.startRecord({
     cancel: function () {
       alert('用户拒绝授权录音');
     }
   });
}

//停止录音,并直接上传语音到微信服务器
function stopRecordInter(){
   wx.stopRecord({
     success: function (res) {
  		uploadVoiceInt(res.localId);//结束录音后就直接上传(res.localId本地音乐文件资源ID)
     },
     fail: function (res) {
       alert(JSON.stringify(res));
     }
  });
}


//上传语音到微信服务器
function uploadVoiceInt(localId){
    	if (localId == '') {
    		ffcs.alertMsg('请先录制一段声音')	 
	        return;
	    }
	    wx.uploadVoice({
		     localId: localId,
		     success: function (res) {
		    	//将本地的音频文件(localId)上传,返回微信服务器上资源ID：res.serverId
				 	var html ='';
					html += '<div class="yuyin" name="weixinVoice" voiceServiceId="'+res.serverId+'">'
				 	html += '<ul class="evt-audio">'
				 	html += '	<li class="evt-audio-li evt-audio-li-on">'
				 	html += '		<a href="javascript:;" class="evt-audio-con">'
				 	html += '			<div class="evt-audio-btn" onclick="playVoiceInter(\''+localId+'\');"></div>'
				 	html += '			<div class="evt-audio-pic" onclick="playVoiceInter(\''+localId+'\');"></div>'
				 	html += '			<i class="evt-audio-close" onclick="del(this)"></i>'
			 		html += '		</a>'
				 	html += '	</li>'
				 	html += '</ul>'
					html +='</div>';
		        // var  _html=' <li name="weixinVoice" onclick="playVoiceInter(\''+localId+'\');"><span class="VoiceDel fr" voiceServiceId="'+res.serverId+'"  onclick="delVoiceInter(event,this);"></span></li>';
		         $(".yuyin-m").append(html);
				 $('.evt-audio-close').click(function(){
					 $(this).parents('.yuyin').remove();
				 });
				 //追加一个语音元素
				 wxVoicefileUploadCommon(1,base,res.serverId);
		        //重新整合所有的语音serverId
		    	var nowVoiceNum=staticVoiceServerId(); 
		    	if(nowVoiceNum>=maxVoiceNum){
		    		$("#VoiceUploadBtn").hide();
		    	}else{
		    		$("#VoiceUploadBtn").show();
		    	}
		    	ffcs.alertMsg('上传语音成功');

		     }
	    
	   });
}
function del(node){
	$(node).parents('.yuyin').remove();
}


//播放音频(根据音频文件的本地localId)
function playVoiceInter(localId){
   if (localId == '') {
	   ffcs.alertMsg('请先录制一段声音'); 
       return;
   }
   wx.playVoice({
     localId: localId
   });
}

//删除语音 
function delVoiceInter(e,o){
	e.stopPropagation();
   //删除当前语音的html
   $(o).parent().remove();
   //重新整合所有的语音serverId
   var nowVoiceNum=staticVoiceServerId();
   //如果语音上传数量没超过最大值，就显示上传语音按钮
   if(nowVoiceNum<maxVoiceNum){
	   $("#VoiceUploadBtn").show();
   }
} 

//重新整合算出所有的语音serverId集合,赋值到voiceServerId,并返回现在的语音附件数量

function staticVoiceServerId(){
	   var nowVoiceNum=0;
	   //重新整合所有的语音serverId
	   var newServiceIds=[];
	   $("div[name=weixinVoice]").each(function(){
	     var serviceId=$(this).attr("voiceServiceId");
	     newServiceIds.push(serviceId);
	     nowVoiceNum++;
	   });
	   var idStr = newServiceIds.join(',');
	   $("#voiceServerId").val(idStr);
	   //移除input框
	   return nowVoiceNum;
}


//下载语音信息---用于查看页面  
function  downloadVoiceInter(voiceServerId){

  if (voiceServerId == '') {
     //alert('请先使用 uploadVoice 上传声音');
     return;
  }
  var voiceServerIdArray=voiceServerId.split(",");
  
  var i = 0;
  var serverIdNum=voiceServerIdArray.length;
  
  function uploadVoice() {
	      wx.downloadVoice({
	        serverId: voiceServerIdArray[i],
	        success: function (res) {
	        	  var  _htmlStr=' <li onclick="playVoiceInter(\''+res.localId+'\')"></li>';
	         	  $("#downVoiceListUl").append(_htmlStr);
	         	  i++;
		          if (i < serverIdNum) {//还有图片要上传  && 小于能允许上传的数量才能上传
		             uploadVoice();//上传图片
		          }else{
			         //ffcs.alertMsg('语音下载结束');
		             return;
		          }
	        },
	        fail: function (res) {
	            alert(JSON.stringify(res));
	        }
	      });
	}
  
  uploadVoice();
}

/*
* 公用上传音频(多个)
* @param formId  定位上传音频控件的后缀id(比如页面上attDivId_0中的0)
* @param base    上下文路径
* @param funType 功能类型
*/
function wxVoicefileUploadCommon (formId,base,mediaId){
	loadSdkIndex = ffcs.loading();
	$.ajax({
	    url: base + "/wap/voiceupload/fileUpload.mhtml",
		type: "post",
		data : {
			mediaId:mediaId,
			resourseDomain: 'zhsq_event',
			type:'zhangzhou'
		},
		dataType:"json",
		success: function(data) {
			try {
				//将返回的数据转成json
				var domain = data.data.domain; //域名
				var path = data.data.filePath;
				var url = domain + path;
				var lis ='<input type="hidden" class="wxFilePath" name="wxFilePath"  value="'+ path +'"/>';
				$("div[name=weixinVoice]").each(function() {
					var serviceId = $(this).attr("voiceServiceId");
					if (serviceId == mediaId){
						$(this).append(lis)
					}
				})
				// $("#attDiv_" + formId).append(lis);
			    //设置图片高度
			 	layer.close(loadSdkIndex);//关闭遮罩层
			} catch (e) {
				ffcs.alertMsg(('错误【' + e.message + '】发生在【' +   e.lineNumber + '】行'));
			} finally{
				layer.close(loadSdkIndex);//关闭遮罩层
			}
		},
		error:function(data) {
			ffcs.alertMsg("连接超时！！！");
			layer.close(loadSdkIndex);//关闭遮罩层
		}
	});
}


/****************************************微信语音上传接口   end*******************************************/
