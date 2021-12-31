package cn.ffcs.common.utils.domain;

import javax.servlet.http.HttpSession;

import cn.ffcs.common.utils.ConstantValue;

public enum App implements IDomain {
	/**
	 * 顶级域名
	 */
	TOP("$TOP_DOMAIN", false, "http://gd.fjsq.org:9095/gmis", IDomain.LOCAL), 
	/**
	 * 综治网格应用 例:http://gd.fjsq.org/zzgrid
	 */
	ZZGRID("$ZZGRID_DOMAIN", false, "http://gd.bug.aishequ.org/zzgrid", IDomain.REMOTE), 
	/**
	 * 事件应用 例:http://event.fjsq.org/zhsq_event
	 */
	
		EVENT("$EVENT_DOMAIN", false, "", IDomain.REMOTE), 
		//EVENT("$EVENT_DOMAIN", true, "http://gd.fjsq.org:8450/zhsq_event", IDomain.REMOTE), 
	
	/**
	 * 系统管理应用 例:http://sysdev.fjsq.org
	 */
	SYSTEM("$SYSTEM_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 公共样式应用 例:http://static.aishequ.org
	 */
	UI("$UI_DOMAIN", false, "http://static.bug.aishequ.org", IDomain.REMOTE), 
	/**
	 * GMIS应用 例:http://gmis.fjsq.org/gmis
	 */
	
	//	GMIS("$GMIS_DOMAIN", false, "", IDomain.REMOTE), 
	GMIS("$GMIS_DOMAIN", false, "http://gd.fjsq.org:8990/gmis", IDomain.REMOTE), 
	
	
	/**
	 * 人口应用 例:http://rs.fjsq.org
	 */
	RS("$RS_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 文件服务应用 例:http://img.fjsq.org
	 */
	IMG("$IMG_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 附件预览
	 */
	SKY("$SKY_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 文件服务应用（域名有包含【/zzgrid/】） 例:http://img.fjsq.org/zzgrid/
	 */
	IMG_ZZGRID("$IMG_ZZGRID_DOMAIN", false, "", IDomain.LOCAL), 
	/**
	 * 工作流应用 例:http://workflow.fjsq.org/workflow
	 */
	WORKFLOW("$WORKFLOW_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 旧地图 例:http://map.fjsq.org
	 */
	OLD_GIS_MAP("$OLD_GIS_MAP_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 消息应用 例:http://newsms.fjsq.org
	 */
	SMS("$SMS_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * UAM应用 例:http://uam.ygj.aishequ.org
	 */
	UAM("$UAM_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 导入导出应用 例:http://bd.fjsq.org
	 */
	IMPEXP("$IMPEXP_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 资源应用 例:http://res.fjsq.org
	 */
	RESOURCE("$RESOURCE_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 报表应用 例:http://bi.fjsq.org
	 */
	BI("$BI_DOMAIN", false, "", IDomain.REMOTE), 
	/**
	 * 水纹应用 例:http://water.fjsq.org/water
	 */
	WATER("$WATER_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 楼宇经济应用 例:http://lyjj.fjsq.org:8080/lyjj
	 */
	LYJJ("$LYJJ_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 消防网格应用 例:http://fire.fjsq.org:8080/fire
	 */
	FIREGRID("$FIREGRID_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 工商网格应用 例:http://icgrid.fjsq.org:8080/icgrid
	 */
	ICGRID("$ICGRID_DOMAIN", false, "", IDomain.REMOTE),
	
	/**
	 * 新导入导出应用 例:http://newbdio.fjsq.org
	 */
	NEWIMPEXP("$IMPEXP_NEW_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * 附件上传应用:http://filedev.fjsq.org
	 */
	SQFILE("$SQ_FILE_DOMAIN", false, "", IDomain.REMOTE),

	COMPONENTS("$COMPONENTS_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * GIS工程
	 */
	GIS("$GIS_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * dj工程
	 */
	DJ("$DJ_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * gbp工程
	 */
	GBP("$GBP_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * WECHAT工程
	 */
	WECHAT("$WECHAT_DOMAIN", false, "", IDomain.REMOTE),
	/**
	 * iot工程
	 */
	IOT("$IOT_DOMAIN", false, "", IDomain.REMOTE),

	/**
	 * CS工程
	 */
	CS("$CS_DOMAIN", false, "", IDomain.REMOTE);

	private String code;
	private boolean debug;
	private String debugUrl;
	private int type;

	private App(String code, boolean isDebug, String debugUrl, int type) {
		this.code = code;
		this.debug = isDebug;
		this.debugUrl = debugUrl;
		this.type = type;
	}

	@Override
	public String toString() {
		return this.code;
	}

	@Override
	public boolean isDebug() {
		return this.debug;
	}

	@Override
	public String getCode() {
		return this.code;
	}

	@Override
	public String getDomain(HttpSession session) {
		String domain = (String) session.getAttribute(this.code);
		if (!ConstantValue.IS_PRODUCT && this.debug) {
			domain = this.getDebugUrl();
		}
		return domain;
	}

	@Override
	public int getType() {
		return this.type;
	}

	@Override
	public String getDebugUrl() {
		return this.debugUrl;
	}
	
}
