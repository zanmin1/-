<style type="text/css">
	.r_elist{height:30px;line-height:30px; font-size:12px;padding-top:10px;padding-left:100px;border-bottom:1px #ccc dashed;text-align:center;}
</style>

<script type="text/javascript">
	var myPageSize = 20;
	//列表分页设置
	function listPage() {
		var p = $('#list').datagrid('getPager');
		$(p).pagination({
			pageList : [ 20, 30, 40, 50 ], //可以设置每页记录条数的列表
			beforePageText : '第', //页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示第 {from} 到 {to} 条记录   共 {total} 条记录'
		});
	}
	
	//列表加载成功时->添加node(id或juqery对象),防止多个列表,乱窜
	function listSuccess(data,node) {
		if(!!node){
			var id = null;
			if(typeof(node)=='string'){
				id = node.replace('#','');
			}else{
				id = node.attr('id');
			}
			if(!!id){
				$('#'+id).datagrid('clearSelections');
				if (data.total == 0) {
				    var noDataImg=$('#'+id).closest('.datagrid-view').find("#noDataImg"+id);
				    if(noDataImg.length==0){
				        $('#'+id).closest('.datagrid-view').eq(0).append('<div id="noDataImg'+id+'" style="text-align: center;padding-top:40px;"><img src="${rc.getContextPath()}/theme/frame/images/nodata.png" title="暂无数据"/></div>');
				    }
				}else{
				     var noDataImg=$('#noDataImg'+id);
				     if(noDataImg.length>0){
				        $('#noDataImg'+id).remove();
				     }
				}
			}
		}else{
			$('#list').datagrid('clearSelections');	//清除掉列表选中记录
			if (data.total == 0) {
			    var noDataImg=$('.datagrid-view').find("#noDataImg");
			    if(noDataImg.length==0){
			        $('.datagrid-view').eq(0).append('<div id="noDataImg" style="text-align: center;padding-top:40px;"><img src="${rc.getContextPath()}/theme/frame/images/nodata.png" title="暂无数据"/></div>');
			    }
			}else{
			     var noDataImg=$('#noDataImg');
			     if(noDataImg.length>0){
			        $('#noDataImg').remove();
			     }
			}
		}
	}
	
	//列表加载失败时
	function listError(node) {
		if(!!node){
			var id = null;
			if(typeof(node)=='string'){
				id = node.replace('#','');
			}else{
				id = node.attr('id');
			}
			if(!!id){
				$('#'+id).closest('.datagrid-view').eq(0).append('<div class="r_elist">数据加载出错</div>');
			}
		}else{
		    $('.datagrid-view').eq(0).append('<div class="r_elist">数据加载出错</div>');
		}
	}
</script>