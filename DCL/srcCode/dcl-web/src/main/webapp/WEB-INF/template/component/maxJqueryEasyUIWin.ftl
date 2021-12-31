<!--
jquery easyui window 包装，用于页面弹出窗口。最大化
应用页面调用showMaxJqueryWindow(title, targetUrl);
参数：标题，窗口显示的页面地址

maximized: true
-->
<div id="MaxJqueryWindowContent"></div>

<script type="text/javascript">
	var dialogs = [];
	
	function showMaxJqueryWindow(title, targetUrl,width,height, maximizable, scroll, callBackOnClose) {
		var $MaxJqueryWindow;
		var top = 0;
		var left = 0;
		if(width==undefined || width==null) {
			width = $(window).width();
		}
		if(height==undefined || height==null) {
			height = $(window).height();
		}
		if(maximizable==undefined || maximizable==null){
			maximizable = false;
		}
		if(scroll==undefined || scroll==null){
			scroll = "no";
		}
		left = parseInt(($(window).width()-width)*0.5+$(document).scrollLeft());
		top = parseInt(($(window).height()-height)*0.5+$(document).scrollTop());
		//添加getTime是为了防止前后两次打开的窗口的id一样，这样会导致父页面获取子页面窗口元素时，有问题
		var maxJqueryWindowId = "MaxJqueryWindow_" + dialogs.length + "_" + new Date().getTime();
		var maxJqueryWin =  '<div id="'+ maxJqueryWindowId +'" class="easyui-window" title="信息窗口" minimizable="false" maximizable="true" collapsible="false" inline="false"'+
								'closed="true" modal="true" style="width:790px;height:480px;padding:1px; overflow:hidden;">'+
								"<iframe scrolling="+scroll+" frameborder='0' src='"+targetUrl+"' style='width:100%;height:100%;'></iframe>"+
							'</div>';
		var MaxJqueryWindowContentHtml = $("#MaxJqueryWindowContent").html();
		MaxJqueryWindowContentHtml += maxJqueryWin;
		$("#MaxJqueryWindowContent").html(MaxJqueryWindowContentHtml);
					
		$MaxJqueryWindow = $('#'+maxJqueryWindowId).window({
		    title: (title==null || title=="")?"信息窗口":title,
		    width: width,
		    height: height,
		    top: top,
		    left: left,
		    shadow: false,
		    modal: true,
		    closed: true,
		    closable: true,//是否有关闭按钮
		    minimizable: false,
		    maximizable: maximizable,
		    collapsible: false,
		    onBeforeClose: function () {
                 if(callBackOnClose != undefined && callBackOnClose != null) {
                 	callBackOnClose();
                 }
            },
            onClose: function(){
				dialogs.pop();
			}
		});
		if(window["$MaxJqueryWindowOnClose"]){
			$MaxJqueryWindow.window({onClose:window["$MaxJqueryWindowOnClose"]});
		} 
		
		dialogs.push($MaxJqueryWindow);
		$MaxJqueryWindow.window('open');
		return maxJqueryWindowId;
	}
	
	function closeMaxJqueryWindow() {//关闭最后一个窗口
		var len = dialogs.length;
		if(len > 0){
			dialogs[len - 1].window('close');//会调用 onClose方法
		}
	}
	
	function closeBeforeMaxJqueryWindow() {//关闭之前所有的窗口 需要在打开窗口方法调用之后使用
		var len = dialogs.length;
		if(len > 1){
			var winDialog = dialogs[len - 1];//为了保存当前打开的窗口
			for(var index = len - 2; index >= 0; index--){
				dialogs[index].window('close');//会调用 onClose方法
			}
			dialogs = [];
			dialogs.push(winDialog);
		}
	}
</script>