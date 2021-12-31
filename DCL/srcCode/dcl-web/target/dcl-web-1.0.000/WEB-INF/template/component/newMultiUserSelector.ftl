<!-- 
#人员选择
说明：
#1、入口函数showMultiUserSelector，参数：已选择的用户ID，已选择的用户名称
#2、引用页面需要有回调函数multiUserSelectCallback，参数：选择的用户ID，选择的用户名称
 -->
<div id="MultiUserSelector" class="easyui-window" title="人员选择" minimizable="false" maximizable="false" collapsible="false" closed="true" modal="false" style="width:600px;height:300px;padding:1px;overflow:hidden;">
	<table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color:#39BBF8;">
		<tr>
			<th style="background-color: #F3F8FE; text-align:center; height:25px; line-height:25px;">快速定位</th>
			<td colspan="3" style="background-color: #F3F8FE;">
				<input type="text" size="25" onkeyup="fastSearchUser();" onfocus="searchInputFocus();" onblur="searchInputBlur();" value="请输入人员姓名或者帐号" id="fastSearchTxt" />
	    		<div id="suggest_items" style="position:absolute;top:53px;left:210px;z-index:99;border:1px solid #817F82;background:white;width:183px;display:none;"></div>
			</td>
		</tr>
		<tr style="border-bottom:1px solid #e2ebf6">
			<td width="200" style="background-color: #F3F8FE; height:25px; line-height:25px;">部门类型
				<select id="userType" onchange="loadOrg();">
				    	<option value="1" >本部门及下属部门</option>
				    	<option value="2" >同级及上级部门</option>
		    	</select>
		    </td>
		    <th style="background-color: #F3F8FE; height:25px; line-height:25px;">人员</th>
			<td rowspan="3" width="50" style="background-color: #F3F8FE;">
				<input type="button" value="添加"  onclick="addCheckUser();" class="hbtn" />
				<input type="button" value="全删"  onclick="delAllUser();" class="hbtn" />
				<input type="button" value="移除" onclick="delCheckUser();" class="hbtn"/>
				<input type="button" value="确定"  onclick="confirmUsers();" class="hbtn"/>
				<input type="button" value="取消" onclick="closeMultiUserSelector();" class="hbtn"/>
			</td>
			<th width="100" style="background-color: #F3F8FE; height:25px; line-height:25px;">已选择人员</th>
		</tr>
		<tr>
			<td style="background-color: #F3F8FE;">
            	<div id="userTree" style="height:240px; width:200px; overflow:auto;"></div>
            </td>
            <td style="background-color: #F3F8FE;"><select style="width:180px;height:240px;" multiple size="16" id="userList"></select></td>
			<td style="background-color: #F3F8FE;"><select style="width:180px;height:240px;" multiple size="16" id="selectUserList"></select></td>
		</tr>
	</table>
</div>
<style>
	.suggest_table_class tr:hover{background:#ccc;}
</style>
<script>
	var $multiUserSelectorWin;
	
	var $iSingleUser = false;
	// Added By 20131129 YangCQ Desc：如果是单人选择，先清除在添加。
	function showSingleUserSelector(initUserId, initUserName) {
		$iSingleUser = true;
		showMultiUserSelector(initUserId, initUserName);
	}

	function showMultiUserSelector(initUserIds, initUserNames) {
		if(initUserIds!=null && initUserIds!="" && initUserNames!=null && initUserNames!="") {
			$('#selectUserList').html('');
			var userIdArray = initUserIds.split(",");
			var userNameArray = initUserNames.split(",");
			var s="";
			for(var i=0; i<userIdArray.length; i++) {
				s+='<option value="'+userIdArray[i]+'" >'+userNameArray[i]+'</option>';
			}
			$('#selectUserList').append(s);
		}
		
	    loadOrg();
	    $multiUserSelectorWin = $('#MultiUserSelector').window({
	    	title:"人员选择",
	    	width: 650,
	    	height: 335,
	    	top:($(window).height()-326)*0.5+$(document).scrollTop(),
	    	left:($(window).width()-650)*0.5+$(document).scrollLeft(),
	    	shadow: true,
	    	modal:true,
	    	closed:true,
	    	minimizable:false,
	    	maximizable:false,
	    	collapsible:false
	    });
		$("#suggest_items").hide();
		$multiUserSelectorWin.window('open');
	}
	
	function closeMultiUserSelector() {
		$multiUserSelectorWin.window('close');
	}
	
	function loadOrg(){
		var type=$('#userType').val();
		var rootUrl = "${rc.getContextPath()}/org/new_func/orgTree.json?type="+type+"&t="+Math.random();
		$("#userTree").omTree({
	        dataSource :rootUrl,
	        simpleDataModel: true,
	        onBeforeExpand : function(node){
	        	var nodeDom = $("#"+node.nid);
	        	if(nodeDom.hasClass("hasChildren")){
	        		nodeDom.removeClass("hasChildren");
	        		$.ajax({
	                    url: '${rc.getContextPath()}/org/new_func/orgTree.json?orgId='+node.id+'&type='+type+"&t="+Math.random(),
	                    method: 'POST',
	                    dataType: 'json',
	                    success: function(data){
	                        $("#userTree").omTree("insert", data, node);
	                    }
	                });
	        	}
	        	return true;
	        },onClick: function(node,event) {
				$('#userList').html('<option value="">数据加载中...</option>');
            	var userUrl = "${rc.getContextPath()}/org/new_func/orgUserList.json?orgId="+node.id+"&t="+Math.random();
            	$.ajax({
					type: "POST",
					url: userUrl,
					dataType:"json",
					success: function(data){
						$('#userList').html('');
						var s="";
						for(var i=0; i<data.length; i++) {
							s+='<option value="'+data[i].userId+'" >'+data[i].partyName+'-'+data[i].userName+'</option>';
						}
						$('#userList').append(s);
					},
					error:function(){
						alert("网络错误！");
					}
				});
            },
			onSuccess: function(data){
				$('#userTree').omTree('expandAll');
			}
	    });
	}
	
	jQuery(document).ready(function() {       
    	jQuery("#userList").dblclick(function() {
    		addCheckUser();
        });
        jQuery("#selectUserList").dblclick(function() {
    		delCheckUser();
        });
    });
	
	function addCheckUser(){
		// Modify By 20131129 YangCQ Desc：如果是单人选择，先清除在添加。
		if ($iSingleUser) delAllUser();
		var users = $('#userList option:selected');
		if(users.length==0) {
			alert("请从人员中选择要添加的用户！");
			return;
		}
		var s="";
		for(var i=0; i<users.length; i++) {
			var options=$('#selectUserList option');
			var flag=true;
			for(var j=0;j<options.length;j++){
				if(users[i].value==$(options[j]).val()){
					flag=false;
					break;
				}
			}
			if(flag){
				s+='<option value="'+users[i].value+'" >'+users[i].text+'</option>';
			}
		}
		
		$('#selectUserList').append(s);
	}
	
	function delAllUser(){
		$('#selectUserList').html('');
	}
	
	function delCheckUser(){
		$('#selectUserList option:selected').remove();
	}
	
	function confirmUsers(){
		var userIds="";
		var userNames="";
		var options=$('#selectUserList option');
		for(var i=0;i<options.length;i++){
			userIds+=","+options[i].value;
			userNames+=","+options[i].text;
		}
		if(userIds.length>0) {
			userIds = userIds.substring(1);
		}
		if(userNames.length>0) {
			userNames = userNames.substring(1);
		}
		//if(userIds==""){
		//	alert("请选择人员！");
		//	return false;
		//}
		multiUserSelectCallback(userIds,userNames);
		closeMultiUserSelector();
	}
	
	function searchInputFocus() {
		$("#fastSearchTxt").val("");
	}
	
	function searchInputBlur() {
		$("#fastSearchTxt").val("请输入人员姓名或者帐号");
	}
	
	function fastSearchUser() {
		var fastSearchTxt = $("#fastSearchTxt").val();
		if(fastSearchTxt==null || fastSearchTxt=="") {
			$("#suggest_items").hide();
			return;
		} else {
			$("#suggest_items").html("数据加载中...");
			$("#suggest_items").show();
			$.post("${rc.getContextPath()}/org/new_func/searchUser.jhtml?t="+Math.random(), {
				"inputName" : fastSearchTxt, "type" : $('#userType').val()
			}, function(data) {
				if(data.length>0) {
					var itemsHtml = '<table width="100%" class="suggest_table_class">'
					for(var i=0; i<data.length; i++) {
						itemsHtml += '<tr  onclick="itemSelected('+data[i].userId+',\''+data[i].partyName+'-'+data[i].userName+'\')">';
						itemsHtml += '<td>'+data[i].partyName+'-'+data[i].userName+'</td>';
						itemsHtml += '</tr>';
					}
					itemsHtml += '</table>'
					$("#suggest_items").html(itemsHtml);
				} else {
					$("#suggest_items").html("<table width='100%'><tr><td><span style='color:red;'>没有找到相应数据</span></td><td><a href='javascript:void(0)' onclick='hideSuggest4User()'>关闭</a></td></tr></table>");
				}
			}, "json");
		}
	}
	
	function hideSuggest4User(){
		$("#suggest_items").hide();
	}
	
	function itemSelected(userId,userName) {
		var options=$('#selectUserList option');
		var flag=true;
		for(var j=0;j<options.length;j++){
			if(userId==$(options[j]).val()){
				flag=false;
				break;
			}
		}
		if(flag){
			var s = '<option value="'+userId+'" >'+userName+'</option>';
			$('#selectUserList').append(s);
		}
		$("#fastSearchTxt").val("请输入人员姓名或者帐号");
		$("#suggest_items").hide();
	}
</script>