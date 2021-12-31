package cn.ffcs.dcl.szxc.controller;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ffcs.common.utils.JsonHelper;
import cn.ffcs.dcl.ZZBaseController;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.sms.bo.SendResult;
import cn.ffcs.sms.service.SendSmsService;
import cn.ffcs.uam.bo.UserInfo;

@Controller("SMSController")
@RequestMapping("/dcl/SMSController")
public class SMSController extends ZZBaseController {

	@Autowired
	private SendSmsService sendSmsService;
	
    @ResponseBody
    @RequestMapping("/getPzListData")
    public Object getPzListData(HttpServletRequest request, HttpSession session, ModelMap map,
                                String audioUrl,String tel,String type,String message,String phone) throws Exception {
        UserInfo userInfo = (UserInfo) session.getAttribute("USER_IN_SESSION");  //替换成本地常量
//http://sms.zgdxxczx.cn/index.jhtml 发送了看“发送记录” “通道配置”名称如果不是bg_vox就改一下下面sendSms方法里面的，其他的问问赛男
//		params = Collections.singletonMap("channelCode", "bg_vox");
//        短信SMS 传message   语音VOX 为VOX时语音路径audioUrl为空取文字message，手机号phoneArr
//public static boolean sendSms(String smsType, String audioUrl , String message, String[] phoneArr){
//    	boolean flag=sendSms("SMS","","message", new String[]{"13055797950"},userInfo.getUserId(),userInfo.getOrgCode());
//        String audioUrl="http://10.16.131.4:8088/voice/TTS/sipipc/voice20211223165617640_598336.wav";
        String[] tels=tel.split(",");
        Map<String, Object> resultMap=sendSms(type,audioUrl,message, tels,userInfo.getUserId(),userInfo.getOrgCode(),phone);
		String jsoncallback = request.getParameter("jsoncallback");
		return jsoncallback + "(" + JsonHelper.getJsonString(resultMap) + ")";
	}


    public Map<String, Object> sendSms(String smsType, String audioUrl, String message, String[] phoneArr, Long userId, String orgCode, String phone){
    	String content="";
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", "false");
        Map<String, Object> params = new HashMap<>();
        if(!StringUtils.isEmpty(phone)) {
    		params = Collections.singletonMap("entpb_entp_num", phone);
        }
        SendResult sendSms = new SendResult();
        if(smsType.equals("VOX")) {
        	if(!StringUtils.isEmpty(audioUrl)){
        		//有音频文件的情况，使用音频文件
        		params = Collections.singletonMap("channelCode", "bg_vox");
        		//音频文件的绝对路径
        		content =  audioUrl;
        	}else if(!StringUtils.isEmpty(message)) {
        		params = Collections.singletonMap("channelCode", "tts_vox");
        		content = message;
        	}else {
        		//没有音频,也没有文字
                return resultMap;
        	}
        	smsType=SendSmsService.TYPE_VOX;
        }else if(smsType.equals("SMS")){
    		params = Collections.singletonMap("channelCode", "bg_sms");
            content = message;
        	smsType=SendSmsService.TYPE_SMS;
        }else {
            return resultMap;
        }
        String sessionId="";
        String faliTel="";
    	for (int i = 0; i < phoneArr.length; i++) {
    		sendSms = sendSmsService.sendSms("dcl",userId, orgCode,new String[]{phoneArr[i]}, content,smsType, new Date(), params);
    		String submitFailNum = sendSms.getSubmitFailNum();
    		System.out.println(sendSms.getNote());
    		System.out.println(sendSms.getAttribute());
    		System.out.println(submitFailNum);
    		if(sendSms.getCode()==0&&StringUtils.isEmpty(submitFailNum)) {//发送成功
    	        @SuppressWarnings("unchecked")
    			Map<String, Object> attribute =sendSms.getAttribute();
    	        if(attribute!=null) {
    	        	String logId=attribute.get("logId").toString();
    	    		System.out.println(logId);
    	    		sessionId+=logId+",";
    	        }
    		}else {
    			faliTel+=phoneArr[i]+",";
    		}
		}
        resultMap.put("faliTel", faliTel);
        resultMap.put("sessionId", sessionId);
        resultMap.put("result", "success");
        return resultMap;
    }
}
