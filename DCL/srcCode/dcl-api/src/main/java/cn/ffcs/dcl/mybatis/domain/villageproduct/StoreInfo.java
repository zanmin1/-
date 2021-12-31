package cn.ffcs.dcl.mybatis.domain.villageproduct;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 商家信息模块bo对象
 * @Author: 张志杰
 * @Date: 12-20 20:01:16
 * @table: 表信息描述 T_STORE_INFO 商家信息  商家信息  序列SEQ_T_STORE_INFO
 * @Copyright: 2021 福富软件
 */
public class StoreInfo implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long storeId; //商家ID 	NUMBER(16)
	private String businessID; //商家OUTID 	VARCHAR2(100)
	private String businessName; //商家名称 	VARCHAR2(100)
	private String code; //商家归属村庄 	VARCHAR2(100)
	private String OrgName; //商家归属村庄 	VARCHAR2(100)
	private String status; //状态 	VARCHAR2(10)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(9)
	private Date createTime; //创建时间 	TIMESTAMP
	private Long updator; //更新人 	NUMBER(9)
	private Date updateTime; //更新时间 	TIMESTAMP
    private String action;//操作类型
    private String timeStamp;//时间戳
    private String auth;//校验
    private String appID;//平台ID


	public Long getStoreId() {  //商家ID
		return storeId;
	}
	public void setStoreId(Long storeId) { //商家ID
		this.storeId = storeId;
	}
	public String getBusinessID() {  //商家OUTID
		return businessID;
	}
	public void setBusinessID(String businessID) { //商家OUTID
		this.businessID = businessID;
	}
	public String getBusinessName() {  //商家名称
		return businessName;
	}
	public void setBusinessName(String businessName) { //商家名称
		this.businessName = businessName;
	}
	public String getCode() {  //商家归属村庄
		return code;
	}
	public void setCode(String code) { //商家归属村庄
		this.code = code;
	}
	public String getStatus() {  //状态
		return status;
	}
	public void setStatus(String status) { //状态
		this.status = status;
	}
	public String getIsValid() {  //是否有效
		return isValid;
	}
	public void setIsValid(String isValid) { //是否有效
		this.isValid = isValid;
	}
	public Long getCreator() {  //创建人
		return creator;
	}
	public void setCreator(Long creator) { //创建人
		this.creator = creator;
	}
	public Date getCreateTime() {  //创建时间
		return createTime;
	}
	public void setCreateTime(Date createTime) { //创建时间
		this.createTime = createTime;
	}
	public Long getUpdator() {  //更新人
		return updator;
	}
	public void setUpdator(Long updator) { //更新人
		this.updator = updator;
	}
	public Date getUpdateTime() {  //更新时间
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) { //更新时间
		this.updateTime = updateTime;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getAppID() {
		return appID;
	}
	public void setAppID(String appID) {
		this.appID = appID;
	}
	public String getOrgName() {
		return OrgName;
	}
	public void setOrgName(String orgName) {
		OrgName = orgName;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}


}