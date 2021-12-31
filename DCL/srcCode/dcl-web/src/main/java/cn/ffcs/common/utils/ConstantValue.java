/**
 *
 */
package cn.ffcs.common.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

/**
 * 常量类
 * @author guohh
 *
 */
public abstract class ConstantValue {
	//-- 用户信息在session中的key
	public static final String USER_IN_SESSION = "USER_IN_SESSION"; //--本系统用户信息
	public static final String WAP_USER_IN_SESSION = "WAP_USER_IN_SESSION"; //--本系统wap用户信息
	public static final String USER_COOKIE_IN_SESSION = "USER_COOKIE_IN_SESSION"; //--统一认证COOKIE用户信息
	public static final String ADMIN_WAP_USER_IN_SESSION = "ADMIN_WAP_USER_IN_SESSION"; //--本系统admin wap用户信息
	public static String LAST_REDIRECT_URL_IN_SESSION ="LAST_REDIRECT_URL_IN_SESSION";//session过期前最后一次请求地址
	public static final String UUMEMKEY_IN_SESSION = "UUMEMKEY_IN_SESSION";
	public static String SESSION_TOKEN_KEY = "SESSION_TOKEN_KEY";
	
	// 地图标注操作
	public static final int ADD_MARKER = 0; // 添加标注
	public static final int EDIT_MARKER = 1; // 编辑标注
	public static final int WATCH_MARKER = 2; // 查看标注
	
	public static final String DEVICE_INFO_MARKER_TYPE = "7778";//设备信息管理地图定位类型
	//当前的用户信息
	// public static UserInfo USER_INFO_IN_SESSION = null;
	
	//跨域调用的关闭按钮
	public static String closeCallBack = "parent.parent.closeMaxJqueryWindow";
	//综治网格解决跨域的中间方法
	public static String iframeUrl2 = "/zzgl/eventReport/isDomain.jhtml?";
	
	//按钮权限——权限编码
    public static final String SYSTEM_PRIVILEGE_CODE = "system_privilege_code";
    //按钮权限——系统管理员key
  	public static final String USER_TYPE_REGIST = "002";	//后台注册人员的用户类型
  	public static final String USER_TYPE_SUPER = "003";		//超级管理员的用户类型
	public static final String USER_TYPE_DEVELOPER = "004";	//开发人员的用户类型
	public static final String USER_TYPE_ADMIN = "009";		//管理人员的用户类型
	//按钮权限——系统管理员key
	public static final String SYSTEM_ADMIN = "system_admin";
  	//按钮权限——角色key
  	public static final String SYSTEM_ROLE = "system_role";
	/**
	 * 用户的权限菜单列表
	 */
	public static final String SESSION_KEY_USERCOOKIE="cookie_usercookie";
	/**
	 * 用户ID信息
	 */
	public static final String SESSION_KEY_USERID="cookie_user_id";
	/**
	 * 信息域
	 */
	public static final String SESSION_KEY_LOCATION_LIST="cookie_location_list";
	
	//-- 平台cookie公钥
	public static String UAM_PUBLIC_KEY = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKsZnA0ZPlzaUveP8aUYqy3jQkuF3cVsxlOkrbYlS22NPVwL1PHkrMYVlkrt04bxLhEXgHLDe+0kxzkRSEWdnRsCAwEAAQ==";

	//-- UAM中的cookie token key
	public static String UAM_COOKIE_TOKEN_KEY = "memcached";
	
	//-- 新版usercookie改造
	public static final String USER_COOKIE_KEY = "userCookieKey";
	public static final String REDIRECT_DOMAIN_KEY = "redirectDomainKey";
	public static final String USER_COOKIE_UAM_DOMAIN_KEY = "uam_domain_key";   //uam将域名写入memcahce时所用的key

	
	//-- 资源服务器域名
	public static String RESOURSE_DOMAIN_KEY = "gmis";

	//--资源文件上传根路径
	public static String RESOURSE_SAVE_ROOT_PATH="/mnt/mfs/sq_upload";

	//-- 统一登录地址
	public static String UAM_LOGIN_URL = "http://uam.cnsq.org/admin";
	
	//--是否是正式发布版本，发布需设置
	public static boolean IS_PRODUCT = true;
	public static boolean ENABLE_BTN_AUTHORITY = false;
	
	//按钮权限
	public static final String SYSTEM_PRIVILEGE_ACTION = "system_privilege_action";
	//下拉框js域名
	//zzgrid项目路径
	//综治事件项目路径
	//GMIS项目路径
	//个人中心域名
	public static String ZONE_DOMAIN="";

	public static final String ZONE_USER_SESSION = "ZONE_USER_SESSION"; //个人中心，用户保存到session中的key
	/** 微信用户的openId */
	public static final String MOBILE_WEIXIN_OPENID = "openId";		/**
	 /** 微信信息标记 */
	public static final String  MOBILE_WEIXIN_ACCOUNTAPPID = "accountAppId";
	//-- global.properties配置文件
	public static final String GLOBAL_PROPERTIES = "global.properties";
	//-- 文字过滤配置文件
	public static final String STRING_FILTER_CONFIG_FILE = "string-filter.properties";
	//--文字过滤器映射
	public static final Map<String, String> STRING_FILTER_MAP = new HashMap<String, String>();

	
	/**
	 * 信息域类型  1 为单位如：福州市；  0为部门 如：财政厅； -1为所有
	 */
	public static final int ORG_TYPE_ALL = -1; //所有
	public static final int ORG_TYPE_DEPT = 0; //部门
	public static final int ORG_TYPE_UNIT = 1; //单位
	
	/**表示当前的登录角色为开发人员 */
	public static final String SUB_REPLY_TYEP ="0";
	// --纠错信息状态
  	/**状态：反馈问题还未回复状态*/
	public static final String ERR_STATUS_BEGIN = "1";
	/**状态：问题已回复状态 */
	public static final String ERR_STATUS_REPLY = "2";
	/**状态：问题已关闭状态 */
	public static final String ERR_STATUS_CLOSE = "3";

	public static final String SEWAGE_CODE_TYPE = "2205";//污水管理、垃圾站处理、村容村貌的地图定位类型
	// 地图标注--污水管理、垃圾站处理、村容村貌模块代码
	public static String SEWAGE_CODE = "SEWAGEMANAGER";
	//设备-路灯
    public static final String DEVICE_LIGHTING="100011";
    /**
	 * 网格各层级显示中心点名称的地图层级设置
	 */
	public static String SHOW_WG_POINT_MAP_LEVEL_CODE = "SHOW_WG_POINT_MAP_LEVEL";//功能编码
	public static String MAP_LEVEL_TRIG_CONDITION_PROVINCE = "PROVINCE";//省
	public static String MAP_LEVEL_TRIG_CONDITION_CITY = "CITY";//市
	public static String MAP_LEVEL_TRIG_CONDITION_COUNTY = "COUNTY";//区县
	public static String MAP_LEVEL_TRIG_CONDITION_STREET = "STREET";//街道
	public static String MAP_LEVEL_TRIG_CONDITION_COMMUNITY = "COMMUNITY";//社区
	public static String MAP_LEVEL_TRIG_CONDITION_GRID = "GRID";//网格
	
	public static String ENABLE_GRIDLAYER_CLICK_EVENT = "ENABLE_GRIDLAYER_CLICK_EVENT";//是否开启网格轮廓点击事件配置
	
	//语音视频 服务器地址
	public static final String MMP_SVRIP="tcp://sm?27.155.64.203:7109//mmp?27.155.64.203:82//";
	//语音视频 VAG地址
	public static final String MMP_MEDIAURL="27.155.64.203:655";
	
	public static final String MMP_OCX_URL="27.155.64.203:655";
	
	//是否显示当前层级网格的轮廓
	public static String SHOW_CURRENT_GRID_LEVEL_OUTLINE = "SHOW_CURRENT_GRID_LEVEL_OUTLINE";
	public static final String USER_COOKIE_MOBILE = "usercookie_for_mobile";
	//是否启用视频通话功能配置的功能编码
	public static final String IS_USER_MMP ="IS_USER_MMP" ;
	//出租屋在表T_ZY_RES_MARKER中的类型
	public static final String MARKER_TYPE_ROOM_RENT = "ROOM_RENT";   //出租屋


	/**
	 * 宁德乡村振兴项目
	 */
	public static final String DCL_HOMESTAY_PHOTO = "DCL_HOMESTAY_PHOTO";   // 民宿管理图片。
	public static final String DCL_HOMESTAY_VIDEO = "DCL_HOMESTAY_VIDEO";   // 民宿管理视频。

	public static final String DCL_ModularContent_PHOTO = "DCL_ModularContent_PHOTO";   // 模块内容管理图片。


	public static final String DCL_ATTR_TITLLE= "DCL_ATTR_TITLLE";
	public static final String DCL_ATTR_VIDEO= "DCL_ATTR_VIDEO";

	//农家乐 附件
	public static final String ATTA_FAR_HOUSE_MANAGE= "ATTA_FAR_HOUSE_MANAGE";
	//农家乐地图标注
	public static String DCL_FAR_HOUSE_MANAGE = "DCL_FAR_HOUSE_MANAGE";
	//景点地图标注
	public static String DCL_FAR_ATT_MANAGE = "DCL_FAR_ATT_MANAGE";
    // 一村一品附件
    public static final String DCL_VILLAGE_PRODUCT_IMAGE = "DCL_VILLAGE_PRODUCT_IMAGE";
    public static final String DCL_VILLAGE_PRODUCT_VIDEO = "DCL_VILLAGE_PRODUCT_VIDEO";
    public static final String DICT_VILLAGE_PRODUCT_TYPE = "D077701";
    public static final String DICT_VILLAGE_PRODUCT_UNIT = "D077702";
	public static final String ATTA_FAR_HOUSE_MANAGE_TITLLE= "ATTA_FAR_HOUSE_MANAGE_TITLLE";
	//农家乐地图标注的类型
	public static String MAP_TYPE = "5";
    // 村小组附件
    public static final String DCL_VILLAGE_GROUP_IMAGE = "DCL_VILLAGE_GROUP_IMAGE";


	//农家乐地图标注的类型
	public static String CATA_LOG = "02";
	/**
	 * 农家乐 地图标注类型
	 */
	public static final String FAR_HOUSE_MANAGE_MARK = "FAR_HOUSE_MANAGE_MARK";
	//景点地图标注
	public static String DCL_FAR_ATT_MANAGE_MARK = "DCL_FAR_ATT_MANAGE_MARK";
    //农家乐视频
	public static final String ATTA_FAR_HOUSE_MANAGE_VIDEO= "ATTA_FAR_HOUSE_MANAGE_VIDEO";
	/**
	 * 江阴新桥
	 */
	public static String XINGQIAO_FUNC_ORG_CODE="320281109";

	/**
	 * 书记信箱 - 附件。
	 */
	public static String SECRETARY_MAILBOX_FILE = "SECRETARY_MAILBOX_FILE";   // 留言附件。
	public static String MAILBOX_REPLY_FILE = "MAILBOX_REPLY_FILE";   // 回复附件。
	/**
	 * 帮扶项目模块控制器 - 附件。
	 */
	public static final String DCL_HELP_PROJECT_PHOTO= "DCL_HELP_PROJECT_PHOTO";
	public static final String DCL_HELP_PROJECT_FILE= "DCL_HELP_PROJECT_FILE";

	/**
	 * 初始化配置
	 * @param configFilePath
	 */
	public static void init(String configFilePath){
		//-- 读取文字过滤器配置文件
		Properties sfProps = new Properties();
		InputStream sfIn = null;
		try {
			String outputTmp = "---Load StringFilter: ";
			sfIn = new BufferedInputStream(new FileInputStream(configFilePath+STRING_FILTER_CONFIG_FILE));
			sfProps.load(sfIn);
			Set<Entry<Object, Object>> sfPropsSet = sfProps.entrySet();
			Iterator<Entry<Object, Object>> sfPropsIt = sfPropsSet.iterator();
			while(sfPropsIt.hasNext()) {
				Entry<Object, Object> item = sfPropsIt.next();
				String key = String.valueOf(item.getKey());
				String value = String.valueOf(item.getValue());
				STRING_FILTER_MAP.put(key, value);
				System.out.println(outputTmp + key + " - " + value);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sfIn!=null) {
				try {
					sfIn.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//-- 读取global.properties配置文件
		Properties globalProps = new Properties();
		InputStream globalIn = null;
		try {
			globalIn = new BufferedInputStream(new FileInputStream(configFilePath+GLOBAL_PROPERTIES));
			globalProps.load(globalIn);
			String outputTmp = "---Load event.default.type: ";
			
			//-- RESOURSE_DOMAIN_KEY
			outputTmp = "---Load RESOURSE_DOMAIN_KEY: ";
			String RESOURSE_DOMAIN_KEY = globalProps.getProperty("RESOURSE_DOMAIN_KEY");
			if(RESOURSE_DOMAIN_KEY!=null && !RESOURSE_DOMAIN_KEY.trim().equals("")) {
				ConstantValue.RESOURSE_DOMAIN_KEY = RESOURSE_DOMAIN_KEY.trim();
				outputTmp += ConstantValue.RESOURSE_DOMAIN_KEY;
			} else {
				outputTmp += (" error! Use Default: " + ConstantValue.RESOURSE_DOMAIN_KEY);
			}
			System.out.println(outputTmp);

			//-- IS_PRODUCT
			outputTmp = "---Load IS_PRODUCT: ";
			String IS_PRODUCT = globalProps.getProperty("dubbo.zookeeper.id");
			if(IS_PRODUCT!=null && !IS_PRODUCT.trim().equals("")) {
				ConstantValue.IS_PRODUCT = "product".equals(IS_PRODUCT.trim());
				outputTmp += ConstantValue.IS_PRODUCT;
			} else {
				outputTmp += (" error! Use Default: " + ConstantValue.IS_PRODUCT);
			}
			System.out.println(outputTmp);

			//-- UAM_LOGIN_URL
			outputTmp = "---Load UAM_LOGIN_URL: ";
			String UAM_LOGIN_URL = globalProps.getProperty("UAM_LOGIN_URL");
			if(UAM_LOGIN_URL!=null && !UAM_LOGIN_URL.trim().equals("")) {
				ConstantValue.UAM_LOGIN_URL = UAM_LOGIN_URL.trim();
				outputTmp += ConstantValue.UAM_LOGIN_URL;
			} else {
				outputTmp += (" error! Use Default: " + ConstantValue.UAM_LOGIN_URL);
			}
			System.out.println(outputTmp);
			//-- UAM_PUBLIC_KEY
			outputTmp = "---Load UAM_PUBLIC_KEY: ";
			String UAM_PUBLIC_KEY = globalProps.getProperty("UAM_PUBLIC_KEY");
			if(UAM_PUBLIC_KEY!=null && !UAM_PUBLIC_KEY.trim().equals("")) {
				ConstantValue.UAM_PUBLIC_KEY = UAM_PUBLIC_KEY.trim();
				outputTmp += ConstantValue.UAM_PUBLIC_KEY;
			} else {
				outputTmp += (" error! Use Default: " + ConstantValue.UAM_PUBLIC_KEY);
			}
			System.out.println(outputTmp);
			
			//-- UAM_COOKIE_TOKEN_KEY
			outputTmp = "---Load UAM_COOKIE_TOKEN_KEY: ";
			String UAM_COOKIE_TOKEN_KEY = globalProps.getProperty("UAM_COOKIE_TOKEN_KEY");
			if(UAM_COOKIE_TOKEN_KEY!=null && !UAM_COOKIE_TOKEN_KEY.trim().equals("")) {
				ConstantValue.UAM_COOKIE_TOKEN_KEY = UAM_COOKIE_TOKEN_KEY.trim();
				outputTmp += ConstantValue.UAM_COOKIE_TOKEN_KEY;
			} else {
				outputTmp += (" error! Use Default: " + ConstantValue.UAM_COOKIE_TOKEN_KEY);
			}
			System.out.println(outputTmp);

			//-- enable_btn_authority 是否开启按钮权限
			outputTmp = "---Load enable_btn_authority: ";
			String enable_btn_authority = globalProps.getProperty("enable_btn_authority");
			if(enable_btn_authority != null && !enable_btn_authority.trim().equals("")) {
				ConstantValue.ENABLE_BTN_AUTHORITY = Boolean.valueOf(enable_btn_authority.trim());
				outputTmp += ConstantValue.ENABLE_BTN_AUTHORITY;
			}else {
				outputTmp += (" error! Use Default: " + ConstantValue.ENABLE_BTN_AUTHORITY);
			}
			System.out.println(outputTmp);
			
			//-- RESOURSE_SAVE_ROOT_PATH
			outputTmp = "---Load RESOURSE_SAVE_ROOT_PATH: ";
			String RESOURSE_SAVE_ROOT_PATH = globalProps.getProperty("RESOURSE_SAVE_ROOT_PATH");
			if(RESOURSE_SAVE_ROOT_PATH!=null && !RESOURSE_SAVE_ROOT_PATH.trim().equals("")) {
				ConstantValue.RESOURSE_SAVE_ROOT_PATH = RESOURSE_SAVE_ROOT_PATH.trim();
				outputTmp += ConstantValue.RESOURSE_SAVE_ROOT_PATH;
			} else {
				outputTmp += (" error! Use Default: " + ConstantValue.RESOURSE_SAVE_ROOT_PATH);
			}
			System.out.println(outputTmp);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(globalIn!=null) {
				try {
					globalIn.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
