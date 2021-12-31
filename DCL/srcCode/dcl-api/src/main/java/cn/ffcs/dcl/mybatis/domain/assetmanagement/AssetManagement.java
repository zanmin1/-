package cn.ffcs.dcl.mybatis.domain.assetmanagement;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 资产管理表模块bo对象
 * @Author: 王文杰
 * @Date: 09-08 19:32:57
 * @table: 表信息描述 T_DV_ASSET_MANAGEMENT 资产管理表  资产管理表  序列SEQ_T_DV_ASSET_MANAGEMENT
 * @Copyright: 2021 福富软件
 */
public class AssetManagement implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long assetId; //资产主键 	NUMBER(16)
	private String assetName; //资产名称 	VARCHAR2(100)
	private String assetType; //资产分类 	VARCHAR2(3)

	private String typeName; //资产分类名称 	VARCHAR2(3)

	private String unit; //单位 	VARCHAR2(20)
	private Long numberr; //数量 	NUMBER(10)
	private String purchaseTime; //购置时间 	DATE
	private String storageLocation; //存放地点 	VARCHAR2(100)
	private Double assetValue; //资产价值 	NUMBER(9,2)
	private Double evaluation; //评估价值 	NUMBER(9,2)
	private String usage; //使用情况 	VARCHAR2(10)

	private String usageName; //使用情况名称 	VARCHAR2(10)

	private String checkInTime; //登记时间 	DATE
	private String checkInPerson; //登记人 	VARCHAR2(100)
	private String ownership; //所有权归属 	VARCHAR2(200)
	private String orgCode; //所属行政村编码 	VARCHAR2(50)
	private String uuid; //UUID 	VARCHAR2(50)
	private String orgName; //所属行政村名称 	VARCHAR2(100)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE


	public Long getAssetId() {  //资产主键
		return assetId;
	}
	public void setAssetId(Long assetId) { //资产主键
		this.assetId = assetId;
	}
	public String getAssetName() {  //资产名称
		return assetName;
	}
	public void setAssetName(String assetName) { //资产名称
		this.assetName = assetName;
	}
	public String getAssetType() {  //资产分类
		return assetType;
	}
	public void setAssetType(String assetType) { //资产分类
		this.assetType = assetType;
	}
	public String getUnit() {  //单位
		return unit;
	}
	public void setUnit(String unit) { //单位
		this.unit = unit;
	}

	public String getStorageLocation() {  //存放地点
		return storageLocation;
	}
	public void setStorageLocation(String storageLocation) { //存放地点
		this.storageLocation = storageLocation;
	}
	public Double getAssetValue() {  //资产价值
		return assetValue;
	}
	public void setAssetValue(Double assetValue) { //资产价值
		this.assetValue = assetValue;
	}
	public Double getEvaluation() {  //评估价值
		return evaluation;
	}
	public void setEvaluation(Double evaluation) { //评估价值
		this.evaluation = evaluation;
	}
	public String getUsage() {  //使用情况
		return usage;
	}
	public void setUsage(String usage) { //使用情况
		this.usage = usage;
	}

	public String getCheckInPerson() {  //登记人
		return checkInPerson;
	}
	public void setCheckInPerson(String checkInPerson) { //登记人
		this.checkInPerson = checkInPerson;
	}
	public String getOwnership() {  //所有权归属
		return ownership;
	}
	public void setOwnership(String ownership) { //所有权归属
		this.ownership = ownership;
	}
	public String getOrgCode() {  //所属行政村编码
		return orgCode;
	}
	public void setOrgCode(String orgCode) { //所属行政村编码
		this.orgCode = orgCode;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public String getOrgName() {  //所属行政村名称
		return orgName;
	}
	public void setOrgName(String orgName) { //所属行政村名称
		this.orgName = orgName;
	}
	public String getRemark() {  //备注
		return remark;
	}
	public void setRemark(String remark) { //备注
		this.remark = remark;
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
	public Long getUpdator() {  //修改人
		return updator;
	}
	public void setUpdator(Long updator) { //修改人
		this.updator = updator;
	}
	public Date getUpdateTime() {  //修改时间
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) { //修改时间
		this.updateTime = updateTime;
	}

	public String getPurchaseTime() {
		return purchaseTime;
	}

	public void setPurchaseTime(String purchaseTime) {
		this.purchaseTime = purchaseTime;
	}

	public String getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getUsageName() {
		return usageName;
	}

	public void setUsageName(String usageName) {
		this.usageName = usageName;
	}

	public Long getNumberr() {
		return numberr;
	}

	public void setNumberr(Long numberr) {
		this.numberr = numberr;
	}
}