package cn.ffcs.dcl.mybatis.domain.fundmanagement;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description: 资金管理表模块bo对象
 * @Author: 王文杰
 * @Date: 09-07 11:28:52
 * @table: 表信息描述 T_DV_FUND_MANAGEMENT 资金管理表  资金管理表  序列SEQ_T_DV_FUND_MANAGEMENT
 * @Copyright: 2021 福富软件
 */
public class FundManagement implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long assetId; //资金主键 	NUMBER(16)
	private String itemDescription; //事项说明 	VARCHAR2(200)
	private String dateOfOccur; //发生日期 	DATE
	private String inAndExTypeP; //收支类型(一级) 	VARCHAR2(20)
	private String typePName; //收支类型(一级)翻译 	VARCHAR2(20)

	private String inAndExTypeC; //收支类型(二级) 	VARCHAR2(20)

	private String typeCName; //收支类型(二级)翻译 	VARCHAR2(20)

	private Double amountIncurred; //发生金额 	NUMBER(10,2)
	private String orgCode; //所属行政村编码 	VARCHAR2(50)
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

	private BigDecimal sumPay; //总支付 	NUMBER(10,2)
	private BigDecimal sumIncome; //总收入 	NUMBER(10,2)
	private BigDecimal sumSurplus; //总结余 	NUMBER(10,2)


	public Long getAssetId() {  //资金主键
		return assetId;
	}
	public void setAssetId(Long assetId) { //资金主键
		this.assetId = assetId;
	}
	public String getItemDescription() {  //事项说明
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) { //事项说明
		this.itemDescription = itemDescription;
	}

	public String getInAndExTypeP() {  //收支类型(一级)
		return inAndExTypeP;
	}
	public void setInAndExTypeP(String inAndExTypeP) { //收支类型(一级)
		this.inAndExTypeP = inAndExTypeP;
	}
	public String getInAndExTypeC() {  //收支类型(二级)
		return inAndExTypeC;
	}
	public void setInAndExTypeC(String inAndExTypeC) { //收支类型(二级)
		this.inAndExTypeC = inAndExTypeC;
	}
	public Double getAmountIncurred() {  //发生金额
		return amountIncurred;
	}
	public void setAmountIncurred(Double amountIncurred) { //发生金额
		this.amountIncurred = amountIncurred;
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

	public String getDateOfOccur() {
		return dateOfOccur;
	}

	public void setDateOfOccur(String dateOfOccur) {
		this.dateOfOccur = dateOfOccur;
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

	public String getTypePName() {
		return typePName;
	}

	public void setTypePName(String typePName) {
		this.typePName = typePName;
	}

	public String getTypeCName() {
		return typeCName;
	}

	public void setTypeCName(String typeCName) {
		this.typeCName = typeCName;
	}


	public BigDecimal getSumPay() {
		return sumPay;
	}

	public void setSumPay(BigDecimal sumPay) {
		this.sumPay = sumPay;
	}

	public BigDecimal getSumIncome() {
		return sumIncome;
	}

	public void setSumIncome(BigDecimal sumIncome) {
		this.sumIncome = sumIncome;
	}

	public BigDecimal getSumSurplus() {
		return sumSurplus;
	}

	public void setSumSurplus(BigDecimal sumSurplus) {
		this.sumSurplus = sumSurplus;
	}
}