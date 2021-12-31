package cn.ffcs.common.utils;

/**
 * 数据字典常量类
 * 
 * @author youzh
 */
public abstract class DictConstantValue {

	public static String IS_NOT = "Y015";// 是否

	public static String COMMEND_TYPE = "B520";// 表彰类型

	public static String COMMEND_LEVEL = "B521";// 表彰等级

	public static String DICT_ORG_LEVEL = "B000";// 组织层级

	public static String DICT_SEX = "B153"; // 性别

	public static String MATTERS_EVENT_TYPE = "B995"; // 事项类型
	
	public static String MATTERS_EVENT_STATE = "B994"; // 状态
	
	public static String DICT_SIGN = "B890"; // 签订协议

	public static String DICT_HAZARD = "B891"; // 危害情况

	public static String DICT_DRIVE_MODELS = "B892"; // 准驾车型

	public static String DICT_CORP_CATALOG = "B893"; // 企业类别

	public static String DICT_IDENTIFY = "B894"; // 商标认定情况

	public static String DICT_CM_CATA = "B895"; // 涉铁矛盾调处类别

	public static String DICT_PLACENAME = "B373";// 场所类型

	public static String DICT_AFFORDTYPE = "B374";// 保障房类型
	
	public static String DICT_CONSTRUCT_STATUS = "B375";// 建设状态
	
	public static String DICT_CONSTRUCT_VER = "B376";// 平台版本
	
	public static String DICT_CONSTRUCT_CATALOG = "B377";// 产品类型
	
	public static String DICT_DEFORMITY_CATA = "B896"; //五残类型
	
	public static String DICT_MAINTENANCE_TEAM = "B272"; // 维稳队伍
	
	public static String DICT_EDU_CODE = "D060001"; // 文化程度
	
	public static String DICT_RS_STATUS = "B949"; //人员状态    在职、离休、退休、其他
	
	public static String DICT_COUNTRY = "B113"; //国籍
	
	public static String DICT_QUESTIONTYPE = "B382";  //客服QA类型
	
	public static String DICT_WLRSTYPE = "B400";  //民情日志类型
	
	public static String DICT_WLGRIDTYPE = "B997";  //巡查日志分类
	
	public static String DICT_WLGRIDPRIODTYPE = "B998";// 巡查日志周期分类
	
	public static String DICT_WLGRIDPRIODTYPE_UNBOND = "B998004";// 巡查日志周期分类——不定期
	
	public static String DICT_VISIT_RECORD_RECENT_STATUS = "B970";// 巡查 巡查走访记录-近期动态
	
	public static String DICT_VISIT_RECORD_MODE = "B971";// 巡查 巡查走访记录-走访形式
	
	public static String DICT_VISIT_RECORD_RESULT = "B972";// 巡查 巡查走访记录-走访效果
	
	public static String DICT_VISIT_RECORD_RISK_EVALUATION = "B973";// 巡查 巡查走访记录-风险评估
	
	public static String DICT_PLACE_TYPE="B974";//消防重点单位-场所类别
	public static String DICT_GRADE_TYPE="B975";//消防重点单位-重点等级
	public static String DICT_TRADE_TYPE="B976";//危化品企业-行业类别
	public static String DICT_COMPANY_STATE="B977";//危化品企业-企业状态
	public static String DICT_PRODUCTION_STATE="B978";//危化品企业-生产状态
	
	
	public static String PARTY_GROUP_TYPE = "A003005";	//党群建设规格
	
	public static String DICT_POLICY_TYPE = "B608"; //政策种类
	
	public static String DICT_UNIT_TYPE = "B600001";// 扶贫：单位类型
	public static String DICT_SUB_ORD = "B600002";// 扶贫：隶属关系
	public static String EP_INSPECT_TYPE_PCODE = "A001093199855";//环保企业巡查检查类型 环保(31) 大类
	public static String FC_INSPECT_TYPE_PCODE = "A001093199863";//消防检查
	
	public static String DICT_PARTYMEMBERTYPE = "D171005";// 党员类别
	public static String DICT_PARTYTYPE = "D171007";// 党建类型
	public static String DICT_SUBORRELA = "D171008";// 隶属关系
	public static String DICT_SUBORRELA_GL = "D171008-2";// 隶属关系
	public static String DICT_WORKUNIT = "D174001";// 工作岗位
	public static String DICT_PARTYPOST = "D171006";// 党内职务
	public static String DICT_ISRETIRE = "D130001";// 退休/在职
	
	public static final String GATE_TYPE_DC = "B914";//大门类型
	public static String DICT_DISP_TYPE = "B630";//  类型
	public static String DICT_ZZ_COMM_PROB_LEVEL = "B631";// 级别
	public static String DICT_ZZ_COMM_PROB_TYPE = "B632";//  类型
	public static String DICT_ZZRISKEXPERT_SEX = "B633";//  性别
	
	public static String DICT_ECONOMIC_TYPE = "B170";//  经济类型
	public static String DICT_PROSECUTION_TYPE = "B176";//  经营方式
	
	public static String DICT_RISK_GRADE = "D018003"; // 风险等级
	public static String DICT_ASSESSMENT_RESULT = "D018002"; // 评估结果
	
	public static String DICT_HAUL_REGION_TYPE = "B200";// 吸毒查获地区
	public static String DICT_SALE_HAUL_REGION_TYPE = "B202";// 贩毒抓获地区
	
	public static String DICT_ID_INFO = "H001"; //人员信息
	public static String DICT_HELP_DANG_LEVEL = "H002"; //风险级别
	public static String DICT_HELP_MEAS = "H003"; //帮教措施
	public static String DICT_YEAR_ASSESS = "H004"; //年度考评等次
	public static String DICT_HR_UNIT = "H005"; //单位
	public static String DICT_HELP_TYPE_BIG = "H006";	//帮教类别
	
	public static String DICT_HOR_TITLE = "D102001"; //与户主关系
	
	/**"B572"：设备类型*/
	public static String DICT_DEVICE_TYPE = "B572";//设备类型
	
	/**"B573"：设备厂商*/
	public static String DICT_DEVICE_MANU = "B573";//设备厂商
	
	public static String DICT_DEVICE_LOW_BATTERY_NUM = "B578001";//电量告警阈值
	public static String DICT_DEVICE_LOST_NUM = "B578002";//失联告警阈值 
	
	public static String SG_TYPE = "B666";//专项治理行动联系人  人员类型
	
	public static String XQ_TYPE = "B700";//县区通报类型
	
	public static String BM_TYPE = "B701";//部门通报类型
	
	public static String GRID_DUTY_TYPE = "D135001";//巡查走访指定任务职务类型【网格管理员职务字典】
	
	public static String VILLAGE_DUTY ="A003002";//晋江村内职务

	public static String DICT_RESOURCE ="B592";// 资源类型

	public static String DICT_TYPE_P ="B598001";// 收支一级

	public static String DICT_TYPE_C_S ="B598002"; //收入类型

	public static String DICT_TYPE_C_Z ="B598003";//支出类型

	public static String DICT_ASSET_TYPE ="B597";//资产类型

	public static String DICT_USAGE ="B594";//使用情况

	public static String DICT_PAY ="B512";// 收费类型

	public static String DICT_ATTR_TYPE ="B511";// 景点类型
	
    public static String CROWD_GRIDADMIN_SETTING="CROWD_GRIDADMIN_SETTING";
    /** 刑释解教人员 */
	public static final String OBJ_TYPE_RELEASE = "01";
	/**
	 * 甘肃省功能域组织编码
	 * 之前 GANSU_FUNC_ORG_CODE= 62,35
	 * zengy 修改为 62
	 */
	public static String GANSU_FUNC_ORG_CODE="62";
	public static String NANCANG_ORGCODE =  "360121";
	
	/**
	 * 南昌公文流转字典（公文类型，公文密级，公文紧急程度）
	 */
	public static String NCDOC_TYPE =  "B787";//公文类型
	public static String NCDOC_SECRET =  "B788";//公文密级
	public static String NCDOC_EMERGENT =  "B789";//公文紧急程度
	
	public static String JJLOGOFF_TYPE =  "A004001";//晋江注销类型

	public static String VAGRANT_PSYCHOTIC_IN = "B751";//流浪精神病人员入站方式
	public static String VAGRANT_PSYCHOTIC_LE = "B752";//流浪精神病人员离站方式
	public static String VAGRANT_PSYCHOTIC_STATUS = "B753";//流浪精神病人员状态

    /**
    *公共信息化平台运营大屏
    */
    public static String DICT_PRODUCT_TYPE="B_PI001";//公共信息化-产品分类
    public static String DICT_DEPL_PATT_TYPE="B_PI002";//公共信息化-部署模式
    public static String DICT_REGI_SCALE_TYPE="B_PI003";//公共信息化-区域规模
    public static String DICT_PS_STATUS_TYPE="B_PI004";//公共信息化-项目状态
    public static String DICT_BRAND_NAME="B_PI005";//公共信息化-所属品牌
    public static String DICT_INDUSTRY_TYPE="B_PI006";//公共信息化-行业类型
    public static String DICT_HOST_LEVEL="B_PI007";//公共信息化-行业类型
    public static String DICT_SYSTEM_OPERATION="B_PI008";//公共信息化-系统运行

    /**
     * 厦门环保任务对接
     */
    public static final String DICT_RECEIVER_UNIT = "B960";// 接受单位
    public static final String DICT_TASK_STATUS = "B961";// 任务状态
    public static final String DICT_TASK_SOURCE = "B962";// 任务来源
    public static final String DICT_TASK_CATEGORY = "B963";// 任务类别
    
    /**
     * 视频监控关联业务对象功能：业务对象类型
     */
    public static final String MONITOR_RELATION_TYPE = "B316";// 关联对象类型

	/**
	 * 工单派发字典值
	 */
	public static final String DIS_EMER_LEVEL = "D382001";// 紧急程度
	public static final String DIS_REMIND_TYPE = "D382003";// 表彰等级

	public static final String TEACH_EXPLAIN = "B472";//帮教述求任务类型
	//甘肃 特殊人群
	public static final String HELP_OBJ_CODE = "D333"; //帮教对象
	public static final String SEX_CODE = "D060002"; //性别

	//甘肃教育宣传 真实案例库字典值
	/**
	 * 危害类型
	 */
	public static final String REAL_TYPE = "B465001";
	/**
	 * 危害程度
	 */
	public static final String REAL_DEGREE = "B465002";
	/**
	 * 发现渠道
	 */
	public static final String REAL_CHANNEL = "B465003";

    /**
     * 甘肃关注人群————宣传活动
     */
    public static final String ADVERTISE_CHANNEL = "B465004";//宣传渠道
    public static final String ADVERTISE_STATUS = "B465005";//宣传状态
    public static final String PLATFORM_ON_LINE = "B465006";//线上的发布平台
    
    /**
     * 平安甘肃-教育转化
     */
    public static final String QUESTIONNAIRE_STATE = "D456001"; //问卷调查状态
    public static final String QUESTIONNAIRE_TYPE = "D456002"; //问卷调查类型
    public static final String QUESTIONNAIRE_MEMBER_STATE = "D456003"; //成员问卷情况
    public static final String MISSION_REMINDER_TYPE = "D456004"; //精准宣教提醒方式
    
    /**
     * 		平安甘肃-调解机构
     */
    
    public static final String DICT_ORG_TYPE = "D444001"; //调解机构类型
    
    /**
     * 反邪教机构 队伍成员职务
     */
  	public static final String  ANTI_CULT_MEMBER_POST_CODE = "D444002";


	public static final String  PROCESSING = "A005003001"; //处理工艺


	public static final String 	WATERMARK ="A005003002";//出水标注

	public static final String 	EXCHANGE_TYPE ="D006016";//兑换类型

	/**
	 * 宁德乡村振兴项目
	 */
	public static final String ISSU_STATUS = "dcl001"; // 发布状态。

	public static final String ISSU_STATUS_ATT = "B497"; // 发布状态。

	public static final String ACCOMMODATION = "dcl004"; // 住宿标准。
	public static final String REPLY_STATUS = "dcl005"; // 回复状态。
	public static final String VISIBLE = "dcl006"; // 是否公开。
	public static final String Encyclopedias = "dcl007";   // 农业百科分类。
	public static final String agriculturalVideo = "dcl008";   // 农业视频分类。
	public static final String USE_TYPE = "dcl0008"; // 使用场景。
	public static final String DIS_TYPE = "dcl0011"; // 大屏展示类型。

	//宁德乡村振兴项目 农家乐地图标注
	public static final String 	T_DV_FARMHOUSE_MANAGEMENT_MAP ="T_DV_FARMHOUSE_MANAGEMENT";

	//新地图标注字典方法
	public static final String T_DV_ATTR_MANAGE_MAP  = "T_DV_ATTR_MANAGE_MAP";//消防给水地图

	public static final String FARMHOUSE_MANAGEMENT_MAP  = "dcl002001";//农家乐地图

	public static final String ATTR_MANAGE_MAP  = "dcl002002";//景点地图

	public static final String DCL_HOMESTAY_MAP  = "dcl002003"; // 民宿管理地图。

	public static final String DCL_MODULAR_TYPE = "dcl003"; // 民宿管理地图。

	public static final String DCL_PLATFORM_TYPE = "dcl0010"; // 民宿管理地图。

	public static final String DCL_VILLAGE_GROUP_TYPE = "dcl012"; // 村小组

	public static final String HELP_PROJECT = "dcl009"; // 帮扶项目
	public static final String HELP_PROJECT_MANAGE_MAP = "dcl002009"; // 帮扶项目地图

	public static final String PEOPLE_TYPE = "dcl066"; // 

	//公厕
	public static final String GC_WC_TYPE = "D900052";
	public static final String TOILET_ADDR = "D900053";
	public static final String WC_CLASS = "D900054";
	public static final String IS_SUPPORT = "D900033";
	public static final String BUILD_TIME = "D900031";
	public static final String DISPOSAL_EX_METHON = "D900032";

}
