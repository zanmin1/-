(function($) {
	
	var trycount = 0;
	var layerIndex;
	var errorMsg = {
		"9000" : "请检查是否配置关联域名",
		"9001" : "缺失参数",
		"9002" : "未获取到公众号数据",
		"9003" : "系统出现异常",
		"9004" : "获取jsapi_ticket失败"
	}
	/**
	 * 动态加载js方法
	 * @param file js文件路径eg:["http://loacalhost:8080/js/a.js"]
	 */
	var loadJs = function loadJs(file) {
	    var head = $('head');
	    $("<script></script>").attr({ src: file, type: 'text/javascript', id:'loadscript' }).appendTo(head);
	}
	
	/**
	 * 动态加载js方法
	 * @param file css文件路径eg:["http://loacalhost:8080/js/a.css"]
	 */
	var loadCss = function loadCss(href) {
		$("<link>").attr({ rel: "stylesheet",type: "text/css",href: href}).appendTo("head");
	}
	
	/**
	 * 判断是不是微信浏览器
	 * @returns {Boolean}
	 */
	var isWeixinBrowser = function isweixin(){
		var ua = navigator.userAgent.toLowerCase();
		return ua.match(/MicroMessenger/i)=="micromessenger" || window.__wxjs_environment == 'miniprogram';
	}
	
	var getUrlStr = function getUrlStr(){
		return location.href.split('#')[0];
	}
	
	/**
	* 区分企业微信号还是公众号
	* @return 企业微信号:4，公众号:null
	*/
	var getAccounType = function getAccounType() {
		var ua = navigator.userAgent.toLowerCase();
		var accountType = ( ua.indexOf('wxwork') > -1 ) ? '4' : '';
		accountType = ( ua.indexOf('zwwx') > -1 )? '5' :accountType;
		return accountType
	}
	
	var base64ToBlob = function(dataurl, filename) {
      var arr = dataurl.split(',')
      var mime = arr[0].match(/:(.*?);/)[1]
      var suffix = mime.split('/')[1]
      var bstr = atob(arr[1])
      var n = bstr.length
      var u8arr = new Uint8Array(n)
      while (n--) {
        u8arr[n] = bstr.charCodeAt(n)
      }
      return new File([u8arr], `${filename}.${suffix}`, {
        type: mime
      })
    }
	
	//弹窗功能
	var ffcswxjsapi_popupNewWindow = function ffcswxjsapi_popupNewWindow(content, configs, confirmCallBack){
		var newWindowscrol= $(window).scrollTop(); 
		$("body").append('<div class="wx-pop-box" id="commnewWind_wxjsapi">'+
			'<div class="wx-pop-bg" id="commnewWindte_wxjsapi"></div>'+
			'<div class="wx-pop-mid-wrap">'+
				'<div class="wx-pop-infor">'+
					'<p class="wx-wrap-tit-only">'+content+'</p>'+
				'</div>'+
				'<div class="wx-pop-btn" id="winchioese">'+
				'</div>'+
			'</div>'+
		'</div>');
		$("#commnewWind_wxjsapi").css("height",window.screen.availHeight);
		$("#commnewWindte_wxjsapi").css("height",window.screen.availHeight);
		$(document).scrollTop(0);
		$("#winchioese").append('<a id="commnewWind_cancel_wxjsapi" class="wx-btn-border">'+configs.cancelBtnText+'</a>'+
					 '<a id="commnewWind_confirm_wxjsapi" class="wx-btn-bg btn-blue">'+configs.confirmBtnText+'</a>');
		document.body.style.overflow = 'hidden';
		window.addEventListener('touchmove', function _preventDefault(e) { e.preventDefault(); });
		
		$('a#commnewWind_cancel_wxjsapi').on('click',function(){
			$("#commnewWind_wxjsapi").remove();
			$("body").css("overflow-y","auto");
			$(document).scrollTop(newWindowscrol);
		})
		
		$('a#commnewWind_confirm_wxjsapi').on('click',function(){
			new confirmCallBack();
			$("#commnewWind_wxjsapi").remove();
			$("body").css("overflow-y","auto");
			$(document).scrollTop(newWindowscrol);
		})
	}
	
	var checkJsApiInter = function checkJsApiInter(appId,timestamp,nonceStr,signature){
		wx.config({
			beta: true,// 必须这么写，否则wx.invoke调用形式的jsapi会有问题   
			debug: window["debug"] || false,    
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
				'previewFile',
				'uploadImage',    
				'downloadFile', 
				'downloadImage',
				'getLocation',
				'scanQRCode'
			],
			openTagList:['wx-open-launch-weapp']    
		});
	}
	
	var checkWxJsApi = function checkWxJsApi(){
		var domain = window["wechat_domain"];
		var static_domain = window["static_domain"];
		if (!domain) {
			/**
			*由于配置可能发引用js之后，每200ms尝试检查一次是否有初始化wechat_domain
			*最多尝试10，没有获取到wechat_domain则不再进行微信wxconfig初始
			*因此建议 初始域名的变量应在引用该js之前，已防止初始微信js失败 eg:
			*<script type="text/javascript">window["wechat_domain"]='https://cs.zhsq.fzyzxxjs.cn';</script>
			*<script type="text/javascript" src="https://static.zhsq.fzyzxxjs.cn/js/ffcs-wxjssdk-v1.0.1.js"></script>
			*/
			if (trycount > 10) {
				if (window["debug"]) {
					layer.msg('请先配置wechat_domain域名');
				}
			} else {
				setTimeout(function(){
					trycount++;
					checkWxJsApi();
				},200);
			}
			return;
		}
		
		if (!isWeixinBrowser()) {//app初始化
			//此处加载app所需的js
			loadJs(static_domain+'/app-assets/extend/app-bridge/app-common-bridge.js');
		} else {//微信初始化
			try {
				//var _WX_JX_API = window["_WX_JX_API"];
				//if (_WX_JX_API && _WX_JX_API.location) {
					//loadJs("https://api.map.baidu.com/api?v=2.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP");
					//loadJs("https://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js");
					//$.getScript('https://api.map.baidu.com/api?v=2.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP',function(){});
					//$.getScript('https://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js',function(){});
				//}
				$.getScript(
					'https://res.wx.qq.com/open/js/jweixin-1.6.0.js',function(){
						layerIndex = layer.load();
						try{
							$.ajax({
								url: domain + '/wxjsapiticket/getJsSdkMsgFromGetJson.mhtml',
								type: "get",
								data:{
									urlStr : getUrlStr(),
									accountType : getAccounType()
								},
								dataType:"jsonp",
								jsonp: "callback",
								jsonpCallback:"jsonpCallback1",
								success: function(data){
									var result = data.result;
									if(result=="success"){
										checkJsApiInter(data.appIdStr,data.timestamp,data.noncestr,data.signature);
										window["wx_appid"] = data.appIdStr;
									}else{
										layer.msg(errorMsg[data.code]);
									}
								},
								error:function(data){
									layer.close(layerIndex);
									layer.msg('JsApi初始化失败');
								},
								complete: function () {
			                        layer.close(layerIndex);
			                    }
							});
						} catch(e) {
							alert(e.message);
						}
					}
				);
			} catch (e) {
				alert(e.message);
			}
		}
	}
	
	//自执行函数
	(_wx_jsapi_init = function() {
		
	});
	
	var WxJsSdkUtils = {
		debug : function(msg) {
			layer.msg(msg);
		},
		previewImage : function(eleId,node) {
			var urls = [];
			$('[id^="'+eleId+'_"]').each(function(){
				var path = $(this).find('img:eq(0)').attr('src');
				if(path.indexOf(static_domain) != 0){//排除公共样式图片
					urls.push(path);
				}
			});
			//alert(JSON.stringify(urls));
			var showPath = $(node).attr('src');
			//alert(showPath);
			if (isWeixinBrowser()) {
				wx.previewImage({
					current: showPath, // 当前显示图片的http链接
					urls: urls // 需要预览的图片http链接列表
				});
			} else {
				setupWebViewJavascriptBridge(function (bridge) {
					bridge.callHandler('previewImage', {
						'current': showPath,
						'urls': urls
					});
				});
			}
		},
		previewFile : function(url,node) {
			if (isWeixinBrowser()) {
				wx.previewFile({
					url: url, // 需要预览文件的地址(必填，可以使用相对路径)
					//name: '', // 需要预览文件的文件名(不填的话取url的最后部分)
					size: $(node).data('size'), // 需要预览文件的字节大小(必填)
					hidePreviewMenuList : [] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
				});
			} else {
				setupWebViewJavascriptBridge(function(bridge) {
					bridge.callHandler('previewFile',
					 {'url': url},
					function(response) {});
				});
			}
		},
		previewImages : function(ele,node) {
			var urls = [];
			$(ele).each(function(){
				urls.push($(this).find('img:eq(0)').attr('src'));
			});
			var showPath = $(node).attr('src');
			if (isWeixinBrowser()) {
				wx.previewImage({
					current: showPath, // 当前显示图片的http链接
					urls: urls // 需要预览的图片http链接列表
				});
			} else {
				setupWebViewJavascriptBridge(function (bridge) {
					bridge.callHandler('previewImage', {
						'current': showPath,
						'urls': urls
					});
				});
			}
		},
		previewSingleImage : function(ele,url) {
			var urls = [];
			if (!url) {
				url = $(ele).attr('src');
			}
			urls.push(url);
			if (isWeixinBrowser()) {
				wx.previewImage({
					current: url, // 当前显示图片的http链接
					urls: urls // 需要预览的图片http链接列表
				});
			} else {
				setupWebViewJavascriptBridge(function (bridge) {
					bridge.callHandler('previewImage', {
						'current': url,
						'urls': urls
					});
				});
			}
		},
	
		getLocation : function(locationType,callBackFunc) {
			wx.getLocation({
				type: locationType || 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
				success: function (res) {
					if (callBackFunc != 'undefined' && typeof(callBackFunc) == 'function') {
						new callBackFunc(res);
					}
				},
				fail : function(res) {
					layer.msg('请确认设备是否开启定位服务');
				}
			});
		}
	}
	window["WxJsSdkUtils"] = WxJsSdkUtils;
	$.fn.extend({
		wapImgUpload : function(options) {
			var debug = options.debug || false;
			//alert('options.autoInitFiles='+options.autoInitFiles);
			var that = this;
			if (options.autoInitFiles) {
				initFiles(that, options);
			}
			if (options.showType == 'view') {
				return;
			}
			
			that.bind('click',function(){
				var eleId = $(this).attr('id');
				if (!eleId) {
					eleId = 'upload_'+new Date().getTime();
					$(this).attr('id',eleId);
				}
				var uploadFileSize = $('[id^="'+eleId+'_"]').length || 0;
				if (debug) {
					WxJsSdkUtils.debug('已上传图片数量:'+uploadFileSize);
				}
				if (uploadFileSize >= options.count) {
					layer.msg('最多上传'+options.count+'张图片');
					return;
				}
				if(isWeixinBrowser()) {
					wx.chooseImage({
						count: (options.count - uploadFileSize) || 9, // 默认9
						sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
						sourceType: options.sourceType || ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
						defaultCameraMode: options.defaultCameraMode || "batch", //表示进入拍照界面的默认模式，目前有normal与batch两种选择，normal表示普通单拍模式，batch表示连拍模式，不传该参数则为normal模式。从3.0.26版本开始支持front和batch_front两种值，其中front表示默认为前置摄像头单拍模式，batch_front表示默认为前置摄像头连拍模式。（注：用户进入拍照界面仍然可自由切换两种模式）
						isSaveToAlbum: options.isSaveToAlbum || 1, //整型值，0表示拍照时不保存到系统相册，1表示自动保存，默认值是1
						success: function (res) {
							if (options.cropOptions != 'undefined' && options.cropOptions != null) {
								var cropOptions = options.cropOptions;
								var localIds = res.localIds;
								var j = 0, jLen = localIds.length; 
								function cropUpload(){ 
									if (j >= jLen) {
										return;
									}
									wx.getLocalImgData({
									  localId: localIds[j], // 图片的localID
									  success: function (wxImgRes) {
										//alert(JSON.stringify(options.cropOptions));
										try {
											//alert(wxImgRes.localData);
											var localData = wxImgRes.localData; // localData是图片的base64数据，可以用img标签显示
											if (localData.indexOf('data:image') == 0) {//区分ios和android
												localData = localData;
											} else {
												localData = 'data:image/jpeg;base64,' + localData.replace(/\n/g, '');
											}
											
											if(cropOptions.circle) {
												var mAlloyCrop = new AlloyCrop({
													//image_src: 'http://static.xqzz.ssdat.com.cn/app-assets/extend/wxjsapi/images/test.png',
													image_src: localData,
													circle: true,
													width: cropOptions.width || 300,
													height: cropOptions.height || 300,
													output: cropOptions.output || 1,
													ok: function (base64, canvas) {
														//alert(base64);
														base64fileUpload(options, base64, function(){
															mAlloyCrop.destroy();
															cropUpload();
														});
													},
													cancel: function () {
														mAlloyCrop.destroy();
														cropUpload();
													},
													ok_text: cropOptions.ok_text ||"确定", // optional parameters , the default value is ok
													cancel_text: cropOptions.cancel_text ||"取消" // optional parameters , the default value is cancel
												});
											} else {
												var mAlloyCrop = new AlloyCrop({
													//image_src: 'http://static.xqzz.ssdat.com.cn/app-assets/extend/wxjsapi/images/test.png',
													image_src: localData,
													width: cropOptions.width || 300,
													height: cropOptions.height || 300,
													output: cropOptions.output || 1,
													ok: function (base64, canvas) {
														//alert(base64);
														base64fileUpload(options, base64, function(){
															mAlloyCrop.destroy();
															cropUpload();
														});
													},
													cancel: function () {
														mAlloyCrop.destroy();
														cropUpload();
													},
													ok_text: cropOptions.ok_text ||"确定", // optional parameters , the default value is ok
													cancel_text: cropOptions.cancel_text ||"取消" // optional parameters , the default value is cancel
												});
											}
											j++;
										} catch(e) {
											alert('[出现异常]'+JSON.stringify(e));
										}
									  },
									  fail : function(errRes) {
										  alert('[getLocalImgData]获取失败');
										  alert(JSON.stringify(errRes));
									  }
									});
								}
								cropUpload();
							} else {
								var localIds = res.localIds; // 返回选定照片的本地ID列表，
								//alert(JSON.stringify(localIds));
								// andriod中localId可以作为img标签的src属性显示图片；
								// iOS应当使用 getLocalImgData 获取图片base64数据，从而用于img标签的显示（在img标签内使用 wx.chooseImage 的 localid 显示可能会不成功）
								var serverIds = [];
								function uploadWxImg() {
									wx.uploadImage({
										localId: localIds.pop(),
										isShowProgressTips: 1, // 默认为1，显示进度提示
										success: function(res) {
											serverIds.push(res.serverId);
											if (localIds.length) {//还有图片要上传  && 小于能允许上传的数量才能上传
											  uploadWxImg();//上传图片
											}else{
												//alert('wxImgfileUploadCommon:'+JSON.stringify(options));
												//alert(JSON.stringify(serverIds));
												layerIndex = layer.load();
												wxImgfileUploadCommon(options, serverIds);
											}
										},
										fail: function (res) {
											layer.msg('上传失败:'+JSON.stringify(res));
										}
									});
								}
								uploadWxImg();									
							}
						}
					});
				} else {
					//alert(JSON.stringify(options));
					var appReqUrl = '';//(options.uploadFileUrl || options.wechat_domain) + (('yes'==options.isUuidBizId)?"/commonFile/uuidBizId/upload.mhtml":"/wx/common/upload.mhtml");
					
					if (options.uploadFileUrl) {
						appReqUrl = options.uploadFileUrl;
					} else {
						appReqUrl = options.wechat_domain + (('yes'==options.isUuidBizId) ? "/commonFile/uuidBizId/upload.mhtml" : "/wx/common/upload.mhtml");
					}
					
					if (appReqUrl.indexOf('?') > -1) {
						appReqUrl += '&appcode='+(options.appcode||'');
					} else {
						appReqUrl += '?appcode='+(options.appcode||'');
					}
					appReqUrl += '&selfBeanName='+(options.selfBeanName||'');
					appReqUrl += '&selfServiceName='+(options.selfServiceName||'');
					appReqUrl += '&module='+(options.module||'');
					appReqUrl += '&isNeedBase64='+(options.isNeedBase64||'N');
					appReqUrl += '&attachmentType='+(options.attamentType||'');
					appReqUrl += '&isBindBizId='+(options.isBindBizId||'');
					appReqUrl += '&bizId='+(options.bizId||'');
					appReqUrl += '&labelVal='+(options.eventSeq||'');
										
					var AppUploadParams = {
						'count':  (options.count - uploadFileSize) || 9
					}
					try {
						var appFuncType = 'chooseImageUpload';
						if (options.AppFileOptions != 'undefined' && options.AppFileOptions != null) {
							appFuncType = 'chooseFileUpload';
							appReqUrl += '&method=up';
							var appOpt = options.AppFileOptions;
							if (appOpt.filePattern) {
								appReqUrl += ('&filePattern='+appOpt.filePattern);
							}
							if (appOpt.fileSize) {
								//appReqUrl += ('&fileSize='+appOpt.fileSize);
								AppUploadParams.fileSize = appOpt.fileSize;
							}
						}
						//alert(appReqUrl);						
						AppUploadParams.serverUrl = appReqUrl;
						//alert(JSON.stringify(AppUploadParams));
						setupWebViewJavascriptBridge(function (bridge) {
							bridge.callHandler(
								appFuncType, 
								AppUploadParams, 
								function(res) {
									try {
										//alert(res);
										//alert(options.uploadSuccess);
										res = JSON.parse(res);
										if (options.uploadSuccess != 'undefined' && typeof(options.uploadSuccess) == 'function') {
											//进入自定义上传成功回调方法
											new options.uploadSuccess(that, res);
										} else {//默认的上传成功处理方法
											uploadSuccDefaultDealFunc(that, options, res);
										}
									} catch(e) {
										alert(e.message);
									}
								}
							);
						});
					} catch (e) {
						alert(e.message);
					}			
				}
			})
			
			/**
			* 默认的上传成功处理方法
			**/
			function uploadSuccDefaultDealFunc(ele, options, data) {
				//将返回的数据转成json
				var domain = data.data.domain; //域名
				var chooseImgList = data.data.list; //图片列表信息
				//获取图片的宽高，防止图片太大展示异常
				var w = ele.find('img').width();
				var h = ele.find('img').height();
				//获取自定义需要映射的input名称对象
				var attaAttributes = options.attaAttributes || {};
				for (var i = 0, len = chooseImgList.length; i < len; i++) {
					var obj = chooseImgList[i];
					var appendType = options.appendType || 'outAfter';
					var copyNode;
					if(appendType == 'cover') {//覆盖当前
						copyNode = ele;
					} else {
						copyNode = ele.clone(false)
					}
					var eleId = copyNode.attr('id');
					copyNode.attr('id',eleId+'_'+i);
					var html = copyNode.prop("outerHTML");
					
					if (appendType == 'outAfter') {//外部后拼接
						ele.after(html);
					} else if(appendType == 'outBefore') {//外部前拼接
						ele.before(html);
					} else if(appendType == 'innerBefore') {//内部前拼接
						ele.prepend(html);
					} else if(appendType == 'innerAfter') {//内部部后拼接
						ele.append(html);
					}
					
					var attaHtml = '';
					for (var key in obj) {
						//alert(key);
						attaHtml += '<input type="hidden" name="'+(attaAttributes[key]||key)+'" value="' + obj[key] + '">';
					}
					var $cn = $('#'+eleId+'_'+i);
					$cn.append(attaHtml);
					var $img = $cn.find('img').first();		
					$img.data('size',obj.fileSize);
					
					var fileExt = obj.fullPath.substr(obj.fullPath.lastIndexOf('.'));					
					if (fileExt.endWith('bmp') || fileExt.endWith('jpg') || fileExt.endWith('jpeg') || fileExt.endWith('png')|| fileExt.endWith('gif')) {//图片
						$img.attr('src',obj.fullPath).css({'width':w,'height':h});
						if(appendType != 'cover') {//覆盖当前，单张图片不需要绑定预览事件
							bindPreview(eleId,$img,obj);
						}
					}else{
						$img.attr('src',static_domain+'/web-assets/extend/ftp-file-update/img/icon_wl_add_file.png').css({'width':w,'height':h});
						bindPreview(eleId,$img,obj);
					}
					
					//绑定上传图片的删除按钮方法
					if (options.delBtnEle != undefined && options.delBtnEle != '') {
						if (options.delBtnFunc != 'undefined' && typeof(options.delBtnFunc) == 'function') {
							//绑定自定义的删除方法
							$cn.find(options.delBtnEle).show().bind('click',function(){
								new options.delBtnFunc($(this), obj);
							});
						} else {
							//绑定默认的删除方法
							$cn.find(options.delBtnEle).show().attr('data-attaid',obj.attaId).bind('click',function(){
								var _this = $(this);
								//如果有自定义的弹窗则使用自定义
								if (options.delConfirmFunc != 'undefined' && typeof(options.delConfirmFunc) == 'function') {
									new options.delConfirmFunc(function(closeConfirmWinCallBack){
										//closeConfirmWinCallBack 自定义的询问弹框的回调方法，附件删除后调用，可进行关闭弹窗操作
										fileDel(_this, eleId, options.isDelFromDb, options.delCallBackFunc, closeConfirmWinCallBack,options);
									});
								} else {//默认的弹窗方式
									ffcswxjsapi_popupNewWindow('确定删除图片?',{
										confirmBtnText : '确认',
										cancelBtnText : '取消'
									},function(){
										fileDel(_this, eleId, options.isDelFromDb, options.delCallBackFunc,options);
									});
								}
							});
						}
					}
				}
				if (options.showType == 'view') {
					ele.hide();
				}
			} 
			
			//元素绑定预览事件
			function bindPreview(eleId,img,obj){
				$(img).bind('click',function(){
					var fileExt = obj.fullPath.substr(obj.fullPath.lastIndexOf('.'));
					if (fileExt.endWith('bmp') || fileExt.endWith('jpg') || fileExt.endWith('jpeg') || fileExt.endWith('png')|| fileExt.endWith('gif')) {//图片
						WxJsSdkUtils.previewImage(eleId,this);
					} else {//其他文档
						WxJsSdkUtils.previewFile(obj.fullPath,this);
					}
				});
			}
			
			//附件上传方法
			function wxImgfileUploadCommon(options, serverIds) {
				//alert(options.uploadFileUrl || options.wechat_domain + (('yes'==options.isUuidBizId)?"/commonFile/uuidBizId/upload.mhtml":"/wx/common/upload.mhtml"));
				//alert('options.isBindBizId='+options.isBindBizId);
				//alert('options.bizId='+options.bizId);
				$.ajax({
					url: options.uploadFileUrl || options.wechat_domain + (('yes'==options.isUuidBizId)?"/commonFile/uuidBizId/upload.mhtml":"/wx/common/upload.mhtml"),
					type: "get",
					data : {
						serverIds:serverIds,
						imgServerIds:serverIds.join(','),
						appcode:options.appcode,
						module:options.module,
						labelVal: (options.eventSeq||''),
						isNeedBase64:options.isNeedBase64||'N',
						attachmentType:options.attamentType,
						isBindBizId:options.isBindBizId||'yes',
						selfBeanName:options.selfBeanName||'',
					    selfServiceName:options.selfServiceName||'',
						bizId:options.bizId||'',
						accountAppId:window["wx_appid"]
					},
					dataType:"jsonp",
					jsonp: "callback",
					jsonpCallback:"success_jsonpCallback_"+new Date().getTime(),
					success: function(data) {
						if (data.status == 1) {
							layer.msg(data.desc);
						} else {
							//alert(JSON.stringify(data));
							try {
								if (options.uploadSuccess != 'undefined' && typeof(options.uploadSuccess) == 'function') {
									//进入自定义上传成功回调方法
									new options.uploadSuccess(that, data);
								} else {//默认的上传成功处理方法
									uploadSuccDefaultDealFunc(that, options, data);
								}
							} catch (e) {
								layer.msg(('JS运行异常【' + e.message + '】'));
							} finally{
								layer.close(layerIndex);
							}
						}
						layer.close(layerIndex);						
					},
					error:function(data) {
						layer.close(layerIndex);
						layer.msg("[wxImgfileUploadCommon]连接超时");
					}
				});
			}
			
			function base64fileUpload(options, base64Url, callBackFunc) {
				var layerIndex001 = layer.load();
				//var base64ImgUrl1 = "";
				//var base64ImgUrl2 = "";
				//var l = base64Url.length;
				//base64ImgUrl1 = base64Url.substring(0, parseInt(l/2));
				//base64ImgUrl2 = base64Url.substring(parseInt(l/2), l);
				/**/
				var formData = new FormData();
				try {
					formData.append("files", base64ToBlob(base64Url));
				    formData.append("appcode", options.appcode);
				    formData.append("module", options.module);
				    formData.append("isNeedBase64", options.isNeedBase64||'N');
				    formData.append("attachmentType", options.attamentType);
					formData.append("isBindBizId", options.isBindBizId||'yes');
					formData.append("bizId", options.bizId||'');
					//formData.append("base64Url", base64Url);
				} catch (e) {
					alert(JSON.stringify(e))
				}
				
				try{
					var url = (options.uploadFileUrl || options.wechat_domain) + (('yes'==options.isUuidBizId)?"/commonFile/uuidBizId/upload.mhtml":"/wx/common/upload.mhtml");
					$.ajax({
						url : url,
						type: "post",
						data : formData,
						/*
						data : {
							appcode:options.appcode,
							isNeedBase64:options.isNeedBase64||'N',
							module:options.module,
							attachmentType:options.attamentType,
							isBindBizId:options.isBindBizId||'yes',
							bizId:options.bizId||'',
							//base64ImgUrl1: base64ImgUrl1,
							//base64ImgUrl2: base64ImgUrl2
							base64ImgUrl:base64Url
						},
						*/
						async: false,
						cache: false,
						contentType: false,
						processData: false,
						//dataType:"jsonp",
						jsonp: "callback",
						jsonpCallback:"success_base64Callback_"+new Date().getTime(),
						success: function(data) {
							//alert(JSON.stringify(data));
							if (data.status == 1) {
								layer.msg(data.desc);
							} else {
								try {
									if (options.uploadSuccess != 'undefined' && typeof(options.uploadSuccess) == 'function') {
										//进入自定义上传成功回调方法
										new options.uploadSuccess(that, data);
									} else {//默认的上传成功处理方法
										uploadSuccDefaultDealFunc(that, options, data);
									}
									
									if (callBackFunc != 'undefined' && typeof(callBackFunc) == 'function') {
										new callBackFunc();
									}
								} catch (e) {
									layer.msg(('JS运行异常【' + e.message + '】'));
								} finally{
									layer.close(layerIndex001);
								}
							}
							layer.close(layerIndex001);						
						},
						error:function(data) {
							alert(JSON.stringify(data));
							layer.close(layerIndex001);
							layer.msg("[base64fileUpload]连接超时");
						}
					});
				} catch(e1) {
					layer.close(layerIndex001);
					layer.msg('[上传出现异常]'+JSON.stringify(e1));
				}
			}
			
			/**
			* 加载时初始附件的方法
			* @param that 根元素
			* @param options 配置
			*/
			function initFiles(that, options) {
				$.ajax({
					url: (options.getAttaUrl || options.wechat_domain) + (('yes'==options.isUuidBizId)?"/commonFile/uuidBizId/getAttaList.mhtml":"/wx/common/getAttaList.mhtml"),
					type: "get",
					data : {
						attachmentType:options.attamentType,
						bizId:options.bizId,
						attachmentIds : options.attachmentIds||'',
						selfBeanName:options.selfBeanName||'',
					    selfServiceName:options.selfServiceName||''
					},
					dataType:"jsonp",
					jsonp: "jsonpCallback",
					jsonpCallback:"success_jsonpCallback_"+new Date().getTime(),
					success: function(data) {
						//alert(JSON.stringify(data));
						if (data.status == 1) {
							layer.msg(data.desc);
						} else {
							try {
								if (options.initFilesFunc != 'undefined' && typeof(options.initFilesFunc) == 'function') {
									//进入自定义上传成功回调方法
									new options.initFilesFunc(that, data);
								} else {//默认的上传成功处理方法
									uploadSuccDefaultDealFunc(that, options, data);
								}
							} catch (e) {
								layer.msg(('错误【' + e.message + '】发生在【' + (e.lineNumber||e.number) + '】行'));
							} finally{
								
							}
						}
					},
					error:function(data) {
						console.log(data);
						//layer.msg("[initFiles]连接超时");
					}
				});
			}
			
			/**
			* 删除附件
			* @param node 当前节点
			* @param eleId 根元素的id
			* @param isDelFromDb 是否删除数据库数据
			* @param delCallBackFunc 删除成功后的回调函数
			* @param closeConfirmWinCallBack 自定义弹窗的回调函数
			*/
			function fileDel(node, eleId, isDelFromDb, delCallBackFunc, closeConfirmWinCallBack,options) {
				var attaId = node.attr('data-attaid');
				if (!attaId) {
					layer.msg('未获取到附件参数');
					return;
				}
				if (isDelFromDb) {
					$.ajax({
						url: (options.delFileUrl || options.wechat_domain) + (('yes'==options.isUuidBizId)?"/commonFile/uuidBizId/fileDelFromDb.mhtml":"/wx/common/fileDelFromDb.mhtml"),
						type: "get",
						data : {
							selfBeanName:options.selfBeanName||'',
							selfServiceName:options.selfServiceName||'',
							isDelFromDb:'true',
							isDelDiscData:options.isDelDiscData||'false',
							attaId:attaId
						},
						dataType:"jsonp",
						jsonp: "jsonpCallback",
						jsonpCallback:"success_jsonpCallback_"+new Date().getTime(),
						success: function(data) {
							if (data.status == 1) {
								layer.msg(data.desc);
								return;
							}
							node.closest($('[id^="'+eleId+'_"]')).remove();
							if (closeConfirmWinCallBack != 'undefined' && typeof(closeConfirmWinCallBack) == 'function') {
								new closeConfirmWinCallBack();
							}
							if (delCallBackFunc != 'undefined' && typeof(delCallBackFunc) == 'function') {
								new delCallBackFunc(attaId);
							}
						},
						error:function(data) {
							layer.msg("[fileDel]连接超时");
						}
					});
				} else {
					node.closest($('[id^="'+eleId+'_"]')).remove();
					if (closeConfirmWinCallBack != 'undefined' && typeof(closeConfirmWinCallBack) == 'function') {
						new closeConfirmWinCallBack();
					}
					if (delCallBackFunc != 'undefined' && typeof(delCallBackFunc) == 'function') {
						new delCallBackFunc(attaId);
					}
				}
			}
		},
		wapVoiceUpload : function(options) {
			var that = this;
			that.bind('click',function(){
				
			})
		},
		videoUpload : function(options) {
			var that = this;
			var elementId = $(this).attr('id');
			var html = '<input id="'+elementId+'_filed" type="file" accept="video/*" style="display:none;">';
			that.append(html);
			that.bind('click',function(){
				var fileobj = document.getElementById(elementId+'_filed');
				fileobj.click();
			})
			
			$('#'+elementId+'_filed').change(function(){
				var videoLayer = layer.load();
				var file = $('#'+elementId+'_filed')[0].files[0];
				var fileSize = file.size;
				var maxUploadLen = options.maxUploadLen || 10;
				if ( fileSize > (maxUploadLen*1024*1024) ) {
					layer.msg('小视频不超过'+maxUploadLen+'M');
					that.val('');
					layer.close(videoLayer);
					return false;
				} else {
					var fileForm = new FormData();
					fileForm.append("video", file);
					$.ajax({
						url: options.wechat_domain + '/upFileServlet',
						data: fileForm,
						type: 'post',
						processData: false,
						contentType: false,
						async: false, 
						success: function (res) {
							if (res) {
								alert(JSON.stringify(res));
							} else {
								layer.msg('小视频上传失败');
							}
							layer.close(videoLayer);
						},
						error: function() {
							layer.msg('网络出现异常');
							layer.close(videoLayer);
						}
					});
				}
			});
		},
		getLocation : function(options) {
			var that = this;
			if (options.autoInit) {
				(function() {
					//_getLocation(that, options);
					setTimeout(function(){
						_getLocation(that, options);
					}, 1000);
				})();
			} else {
				that.bind('click',function(){
					_getLocation(_this, options);
				})
			}
			
			/*********************************************坐标系转换******************************************************/
			var x_PI = 3.14159265358979324 * 3000.0 / 180.0;
			var PI = 3.1415926535897932384626;
			var a = 6378245.0;
			var ee = 0.00669342162296594323;
			function transformLat(lng, lat) {
				var lat = +lat;
				var lng = +lng;
				var ret = -100.0 + 2.0 * lng + 3.0 * lat + 0.2 * lat * lat + 0.1 * lng * lat + 0.2 * Math.sqrt(Math.abs(lng));
				ret += (20.0 * Math.sin(6.0 * lng * PI) + 20.0 * Math.sin(2.0 * lng * PI)) * 2.0 / 3.0;
				ret += (20.0 * Math.sin(lat * PI) + 40.0 * Math.sin(lat / 3.0 * PI)) * 2.0 / 3.0;
				ret += (160.0 * Math.sin(lat / 12.0 * PI) + 320 * Math.sin(lat * PI / 30.0)) * 2.0 / 3.0;
				return ret
			};

			function transformLng(lng, lat) {
				var lat = +lat;
				var lng = +lng;
				var ret = 300.0 + lng + 2.0 * lat + 0.1 * lng * lng + 0.1 * lng * lat + 0.1 * Math.sqrt(Math.abs(lng));
				ret += (20.0 * Math.sin(6.0 * lng * PI) + 20.0 * Math.sin(2.0 * lng * PI)) * 2.0 / 3.0;
				ret += (20.0 * Math.sin(lng * PI) + 40.0 * Math.sin(lng / 3.0 * PI)) * 2.0 / 3.0;
				ret += (150.0 * Math.sin(lng / 12.0 * PI) + 300.0 * Math.sin(lng / 30.0 * PI)) * 2.0 / 3.0;
				return ret
			};

			/**
			 * GCJ02 转换为 WGS84
			 * @param lng
			 * @param lat
			 * @returns {*[]}
			 */
			function gcj02towgs84(lng, lat) {
				var lat = +lat;
				var lng = +lng;
				if (out_of_china(lng, lat)) {
					return [lng, lat]
				} else {
					var dlat = transformLat(lng - 105.0, lat - 35.0);
					var dlng = transformLng(lng - 105.0, lat - 35.0);
					var radlat = lat / 180.0 * PI;
					var magic = Math.sin(radlat);
					magic = 1 - ee * magic * magic;
					var sqrtmagic = Math.sqrt(magic);
					dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * PI);
					dlng = (dlng * 180.0) / (a / sqrtmagic * Math.cos(radlat) * PI);
					var mglat = lat + dlat;
					var mglng = lng + dlng;
					return [lng * 2 - mglng, lat * 2 - mglat]
				}
			}

			/**
			 * 百度坐标系 (BD-09) 与 火星坐标系 (GCJ-02)的转换
			 * 即 百度 转 谷歌、高德
			 * @param bd_lon
			 * @param bd_lat
			 * @returns {*[]}
			 */
			function bd09togcj02(bd_lon, bd_lat) {
				var bd_lon = +bd_lon;
				var bd_lat = +bd_lat;
				var x = bd_lon - 0.0065;
				var y = bd_lat - 0.006;
				var z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * x_PI);
				var theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * x_PI);
				var gg_lng = z * Math.cos(theta);
				var gg_lat = z * Math.sin(theta);
				return [gg_lng, gg_lat]
			}

			/**
			 * 判断是否在国内，不在国内则不做偏移
			 * @param lng
			 * @param lat
			 * @returns {boolean}
			 */
			function out_of_china(lng, lat) {
				var lat = +lat;
				var lng = +lng;
				// 纬度3.86~53.55,经度73.66~135.05
				return !(lng > 73.66 && lng < 135.05 && lat > 3.86 && lat < 53.55);
			}

			function covertLocName(_this, res, options, locationLoadIndex){
				try {
					var point = new BMap.Point(res.longitude, res.latitude);
					new BMap.Convertor().translate([point], 3, 5, function(data) {
						var baiduLng = parseFloat(data.points[0].lng);
						var baiduLat = parseFloat(data.points[0].lat);
						var baiduPoint = new BMap.Point(baiduLng, baiduLat);

						new BMap.Geocoder().getLocation(baiduPoint, function(result) {
							var locName = result.address;
							if (result.surroundingPois != null && result.surroundingPois.length > 0 && result.addressComponents.street == "") {
								locName = locName + result.surroundingPois[0].title;
							}
							if (locName != null && locName != '') {
								locName = locName.replace("中国", "");
								res.locName = locName;
								if (options.locationType != 'wgs84') {
									var xy = gcj02towgs84(res.longitude, res.latitude);
									res.longitude = xy[0];
									res.latitude = xy[1];
								}
							}
							layer.close(locationLoadIndex);
							if (options.callBackFunc != 'undefined' && typeof(options.callBackFunc) == 'function') {
								new options.callBackFunc(_this,res);
							}
						});
					});
				} catch(e) {
					alert(JSON.strigify(e));
				}
			}
			
			function _getLocation(_this, options) {
				var locationLoadIndex = layer.load();
				try {
					options.locationType = options.locationType || 'wgs84';
					if(isWeixinBrowser()) {
						wx.ready(function(){
						  wx.getLocation({
								type: options.locationType, // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
								success: function (res) {
									covertLocName(_this,res,options,locationLoadIndex);
									//layer.close(locationLoadIndex);
									//if (options.callBackFunc != 'undefined' && typeof(options.callBackFunc) == 'function') {
									//	new options.callBackFunc(_this,res);
									//}
								},
								fail : function(res) {
									layer.close(locationLoadIndex);
									if (options.errorCallBackFunc != 'undefined' && typeof(options.errorCallBackFunc) == 'function') {
										new options.errorCallBackFunc(_this,res);
									} else {
										layer.msg('请确认设备是否开启定位服务');
									}
								}
							});
						});
					} else {
						window.WebViewJavascriptBridge.callHandler('getLocation', {},
							function (res) {
								layer.close(locationLoadIndex);
								var obj = eval('(' + res + ')');
								var status = obj.status;
								if (status == 0) {
									var longitude = obj.longitude;//经度
									var latitude = obj.latitude;//纬度
									var locName = obj.locName;//地址
									if (options.callBackFunc != 'undefined' && typeof(options.callBackFunc) == 'function') {
										new options.callBackFunc(_this,obj);
									}
								} else {
									if (options.errorCallBackFunc != 'undefined' && typeof(options.errorCallBackFunc) == 'function') {
										new options.errorCallBackFunc(_this,res);
									} else {
										layer.msg('请确认设备是否开启定位服务');
									}
								}
							}
						);
					}
				} catch(e) {
					setTimeout(_getLocation(_this, options), 1000);
					//_getLocation(_this, options);
				}
			}
		}
	})
})(jQuery);