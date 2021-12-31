package cn.ffcs.dcl.mybatis.domain.indexcontent;

import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 首页展示内容管理模块bo对象
 * @Author: xuewq
 * @Date: 12-13 15:07:25
 * @table: 表信息描述 T_INDEX_CONTENT 首页展示内容管理  首页vr和图集内容管理  序列SEQ_INDEX_CONTENT
 * @Copyright: 2021 福富软件
 */
public class IndexContent extends PageBean<IndexContent> implements  Serializable {

  private static final long serialVersionUID = 1L;

	private Long modularId; //主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String code; //code 	VARCHAR2(50)
	private String regionCode; //regionCode 	VARCHAR2(50)
	private String type; //展示类型 	VARCHAR2(2)
	private String url; //链接地址 	VARCHAR2(1000)
	private String isEnable; //是否启用 	CHAR(1)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	//  冗余字段

	private List<AttachmentByUUID> attList; //附件集合
	private String typeName; //展示类型中文 	01：图片集，02：VR
	private String isEnableName; //是否启用中文
	private Long[] attachmentId; //附件ID数组

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public List<AttachmentByUUID> getAttList() {
		return attList;
	}

	public void setAttList(List<AttachmentByUUID> attList) {
		this.attList = attList;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getIsEnableName() {
		return isEnableName;
	}

	public void setIsEnableName(String isEnableName) {
		this.isEnableName = isEnableName;
	}

	public Long[] getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Long[] attachmentId) {
		this.attachmentId = attachmentId;
	}

	public Long getModularId() {  //主键
		return modularId;
	}
	public void setModularId(Long modularId) { //主键
		this.modularId = modularId;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public String getType() {  //展示类型
		return type;
	}
	public void setType(String type) { //展示类型
		this.type = type;
	}
	public String getUrl() {  //链接地址
		return url;
	}
	public void setUrl(String url) { //链接地址
		this.url = url;
	}
	public String getIsEnable() {  //是否启用
		return isEnable;
	}
	public void setIsEnable(String isEnable) { //是否启用
		this.isEnable = isEnable;
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


}