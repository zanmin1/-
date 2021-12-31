/**
	参数：resourcesId（资源id）  markerType（标识code）  gridId（网格id）
	数据保存将由接口里面的保存功能直接保存到数据库
*/
function markResInMap(resourcesId,markerType,gridId) {
	var url = "";
	var mapEngineType = "";
	var ZHSQ_EVENT_URL = "";
	$.ajax({
		type: "POST",
		url: jsBasePath+'/zzgl/map/gis/getMapEngineInfo.json',
		dataType:"json",
		async:false,
		success: function(data){
			mapEngineType = data.mapEngineType;
			ZHSQ_EVENT_URL = data.ZHSQ_EVENT_URL;
		},
		error:function(data){
			$.messager.alert('错误','无法获取地图引擎！','error');
		}
	});
	if('005' == mapEngineType) {
		url = ZHSQ_EVENT_URL+'/zhsq/map/arcgis/arcgis/toMapArcgisOfAnchorPointForSave.jhtml?resourcesId='+resourcesId+'&markerType='+markerType+'&catalog=02';
	}else {
		url = jsBasePath+"/zzgl/res/marker/config.jhtml?gridId="+gridId+"&resourcesId="+resourcesId+"&markerType="+markerType;
	}
	showMaxJqueryWindowForCross("资源点位标注", url);
}

/**

参数：gridId 网格Id,callBackUrl 跨域回传地图数据的接收页面,x，y标注点,mapt地图类型
如果是新增页面或者之前没有标注的不存在x，y，mapt ，可以不传递这三个参数
地图标注数据需要在业务中进行保存，接口只是提供经纬度获取以及对应的地图类型

*/
function initMapMarkerInfoSelector(gridId,callBackUrl,x,y,mapt,width,height,isEdit,mapType,parameterJsonStr,modularCode){
	if(isEdit == undefined || isEdit == null) {
		isEdit = true;
	}
	if(mapType == undefined || mapType == null) {
		mapType = "";
	}
	var mapEngineType = "";
	var ZHSQ_EVENT_URL = "";
	var ZHSQ_ZZGRID_URL = "";
	var markerType = "";
	var FACTOR_STATION = "";
	var FACTOR_URL = "";
	var FACTOR_SERVICE = "";
	
	$.ajax({
		type: "POST",
		url: jsBasePath+'/zzgl/map/gis/getMapEngineInfo.json?mapType='+mapType+'&modularCode='+modularCode+'&t='+Math.random(),
		dataType:"json",
		async:false,
		success: function(data){
			mapEngineType = data.mapEngineType;
			ZHSQ_EVENT_URL = data.ZHSQ_EVENT_URL;
			ZHSQ_ZZGRID_URL = data.ZHSQ_ZZGRID_URL;
			mapType = data.mapType;
			markerType = data.markerType
			FACTOR_STATION = data.FACTOR_STATION
			FACTOR_URL = data.FACTOR_URL
			FACTOR_SERVICE = data.FACTOR_SERVICE
			
		},
		error:function(data){
			$.messager.alert('错误','无法获取地图引擎！','error');
		}
	});
	
	var data;
	var url;
	if(x!=undefined && x!='' && y!=undefined && y!='' && mapt!=undefined && mapt!=''){
		data = 'x='+x+'&y='+y+'&mapt='+mapt+'&gridId='+gridId+'&isEdit='+isEdit+'&mapType='+mapType+'&callBackUrl='+callBackUrl;
	}else {
		data = 'gridId='+gridId+'&isEdit='+isEdit+'&mapType='+mapType+'&callBackUrl='+callBackUrl;
	}
	// 天地图
	if('005' == mapEngineType){//新地图链接
		if(FACTOR_STATION == "1") {
			var id = parameterJson.id;//$("#id").val();
			if(id == undefined || id == "") {
				$.messager.alert('错误', '无法获取地图标注相关数据！', 'error');
				return;
			}else {
				var parameterJsonStr = JSON.stringify(parameterJson);
				data = "id=" + id + "&parameterJsonStr="+encodeURI(parameterJsonStr)+"&FACTOR_URL="+FACTOR_URL+"&FACTOR_SERVICE="+FACTOR_SERVICE+"&markerType="+markerType+"&"+data;
				url = ZHSQ_EVENT_URL + '/zhsq/map/arcgis/arcgisFactor/toFactorPointTagCommon.jhtml?' + data;
			}
		} else {
			url = ZHSQ_EVENT_URL + '/zhsq/map/arcgis/arcgis/outPlatCrossDomain.jhtml?' + data;
		}
	}else{ 
		url = ZHSQ_ZZGRID_URL+'/zzgl/map/gis/popMapMarkerSelectorCrossDomainNew.jhtml?' + data;
	}
	showMaxJqueryWindowForCross("地理位置", url,width,height);
	
}

/**
 * 地图标注改造
 * @param gridId
 * @param callBackUrl
 * @param width
 * @param height
 * @param isEdit
 * @param mapType
 */
function showMapWindow(gridId, callBackUrl, width, height, isEdit, mapType,parameterJson,modularCode, isGetXIEJINGAddress) {
	var childIframeContents = $("#CustomJqueryWindow").find("iframe").contents();
	if(childIframeContents.find("#x").val() == undefined) {
		try{
			childIframeContents = $("#MaxJqueryWindow").find("iframe").contents();
		}catch (e){
			childIframeContents = $("#CustomJqueryWindow").find("iframe").contents();
		}
	}
	if(childIframeContents.find("#x").val() == undefined) {
		childIframeContents = $("#MaxJqueryWindow1").find("iframe").contents();
	}
	if((typeof childIframeContents == 'undefined' || childIframeContents.length < 0
		|| childIframeContents.find("#x").val() == undefined)
		) {
		var wins = windowPanelHelper.getOpenWins();
		//var elements = $('div[id^=wd_]');//'wd_'开头的id
		var maxJqueryWinId;
		if(typeof wins != 'undefined' && wins.length >0){
			maxJqueryWinId = wins[wins.length-1].id;
		}
		childIframeContents = $("#"+maxJqueryWinId).find("iframe").contents();
	}

	var x = "";
	if (parameterJson && typeof parameterJson.x != "undefined") {
		x = parameterJson.x;
	} else {
		x = childIframeContents.find("#x").val();
	}
	var y = "";
	if (parameterJson && typeof parameterJson.y != "undefined") {
		y = parameterJson.y;
	} else {
		y = childIframeContents.find("#y").val();
	}
	var mapt = "";
	if (parameterJson && typeof parameterJson.mapt != "undefined") {
		mapt = parameterJson.mapt;
	} else {
		mapt = childIframeContents.find("#mapt").val();
	}

	if(isEdit == undefined || isEdit == null) {
		isEdit = true;
	}
	if(mapType == undefined || mapType == null) {
		mapType = "";
	}
	
	var mapEngineType = "";
	var ZHSQ_EVENT_URL = "";
	var ZHSQ_ZZGRID_URL = "";
	var markerType = "";
	var FACTOR_STATION = "";
	var FACTOR_URL = "";
	var FACTOR_SERVICE = "";
	
	$.ajax({
		type: "POST",
		url: jsBasePath+'/zzgl/map/gis/getMapEngineInfo.json?mapType='+mapType+'&modularCode='+modularCode+'&t='+Math.random(),
		dataType:"json",
		async:false,
		success: function(data){
			mapEngineType = data.mapEngineType;
			ZHSQ_EVENT_URL = data.ZHSQ_EVENT_URL;
			ZHSQ_ZZGRID_URL = data.ZHSQ_ZZGRID_URL;
			mapType = data.mapType;
			markerType = data.markerType;
			FACTOR_STATION = data.FACTOR_STATION;
			FACTOR_URL = data.FACTOR_URL;
			FACTOR_SERVICE = data.FACTOR_SERVICE;
		},
		error:function(data){
			$.messager.alert('错误','无法获取地图引擎！','error');
		}
	});
	
	var data = "";
	var url;
	if(typeof isGetXIEJINGAddress != 'undefined' && isGetXIEJINGAddress != null && isGetXIEJINGAddress != ''){
		data = "isGetXIEJINGAddress=" +isGetXIEJINGAddress;
	}
	if(data != ""){
		data = data + "&";
	}
	if(x!=undefined && x!='' && y!=undefined && y!='' && mapt!=undefined && mapt!=''){

		data = data + 'x='+x+'&y='+y+'&mapt='+mapt+'&gridId='+gridId+'&isEdit='+isEdit+'&mapType='+mapType+'&callBackUrl='+callBackUrl;
	}else {
		data = data + 'gridId='+gridId+'&isEdit='+isEdit+'&mapType='+mapType+'&callBackUrl='+callBackUrl;
	}
	
	// 天地图
	if('005' == mapEngineType){//新地图链接
		if(FACTOR_STATION == "1") {
			var id = parameterJson.id;//$("#id").val();
			if(id == undefined || id == "") {
				$.messager.alert('错误', '无法获取地图标注相关数据！', 'error');
				return;
			}else {
				var parameterJsonStr = JSON.stringify(parameterJson);
				data = "id=" + id + "&parameterJsonStr="+encodeURI(parameterJsonStr)+"&FACTOR_URL="+FACTOR_URL+"&FACTOR_SERVICE="+FACTOR_SERVICE+"&markerType="+markerType+"&"+data;
				url = ZHSQ_EVENT_URL + '/zhsq/map/arcgis/arcgisFactor/toFactorPointTagCommon.jhtml?' + data;
			}
		}else {
			url = ZHSQ_EVENT_URL+'/zhsq/map/arcgis/arcgis/outPlatCrossDomain.jhtml?' + data;
		}
	} else if ('006' == mapEngineType) { // 星云-高德引擎
		url = ZHSQ_EVENT_URL+'/zhsq/map/arcgis/arcgis/spgisCrossDomain.jhtml?' + data;
	} else {
		url = ZHSQ_ZZGRID_URL+'/zzgl/map/gis/popMapMarkerSelectorCrossDomainNew.jhtml?' + data;
	}

	showMaxJqueryWindowForCross("地理位置", url,width,height);
}

//默认的回调函数，定位数据回调赋值可根据各个页面参数名称不同进行调整
function mapMarkerSelectorCallback(mapt, x, y, address){//将标注信息传递到新增、编辑页面
	var childIframeContents = $("#CustomJqueryWindow").find("iframe").contents();
	var childIframe = $("#CustomJqueryWindow").find("iframe");
	if(childIframeContents.contents().find("#x").val() == undefined) {
		try{
			childIframeContents = $("#MaxJqueryWindow").find("iframe").contents();
			childIframe = $("#MaxJqueryWindow").find("iframe");
		}catch (e){
			childIframeContents = $("#CustomJqueryWindow").find("iframe").contents();
			childIframe = $("#CustomJqueryWindow").find("iframe");
		}
	}
	if(typeof childIframeContents == 'undefined' || childIframeContents.length <= 0
		|| childIframeContents.find("#x").val() == undefined) {
		childIframeContents = $("#MaxJqueryWindow1").find("iframe").contents();
		childIframe = $("#MaxJqueryWindow1").find("iframe");
	}

	//适配global.js里面的新弹框方式
	if((typeof childIframeContents == 'undefined' || childIframeContents.length < 0
		|| childIframeContents.find("#x").val() == undefined)
	) {
		var wins = windowPanelHelper.getOpenWins();
		//var elements = $('div[id^=wd_]');//'wd_'开头的id
		var maxJqueryWinId;
		if(typeof wins != 'undefined' && wins.length >0){
			maxJqueryWinId = wins[wins.length-1].id;
		}
		childIframeContents = $("#"+maxJqueryWinId).find("iframe").contents();
	}


	if(typeof address != "undefined" && address != null && address != ''
		&& typeof childIframe[0].contentWindow.setAddressCallBack != 'undefined'
		&& typeof childIframe[0].contentWindow.setAddressCallBack == 'function'){
		childIframe[0].contentWindow.setAddressCallBack(address);
	}
	childIframeContents.find("#mapt").val(mapt);
	childIframeContents.find("#x").val(x);
	childIframeContents.find("#y").val(y);
	childIframeContents.find("#mapTab2").html("修改地理位置");
	childIframeContents.find(".mapTab").addClass("mapTab2");
	try{
		$("#MaxJqueryWindow").find("iframe")[0].contentWindow.callbackMap(x,y);
	}catch(e){

	}
	closeMaxJqueryWindowForCross();
}
