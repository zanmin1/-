package cn.ffcs.dcl.mybatis.domain.restoilet;

import cn.ffcs.dcl.utils.PageBean;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 公厕配备信息表模块bo对象
 * @Author: linguoxiong
 * @Date: 09-09 18:03:54
 * @table: 表信息描述 T_RES_TOILET_EQUIP 公厕配备信息表
序列：SEQ_RG_TOILET_EQUIP
  公厕配备信息表
序列：SEQ_RG_TOILET_EQUIP
  序列SEQ_T_RES_TOILET_EQUIP
 * @Copyright: 2021 福富软件
 */
public class ToiletEquip extends PageBean<ToiletEquip> implements Serializable {

   private static final long serialVersionUID = 1L;

	private Long resToiletEquipId; //厕所ID 	NUMBER(20)
	private Long truckNum; //村级配备吸污车数量（辆）（填写，单位为“辆”） 	NUMBER(10)
	private Long pumpNum; //村级配备吸污泵数量（个）（填写，单位为“个”） 	NUMBER(10)
	private String otherFacil; //村级配备其他设施（列举名称及数量）（填写） 	VARCHAR2(200)
	private String isProfessTeam; //是否有专业维护队伍 	VARCHAR2(20)
	private Long termUserNum; //维护队伍人数（人）（填写，单位为“人”） 	NUMBER(10)
	private String isFunds; //是否有维护经费（单选） 	VARCHAR2(20)
	private Double yearFunds; //年度维护经费（元）（填写，单位为“元”） 	NUMBER(10,2)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fillingDate; //填表日期（填写，限定日期格式输入） 	DATE

	private String fillingDateStr; //填表日期（填写，限定日期格式输入） 	String

	private String fillingUser; //填表人（填写） 	VARCHAR2(50)
	private String mobilePhone; //联系电话（填写，校验11位阿拉伯数字输入） 	VARCHAR2(20)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建人时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private String uuid; //UUID 	VARCHAR2(50)
	private String reOrgCode; //所属区域编码 	VARCHAR2(30)
	private String regionName; //所属区域名称 	VARCHAR2(200)
	private String orgCode; //组织编码 	VARCHAR2(24)
	private Integer toiletNum; //已建公厕数量（座） 	NUMBER(3)

	private String isProfessTeamCN; //
	private String isFundsCN; //

	private Long wcNum; // 	NUMBER(10)

	private String ds;//地市
	private String xq;//县区
	private String xz;//乡镇
	private String csq;//村社区

	private List<String> wcIds;

	private String guid; //guid

	public String getIsProfessTeamCN() {
		return isProfessTeamCN;
	}

	public void setIsProfessTeamCN(String isProfessTeamCN) {
		this.isProfessTeamCN = isProfessTeamCN;
	}

	public String getIsFundsCN() {
		return isFundsCN;
	}

	public void setIsFundsCN(String isFundsCN) {
		this.isFundsCN = isFundsCN;
	}

	public String getFillingDateStr() {
		return fillingDateStr;
	}

	public void setFillingDateStr(String fillingDateStr) {
		this.fillingDateStr = fillingDateStr;
	}

	public Long getResToiletEquipId() {  //厕所ID
		return resToiletEquipId;
	}
	public void setResToiletEquipId(Long resToiletEquipId) { //厕所ID
		this.resToiletEquipId = resToiletEquipId;
	}
	public Long getTruckNum() {  //村级配备吸污车数量（辆）（填写，单位为“辆”）
		return truckNum;
	}
	public void setTruckNum(Long truckNum) { //村级配备吸污车数量（辆）（填写，单位为“辆”）
		this.truckNum = truckNum;
	}
	public Long getPumpNum() {  //村级配备吸污泵数量（个）（填写，单位为“个”）
		return pumpNum;
	}
	public void setPumpNum(Long pumpNum) { //村级配备吸污泵数量（个）（填写，单位为“个”）
		this.pumpNum = pumpNum;
	}
	public String getOtherFacil() {  //村级配备其他设施（列举名称及数量）（填写）
		return otherFacil;
	}
	public void setOtherFacil(String otherFacil) { //村级配备其他设施（列举名称及数量）（填写）
		this.otherFacil = otherFacil;
	}
	public String getIsProfessTeam() {  //是否有专业维护队伍
		return isProfessTeam;
	}
	public void setIsProfessTeam(String isProfessTeam) { //是否有专业维护队伍
		this.isProfessTeam = isProfessTeam;
	}
	public Long getTermUserNum() {  //维护队伍人数（人）（填写，单位为“人”）
		return termUserNum;
	}
	public void setTermUserNum(Long termUserNum) { //维护队伍人数（人）（填写，单位为“人”）
		this.termUserNum = termUserNum;
	}
	public String getIsFunds() {  //是否有维护经费（单选）
		return isFunds;
	}
	public void setIsFunds(String isFunds) { //是否有维护经费（单选）
		this.isFunds = isFunds;
	}
	public Double getYearFunds() {  //年度维护经费（元）（填写，单位为“元”）
		return yearFunds;
	}
	public void setYearFunds(Double yearFunds) { //年度维护经费（元）（填写，单位为“元”）
		this.yearFunds = yearFunds;
	}
	public Date getFillingDate() {  //填表日期（填写，限定日期格式输入）
		return fillingDate;
	}
	public void setFillingDate(Date fillingDate) { //填表日期（填写，限定日期格式输入）
		this.fillingDate = fillingDate;
	}
	public String getFillingUser() {  //填表人（填写）
		return fillingUser;
	}
	public void setFillingUser(String fillingUser) { //填表人（填写）
		this.fillingUser = fillingUser;
	}
	public String getMobilePhone() {  //联系电话（填写，校验11位阿拉伯数字输入）
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) { //联系电话（填写，校验11位阿拉伯数字输入）
		this.mobilePhone = mobilePhone;
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
	public Date getCreateTime() {  //创建人时间
		return createTime;
	}
	public void setCreateTime(Date createTime) { //创建人时间
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

	public List<String> getWcIds() {
		return wcIds;
	}

	public void setWcIds(List<String> wcIds) {
		this.wcIds = wcIds;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getReOrgCode() {
		return reOrgCode;
	}

	public void setReOrgCode(String reOrgCode) {
		this.reOrgCode = reOrgCode;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public Long getWcNum() {
		return wcNum;
	}

	public void setWcNum(Long wcNum) {
		this.wcNum = wcNum;
	}

	public Integer getToiletNum() {
		return toiletNum;
	}

	public void setToiletNum(Integer toiletNum) {
		this.toiletNum = toiletNum;
	}

	public String getDs() {
		return ds;
	}

	public void setDs(String ds) {
		this.ds = ds;
	}

	public String getXq() {
		return xq;
	}

	public void setXq(String xq) {
		this.xq = xq;
	}

	public String getXz() {
		return xz;
	}

	public void setXz(String xz) {
		this.xz = xz;
	}

	public String getCsq() {
		return csq;
	}

	public void setCsq(String csq) {
		this.csq = csq;
	}

	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
	}
}