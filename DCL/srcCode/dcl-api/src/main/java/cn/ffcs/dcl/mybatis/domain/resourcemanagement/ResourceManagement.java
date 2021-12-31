package cn.ffcs.dcl.mybatis.domain.resourcemanagement;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 资源管理表模块bo对象
 * @Author: 王文杰
 * @Date: 09-09 15:04:53
 * @table: 表信息描述 T_DV_RESOURCE_MANAGEMENT 资源管理表  资源管理表  序列SEQ_T_DV_RESOURCE_MANAGEMENT
 * @Copyright: 2021 福富软件
 */
public class ResourceManagement implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long resourceId; //资源主键 	NUMBER(16)

	private String resourceName; //资源名称 	VARCHAR2(100)

	private String resourceType; //资源分类 	VARCHAR2(3)

	private String typeName; //资源分类名称	VARCHAR2(3)

	private String unit; //单位 	VARCHAR2(20)

	private Long number; //数量 	NUMBER(10)

	private String resourceDesc; //资源描述 	VARCHAR2(500)

	private String ownership; //所有权归属 	VARCHAR2(200)
	private String utilization; //利用情况 	VARCHAR2(200)
	private String contractor; //承包人 	VARCHAR2(100)
	private String contractorTel; //承包人联系方式 	VARCHAR2(20)
	private String contractPeriod; //承包期限 	VARCHAR2(100)
	private Double contractAmount; //承包金额 	NUMBER(10,2)
	private String contractPayMethod; //承包金交纳方式 	VARCHAR2(100)
	private String orgCode; //所属行政村编码 	VARCHAR2(50)
	private String checkInPerson; //登记人 	VARCHAR2(100)
	private String checkInTime; //登记时间 	DATE
	private String uuid; //UUID 	VARCHAR2(50)
	private String orgName; //所属行政村名称 	VARCHAR2(100)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE


	private String startTime; //发生开始时间 	DATE

	private String endTime; //发生结束时间 	DATE


	public Long getResourceId() {  //资源主键
		return resourceId;
	}
	public void setResourceId(Long resourceId) { //资源主键
		this.resourceId = resourceId;
	}
	public String getResourceName() {  //资源名称
		return resourceName;
	}
	public void setResourceName(String resourceName) { //资源名称
		this.resourceName = resourceName;
	}
	public String getResourceType() {  //资源分类
		return resourceType;
	}
	public void setResourceType(String resourceType) { //资源分类
		this.resourceType = resourceType;
	}
	public String getUnit() {  //单位
		return unit;
	}
	public void setUnit(String unit) { //单位
		this.unit = unit;
	}
	public Long getNumber() {  //数量
		return number;
	}
	public void setNumber(Long number) { //数量
		this.number = number;
	}
	public String getResourceDesc() {  //资源描述
		return resourceDesc;
	}
	public void setResourceDesc(String resourceDesc) { //资源描述
		this.resourceDesc = resourceDesc;
	}
	public String getOwnership() {  //所有权归属
		return ownership;
	}
	public void setOwnership(String ownership) { //所有权归属
		this.ownership = ownership;
	}
	public String getUtilization() {  //利用情况
		return utilization;
	}
	public void setUtilization(String utilization) { //利用情况
		this.utilization = utilization;
	}
	public String getContractor() {  //承包人
		return contractor;
	}
	public void setContractor(String contractor) { //承包人
		this.contractor = contractor;
	}
	public String getContractorTel() {  //承包人联系方式
		return contractorTel;
	}
	public void setContractorTel(String contractorTel) { //承包人联系方式
		this.contractorTel = contractorTel;
	}
	public String getContractPeriod() {  //承包期限
		return contractPeriod;
	}
	public void setContractPeriod(String contractPeriod) { //承包期限
		this.contractPeriod = contractPeriod;
	}
	public Double getContractAmount() {  //承包金额
		return contractAmount;
	}
	public void setContractAmount(Double contractAmount) { //承包金额
		this.contractAmount = contractAmount;
	}
	public String getContractPayMethod() {  //承包金交纳方式
		return contractPayMethod;
	}
	public void setContractPayMethod(String contractPayMethod) { //承包金交纳方式
		this.contractPayMethod = contractPayMethod;
	}
	public String getOrgCode() {  //所属行政村编码
		return orgCode;
	}
	public void setOrgCode(String orgCode) { //所属行政村编码
		this.orgCode = orgCode;
	}
	public String getCheckInPerson() {  //登记人
		return checkInPerson;
	}
	public void setCheckInPerson(String checkInPerson) { //登记人
		this.checkInPerson = checkInPerson;
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

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
}