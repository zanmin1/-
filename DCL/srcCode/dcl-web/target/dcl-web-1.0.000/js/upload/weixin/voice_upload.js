/** 可以参考 add_upload.jsp
 * 
 * <一> 微信上传(图片语音)组件
 *    页面中必须要有input id="accountId" 并传值过来
 *    上传图片: (1) <div id="uploadImgDiv"></div>       (2) initUploadImg(2,3);//参数可加可不加(一行显示一个，最多上传几张)
 *    上传语音: (1) <div id="uploadVoiceDiv"></div>     (2) initUploadVoice(9);//参数可加可不加(最多上传几个)
 *    共同步骤： 调 getJsSdkMsg() 加载sdk
 * 
 *    表单提交时要取上传到微信服务器的图片ID： $("#imageServerId").val();
 *    表单提交时要取上传到微信服务器的语音ID： $("#voiceServerId").val();
 * 
 * <二>使用图片和语音上传要注意事项：
 * 
 *    上传图片要注意事项：
 *      1.1 <li name="weixinPhoto"></li>     页面中不要定义这种li不然会影响图片数量统计
 *      1.2 页面中不要定义元素Id为： imageServerId,PictureListUl
 * 
 *    上传语音要注意事项：
 *      1.1 <li name="weixinVoice"></li>     页面中不要定义这种li不然会影响语音数量统计
 *      1.2 页面中不要定义元素Id为： VoiceUploadBtn,voiceServerId,VoiceListUl,uploadVoiceDialog
 *     
 * <三>查看页面（下载语音文件）
 *    (1) <div class="VoiceList"><ul id="downVoiceListUl" ></ul></div>  下载语音显示的div
 *    (2) 调 getJsSdkMsg() 加载sdk   
 *    (3) downloadVoiceInter(voiceServerId);//参数为语音serverId   多个用,隔开
 */

//最多能上传的语音数量
var maxVoiceNum=9;

/****************************************微信语音上传接口   start*******************************************/

//初始化微信语音(nowMaxVoiceNum)最多上传语音数量
function  initUploadVoice(nowMaxVoiceNum){
	
	if(nowMaxVoiceNum != undefined) {
		maxVoiceNum=nowMaxVoiceNum;
	}
	
	var htmlStr="";
	htmlStr+='<div class="VoiceUpload" id="VoiceUploadBtn" style="width:100%" onclick="startRecordInter();"><img src="../../images/mr_14.png">开始录音</div>';
	htmlStr+='<input type="hidden" id="voiceServerId" name="voiceServerId" />';
	//语音
	htmlStr+='<div class="VoiceList">';
	htmlStr+='   <ul id="VoiceListUl"></ul>';
	htmlStr+='</div>  ';
	//录音提示界面
	htmlStr+='<div id="uploadVoiceDialog" style="display:none">';
	htmlStr+='   <div style="text-align:center;padding-top:10px;">';
	htmlStr+='      <i class="fa fa-spinner fa-spin fa-2x"></i>&nbsp;&nbsp;录音中。。。 ';
	htmlStr+='   </div>';
	htmlStr+='   <p><button type="button" class="allbtn per_sumbit" onclick="stopRecordInter();">结束录音并上传</button></p>';
	htmlStr+='   <div style="height:10px;"></div>';
	htmlStr+='</div>';

 	$("#uploadVoiceDiv").html(htmlStr);
}


var startVoiceDialog;
//打开提示对话框(提示是否录音)
function startRecordInter(){
	
	var confirmVoiceDialog=layer.confirm('确定开始录音？', {
	    btn: ['确定','取消'] //按钮
	}, function(){
	    layer.close(confirmVoiceDialog);
	    startVoiceDialog=ffcs.dialogWithHtml ('提示', $("#uploadVoiceDialog"),null,0);//填出录音中对话框
	    sureStartRecord();//调用录音接口正式开始录音
	}, function(){
	    
	});
}


//正式开始录音
function sureStartRecord(){
   wx.startRecord({
     cancel: function () {
       alert('用户拒绝授权录音');
     }
   });
}

//停止录音,并直接上传语音到微信服务器
function stopRecordInter(){
   wx.stopRecord({
     success: function (res) {
        layer.close(startVoiceDialog);//关闭录音对话框
  		uploadVoiceInt(res.localId);//结束录音后就直接上传(res.localId本地音乐文件资源ID)
     },
     fail: function (res) {
       alert(JSON.stringify(res));
     }
  });
}


//上传语音到微信服务器
function uploadVoiceInt(localId){
    	if (localId == '') {
    		ffcs.alertMsg('请先录制一段声音');	 
	        return;
	    }
    	//将本地的音频文件(localId)上传,返回微信服务器上资源ID：res.serverId
	    wx.uploadVoice({
	    	localId: localId,
	    	success: function (res) {
	    		var mediaId = res.serverId;
		    	if (mediaId) {
		    		downloadAndUpload(localId, mediaId); //下载微信语音并上传么自己的服务器
		    	} else {
		    		ffcs.alertMsg('微信语音上传失败');
		    	}
		     }
	   });
}


//播放音频(根据音频文件的本地localId)
function playVoiceInter(localId){
   if (localId == '') {
	   ffcs.alertMsg('请先录制一段声音'); 
       return;
   }
   wx.playVoice({
     localId: localId
   });
}

//删除语音 
function delVoiceInter(o){
  
   //删除当前语音的html
   $(o).parent().remove();
   //重新整合所有的语音serverId
   var nowVoiceNum=staticVoiceServerId();
   //如果语音上传数量没超过最大值，就显示上传语音按钮
   if(nowVoiceNum<maxVoiceNum){
	   $("#VoiceUploadBtn").show();
   }
} 

//重新整合算出所有的语音serverId集合,赋值到voiceServerId,并返回现在的语音附件数量
function staticVoiceServerId(){
	
	   var nowVoiceNum=0;
	   //重新整合所有的语音serverId
	   var newServiceIds=[];
	   $("li[name=weixinVoice]").each(function(){
	     var  serviceId=$(this).find("span[class='VoiceDel fr']").attr("voiceServiceId");
	     newServiceIds.push(serviceId);
	     nowVoiceNum++;
	   });
	   var idStr = newServiceIds.join(',');	
	   $("#voiceServerId").val(idStr); 
	   return nowVoiceNum;
}


//下载语音信息---用于查看页面  
function  downloadVoiceInter(voiceServerId){

  if (voiceServerId == '') {
     //alert('请先使用 uploadVoice 上传声音');
     return;
  }
  var voiceServerIdArray=voiceServerId.split(",");
  
  var i = 0;
  var serverIdNum=voiceServerIdArray.length;
  
  function uploadVoice() {
	      wx.downloadVoice({
	        serverId: voiceServerIdArray[i],
	        success: function (res) {
	        	  var  _htmlStr=' <li onclick="playVoiceInter(\''+res.localId+'\')"></li>';
	         	  $("#downVoiceListUl").append(_htmlStr);
	         	  i++;
		          if (i < serverIdNum) {//还有图片要上传  && 小于能允许上传的数量才能上传
		             uploadVoice();//上传图片
		          }else{
			         //ffcs.alertMsg('语音下载结束');
		             return;
		          }
	        },
	        fail: function (res) {
	            alert(JSON.stringify(res));
	        }
	      });
	}
  
  uploadVoice();
}

//下载微信语音并上传么自己的服务器
function downloadAndUpload(localId, mediaId) {
	var voiceLoadIndex = ffcs.loading();
	$.ajax({
	    url: basePath + '/wap/voiceupload/fileUpload.mhtml',
		type : "post",
		data : {
			mediaId : mediaId
		},
		success : function(data) {
			var filePath = data.data.filePath;
			if (filePath) {
		        //追加一个语音元素
		        var _html=' <li name="weixinVoice"><span onclick="playVoiceInter(\'' + localId + '\');">　　　　　</span><span class="VoiceDel fr" voiceServiceId="' + filePath + '" onclick="delVoiceInter(this);"></span></li>';
		        $("#VoiceListUl").append(_html);
		        
		        //重新整合所有的语音serverId
		    	var nowVoiceNum = staticVoiceServerId(); 
		    	if (nowVoiceNum >= maxVoiceNum) {
		    		$("#VoiceUploadBtn").hide();
		    	} else {
		    		$("#VoiceUploadBtn").show();
		    	}
		    	
		    	//ffcs.alertMsg('上传语音成功');
			} else {
				ffcs.alertMsg('上传语音失败');
			}
		},
		error : function() {
			ffcs.alertMsg('请求失败');
		},
		complete : function() {
			layer.close(voiceLoadIndex);
		}
	});
}

/****************************************微信语音上传接口   end*******************************************/
