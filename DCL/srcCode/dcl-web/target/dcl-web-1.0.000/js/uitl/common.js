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
                } else if (value.charCodeAt(i) == 38) {
                    limitLen -= 5;
                } else {
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
    setMaxCodeLength();
});

//表达提交判断
function formValidation(scopeId){
    var isToF = true;//返回值
    var validationList = $('[appValidation]');
    if (scopeId){
        validationList = $('#'+scopeId+' [appValidation]');
    }
    $.each(validationList, function(i, item) {
        var value = $(this).val();
        var text = $(this).text();
        if(item.localName=="textarea"){
            var text=value;
        }
        //判空验证
        var isNotEmpty = $(this).attr('isNotEmpty');
        if(!isEmpty(isNotEmpty)){
            if(isEmpty(value)&&isEmpty(text)){
                layer.msg($(this).attr('isNotEmpty'));
                isToF = false;
                return false;
            }
        }
        //正整数验证
        var isIntNum = $(this).attr('isIntNum');
        if(!isEmpty(isIntNum)){
            if(!isEmpty(value)&&!isIntNumValid(value)){
                layer.msg($(this).attr('isIntNum'));
                isToF = false;
                return false;
            }
        }
        //手机验证
        var isPhone = $(this).attr('isPhone');
        if(!isEmpty(isPhone)){
            if(!isEmpty(value)){
                if(!checkMobileNum(value)){
                    layer.msg($(this).attr('isPhone'));
                    isToF = false;
                    return false;
                }
            }else if(!isEmpty(text)){
                if(!checkMobileNum(text)){
                    layer.msg($(this).attr('isPhone'));
                    isToF = false;
                    return false;
                }
            }
        }

        //手机验证
        var isHomeOrMobilePhone = $(this).attr('isHomeOrMobilePhone');
        if(!isEmpty(isHomeOrMobilePhone)){
            if(!isEmpty(value)){
                if(!checkPhoneNum(value)){
                    layer.msg($(this).attr('isHomeOrMobilePhone'));
                    isToF = false;
                    return false;
                }
            }else if(!isEmpty(text)){
                if(!checkPhoneNum(text)){
                    layer.msg($(this).attr('isHomeOrMobilePhone'));
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
        //身份证验证
        var isIdCard = $(this).attr('isIdCard');
        if(!isEmpty(isIdCard)){
            if(!isEmpty(value)){
                if(!IdentityCodeValid(value)){
                    layer.msg($(this).attr('isIdCard'));
                    isToF = false;
                    return false;
                }
            }else if(!isEmpty(text)){
                if(!IdentityCodeValid(value)){
                    layer.msg($(this).attr('isIdCard'));
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

        //最小输入字数
        var minlength = $(this).attr('minlength');
        if(!isEmpty(minlength)){
            minlength = eval("(" + minlength + ")");
            if(value){
                if(value.length < minlength[0]){
                    layer.msg(minlength[1]);
                    isToF = false;
                    return false;
                }
            }
            if(text){
                if(text.length < minlength[0]){
                    layer.msg(minlength[1]);
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

function isIntNumValid(s){
    var regu = /^[1-9]+[0-9]*$/;
    if(new RegExp(regu).test(s)){
        return true;
    } else {
        return false;
    }
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

function isHomePhone(s){
    var phoneRegWithArea = /^[0][1-9]{2,3}[0-9]{5,8}$/;
    if( new RegExp(phoneRegWithArea).test(s) ){
        return true;
    }else{
        return false;
    }
}

function checkMobileNum(v){
    v = v.replace(/\，/gi,",");
    if (v == "") return false;
    var hms = v.split(",");
    for (var i = 0; i < hms.length; i++) {
        if (!isMobile(hms[i]) && !isPhones(hms[i])) {
            return false;
        }
    }
    return true;
}

function checkPhoneNum(v){
    v = v.replace(/\，/gi,",");
    if (v == "") return false;
    var hms = v.split(",");
    for (var i = 0; i < hms.length; i++) {
        if (!isHomePhone(hms[i]) && !isPhones(hms[i])) {
            return false;
        }
    }
    return true;
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
    if(str==undefined || str=="" || str==null || str=="null" || $.trim(str) == ''){
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
var addrefromtype = "";
var addrecanchosup = false;
var addreshiddenlastcode=false;
var addresShowGridName = "Yes";
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
    var thisSerarValue="";
    if(isEmpty(className)){
        alert("请添加新元素id名");
        return;
    }
    var sdptype = $("#gird"+className).css("display");
    if (sdptype == "none") {
        addrefromtype="";
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
        if(!isEmpty(addreparm[0].qrcodeSwitchClose)&&"true"==addreparm[0].qrcodeSwitchClose){
            qrcodeCode=false;
        }else{
            qrcodeCode=true;
        }
        if(!isEmpty(addreparm[0].hiddenlastcode)&&"true"==addreparm[0].hiddenlastcode){
            addreshiddenlastcode=true;
        }else{
            addreshiddenlastcode=false;
        }
        if(!isEmpty(addreparm[0].minaddrescenji)){
            minaddrescenji=addreparm[0].minaddrescenji;
        }else{
            minaddrescenji=6;
        }
        if(!isEmpty(addreparm[0].fromtype)){
            addrefromtype=addreparm[0].fromtype;
        }
        if(!isEmpty(addreparm[0].showserchadd)){
            showserchaddbiaoz=addreparm[0].showserchadd;
        }else{
            showserchaddbiaoz="open";
        }
        if(!isEmpty(addreparm[0].canshooseup)&&"true"==addreparm[0].canshooseup){
            addrecanchosup=true;
        }else{
            addrecanchosup=false;
        }
        if(!isEmpty(addreparm[0].thisSerarValue)){
            thisSerarValue=addreparm[0].thisSerarValue;
        }else{
            thisSerarValue="";
        }
        if(!isEmpty(addreparm[0].showGridName)){
            addresShowGridName=addreparm[0].showGridName;
        }else{
            addresShowGridName='Yes';
        }
    }else{
        maxaddrescenji=1;
        minaddrescenji=6;
        showserchaddbiaoz="open";
        addrecanchosup=false;
        addreshiddenlastcode=false;
        qrcodeCode=true;
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
        var toshowQraddrfora='';
        if(qrcodeCode){
            toshowQraddrfora='<a href="javascript:toshowQraddr()" class="go-qrserch green" style="right:50px;"></a>'
        }
        var toshowSeropt='<a href="javascript:void(0);" onclick="addresSure(\''+addreCallback+'\')" class="btn-blue">确定</a>';
        if(typeName == "xiejing"&&userOrgcode.startsWith("6205")) {
            toshowSeropt='';
        }
        var addreschocneji=new Array();
        addreschocneji[0]='<div class="form-line">'
            +'<label>省份</label>'
            +'<input type="hidden" name="provinceCode" id="provinceCode'+className+'"/>'
            +'<a id="orgid1'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'provinceCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="province'+className+'">请选择</span><i id="orgimg1'+className+'" class="right-icon"></i></a>'
            +'<select style="display: none;" id="provinceId'+className+'"></select>'
            +'</div>';
        addreschocneji[1]='<div class="form-line">'
            +'<label>城市</label>'
            +'<input type="hidden" name="cityCode" id="cityCode'+className+'"/>'
            +'<a id="orgid2'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'cityCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="city'+className+'">请选择</span><i id="orgimg2'+className+'" class="right-icon"></i></a>'
            +'<select style="display: none;" id="cityId'+className+'"></select>'
            +'</div>';
        addreschocneji[2]= '<div class="form-line">'
            +'<label>区(县)</label>'
            +'<input type="hidden" name="countyCode" id="countyCode'+className+'"/>'
            +'<a id="orgid3'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'countyCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="county'+className+'">请选择</span><i id="orgimg3'+className+'" class="right-icon"></i></a>'
            +'<select style="display: none;" id="countyId'+className+'"></select>'
            +'</div>';
        addreschocneji[3]= '<div class="form-line">'
            +'<label>街(镇)</label>'
            +'<input type="hidden" name="streetCode" id="streetCode'+className+'"/>'
            +'<a id="orgid4'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'streetCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="street'+className+'">请选择</span><i id="orgimg4'+className+'" class="right-icon"></i></a>'
            +'<select style="display: none;" id="streetId'+className+'"></select>'
            +'</div>';
        addreschocneji[4]= '<div class="form-line">'
            +'<label>社区(村)</label>'
            +'<input type="hidden" name="communityCode" id="communityCode'+className+'"/>'
            +'<a id="orgid5'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'communityCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="community'+className+'">请选择</span><i id="orgimg5'+className+'" class="right-icon"></i></a>'
            +'<select style="display: none;" id="communityId'+className+'"></select>'
            +'</div>';
        addreschocneji[5]= '<div class="form-line">'
            +'<label>网格</label>'
            +'<input type="hidden" name="lastgridCode" id="lastgridCode'+className+'"/>'
            +'<a id="orgid6'+className+'" href="javascript:void(0);" onclick="selectDicttosure(\'lastgridCode\',\'<%=path%>\')" class="label-con select-addr" ><span id="lastgrid'+className+'">请选择</span><i id="orgimg6'+className+'" class="right-icon"></i></a>'
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
            +toshowSeropt
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
                    toshowQraddrfora+
                    '<input type="text" id="addsearchKwor'+ className +'" readonly="readonly"  onclick="inputaddsecr()" placeholder="详细地址"  value="'+thisSerarValue+'" class="search-input" />'+
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
                    toshowQraddrfora+
                    '<input type="text" placeholder="详细地址"  value="'+thisSerarValue+'"  readonly="readonly" onclick="inputaddsecr()" id="addsearchKwor'+ className +'" class="search-input" />'+
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
    var id = 'gird'+className;
    var id1='';
    var sdp = $("#"+id).css("display");
    if (sdp == "none") {
        $("#"+className+"browserRefres").val(browserRefreshType);
        browserRefreshType=false;
        nowbrowserRefreshtype=false;
        onPageFinishedJS();
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
        onPageFinishedJS();
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
        if(!isEmpty(addrefromtype)){
            if("fromnewaddress"==addrefromtype){
                tochosebackfromotherjs();
            }else if("fromaddnewaddress"==addrefromtype){
                toaddbackfromotherjs();
            }
        }
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
                onPageFinishedJS();
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
                var name = strInfo(item.addressAllName);
                var divisionCod = strInfo(item.regionCode);
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
//	$("#"+addrenowshow+"val").val(itemdata.addressStreetCode);
    $("#"+addrenowshow+"val").val(itemdata.regionCode);
    $("#"+addrenowshow+"searName").val(itemdata.addressAllName);
    addresSure(addreCallbacknam,1);
}

//地址选择确认返回
function addresSure(addreCallback,typ){
    browserRefreshType=$("#"+addrenowshow+"browserRefres").val();
    nowbrowserRefreshtype=browserRefreshType;
    onPageFinishedJS();
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
    if(addresShowGridName=="No") {
//		var dad = $("#lastgrid"+addrenowshow+"").text();
        addreName=addreName.replace($("#lastgrid"+addrenowshow+"").text(),"");
    }
    var func=eval(addreCallback);
    if(addreshiddenlastcode&&addreCode.length>12&&addtype=="xiejing"){
        var url = allpath+"/api/v4/common/defaultAddr.json?dataType=grid&tokenKey="+alltokenkey+"&userOrgCode="+ alluserOrgCode +"&orgCode="+$("#communityCode"+addrenowshow).val();
        var addresindexLoad = layer.load(1);
        $.getJSON(url, function(data) {
            var rows = data.data.address;
            layer.close(addresindexLoad);
            if(data.data.address != null){
                addreName=strInfo(data.data.address.addressPathName);
            }
            if(typ==1){
                addreName=$("#"+addrenowshow+"searName").val();
            }else{
                addreName=addreName+strInfo($("#addsearchKwor"+addrenowshow).val(),"");
            }
            var addressparm = [];
            addressparm.push(rows);
            new func(addreName,addreCode,addrenowshow,addreJson,addressparm);
        });
    }else{
        var url = allpath+"/api/v4/common/defaultAddr.json?tokenKey="+alltokenkey+"&userOrgCode="+ alluserOrgCode +"&orgCode="+$("#communityCode"+addrenowshow).val();
        var addresindexLoad = layer.load(1);
        $.getJSON(url, function(data) {
            try {
                var rows = data.data.address;
                layer.close(addresindexLoad);
                var addressparm = [];
                addressparm.push(rows);
                new func(addreName,addreCode,addrenowshow,addreJson,addressparm);
            } catch(e) {
                console.log(e);
                layer.msg("获取地址服务问题：" + e.message);
                layer.close(addresindexLoad);
            }
        });
    }
    if(!isEmpty(addrefromtype)){
        if("fromnewaddress"==addrefromtype){
            tochosebackfromotherjs();
        }else if("fromaddnewaddress"==addrefromtype){
            toaddbackfromotherjs();
        }
    }
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
        if(addrecanchosup){
            getmorenaddresslist(morenorgCode);
        }
    }
}



function provinceCallback(name,value,isNew){
    $("#regionCode"+addrenowshow).val(value);
    $("#"+addrenowshow+"val").val(value);
    $("#"+addrenowshow+"Name").val(name);
    $("#province"+addrenowshow).attr("style", "color:#000");
    resSelect(1);
    if(addtype=="xiejing"){
        getaddresslist('cityId'+addrenowshow+'','2',value);
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }else if(addtype=="grid"){
        findgridList("cityId"+addrenowshow+"",value,'cityCode'+addrenowshow+'','city'+addrenowshow+'');
    }else{
        getaddresslist('cityId'+addrenowshow+'','2',value);
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }

}

function cityCallback(name,value,isNew){
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
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }else if(addtype=="grid"){
        findgridList("countyId"+addrenowshow+"",value,'countyCode'+addrenowshow+'','county'+addrenowshow+'');
    }else{
        getaddresslist('countyId'+addrenowshow+'','3',value);
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }

}

function countyCallback(name,value,isNew){
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
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }else if(addtype=="grid"){
        findgridList("streetId"+addrenowshow+"",value,'streetCode'+addrenowshow+'','street'+addrenowshow+'');
    }else{
        getaddresslist('streetId'+addrenowshow+'','4',value);
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }
}

function streetCallback(name,value,isNew){
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
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }else if(addtype=="grid"){
        findgridList("communityId"+addrenowshow+"",value,'communityCode'+addrenowshow+'','community'+addrenowshow+'');
    }else{
        getaddresslist('communityId'+addrenowshow+'','5',value);
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }

}

function communityCallback(name,value,isNew){
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
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }else if(addtype=="grid"){
        findgridList("lastgridId"+addrenowshow+"",value,'lastgridCode'+addrenowshow+'','lastgrid'+addrenowshow+'');
    }else{
        getaddresslist('lastgridId'+addrenowshow+'','6',value);
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
            addressserachList(1,addreCallbackall);
        }
    }

}

function lastgridCallback(name,value,isNew){
    $("#lastgridCode"+addrenowshow).val(value);
    $("#lastgrid"+addrenowshow).attr("style", "color:#000");
    if(addtype=="xiejing"){
        name=$("#province"+addrenowshow).text()+$("#city"+addrenowshow).text()+$("#county"+addrenowshow).text()+$("#street"+addrenowshow).text()+$("#community"+addrenowshow).text()+name;
    }
    $("#"+addrenowshow+"val").val(value);
    $("#"+addrenowshow+"Name").val(name);
    if(addtype!="grid"){
        if(showserchaddbiaoz=="open"&&(isEmpty(isNew)||isNew!="0")){
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
                        var isNew = "0";
                        if(nowcode==morenpcd){
                            isNew="1";
                        }
                        tosetmorlies(level,name,divisionCod,isNew);
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
function tosetmorlies(level,name,divisionCod,isNew){
    switch(level)
    {
        case 1:
            $("#provinceCode"+addrenowshow).val(divisionCod);
            $("#province"+addrenowshow).text(name);
            if(addrecanchosup){
                $("#orgid1"+addrenowshow).attr("href","javascript:void(0);");
                $("#orgid1"+addrenowshow).attr("onclick","");
                $("#orgimg1"+addrenowshow).removeClass("right-icon");
            }
            provinceCallback(name,divisionCod,isNew);
            break;
        case 2:
            $("#cityCode"+addrenowshow).val(divisionCod);
            $("#city"+addrenowshow).text(name);
            if(addrecanchosup){
                $("#orgid2"+addrenowshow).attr("href","javascript:void(0);");
                $("#orgid2"+addrenowshow).attr("onclick","");
                $("#orgimg2"+addrenowshow).removeClass("right-icon");
            }
            cityCallback(name,divisionCod,isNew);
            break;
        case 3:
            $("#countyCode"+addrenowshow).val(divisionCod);
            $("#county"+addrenowshow).text(name);
            if(addrecanchosup){
                $("#orgid3"+addrenowshow).attr("href","javascript:void(0);");
                $("#orgid3"+addrenowshow).attr("onclick","");
                $("#orgimg3"+addrenowshow).removeClass("right-icon");
            }
            countyCallback(name,divisionCod,isNew);
            break;
        case 4:
            $("#streetCode"+addrenowshow).val(divisionCod);
            $("#street"+addrenowshow).text(name);
            if(addrecanchosup){
                $("#orgid4"+addrenowshow).attr("href","javascript:void(0);");
                $("#orgid4"+addrenowshow).attr("onclick","");
                $("#orgimg4"+addrenowshow).removeClass("right-icon");
            }
            streetCallback(name,divisionCod,isNew);
            break;
        case 5:
            $("#communityCode"+addrenowshow).val(divisionCod);
            $("#community"+addrenowshow).text(name);
            if(addrecanchosup){
                $("#orgid5"+addrenowshow).attr("href","javascript:void(0);");
                $("#orgid5"+addrenowshow).attr("onclick","");
                $("#orgimg5"+addrenowshow).removeClass("right-icon");
            }
            communityCallback(name,divisionCod,isNew);
            break;
        case 6:
            $("#lastgridCode"+addrenowshow).val(divisionCod);
            $("#lastgrid"+addrenowshow).text(name);
            if(addrecanchosup){
                $("#orgid6"+addrenowshow).attr("href","javascript:void(0);");
                $("#orgid6"+addrenowshow).attr("onclick","");
                $("#orgimg6"+addrenowshow).removeClass("right-icon");
            }
            lastgridCallback(name,divisionCod,isNew);
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
//	        $.each(data.data.address, function(i, item) {
            var item = data.data.address;
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
//	        });
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
    onPageFinishedJS();
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
            '<a onclick="newWindow('+truefun+','+id+')" class="btn-bg btn-blue">确认</a>');
    }
    document.body.style.overflow = 'hidden';
    window.addEventListener('touchmove', _preventDefault);

}

function _preventDefault(e) { e.preventDefault(); }
function newWindow(tyepwind,id){
    nowbrowserRefreshtype=browserRefreshType;
    onPageFinishedJS();
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
var nowchosedictId=null;
//通用的字典选择方法
function selectDict(pathurl,optionsId,hid,sid,dictCallback,newgotochose){//pathurl:上下文路径   optionsId：存放字典option的options所对应的ID  hid:隐藏域参数        sid:显示参数  callback 回调
    callback = dictCallback;
    hideId=hid;
    showId=sid;
    path=pathurl;
    nowchoseDictId={usedictId:newgotochose};
    isMore=false;
    showWindow(optionsId,newgotochose);//弹框  参数：1:表示从顶部开始  空或其他表示偏中间位置显示
}
//通用的字典多选
function selectDicts(pathurl,optionsId,hid,sid,dictCallback,newgotochose){//pathurl:上下文路径   optionsId：存放字典option的options所对应的ID  hid:隐藏域参数        sid:显示参数  callback 回调
    callback = dictCallback;
    hideId=hid;
    showId=sid;
    path=pathurl;
    nowchoseDictId={usedictId:newgotochose};
    isMore=true;
    showWindow(optionsId,newgotochose);
}
var nowbrowserRefreshtype=false;
//显示半屏弹框
function showWindow(optionsId, newgotochose) {
    nowbrowserRefreshtype = false;
    onPageFinishedJS(false);
    if (lastOptionsId == optionsId && isEmpty(newgotochose)) { //optionsId不变，不需要重新初始化窗口
        if ($("#" + hideId).val() == null || $("#" + hideId).val() == '' || $("#" + hideId).val() == undefined) {
            $(".list_ul li").removeClass("curr_sel");
        } else {
            //回填值
            var vals = $("#" + hideId).val();
            var v = vals.split(",");
            for (var i in v) {
                $("li[val='" + v[i] + "']").addClass("curr_sel");
            }
        }

        $("#dictWin").show();
    } else {
        //设置弹框
        $("#dictWin").remove();

        //居中选项弹窗
        if (!isMore) {
            $("body").append('<div class="fixed-container" style="display:none;" id="dictWin"><div class="fixed-bg"></div><div class="fixed-data-3"><h3 class="pop-list-tit">请选择</h3><ul class="pop-list-ul list_ul"></ul><a href="javascript:void(0);" onclick="winHide();" class="pop-close"></a></div></div>');
        } else {
            $("body").append('<div class="fixed-container" style="display:none;" id="dictWin"><div class="fixed-bg"></div><div class="fixed-data-3"><h3 class="pop-list-tit">请选择</h3><ul class="pop-list-ul list_ul"></ul><h3 class="pop-list-btn sure"><a href="javascript:void(0);" onclick="moreSure();">确定</a></h3><a href="javascript:void(0);" onclick="winHide();" class="pop-close"></a></div></div>');
        }
        setDictLi(optionsId);
        //回填值
        var vals = $("#" + hideId).val();
        if (vals != undefined) {
            var v = vals.split(",");
            for (var i in v) {
                $("li[val='" + v[i] + "']").addClass("curr_sel");
            }
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
    onPageFinishedJS();
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
        new func("","",nowchoseDictId);
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
    onPageFinishedJS();
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
            new func(name,value,nowchoseDictId);
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
    onPageFinishedJS();
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
        new func(names.join(";"),vals.join(","),nowchoseDictId);
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
function browserRefreshforWin(enabled){
    browserRefreshType=enabled;
    nowbrowserRefreshtype=browserRefreshType;
    onPageFinishedJS();
}
//返回键设置为关闭浏览器
var shutdownwinType=false;
function shutDownWin(enabled){
    shutdownwinType=enabled;
    onPageFinishedJS();
}
//app加载完成后自动调用该方法(旧)
function browserRefresh(){
    onPageFinishedJS();
}
//设置横屏
var landscapeType=false;
var landscapeBack="";
var landscapeCss='';
function landscapeWin(enabled,back){
    landscapeType=enabled;
    landscapeBack=back;
    onPageFinishedJS();
}
//app加载完成后自动调用该方法
function onPageFinished(){
    onPageFinishedJS();
    onPageFinishedWeb();
}

function onPageFinishedJS(){
    setupWebViewJavascriptBridge(function(bridge) {
        bridge.callHandler('setRefreshEnabled',{
            'enabled':nowbrowserRefreshtype},function(data) {});
    });
    setupWebViewJavascriptBridge(function (bridge) {
        bridge.callHandler('setBackButton', {
            'isListenerBack': shutdownwinType
        }, function (data) {
            setupWebViewJavascriptBridge(function (bridge) {
                bridge.callHandler('quit');
            });
        });
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
function onPageFinishedWeb(){

}
function getbrowserupdownYN(){
    setupWebViewJavascriptBridge(function(bridge) {
        bridge.callHandler('getRefreshEnabled',{
            'enabled':type},function(data) {return data;});
    });
}


/*
根据〖中华人民共和国国家标准 GB 11643-1999〗中有关公民身份号码的规定，公民身份号码是特征组合码，由十七位数字本体码和一位数字校验码组成。排列顺序从左至右依次为：六位数字地址码，八位数字出生日期码，三位数字顺序码和一位数字校验码。
    地址码表示编码对象常住户口所在县(市、旗、区)的行政区划代码。
    出生日期码表示编码对象出生的年、月、日，其中年份用四位数字表示，年、月、日之间不用分隔符。
    顺序码表示同一地址码所标识的区域范围内，对同年、月、日出生的人员编定的顺序号。顺序码的奇数分给男性，偶数分给女性。
    校验码是根据前面十七位数字码，按照ISO 7064:1983.MOD 11-2校验码计算出来的检验码。

出生日期计算方法。
    15位的身份证编码首先把出生年扩展为4位，简单的就是增加一个19或18,这样就包含了所有1800-1999年出生的人;
    2000年后出生的肯定都是18位的了没有这个烦恼，至于1800年前出生的,那啥那时应该还没身份证号这个东东，⊙﹏⊙b汗...
下面是正则表达式:
 出生日期1800-2099  (18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])
 身份证正则表达式 /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i
 15位校验规则 6位地址编码+6位出生日期+3位顺序号
 18位校验规则 6位地址编码+8位出生日期+3位顺序号+1位校验位

 校验位规则     公式:∑(ai×Wi)(mod 11)……………………………………(1)
                公式(1)中：
                i----表示号码字符从由至左包括校验码在内的位置序号；
                ai----表示第i位置上的号码字符值；
                Wi----示第i位置上的加权因子，其数值依据公式Wi=2^(n-1）(mod 11)计算得出。
                i 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
                Wi 7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2 1

*/
//身份证号合法性验证
//支持15位和18位身份证号
//支持地址编码、出生日期、校验位验证

/**
 * checkIdCard
 * 1、card
 */
function IdentityCodeValid(card) {
    var vcity = {
        11 : "北京",
        12 : "天津",
        13 : "河北",
        14 : "山西",
        15 : "内蒙古",
        21 : "辽宁",
        22 : "吉林",
        23 : "黑龙江",
        31 : "上海",
        32 : "江苏",
        33 : "浙江",
        34 : "安徽",
        35 : "福建",
        36 : "江西",
        37 : "山东",
        41 : "河南",
        42 : "湖北",
        43 : "湖南",
        44 : "广东",
        45 : "广西",
        46 : "海南",
        50 : "重庆",
        51 : "四川",
        52 : "贵州",
        53 : "云南",
        54 : "西藏",
        61 : "陕西",
        62 : "甘肃",
        63 : "青海",
        64 : "宁夏",
        65 : "新疆",
        71 : "台湾",
        81 : "香港",
        82 : "澳门",
        91 : "国外"
    };
    checkCard = function(card) {
        // 是否为空
        if (card === '') {
            return false;
            // return '* 请输入证件号码，证件号码不能为空';
        }
        // 校验长度，类型
        if (isCardNo(card) === false) {
            return false;
            // return '* 您输入的证件号码不正确，请重新输入';
        }
        // 检查省份
        if (checkProvince(card) === false) {
            return false;
            // return '* 您输入的证件号码不正确,请重新输入';
        }
        // 校验生日
        if (checkBirthday(card) === false) {
            return false;
            // return '* 您输入的证件号码生日不正确,请重新输入';
        }
        // 检验位的检测
        //if (checkParity(card) === false) {
        // return false;
        // return '* 您的证件号码校验位不正确,请重新输入';
        //}
        return true;
    };
    // 检查号码是否符合规范，包括长度，类型校验长度合法后判定人口性别
    isCardNo = function(card) {
        // 证件号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
        var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
        if (reg.test(card) === false) {
            return false;
        }
        return true;
    };
    // 取证件号码前两位,校验省份
    checkProvince = function(card) {
        var province = card.substr(0, 2);
        if (vcity[province] == undefined) {
            return false;
        }
        return true;
    };
    // 检查生日是否正确
    checkBirthday = function(card) {
        var len = card.length;
        // 证件号码15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
        if (len == '15') {
            var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
            var arr_data = card.match(re_fifteen);
            var year = arr_data[2];
            var month = arr_data[3];
            var day = arr_data[4];
            var birthday = new Date('19' + year + '/' + month + '/' + day);
            return verifyBirthday('19' + year, month, day, birthday);
        }
        // 证件号码18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
        if (len == '18') {
            var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
            var arr_data = card.match(re_eighteen);
            var year = arr_data[2];
            var month = arr_data[3];
            var day = arr_data[4];
            var birthday = new Date(year + '/' + month + '/' + day);
            return verifyBirthday(year, month, day, birthday);
        }
        return false;
    };
    // 校验日期
    verifyBirthday = function(year, month, day, birthday) {
        var now = new Date();
        var now_year = now.getFullYear();
        // 年月日是否合理
        if (birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day) {
            // 判断年份的范围（0岁到200岁之间)
            var time = now_year - year;
            if (time >= 0 && time <= 200) {
                return true;
            }
            return false;
        }
        return false;
    };
    // 校验位的检测
    checkParity = function(card) {
        // 15位转18位
        card = changeFivteenToEighteen(card);
        var len = card.length;
        if (len == '18') {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var cardTemp = 0,
                i, valnum;
            for (i = 0; i < 17; i++) {
                cardTemp += card.substr(i, 1) * arrInt[i];
            }
            valnum = arrCh[cardTemp % 11];
            if (valnum == card.substr(17, 1)) {
                return true;
            }
            return false;
        }
        return false;
    };
    // 15位转18位证件号码
    changeFivteenToEighteen = function(card) {
        if (card.length == '15') {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var cardTemp = 0,
                i;
            card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
            for (i = 0; i < 17; i++) {
                cardTemp += card.substr(i, 1) * arrInt[i];
            }
            card += arrCh[cardTemp % 11];
            return card;
        }
        return card;
    };
    return checkCard(card);
}

/*********************************************通用的字典 结束******************************************************/

/***
 * 2020年9月22日 转成 2020-09-22
 * @param str
 * @returns {string}
 */
function changeBirthFormat(str){
    //年
    var yearRegex = "\\d*(?=年)";
    var year = str.match(yearRegex)!=null?str.match(yearRegex)[0]:'';
    //月
    var  monthRegex = "\\d*(?=月)";
    var month = str.match(monthRegex)!=null?str.match(monthRegex)[0]:'';
    if (month.length==1){
        month = "0"+month;
    }
    //日
    var dayRegex = "\\d*(?=日)";
    var day = str.match(dayRegex)!=null?str.match(dayRegex)[0]:'';
    if (day.length==1){
        day = "0"+day;
    }
    return  year+"-"+month+"-"+day;
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
