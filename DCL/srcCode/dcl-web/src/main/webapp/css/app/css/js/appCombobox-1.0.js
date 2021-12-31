/**
 * 多js公用一个Object对象
 */
if (typeof (AppApi) == "undefined") {
    var AppApi = {};
}
$.expr[":"].searchableSelectContains = $.expr.createPseudo(function(arg) {
    return function( elem ) {
        return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
    };
});
var uiDomain;

var cboxHtml = $('<div class="cbox" id="cBoBox" style="position: fixed;width: 100%;top: 10%;z-index:15"></div>');
var popBoxHtml = $('<div id="pop_box" class="pop_box" style="display:none;"></div>');
var popBgHtml = $('<div id="pop_bg" class="pop_bg" style="z-index:3"></div>');
var showComboHtml = $('<div class="pop_mid_wrap" style="z-index:4" id="showCombo"></div>');
var searchInputHtml = $('<div id="searchInput"></div>')
var appComBoxHtml = $('<div id="appCombox"></div>');
var sureButtonHtml = $('<div id="sureButDiv" style="display: none"></div>');
var treeDiv =$('<div class="pop_slided_ul" id="treeDiv" style="max-height:400px;"></div>');

showComboHtml.append(searchInputHtml);
showComboHtml.append(appComBoxHtml);
showComboHtml.append(sureButtonHtml);
popBoxHtml.append(popBgHtml);
popBoxHtml.append(showComboHtml);
cboxHtml.append(popBoxHtml);

/**
 * 树形字典下拉框
 *
 * @param tId1 : [必选]回填name值的文本框id
 * @param tId2 : [可选]回填value值的文本框id
 * @param pCode : [必选]字典pCode值
 * * 数据结构：  // 字符串代表整个节点过滤掉
 var pCode =[{name: "测试01",	value: "1"},{	name: "测试010101",value: "111"}],
 {name: "测试02",	value: "2"}]];
 * @param callBackSelectedEvent : [可选]选中节点的回调事件
 * @param selectNodes : [可选]默认选中value相等的节点
 * @param options : [可选]用于修改默认参数值
 * @returns : 下拉框组件对象
 */
AppApi.initTreeComboBox = function(tId1, tId2, pCode, callBackSelectedEvent, selectNodes, options) {

    if ($('#cBoBox').length == 0) {
        $('body').after(cboxHtml);//添加居中显示div
    };
    //绑定点击事件

    var defaults = {
        multi:false,//是否允许多选
        isSearch:false,//是否允许搜索
        theme:'',
        // uiDomain:'', //公共样式域名.
        domain:'',//请求domain
        url:"/wap/BaseDictionaryController/getDataDictTreeForJsonp.json?dictPcode=" + pCode + "&jsoncallback=?",
    };
    // console.log(getAppComBasePath());
    var options = $.extend(defaults, options);
    if(!uiDomain && uiDomain!=''){
        uiDomain = getAppComBasePath();
    }
    //加载样式
    setStyleSheet(uiDomain);

    //绑定点击事件
    $('#'+tId1).click(function () {
        changeTheme(options.theme);
        treeCallback = callBackSelectedEvent;
        if (pCode != null && typeof pCode == "object") {
            showButDiv(false);
            setDivH3(false);
            setTreeComboxLi(pCode,tId1,tId2,selectNodes);
            showPopBox();
        } else if (pCode != null && typeof pCode == "string") {
            $.ajax({
                type : "POST",
                async:false,
                url : options.domain + options.url,
                contentType : "application/json; charset=utf-8",
                dataType : "jsonp",
                success : function(data) {
                    var tree = listToTree(data,pCode);//调用函数，传入要转换的list数组，和树中顶级元素的pid
                    showButDiv(false);
                    setDivH3(false);
                    setTreeComboxLi(tree,tId1,tId2,selectNodes)
                    showPopBox();
                }
            });
        }
    })
}

/**
 * 非树形字典下拉框
 *
 * @param tId1 : [必选]回填name值的文本框id
 * @param tId2 : [可选]回填value值的文本框id
 * @param pCode : [必选]字典pCode值
 * * 数据结构：  // 字符串代表整个节点过滤掉
 var pCode =[{name: "测试01",	value: "1",	children: [{name: "测试0101",value: "11",children: [{	name: "测试010101",value: "111"}]	}]},
 {name: "测试02",	value: "2"}]];
 * @param callBackSelectedEvent : [可选]选中节点的回调事件
 * @param selectNodes : [可选]默认选中value相等的节点
 * @param options : [可选]用于修改默认参数值
 * @returns : 下拉框组件对象
 */
AppApi.initListComboBox = function(tId1, tId2, pCode, callBackSelectedEvent,selectNodes, options) {
    if ($('#cBoBox').length == 0) {
        $('body').after(cboxHtml);//添加居中显示div
    };
    //绑定点击事件
    var defaults = {
        multi:false,//是否允许多选
        isSearch:false,//是否允许搜索
        theme:'',
        // uiDomain:'', //公共样式域名
        domain:'',//请求domain
        url:"/wap/BaseDictionaryController/getDataDictTreeForJsonp.json?dictPcode=" + pCode + "&jsoncallback=?",
    };
    var options = $.extend(defaults, options);
    if(!uiDomain && uiDomain!=''){
        uiDomain = getAppComBasePath();
    }


    //加载样式
    setStyleSheet(uiDomain);

    $('#'+tId1).click(function () {
        changeTheme(options.theme);
        if (pCode != null && typeof pCode == "object") {
            options.url = "";
            showButDiv(options.multi);//多选展示按钮
            if(options.multi){
                //多选填充
                setChboxLi(pCode,tId1,tId2,selectNodes,callBackSelectedEvent);
            }else{
                //单选填充
                setLi(pCode,tId1,tId2,selectNodes,callBackSelectedEvent)
            }
            setDivH3(options.isSearch);
            showPopBox();
        } else if (pCode != null && typeof pCode == "string") {
            $.ajax({
                type : "POST",
                async:false,
                url : options.domain + options.url,
                contentType : "application/json; charset=utf-8",
                dataType : "jsonp",
                success : function(data) {
                    showButDiv(options.multi);
                    if(options.multi){
                        setChboxLi(data,tId1,tId2,selectNodes,callBackSelectedEvent);
                    }else{
                        setLi(data,tId1,tId2,selectNodes,callBackSelectedEvent)
                    }
                    setDivH3(options.isSearch);
                    showPopBox();
                }
            });
        }
    })
}

//li 添加点击事件
function setLi(data,id1,id2,selectNodes,callBackSelectedEvent){
    var showId = 'show'+id2;
    var htmlUlstr = '<ul class="list_ul" id="'+showId+'" >';
    var id2Val = $("#"+id2).val();
    if(id2Val){
        selectNodes = id2Val;
    }
    for(var i = 0;i < data.length ; i++ ){
        var value = data[i].value;
        var name = data[i].name;
        if(selectNodes == value){
            htmlUlstr += '<li class="appLi curr_sel" data-data=\''+JSON.stringify(data[i])+'\'>'+name+'</li>';
        }else{
            htmlUlstr += '<li class="appLi" data-data=\''+JSON.stringify(data[i])+'\'>'+name+'</li>';
        }
    }
    htmlUlstr += '</ul>';
    $('#appCombox').html(htmlUlstr);
    $(".curr_sel").css('background','url(' + uiDomain + '/app-assets/extend/AppComboBox/img/icon_tick.png) right center no-repeat');
    $(".curr_sel").css('background-size','14px');


    $("ul#"+showId).on("click","li",function(){
        $("ul#"+showId +" li").removeClass("curr_sel");
        $(this).addClass("curr_sel");
        $("#pop_box").css("display","none");
        var selData = $(this).data("data");
        $("#"+id1).val(selData.name);
        $("#"+id2).val(selData.value);
        if(callBackSelectedEvent && typeof callBackSelectedEvent != 'undefined' && callBackSelectedEvent != undefined){
            var  func= eval(callBackSelectedEvent);
            new func(selData);
        }
        $('#appCombox').html('');
    });
}

//填充 多选li 添加点击事件
function setChboxLi(data,id1,id2,selectNodes,callBackSelectedEvent) {
    var closePopBoxHtml = $('<a href="javascript:void(0)" id="save' + id2 + '" class="sure-btn">确定</a>');
    sureButtonHtml.html(closePopBoxHtml);
    var showId = 'show' + id2;
    var htmlUlstr = '<ul class="list_ul" id="' + showId + '" >';
    var id2Val = $("#" + id2).val();
    if (id2Val) {
        selectNodes = id2Val;
    }
    for (var i = 0; i < data.length; i++) {
        var name = data[i].name;
        var value = data[i].value;
        if (selectNodes && selectNodes.indexOf(value)>-1 ) {
            htmlUlstr += '<li class="appLi curr_sel" data-data=\''+JSON.stringify(data[i])+'\'>' + name + '</li>';
        } else {
            htmlUlstr += '<li class="appLi" data-data=\''+JSON.stringify(data[i])+'\'>' + name + '</li>';
        }
    }

    htmlUlstr += '</ul>';
    $('#appCombox').html(htmlUlstr);
    setSelectClass(uiDomain)

    $("ul#" + showId).on("click", "li", function () {
        if ($(this).attr("class").indexOf('curr_sel') > -1) {
            $(this).removeClass("curr_sel")
            cancelSelectClass($(this));
        } else {
            $(this).addClass("curr_sel")
            setSelectClass(uiDomain)
        }
    });
    $("#save" + id2).click(function () {
        var liArray = $("#" + showId + " .curr_sel");
        var CNs = [];
        var values = [];
        var data=[];
        $.each(liArray, function (idx, elem) {
            var selData = JSON.parse(elem.dataset.data);
            CNs.push(selData.name);
            values.push(selData.value);
            data.push(selData);
        });


        $("#" + id1).val(CNs.join(','));
        $("#" + id2).val(values.join(','));
        if(callBackSelectedEvent && typeof callBackSelectedEvent != 'undefined' && callBackSelectedEvent != undefined){
            var  func= eval(callBackSelectedEvent);
            new func(data);
        }
        $("#pop_box").css("display","none");
        $('#appCombox').html('');

    })
}

//填充 树形下拉框 添加点击事件
function setTreeComboxLi(data,id1,id2,selectNodes) {
    var treeUl= $('<div class="tree-ul-div"></div>');
    var id2Val = $("#" + id2).val();
    if (id2Val) {
        selectNodes = id2Val;
    }
    treeUl.append(creatSelectTree(data,id1,id2,selectNodes));
    $('#appCombox').html(treeUl);
    setSelectClass(uiDomain)

    //展开节点选中的
    openDiv("appCombox");
}

//设置搜索框
function setDivH3(isTrue) {
    var searchInputHtml =  $('<h3 class="list_tit">请选择</h3>\n');
    if(isTrue){
        searchInputHtml = $('<div  class="list_tit"><input type="text" name="searchName" onkeyup="_onblur(value)" id="searchName"  placeholder="搜索" maxlength="20"></div></h3>')
    }
    $('#searchInput').html(searchInputHtml);
}

//显示中心div
function showPopBox(){
    $("#pop_box").css("display","block");
    $("#closePopBox").click(function(){
        $("#pop_box").css("display","none");
        $('#appCombox').html('');
    });
    $("#pop_bg").click(function(){
        $("#pop_box").css("display","none");
    })
}

//搜索框keyUp触发
function _onblur(event){
    $('.appLi').addClass('appLi-hide');
    $('.appLi:searchableSelectContains('+event+')').removeClass('appLi-hide');
}

//显示按钮div 多选显示
function showButDiv(flg) {
    if(flg)
        $("#sureButDiv").show();
    else
        $("#sureButDiv").hide();
}

//list 转成树形json
function listToTree(list,pCode) {
    var ret = [];//一个存放结果的临时数组
    for(var i in list) {
        if(list[i].dictPcode == pCode) {//如果当前项的父id等于要查找的父id，进行递归
            list[i].children = listToTree(list, list[i].dictCode);
            ret.push(list[i]);//把当前项保存到临时数组中
        }
    }
    return ret;//递归结束后返回结果
}

var treeCallback;  //树回调  （name,value）
//生成树节点（递归）
function creatSelectTree(data,id1,id2,selectNodes){
    var treeUl= $('<div></div>');
    for(var i=0;i<data.length;i++) {
        var value = data[i].value;
        var name = data[i].name;
        // var dictCode = data[i].dictCode;
        var dictCodeDic = 'id'+value;
        var liDiv = $('<div id="'+value+'" class="tree-li-div"></div>')
        var dictDiv = $('<div id="div'+value+'"></div>')
        var impHtml = $('<img id="'+value+'img" alt="" src="'+uiDomain+'/app-assets/extend/AppComboBox/img/tree_arr3.png" onclick="getNode(\''+value+'\',\''+dictCodeDic+'\')" >');
        var aHtml = $('<a class="tree-a" href="javascript:selectedLi('+JSON.stringify(data[i]).replace(/\"/g,"'")+',\''+id1+'\',\''+id2+'\')"> '+name+'</a>');

        var dictDivHtml = $('<div id="'+dictCodeDic+'" style="display:none;border:0;margin: 0px 0px 0px 20px"></div>');
        if(value == selectNodes){
            dictDiv.addClass('curr_sel')
        }
        if(data[i].children && data[i].children.length) {//如果有子集
            dictDiv.append(impHtml);
            dictDiv.append(aHtml);
            liDiv.append(dictDiv);
            liDiv.append(dictDivHtml);
            dictDivHtml.append(creatSelectTree(data[i].children,id1,id2,selectNodes));
        }else{
            dictDiv.append(aHtml);
            liDiv.append(dictDiv);
        }
        treeUl.append(liDiv);
    }
    return treeUl;
}

//树形选中
function selectedLi(dataJs,id1,id2) {
    // var selDate = JSON.parse(dataJs);
    $("#pop_box").css("display","none");
    $("#"+id1).val(dataJs.name);
    $("#"+id2).val(dataJs.value);
    if(treeCallback && typeof treeCallback != 'undefined' && treeCallback != undefined){
        var  func=eval(treeCallback);
        new func(dataJs);
    }
    $('#appCombox').html('');
}

//显示OR隐藏节点图标
function getNode(id,divId){
    if($("#"+id+"img").attr('src')== uiDomain+"/app-assets/extend/AppComboBox/img/tree_arr4.png"){
        $("#"+id+"img").attr('src',uiDomain+"/app-assets/extend/AppComboBox/img/tree_arr3.png");
        $("#"+divId).hide();
    }else{
        if($("#"+divId).is(":hidden")){
            $("#"+id+"img").attr('src',uiDomain+"/app-assets/extend/AppComboBox/img/tree_arr4.png");
            $("#"+divId).show();    //如果元素为隐藏,则将它显现
        }
    }
}

//展开选中的节点
function openDiv(divHtml) {
    var currDiv = $("#"+divHtml+" .curr_sel");
    changeAndShowImg(currDiv);
}

//修改展开节点的图片
function changeAndShowImg(div) {
    var needShowParentDiv = div.parent().parent().parent();
    if(needShowParentDiv.length){
        needShowParentDiv.show();
        var parendId = div.parent().parent().parent().parent().attr("id");
        var imgId = parendId +'img';
        $('#'+imgId).attr('src',uiDomain+"/app-assets/extend/AppComboBox/img/tree_arr4.png");
        changeAndShowImg($('#div'+parendId));
    }
}

/**
 * 加载CSS样式
 */
function setStyleSheet(uiDomin){
    // 找到head
    var doc_head = document.head;
    // 找到所有的link标签
    var link_list = document.getElementsByTagName("link");
    if ( link_list ){
        for ( var i=0;i<link_list.length;i++ ){
            // 找到我们需要替换的link
            if ( link_list[i].getAttribute("ty") === "appBoboxTheme" ){
               return;
            }
        }
    }
    // 创建一个新link标签
    var link_style = document.createElement("link");
    // 对link标签中的属性赋值
    link_style.setAttribute("rel","stylesheet");
    link_style.setAttribute("type","text/css");
    link_style.setAttribute("href",uiDomin+"/app-assets/extend/AppComboBox/css/appComboBox.css?t=2018092002");
    link_style.setAttribute("ty","appBoboxTheme");
    // 加载到head中最后的位置
    doc_head.appendChild(link_style);
};

//修改主题色
function changeTheme(theme) {
    if(theme){
        $("#cBoBox").removeClass().addClass("cbox-"+theme);
    }else{
        $("#cBoBox").removeClass().addClass("cbox");
    }
}

//设置选中图片样式
function setSelectClass(uiDomain){
    $(".curr_sel").css('background','url(' + uiDomain + '/app-assets/extend/AppComboBox/img/icon_tick.png) right center no-repeat');
    $(".curr_sel").css('background-size','14px');
}

//取消选中图片样式
function cancelSelectClass(element){
    element.css('background','');
    // $(".curr_sel").css('background-size','14px');
}

//获取js 路径
function getAppComBasePath(){
    var scripts = document.getElementsByTagName('script'), i, ln, path, scriptSrc, match;
    for (i = 0, ln = scripts.length; i < ln; i++) {
        scriptSrc = scripts[i].src;
        match = scriptSrc.match('\/app-assets\/extend\/AppComboBox\/js\/appCombobox-1.0\.js');
        if (match) {
            path = scriptSrc.substring(0, scriptSrc.indexOf('app-assets'));
            break;
        }
    }
    return path;

}