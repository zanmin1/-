<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=OBm0kGjTPSEXKjr3igMrjT9Hgml8fGPP"></script>
</head>
<body>
<div id="allmap"></div>
<div class="footer-bar">
	<input type="hidden" name="mapAddr" id="mapAddr">
	<input type="hidden" name="mapLng" id="mapLng">
	<input type="hidden" name="mapLat" id="mapLat">
</div>
</body>
</html>
<script type="text/javascript">
	//var checkDepartmentAddr = '${checkDepartmentAddr}'; //企业地址
    //注意：parent 是 JS 自带的全局对象，可用于操作父页面
    //var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    // 百度地图API功能
    //var map = new BMap.Map("allmap");
    //map.centerAndZoom(checkDepartmentAddr,12);
    //map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    
    var Y='${Y}';
	var X='${X}';
    //console.log("Y:"+Y+",X:"+X);
    //注意：parent 是 JS 自带的全局对象，可用于操作父页面
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(X, Y);

    map.centerAndZoom(point,15);
    map.enableScrollWheelZoom(true);   //启用滚轮放大缩小，默认禁用


    var marker = new BMap.Marker(point);
    //将标注添加到地图中

    map.addOverlay(marker);
	map.enableBizAuthLogo(); //开启
	map.addControl(new BMap.NavigationControl());
	map.addControl(new BMap.ScaleControl());
	map.addControl(new BMap.OverviewMapControl());
</script>
