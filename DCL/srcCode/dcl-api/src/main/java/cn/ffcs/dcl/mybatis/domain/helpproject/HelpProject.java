package cn.ffcs.dcl.mybatis.domain.helpproject;

import cn.ffcs.dcl.utils.DateUtils;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 帮扶项目模块bo对象
 * @Author: zhengby
 * @Date: 10-19 18:01:48
 * @table: 表信息描述 T_HELP_PROJECT 帮扶项目  帮扶项目  序列SEQ_T_HELP_PROJECT
 * @Copyright: 2021 福富软件
 */
public class HelpProject implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long helpProjectId; //主键ID 	NUMBER(16)
	private String uuId; //唯一标识 	VARCHAR2(32)
	private String helpProjectName; //项目名称 	VARCHAR2(100)
	private String projectType; //项目类型 	VARCHAR2(10)
	private String projectTypeStr; //项目类型Str 	VARCHAR2(10)
	private String prijectStatus; //项目状态 	VARCHAR2(30)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projectStartTime; //项目起止时间 	DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projectEndTime; //项目开始时间 	DATE

	private String projectStartTimeStr; //项目起止时间 	DATE
	private String projectEndTimeStr; //项目开始时间 	DATE

	private String imUnit; //实施单位 	VARCHAR2(100)
	private String imUnitContractPerson; //实施单位联系人 	VARCHAR2(100)
	private String imUnitTel; //实施单位联系电话 	VARCHAR2(30)
	private String projectLocation; //项目地点 	VARCHAR2(100)
	private String x; //X 	VARCHAR2(100)
	private String y; //Y 	VARCHAR2(100)
	private String t_x;//经度（保存用）
	private String t_y;//纬度（保存用）
	private String projectDesc; //项目概况 	VARCHAR2(500)
	private String orgCode; //所属区域 	VARCHAR2(32)
	private String orgName; //所属区域名称 	VARCHAR2(100)
	private String isValid; //数据状态 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //更新人 	NUMBER(16)
	private Date updateTime; //更新时间 	DATE
	private String remark; //备注 	VARCHAR2(500)
	private Long[] attachmentId;//附件ID数组
	private List<AttachmentByUUID> attList;//附件对象集合

	public String getProjectTypeStr() {
		return projectTypeStr;
	}

	public void setProjectTypeStr(String projectTypeStr) {
		this.projectTypeStr = projectTypeStr;
	}

	public Long[] getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Long[] attachmentId) {
		this.attachmentId = attachmentId;
	}

	public List<AttachmentByUUID> getAttList() {
		return attList;
	}

	public void setAttList(List<AttachmentByUUID> attList) {
		this.attList = attList;
	}

	public String getProjectStartTimeStr() {
		return projectStartTimeStr;
	}

	public void setProjectStartTimeStr(String projectStartTimeStr) {
		this.projectStartTimeStr = projectStartTimeStr;
		try {
			this.setProjectStartTime(DateUtils.convertStringToDate(projectStartTimeStr,DateUtils.PATTERN_DATE));
		}catch (Exception e){

		}
	}

	public String getProjectEndTimeStr() {
		return projectEndTimeStr;
	}

	public void setProjectEndTimeStr(String projectEndTimeStr) {
		this.projectEndTimeStr = projectEndTimeStr;
		try {
			this.setProjectEndTime(DateUtils.convertStringToDate(projectEndTimeStr,DateUtils.PATTERN_DATE));
		}catch (Exception e){

		}
	}

	public Date getProjectStartTime() {
		return projectStartTime;
	}

	public void setProjectStartTime(Date projectStartTime) {
		this.projectStartTime = projectStartTime;
	}

	public Date getProjectEndTime() {
		return projectEndTime;
	}

	public void setProjectEndTime(Date projectEndTime) {
		this.projectEndTime = projectEndTime;
	}

	public String getT_x() {
		return t_x;
	}

	public void setT_x(String t_x) {
		this.t_x = t_x;
	}

	public String getT_y() {
		return t_y;
	}

	public void setT_y(String t_y) {
		this.t_y = t_y;
	}

	public Long getHelpProjectId() {  //主键ID
		return helpProjectId;
	}
	public void setHelpProjectId(Long helpProjectId) { //主键ID
		this.helpProjectId = helpProjectId;
	}
	public String getUuId() {  //唯一标识
		return uuId;
	}
	public void setUuId(String uuId) { //唯一标识
		this.uuId = uuId;
	}
	public String getHelpProjectName() {  //项目名称
		return helpProjectName;
	}
	public void setHelpProjectName(String helpProjectName) { //项目名称
		this.helpProjectName = helpProjectName;
	}
	public String getProjectType() {  //项目类型
		return projectType;
	}
	public void setProjectType(String projectType) { //项目类型
		this.projectType = projectType;
	}
	public String getPrijectStatus() {  //项目状态
		return prijectStatus;
	}
	public void setPrijectStatus(String prijectStatus) { //项目状态
		this.prijectStatus = prijectStatus;
	}
	public String getImUnit() {  //实施单位
		return imUnit;
	}
	public void setImUnit(String imUnit) { //实施单位
		this.imUnit = imUnit;
	}
	public String getImUnitContractPerson() {  //实施单位联系人
		return imUnitContractPerson;
	}
	public void setImUnitContractPerson(String imUnitContractPerson) { //实施单位联系人
		this.imUnitContractPerson = imUnitContractPerson;
	}
	public String getImUnitTel() {  //实施单位联系电话
		return imUnitTel;
	}
	public void setImUnitTel(String imUnitTel) { //实施单位联系电话
		this.imUnitTel = imUnitTel;
	}
	public String getProjectLocation() {  //项目地点
		return projectLocation;
	}
	public void setProjectLocation(String projectLocation) { //项目地点
		this.projectLocation = projectLocation;
	}
	public String getX() {  //X
		return x;
	}
	public void setX(String x) { //X
		this.x = x;
	}
	public String getY() {  //Y
		return y;
	}
	public void setY(String y) { //Y
		this.y = y;
	}
	public String getProjectDesc() {  //项目概况
		return projectDesc;
	}
	public void setProjectDesc(String projectDesc) { //项目概况
		this.projectDesc = projectDesc;
	}
	public String getOrgCode() {  //所属区域
		return orgCode;
	}
	public void setOrgCode(String orgCode) { //所属区域
		this.orgCode = orgCode;
	}
	public String getOrgName() {  //所属区域名称
		return orgName;
	}
	public void setOrgName(String orgName) { //所属区域名称
		this.orgName = orgName;
	}
	public String getIsValid() {  //数据状态
		return isValid;
	}
	public void setIsValid(String isValid) { //数据状态
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
	public String getRemark() {  //备注
		return remark;
	}
	public void setRemark(String remark) { //备注
		this.remark = remark;
	}


}