package cn.ffcs.dcl.mybatis.domain.base;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 甘肃公文附件模块bo对象
 * @Author: wtl
 * @Date: 10-25 10:20:43
 * @Copyright: 2018 福富软件
 */
public class DocTemplate implements Serializable {

	private Long templateId; //主键
	private String templateName; //公文模板名称
	private String useOrgainze; //使用组织
	private String orgCode; //组织code
	private String orgName; //组织名称(模板层级)
	private Long uploadUserId; //上传人员id
	private String uploadName; //上传人员名字
	private Date uploadTime; //上传时间
	private String attName; //附件名称
	private String state; //数据有效性(1:有效,0:无效)
	private String filePath; //附件路劲
	private String uploadTimeStr; //上传人员名字


	public String getUploadTimeStr() {
		return uploadTimeStr;
	}
	public void setUploadTimeStr(String uploadTimeStr) {
		this.uploadTimeStr = uploadTimeStr;
	}
	public Long getTemplateId() {
		return templateId;
	}
	public void setTemplateId(Long templateId) {
		this.templateId = templateId;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public String getUseOrgainze() {
		return useOrgainze;
	}
	public void setUseOrgainze(String useOrgainze) {
		this.useOrgainze = useOrgainze;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public Long getUploadUserId() {
		return uploadUserId;
	}
	public void setUploadUserId(Long uploadUserId) {
		this.uploadUserId = uploadUserId;
	}
	public String getUploadName() {
		return uploadName;
	}
	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


}