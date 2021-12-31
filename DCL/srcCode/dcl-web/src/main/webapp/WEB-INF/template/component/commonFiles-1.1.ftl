<#if Session.defaultPageAction?exists>
	<#assign defaultPageAction = Session.defaultPageAction>
</#if>
<#assign rootPath = rc.getContextPath() >
<#if Session.uiDomain?exists>
	<#assign uiDomain = Session.uiDomain>
</#if>

<#global ffcs=JspTaglibs["/WEB-INF/tld/RightTag.tld"] >
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/js/jquery-easyui-1.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/normal.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/easyuiExtend.css" />
<link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/jquery.mCustomScrollbar.css" />

<script type="text/javascript" src="${uiDomain!''}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${uiDomain!''}/js/jqry-9-1-7.min.js"></script>
<script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${uiDomain!''}/js/jquery.easyui.patch.js"></script><!--用于修复easyui-1.4中easyui-numberbox失去焦点后不能输入小数点的问题-->
<script type="text/javascript" src="${uiDomain!''}/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${uiDomain!''}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${uiDomain!''}/js/jquery.form.js" ></script>
<script type="text/javascript" src="${uiDomain!''}/js/zzgl_core.js?_=1"></script>
<script type="text/javascript" src="${uiDomain!''}/js/function.js"></script>
<script type="text/javascript" src="${uiDomain!''}/js/layer/layer.js"></script>
<script type="text/javascript" src="${ANOLE_COMPONENT_URL}/js/components/keyboard/shortcut.js" charset="utf-8"></script>
<script type="text/javascript">
    var imgPath = "${APP_URL_IMG!''}"+"/zzgrid/";
    var rootPath = "${rootPath!''}";
    var uiPath = "${uiDomain!''}";
    var _jSessionId = "${JSESSIONID!''}";
    var defaultImgPath = "${rc.getContextPath()}/images/legal_icon.png";
    //页面初始化
    $(document).ready(function(){	
	    <#if promptMsg??>
	    	$.messager.alert('警告','${promptMsg}');//消息提示
	    </#if>
	    <#if defaultPageAction??>
	    	window['${defaultPageAction}']();//默认执行函数
	    </#if>
    });

    (function($){

        /**
         * 表单序列化成json对象
         *
         */
        $.fn.serializeJson = function(){
            var serializeObj = {};
            var array=this.serializeArray();
            var str=this.serialize();
            $(array).each(function(){
                if(serializeObj[this.name]){
                    if($.isArray(serializeObj[this.name])){
                        serializeObj[this.name].push(this.value);
                    }else{
                        serializeObj[this.name]=[serializeObj[this.name],this.value];
                    }
                }else{
                    serializeObj[this.name]=this.value;
                }
            });
            return serializeObj;
        };
    })(jQuery);

</script>

