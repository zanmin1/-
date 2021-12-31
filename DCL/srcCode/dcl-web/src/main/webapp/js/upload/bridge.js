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
   
	//判断客户端类型
	function getClientType() {
		var p = navigator.platform;
		if (p.indexOf("Win") == 0) {
			return "pc";
		} else {
			var ua = navigator.userAgent.toLowerCase();  
			if (ua.match(/MicroMessenger/i) == "micromessenger") {  
				return "wx";  
			} else {  
				return "mobile";  
			}  
		}
	}
   