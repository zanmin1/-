package cn.ffcs.dcl.mybatis.domain.vaccinationstatus;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 疫苗接种情况模块bo对象
 * @Author: luchch
 * @Date: 12-14 15:08:31
 * @table: 表信息描述 T_VACCINATION_STATUS 疫苗接种情况  疫苗接种情况表  序列SEQ_T_VACCINATION_STATUS
 * @Copyright: 2021 福富软件
 */
public class VaccinationStatus implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long vaccinationstatusId; //疫苗接种情况主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private Long nonvaccinationpersonsNumber; //未接种人数 	NUMBER(9)
	private Long vaccinationpersonsNumber; //已接种人数 	NUMBER(9)
	private Long firstvaccinationNumber; //完成第一针接种人数 	NUMBER(9)
	private Long secondvaccinationNumber; //完成第二针接种人 	NUMBER(9)
	private Long thirdvaccinationNumber; //完成第三针接种人 	NUMBER(9)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private String remark; //备注 	VARCHAR2(200)
	private String regionCode; // 所属于区域
	private String regionName; // 所属区域名称

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public Long getVaccinationstatusId() {  //疫苗接种情况主键
		return vaccinationstatusId;
	}
	public void setVaccinationstatusId(Long vaccinationstatusId) { //疫苗接种情况主键
		this.vaccinationstatusId = vaccinationstatusId;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public Long getNonvaccinationpersonsNumber() {  //未接种人数
		return nonvaccinationpersonsNumber;
	}
	public void setNonvaccinationpersonsNumber(Long nonvaccinationpersonsNumber) { //未接种人数
		this.nonvaccinationpersonsNumber = nonvaccinationpersonsNumber;
	}
	public Long getVaccinationpersonsNumber() {  //已接种人数
		return vaccinationpersonsNumber;
	}
	public void setVaccinationpersonsNumber(Long vaccinationpersonsNumber) { //已接种人数
		this.vaccinationpersonsNumber = vaccinationpersonsNumber;
	}
	public Long getFirstvaccinationNumber() {  //完成第一针接种人数
		return firstvaccinationNumber;
	}
	public void setFirstvaccinationNumber(Long firstvaccinationNumber) { //完成第一针接种人数
		this.firstvaccinationNumber = firstvaccinationNumber;
	}
	public Long getSecondvaccinationNumber() {  //完成第二针接种人
		return secondvaccinationNumber;
	}
	public void setSecondvaccinationNumber(Long secondvaccinationNumber) { //完成第二针接种人
		this.secondvaccinationNumber = secondvaccinationNumber;
	}
	public Long getThirdvaccinationNumber() {  //完成第三针接种人
		return thirdvaccinationNumber;
	}
	public void setThirdvaccinationNumber(Long thirdvaccinationNumber) { //完成第三针接种人
		this.thirdvaccinationNumber = thirdvaccinationNumber;
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
	public String getRemark() {  //备注
		return remark;
	}
	public void setRemark(String remark) { //备注
		this.remark = remark;
	}


}