package cn.ffcs.dcl.mybatis.domain.vaccinationsite;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 疫苗接种点模块bo对象
 * @Author: luchch
 * @Date: 12-14 15:09:21
 * @table: 表信息描述 T_VACCINATION_SITE 疫苗接种点  疫苗接种点表  序列SEQ_T_VACCINATION_SITE
 * @Copyright: 2021 福富软件
 */
public class VaccinationSite implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long vaccinationsiteId; //疫苗接种点主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String vaccinationsiteName; //疫苗接种点名称 	VARCHAR2(200)
	private String vaccinationTime; //疫苗接种时间 	VARCHAR2(200)
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

	public Long getVaccinationsiteId() {  //疫苗接种点主键
		return vaccinationsiteId;
	}
	public void setVaccinationsiteId(Long vaccinationsiteId) { //疫苗接种点主键
		this.vaccinationsiteId = vaccinationsiteId;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public String getVaccinationsiteName() {  //疫苗接种点名称
		return vaccinationsiteName;
	}
	public void setVaccinationsiteName(String vaccinationsiteName) { //疫苗接种点名称
		this.vaccinationsiteName = vaccinationsiteName;
	}
	public String getVaccinationTime() {  //疫苗接种时间
		return vaccinationTime;
	}
	public void setVaccinationTime(String vaccinationTime) { //疫苗接种时间
		this.vaccinationTime = vaccinationTime;
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