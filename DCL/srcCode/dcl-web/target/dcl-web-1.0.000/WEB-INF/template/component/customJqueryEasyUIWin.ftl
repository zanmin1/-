<!--
jquery easyui window 包装，用于页面弹出窗口。自定义窗口大小
应用页面调用showCustomJqueryWindow(title, width, height, targetUrl);
参数：标题，窗口显示的页面地址

maximized: true
-->
<div id="CustomJqueryWindow" class="easyui-window" title="信息窗口" minimizable="false" maximizable="true" collapsible="false" inline="false"
	closed="true" modal="true" style="width:790px;height:480px;padding:1px; overflow:hidden;">
</div>

<script type="text/javascript">
	var $CustomJqueryWindow;
	function showCustomJqueryWindow(title, width, height, targetUrl,scroll,isDraggable) {
	    if(width==undefined || width==null) {
			width = window.document.body.clientWidth;//$(window).width();
		}
		if(height==undefined || height==null) {
			height =window.document.body.clientHeight;// $(window).height();
		}
		if(scroll==undefined || scroll==null){
			scroll = "no";
		}
		if(isDraggable==undefined || isDraggable==null){
			isDraggable = true;
		}
		$("#CustomJqueryWindow").empty().html("<iframe scrolling="+scroll+" frameborder='0' src='"+targetUrl+"' style='width:99.9%;height:100%;overflow-x:hidden;'></iframe>")
		$CustomJqueryWindow = $('#CustomJqueryWindow').window({
		    title: (title==null || title=="")?"信息窗口":title,
		    width: width,
		    height: height,
	    	top:($(window).height()-height)*0.5+$(document).scrollTop(),
	    	left:($(window).width()-width)*0.5+$(document).scrollLeft(),
		    shadow: true,
		    modal: true,
		    closed: true,
		    minimizable: false,
		    maximizable: false,resizable:isDraggable,//不能改变窗口大小
		    collapsible: false,draggable:isDraggable//不能拖动窗口
		});
		$CustomJqueryWindow.window('open');
	}
	
	function closeCustomJqueryWindow() {
		$CustomJqueryWindow.window('close');
	}
</script>