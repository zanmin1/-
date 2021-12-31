// 实现图片上传预览和点击图片更换图片，隐藏原本的button和编辑框
// 调用方式，需使用2个div 分别嵌套img控件和file控件 将button设置透明，然后设置它的大小和图片预览的大小一致，覆盖到预览图片上方。
//未解决：在ie10下，file编辑框的光标无法隐藏，在其它浏览器下没有这种现象
//<div id="localImag"  >
//<img src="${rc.getContextPath()}/theme/scim/gis/query/img/untitled.png"  id="preview" name="preview" style="width: 150px; height: 200px;border:1px solid #ccc;" />
//</div>
//<div id="photo" style="filter: alpha(opacity = 0); opacity: 0;margin-top:-215px;" >
//<input name="upPhoto" type="file"  id="upPhoto"  style=" filter: alpha(opacity = 0); opacity: 10; height:200px;width: 200px;" 
//  accept="image/gif, image/jpg,image/jpeg,image/png, image/bmp" onchange="checkFile(this,'localImag','preview', 'gif,jpg,jpeg,png,bmp', '请选择类型为：gif,jpg,jpeg,png,bmp 的图片文件！')" hidefocus> 
//</div>
// 在file 中利用onchange调用checkFile函数 
function setImagePreview(ImgDivId,ImgId,DocId) 
{ 
	 var docObj=document.getElementById(DocId);  
	 var imgObjPreview=document.getElementById(ImgId); 
	 if(docObj.files && docObj.files[0]){ 
 //火狐下，直接设img属性
	    imgObjPreview.style.display = 'block';
	     imgObjPreview.style.width = '90px'; 
	     imgObjPreview.style.height = '90px';
	      imgObjPreview.style.border = '1px';
	      imgObjPreview.style.solid = '#ccc';
	     //imgObjPreview.src = docObj.files[0].getAsDataURL();
	     //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
	     imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
      }
      else{  
		      //IE下，使用滤镜  
	      docObj.select(); 
    	  var imgSrc = document.selection.createRange().text; 
       	  var localImagId = document.getElementById(ImgDivId); 
        //必须设置初始大小  style="width: 150px; height: 200px;border:1px solid #ccc;"
         localImagId.style.width = "90px"; 
         localImagId.style.height = "90px";
         localImagId.style.border ="1px";
         localImagId.style.solid = "#ccc";
          //图片异常的捕捉，防止用户修改后缀来伪造图片 
          try{ 
           localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
           localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
           }
           catch(e){ 
            alert("您上传的图片格式不正确，请重新选择!");  
            return false; 
             }
            imgObjPreview.style.display = 'none';  
            document.selection.empty(); 
         } 
     return true; 
} 

//限制文件选择
 function checkFile(file,ImgDivId,ImgId, type, str, limitSize){
   	if(file!=null && file.value != ''){
   		var lastPos = file.value.lastIndexOf('.');
   		var pos, fileType;
   		if(lastPos > -1){
   			pos = lastPos + 1;
   			fileType = file.value.substring(pos, file.value.length);
   			fileType = fileType.toLowerCase();
   			if(type.indexOf(fileType) > -1){
   				var files = $(file);
				var size = files[0].files[0].size;
				if (limitSize != undefined && size > limitSize * 1024 * 1024) {
					$.messager.alert('提示信息', '图片大小不能大于' + limitSize + 'M！', 'info');
	  				return false;
				}   				
   			
   				// 如果是符合要求的图片，才进行预览显示
   				setImagePreview(ImgDivId,ImgId,file.id);
   			}else{
   				alert(str);
  				var file = $("#"+file.id);
   			    file.after(file.clone().val(""));   
   			    file.remove(); 
   			    
   			}
   		}
   	}
} 