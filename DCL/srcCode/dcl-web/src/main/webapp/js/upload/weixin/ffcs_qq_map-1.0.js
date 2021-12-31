/*!
 * ffcsQQMap 1.0
 * wzh
 * Date: 2016-11-14
 * 
 * 1、未指定地图中心点情况下，默认指向当前用户所在城市功能。
 * 2、对标注进一步封装
 * 3、对文字标签进一步封装
 * 4、对折线覆盖物进一步封装
 */
(function($){
	$.fn.ffcsMap=function(settings){
		if(this.length!=1){
			console.error("未找到指定地图容器，或者容器不合法!");
			return;
		};
		//默认配置文件
		$.ffcsMap={
			MapOptions:{
				draggable:true,
				zoom : 11
			},
			Listener:[],
			MarkerOptions:[],
			LabelOptions:[],
			PolylineOptions:[]
		};
		
		//合并配置
		$.extend($.ffcsMap.MapOptions,settings.MapOptions); //地图基本配置
		$.extend($.ffcsMap.Listener,settings.Listener);        //事件基本配置
		$.extend($.ffcsMap.MarkerOptions,settings.MarkerOptions);       //地图标注配置
		$.extend($.ffcsMap.LabelOptions,settings.LabelOptions);         //地图文字标签配置
		$.extend($.ffcsMap.PolylineOptions,settings.PolylineOptions);     //地图折线配置
		
		//创建地图
		var map = new qq.maps.Map(this[0], $.ffcsMap.MapOptions);
		
		//如果外层 参数没有指定地图中心点，则默认指向IP所在城市
		if(settings.MapOptions==undefined || settings.MapOptions.center==undefined){
			//定位地图到当前城市
		    citylocation = new qq.maps.CityService({
		        complete : function(result){
		            map.setCenter(result.detail.latLng);
		        }
		    });
		    //调用searchLocalCity();根据用户IP查询城市信息。
		    citylocation.searchLocalCity();
		}
		
		//初始化事件
		$.each($.ffcsMap.Listener,function(){
			qq.maps.event.addListener(map, this.type, this.callback);
		});
		
		//初始化标注
		$.each($.ffcsMap.MarkerOptions,function(){
			var mk = {map:map};
			var marker = new qq.maps.Marker($.extend(mk,this));
			if(this.event!=undefined){
				qq.maps.event.addListener(marker, this.event.type, this.event.callback);
			}
		});
		
		//初始化文字标签
		$.each($.ffcsMap.LabelOptions,function(){
			var lab = {map:map};
			var label = new qq.maps.Label($.extend(lab,this));
			if(this.event!=undefined){
				qq.maps.event.addListener(label, this.event.type, this.event.callback);
			}
		});
		
		//初始化拆线
		$.each($.ffcsMap.PolylineOptions,function(){
			var pl = {map:map};
			var polyline = new qq.maps.Polyline($.extend(pl,this));
			if(this.event!=undefined){
				qq.maps.event.addListener(polyline, this.event.type, this.event.callback);
			}
		});
		
		return map;
	};
})(jQuery);