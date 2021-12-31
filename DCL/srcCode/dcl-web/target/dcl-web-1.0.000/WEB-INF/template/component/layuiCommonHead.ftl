<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- layui样式 -->
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.css" />
<!--本部样式-->
<!--引入 重置默认样式 statics/zhxc -->
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/common/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-global.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/layuiExtend.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/layui-guanlihotai-biaozhun/pages/blue/css/standard-template.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/_jzfp/fujian-xczx/pages/blue/css/modify-index.css" />

<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_jzfp/shandong/pages/blue/css/global.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_jzfp/shandong/pages/blue/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/plugins/layui-v2.5.5/layui/css/modules/layer/theme/shenzhen-fp/layer/style.css">
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_jzfp/shandong/pages/blue/css/jxxy-modify.css">
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/web-assets/_jzfp/shandong/pages/blue/css/sd-modify.css">

<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/web-assets/plugins/jquery-nicescroll/jquery.nicescroll.js"></script>
<script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>

<script src="${uiDomain!''}/web-assets/plugins/layui-ext/layuiTree/layuiTree.js?8"></script>
<#--单选组件-->
<script src="${uiDomain}/web-assets/plugins/layui-ext/single-select/js/layuiComp.singleSelect.js"></script>
<#--单选组件-->
<script type="text/javascript" src="${uiDomain}/web-assets/plugins/layui-ext/multi-select/js/multiSelect.js"></script>
<link rel="stylesheet" type="text/css" href="${uiDomain}/web-assets/plugins/layui-ext/multi-select/css/formSelects-v4.css" />
<script src="${uiDomain}/web-assets/plugins/layui-ext/multi-select/js/formSelects-v4.min.js" type="text/javascript" charset="utf-8"></script>
<#--radio单选组件-->
<script src="${uiDomain}/web-assets/plugins/layui-ext/single-radio/js/layuiComp.singleRadio.js"></script>
<#--checkbox复选组件-->
<script src="${uiDomain}/web-assets/plugins/layui-ext/multi-checkbox/js/layuiComp.multiCheckBox.js"></script>
<#--Layui的规则校验组件-->
<script src="${uiDomain}/web-assets/plugins/layui-ext/verification/v1.0.0/js/layui-verification.js" type="text/javascript" charset="utf-8"></script>
<script src="${uiDomain}/web-assets/plugins/validation-ext.js"></script>
<style>
	.a-detail:hover{
		color: #939393 !important;
	}
</style>
<script>
	var base = '${rc.getContextPath()}';//项目的上下文，（工程名）
	// 暂无数据
	var listNoDataHtml = '<div class="zwsu-ext1 flex flex-ac flex-jc">'
							+ '<img src="${uiDomain!''}/web-assets/layui-guanlihotai-biaozhun/pages/blue/images/zwsj.png" />'
                        + '</div>';

	// layui日期控件共通处理
	if (typeof LayuiComp != 'undefined') {
		LayuiComp.date = {
		    max:{
		        year: 2099,
			    month: 0,
			    date: 1
			},
			min:{
		        year: 1900,
		        month: 0,
		        date: 1
		    },
		    str:{
		       min: '1900-01-01',
		       max: '2099-12-31'
		    }
		}
	}
	// 计算页面高度
	var winW, winH, lhH, lbH, tbH;
	function calcLayBdH() {
		winW = $(window).width(),
				winH = $(window).height(),
				lhH = $('.lay-nor-hd').outerHeight(true),
				lbH;
		if (winW <= 1366) {
			lbH = winH - lhH - 20;
			tbH = lbH;//table高度计算，可调整
		} else {
			lbH = winH - lhH - 30;
			tbH = lbH;
		}
		$('.lay-nor-bd').css({ 'height': lbH + 'px' });
	}
	

	$(function () {

        // 滚动条美化
        $('.scroll').niceScroll({
            cursorcolor: "#000", //滚动条的颜色
            cursoropacitymax: 0.12, //滚动条的透明度，从0-1
            cursorwidth: "4px", //滚动条的宽度  单位默认px
            cursorborderradius: "2px", //滚动条两头的圆角
            autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
            zindex: 8, //给滚动条设置z-index值
        })

        //高级搜索
		$('#more').on('click', function (e) {
			e.stopPropagation()
			$(this).toggleClass('active');
			$('.more-search-ul').slideToggle(200,function(){
				$('.scroll').getNiceScroll().resize();
			})
		});
		$('.more-search-ul').on('click',function(){
			return false;
		});
        $('.more-search-ul .layui-form-select').click(function(){
            $('.scroll').getNiceScroll().resize(); 
        });
		$(window).on('click',function(){
			$('#more').removeClass('active');
			$('.more-search-ul').slideUp(200,function(){
				$('.scroll').getNiceScroll().resize();
			})
		});
	});

	
	/*
	* 参数说明：
    * number：要格式化的数字
    * decimals：保留几位小数
    * dec_point：小数点符号
    * thousands_sep：千分位符号
    * */
	function number_format(number, decimals, dec_point, thousands_sep) {
	    number = (number + '').replace(/[^0-9+-Ee.]/g, '');
	    var n = !isFinite(+number) ? 0 : +number,
	        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	        s = '',
	        toFixedFix = function (n, prec) {
	            var k = Math.pow(10, prec);
	            return '' + Math.floor(n * k) / k;
	        };
	
	    //s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	    s = ('' + n).split('.');
	    var re = /(-?\d+)(\d{3})/;
	    while (re.test(s[0])) {
	        s[0] = s[0].replace(re, "$1" + sep + "$2");
	    }
	
	    if ((s[1] || '').length < prec) {
	        s[1] = s[1] || '';
	        s[1] += new Array(prec - s[1].length + 1).join('');
	    }
	    
	    if ((s[1] || '').length == 0) {
	    	return s.join('');
	    } else {
	    	return s.join(dec);
	    }
	}
	
	/*
	* 共通弹窗
	* 参数说明：
    * msg1：第一行显示的文字
    * msg2：第二行显示的文字
    * icon：1:问号；2：确定；3：错误；4：禁止
    * title：标题内容，可不传，默认为“提示信息”
    * width：宽度，可不传，默认为“400px”
    * btn：展示的按钮，可不传，默认为['是', '否'],当不需要展示按钮时，需传[]
    * callBack：回调函数
    * callBackParam：回调函数参数
    * */
	function commonShowDialog(opts) {
	
		// 展示的图标
		var icomClass = "fl ts-icon ";
		switch (opts.icon) {
			case 2:
				icomClass += "ts-icon-cg";
				break;
			case 3:
				icomClass += "ts-icon-sb";
				break;
			case 4:
				icomClass += "ts-icon-jz";
				break;
		}
		
		// 展示的文字
		var showMsg = "";
		if (opts.msg2 == undefined || opts.msg2 == null || opts.msg2 == "") {
			showMsg = '<p class="ts-title">' + opts.msg1 + '</p>';
		} else {
			showMsg = '<p class="ts-title">' + opts.msg1 + '</p>'+
					  '<p class="mt5 ts-text">' + opts.msg2 + '</p>';
		}
    
	    // 弹窗html
        var maskHtml ='<div class="clearfix" style="padding:20px;background:#fff;">'+
				            '<i class="' + icomClass + '"></i>'+
				            '<div class="fl ml10" >'+
	                      		showMsg +
	                        '</div>' +
				      '</div>';
				      
		// 标题内容
		if (opts.title == undefined || opts.title == null || opts.title == "") {
			opts.title = "提示信息";
		}
		
		// 宽度
		if (opts.width == undefined || opts.width == null || opts.width == "") {
			opts.width = "400px";
		}
		
		// 展示的按钮
		var btn = {};
		var time = 0;
		if (opts.btn == undefined || opts.btn == null) {
			opts.btn = ['确定', '取消'];
			btn = {btn: opts.btn};
		} else if (opts.btn.length > 0) {
			btn = {btn: opts.btn};
		} else {
			time = 1500;
		}
				      
		var index = layer.open($.extend(btn, {
			skin: 'layer-ext-sch',
			title: opts.title, 
			type: 1,
			btnAlign:'c',
			time: time,
			area: [opts.width, 'auto'],
			shadeClose: true, //点击遮罩关闭
			content: maskHtml,
			yes: function(index, layero) {
				if (typeof opts.callBack === "function") {
					opts.callBack(opts.callBackParam);
				}
				layer.close(index);
			}
		}));
	}

	/*
	* 共通弹窗
	* 参数说明：
    * msg1：第一行显示的文字
    * msg2：第二行显示的文字
    * icon：1:问号；2：确定；3：错误；4：禁止
    * title：标题内容，可不传，默认为“提示信息”
    * width：宽度，可不传，默认为“400px”
    * btn：展示的按钮，可不传，默认为['是', '否'],当不需要展示按钮时，需传[]
    * yesCallBack：回调函数
    * yesCallBackParam：回调函数参数
    * cancelCallBack：回调函数
    * cancelCallBackParam：回调函数参数
    * */
	function commonShowDialog2(opts) {

		// 展示的图标
		var icomClass = "fl ts-icon ";
		switch (opts.icon) {
			case 2:
				icomClass += "ts-icon-cg";
				break;
			case 3:
				icomClass += "ts-icon-sb";
				break;
			case 4:
				icomClass += "ts-icon-jz";
				break;
		}

		// 展示的文字
		var showMsg = "";
		if (opts.msg2 == undefined || opts.msg2 == null || opts.msg2 == "") {
			showMsg = '<p class="ts-title">' + opts.msg1 + '</p>';
		} else {
			showMsg = '<p class="ts-title">' + opts.msg1 + '</p>'+
					  '<p class="mt5 ts-text">' + opts.msg2 + '</p>';
		}

	    // 弹窗html
        var maskHtml ='<div class="clearfix" style="padding:20px;background:#fff;height:100%;box-sizing:border-box;">'+
				            '<i class="' + icomClass + '"></i>'+
				            '<div class="fl ml10" style="width:calc(100% - 40px);">'+
	                      		showMsg +
	                        '</div>' +
				      '</div>';

		// 标题内容
		if (opts.title == undefined || opts.title == null || opts.title == "") {
			opts.title = "提示信息";
		}

		// 宽度
		if (opts.width == undefined || opts.width == null || opts.width == "") {
			opts.width = "400px";
		}

		// 展示的按钮
		var time = 0;
		if (opts.btn == undefined || opts.btn == null) {
			opts.btn = ['是', '否'];
		} else {
			time = 1500;
		}

		var idx = layer.confirm('', {
			skin: 'layer-ext-sch',
			title: opts.title,
			type: 1,
			btn: opts.btn,
			btnAlign: 'c',
			time: time,
			area: [opts.width, 'auto'],
			shadeClose: true, //点击遮罩关闭
			closeBtn: 0,
			content: maskHtml
		}, function () {
			if (typeof opts.yesCallBack === "function") {
				opts.yesCallBack(opts.yesCallBackParam);
			}
			layer.close(idx);
		}, function () {
			if (typeof opts.cancelCallBack === "function") {
				opts.cancelCallBack(opts.cancelCallBackParam);
			}
			layer.close(idx);
		});
	}

	/*
	* 附件下载方法
	* 参数说明：
    * attId：附件ID
    * */
	function DownLoadFile(attId) {
		var fileUrl = base+'/spr/file/downloadFile.jhtml?attaId='+attId;
		window.open(fileUrl);
	}
</script>