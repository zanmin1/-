package cn.ffcs.dcl.mybatis.domain.voiceGroup;

import cn.ffcs.dcl.mybatis.domain.base.Page;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 语音群组表模块bo对象
 * @Author: 王文杰
 * @Date: 12-27 16:41:33
 * @table: 表信息描述 T_VOICE_GROUP     序列SEQ_T_VOICE_GROUP
 * @Copyright: 2021 福富软件
 */
public class VoiceGroup extends Page implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long groupId; // 	NUMBER(16)
	private String orgCode; //所属行政村编码 	VARCHAR2(50)
	private String uuid; //UUID 	VARCHAR2(50)
	private String orgName; //所属行政村名称 	VARCHAR2(100)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private String name; //名字 	VARCHAR2(50)


	public Long getGroupId() {  
		return groupId;
	}
	public void setGroupId(Long groupId) { 
		this.groupId = groupId;
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
	public String getName() {  //名字
		return name;
	}
	public void setName(String name) { //名字
		this.name = name;
	}


}