var setting = {
	view: {
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false//,
		//addDiyDom: addDiyDom
	},
	edit: {
		drag: {isCopy: false, isMove: true},
		enable: true,
		editNameSelectAll: true,
		showRemoveBtn: showRemoveBtn,
		showRenameBtn: showRenameBtn
	},
	data: {
		key : {
			name : "name"
		},
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pid",
			rootPId: "",
			valKey: "value"
		}
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeDrop: beforeDrop,
		beforeEditName: beforeEditName,
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRemove: onRemove,
		onDrop:onDrop,
		onClick:onClick,
		onRename: onRename
	}
};

var zNodes =[
	{ id:1, pId:0, name:"父节点 1", open:true},
	{ id:11, pId:1, name:"叶子节点 1-1"},
	{ id:12, pId:1, name:"叶子节点 1-2"},
	{ id:13, pId:1, name:"叶子节点 1-3"},
	{ id:2, pId:0, name:"父节点 2", open:true},
	{ id:21, pId:2, name:"叶子节点 2-1"},
	{ id:22, pId:2, name:"叶子节点 2-2"},
	{ id:23, pId:2, name:"叶子节点 2-3"},
	{ id:3, pId:0, name:"父节点 3", open:true},
	{ id:31, pId:3, name:"叶子节点 3-1"},
	{ id:32, pId:3, name:"叶子节点 3-2"},
	{ id:33, pId:3, name:"叶子节点 3-3"}
];
var log, className = "dark";
function beforeDrag(treeId, treeNodes) {
	for (var i=0,l=treeNodes.length; i<l; i++) {
		if (treeNodes[i].drag === false) {
			return false;
		}
		//if(treeId == 'resourceTree'){
		//	if(treeNodes[i].level == '0'){
		//		alert("不能拖拽根节点！");
		//		return false;
		//	}
		//}
	}
	return true;
}
function beforeDrop(treeId, treeNodes, targetNode, moveType) {
	if(treeId != 'resourceTree'){
		alert("不能拖拽到个性化组织树！");
		return false;
	}
	return targetNode ? targetNode.drop !== false : true;
}
function beforeEditName(treeId, treeNode) {
	if(treeNode.orgCode == "-1"){
		alert("无法编辑根节点!");
		return false;
	}else{
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		var zTree = $.fn.zTree.getZTreeObj("resourceTree");
		zTree.selectNode(treeNode);
		//confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？")
		return true;
	}

}
function beforeRemove(treeId, treeNode) {
	if(treeNode.displayCode == "-1" || treeNode.pid == null || treeNode.pid == ""){
		alert("无法删除根节点!");
		return false;
	}else{
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		var zTree = $.fn.zTree.getZTreeObj("resourceTree");
		zTree.selectNode(treeNode);
		return confirm("确认删除 节点 -- '" + treeNode.name + "' 组织吗？");
	}

}

function onRemove(e, treeId, treeNode) {
	showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}
function beforeRename(treeId, treeNode, newName, isCancel) {
	if(treeNode.orgCode == "-1"){
		alert("无法编辑根节点!");
		return false;
	}else{
		className = (className === "dark" ? "":"dark");
		showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("resourceTree");
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}else{
			//修改节点的orgCode
			var codeName = newName.split("-");
			var orgCodeEx = "";
			if(codeName.length > 0){
				orgCodeEx = codeName[0];
			}
			treeNode.displayCode = orgCodeEx;
			treeNode.orgCode = treeNode.orgCode;

			//修改子节点的orgCode
			var treeObj = $.fn.zTree.getZTreeObj("resourceTree");
			updateChildNodes(treeNode, orgCodeEx, treeNode.orgCode);
			//var children = treeNode.children;
			//if(children != null && children.length > 0){
			//
			//	for(var i=0;i<children.length;i++){
			//		var childOldOrgCode = children[i].orgCode;
			//		var childNewOrgCode = "";
			//		if(childOldOrgCode.indexOf(oldOrgCode)>=0){
			//			childNewOrgCode = childOldOrgCode.replace(oldOrgCode, newOrgCode);
			//		}
			//		treeNode.children[i].name = treeNode.children[i].name.replace(childOldOrgCode, childNewOrgCode);
			//		treeNode.children[i].orgCode = childNewOrgCode;
			//	}
			//}
			treeObj.refresh();
		}
		return true;
	}

}

function updateChildNodes(parentNode, displayCodeEX, orgCode){
	var children = parentNode.children;
	if(orgCode == "-1" || displayCodeEX == null || displayCodeEX == "-1"){
		displayCodeEX = "XX";
	}
	if(children != null && children.length > 0){
		for(var i=0;i<children.length;i++){
			var childNewOrgCode = "000";
			if(i+1<10){
				childNewOrgCode = "00" + (i+1);
			}else if(i+1<100){
				childNewOrgCode = "0" + (i+1);
			}else{
				childNewOrgCode = "" + (i+1);
			}
			children[i].displayCode = displayCodeEX + childNewOrgCode;
			children[i].orgCode = children[i].orgCode;
			children[i].orgId = children[i].layCfgId;
			children[i].pId = parentNode.id;
			var childCodeName = children[i].name.split("-");
			if(childCodeName.length > 1){
				children[i].name = children[i].displayCode + "-" + childCodeName[1];
			}else{
				children[i].name = children[i].displayCode + "-" + children[i].name;
			}
			if(children[i].isParent){//判断是否是父节点
				updateChildNodes(children[i], children[i].displayCode, children[i].orgCode);
			}
		}


	}
}

function onClick(e, treeId, treeNode){
	var treeObj = $.fn.zTree.getZTreeObj(treeNode.parentTId);
	if (treeNode.parentTId!=null) {
		var sObj = $("#" + treeNode.parentTId + "_span");
		$("#parentName").val(sObj[0].innerText);
	} else {
		$("#parentName").val("");
	}
	$("#id").val(treeNode.id);
	$("#departmentName").val(treeNode.name);
}

function addDiyDom(treeId, treeNode) {
	//修改子节点的orgCode
	var treeObj = $.fn.zTree.getZTreeObj("resourceTree");
	updateChildNodes(treeNode, treeNode.displayCode, treeNode.orgCode);
}

function onRename(e, treeId, treeNode, isCancel) {
	var aObj = $("#" + treeNode.tId + "_span");

	showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
}
function onDrop(event, treeId, treeNodes, treeNode, moveType){
	//修改子节点的orgCode
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	updateChildNodes(treeNode, treeNode.displayCode, treeNode.orgCode);
	treeObj.refresh();
}
function showRemoveBtn(treeId, treeNode) {
	return true;
//			return !treeNode.isFirstNode;
}
function showRenameBtn(treeId, treeNode) {
	return true;
//			return !treeNode.isLastNode;
}
function showLog(str) {
	if (!log) log = $("#log");
	log.append("<li class='"+className+"'>"+str+"</li>");
	if(log.children("li").length > 8) {
		log.get(0).removeChild(log.children("li")[0]);
	}
}
function getTime() {
	var now= new Date(),
	h=now.getHours(),
	m=now.getMinutes(),
	s=now.getSeconds(),
	ms=now.getMilliseconds();
	return (h+":"+m+":"+s+ " " +ms);
}

var newCount = 1;
function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		+ "' title='新增节点' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_"+treeNode.tId);
	if (btn) btn.bind("click", function(){
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		var newID = newCount++;
		var newOrgCode="";
		var newName = "";
		if(treeNode.displayCode != '-1'){
			newOrgCode =  treeNode.displayCode+"001";
			newName = "自定义节点" + (newID);
		}else{
			newOrgCode="XX01";
			newName = "自定义节点" + (newID);
		}
		zTree.addNodes(treeNode, {id: newID, pId: treeNode.id, name: newOrgCode+"-" + newName});
		var node = zTree.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点
		node.orgCode = newOrgCode;
		node.name = newOrgCode+"-" + newName;
		node.createType = "A";//A：自定义，B：拖拽
		zTree.selectNode(node); //让新添加的节点处于选中状态
		return true;
	});
};
function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.tId).unbind().remove();
};
//用于捕获父节点展开之前的事件回调函数，并且根据返回值确定是否允许展开操作 ，false不代开
function zTreeBeforeExpand(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	if (treeNode.isParent&&treeNode.id!="1") {
		zTree.reAsyncChildNodes(treeNode, "refresh");//异步刷新，清空后加载，加载后打开,需要不打开加参数true
		return false;//使用了异步强行加载，如果用true,节点展开将不会按照expandSpeed属性展开，false将按照设定速度展开
	}
	else {
		return true;
	}
};
function zTreeOnExpand(event, treeId, treeNode) {

};
function selectAll() {
	var zTree = $.fn.zTree.getZTreeObj("resourceTree");
	zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
}

function initTree(treeType){
	if(typeof treeType == 'undefined' || treeType == null){
		treeType = "";
	}
	$.ajax({
		type : 'POST',
		dataType : "json",
		url : contextPath + "/zhis/orgStructure/orgTreeLeft.json",
		error : function() {
		},
		success : function(data) {
			$.fn.zTree.init($("#resourceTree"), setting, data);
		}
	});
}