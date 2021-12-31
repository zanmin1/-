	<script type="text/javascript">
		var uiDomain = "${uiDomain!''}";
		var js_ctx =  "${rc.getContextPath()}";
		var _myServer = "${uiDomain!''}/js/map/arcgis/3.8";
		_myServer = _myServer.replace("http://","");
		var _myServer_compact = "${uiDomain!''}";
		_myServer_compact = _myServer_compact.replace("http://","");
		var AUTOMATIC_CLEAR_MAP_LAYER = "<#if AUTOMATIC_CLEAR_MAP_LAYER??>${AUTOMATIC_CLEAR_MAP_LAYER}</#if>";
		var IS_IMAGE_MAP_SHOW_CONTOUR = "<#if IS_IMAGE_MAP_SHOW_CONTOUR??>${IS_IMAGE_MAP_SHOW_CONTOUR}</#if>";
		var IS_VECTOR_MAP_SHOW_CONTOUR = "<#if IS_VECTOR_MAP_SHOW_CONTOUR??>${IS_VECTOR_MAP_SHOW_CONTOUR}</#if>";
		var IS_GRID_ARCGIS_SHOW_CENTER_POINT = "<#if IS_GRID_ARCGIS_SHOW_CENTER_POINT??>${IS_GRID_ARCGIS_SHOW_CENTER_POINT}</#if>";
		var OUTLINE_FONT_SETTINGS = "<#if OUTLINE_FONT_SETTINGS??>${OUTLINE_FONT_SETTINGS}</#if>";
		var OUTLINE_FONT_SETTINGS_BUILD = "<#if OUTLINE_FONT_SETTINGS_BUILD??>${OUTLINE_FONT_SETTINGS_BUILD}</#if>";
		var ARCGIS_DOCK_MODE = "<#if ARCGIS_DOCK_MODE??>${ARCGIS_DOCK_MODE}</#if>";
		var LC_INFO_ORG_CODE = "<#if LC_INFO_ORG_CODE??>${LC_INFO_ORG_CODE}</#if>";
        //网格各层级显示中心点名称的地图层级设置
        var MAP_LEVEL_TRIG_CONDITION_PROVINCE = "<#if MAP_LEVEL_TRIG_CONDITION_PROVINCE??>${MAP_LEVEL_TRIG_CONDITION_PROVINCE}<#else>0</#if>";
        var MAP_LEVEL_TRIG_CONDITION_CITY = "<#if MAP_LEVEL_TRIG_CONDITION_CITY??>${MAP_LEVEL_TRIG_CONDITION_CITY}<#else>0</#if>";
        var MAP_LEVEL_TRIG_CONDITION_COUNTY = "<#if MAP_LEVEL_TRIG_CONDITION_COUNTY??>${MAP_LEVEL_TRIG_CONDITION_COUNTY}<#else>0</#if>";
        var MAP_LEVEL_TRIG_CONDITION_STREET = "<#if MAP_LEVEL_TRIG_CONDITION_STREET??>${MAP_LEVEL_TRIG_CONDITION_STREET}<#else>0</#if>";
        var MAP_LEVEL_TRIG_CONDITION_COMMUNITY = "<#if MAP_LEVEL_TRIG_CONDITION_COMMUNITY??>${MAP_LEVEL_TRIG_CONDITION_COMMUNITY}<#else>0</#if>";
        var MAP_LEVEL_TRIG_CONDITION_GRID = "<#if MAP_LEVEL_TRIG_CONDITION_GRID??>${MAP_LEVEL_TRIG_CONDITION_GRID}<#else>0</#if>";
	</script>
	<link rel="stylesheet" href="${uiDomain!''}/js/map/arcgis/3.8/js/esri/css/esri.css">
	<link rel="stylesheet" href="${rc.getContextPath()}/js/gis/library/mnbootstrap/css/maptools.css">
	<link rel="stylesheet" href="${rc.getContextPath()}/js/gis/library/style/css/mapindex.css" />
	<link href="${uiDomain!''}/images/map/gisv0/special_config/css/public.css" rel="stylesheet" type="text/css" />
	<link href="${uiDomain!''}/images/map/gisv0/special_config/css/map.css" rel="stylesheet" type="text/css" />
	<link href="${uiDomain!''}/images/map/gisv0/special_config/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${uiDomain}/js/jqueryeasyui/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="${uiDomain}/js/jqueryeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/normal.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css${styleCSS!''}/easyuiExtend.css" />
    <link rel="stylesheet" type="text/css" href="${uiDomain!''}/css/easyuiExtend.css" />
	<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js" type="text/javascript"></script>
	
	<script type="text/javascript" src="${uiDomain}/js/jqueryeasyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${uiDomain}/js/jqueryeasyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/jquery-ui-1.10.4/ui/jquery-ui.js" ></script>
	<script src="${rc.getContextPath()}/js/gis/library/jquery-ui-1.10.4/ui/jquery.ui.draggable.js" ></script>
	
	
	<script src="${uiDomain!''}/images/map/gisv0/special_config/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="${uiDomain!''}/js/map/arcgis/3.8/init.js"></script>
	<script src="${rc.getContextPath()}/js/gis/utils/HashMapUtil.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsMap.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsMeasure.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsSlider.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsOverviewMap.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsSymbolPicker.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsLayerPicker.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsSymbolPicker.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsFillQuery.js"></script>
	<script src="${rc.getContextPath()}/js/gis/library/ffplugin/ffcsTianDiTuLayer.js"></script>
	<script src="${rc.getContextPath()}/js/gis/base/arcgis_versionnoe.js"></script>
	<script src="${rc.getContextPath()}/js/zzgl_core.js"></script>
    <script type="text/javascript" src="${uiDomain!''}/js/function.js"></script>