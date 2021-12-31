package cn.ffcs.dcl.mybatis.domain.voicePeople;

import cn.ffcs.dcl.mybatis.domain.base.Page;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 语音人员表模块bo对象
 * @Author: 王文杰
 * @Date: 12-24 15:54:18
 * @table: 表信息描述 T_VOICE_PEOPLE 语音人员表  语音人员表  序列SEQ_T_VOICE_PEOPLE
 * @Copyright: 2021 福富软件
 */
public class VoicePeople extends Page implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long peopleId; //主键 	NUMBER(16)
	private String name; //名字 	VARCHAR2(50)
	private String sex; //性别 	CHAR(1)
	private String sexStr; //性别 	CHAR(1)
	private String address; //地址 	VARCHAR2(200)
	private String tel; //电话 	VARCHAR2(50)
	private String peopleType; // 	VARCHAR2(2)


	private String orgCode; //所属行政村编码 	VARCHAR2(50)
	private String uuid; //UUID 	VARCHAR2(50)
	private String orgName; //所属行政村名称 	VARCHAR2(100)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE

	private Long[] attachmentId;//附件ID数组
	private List<AttachmentByUUID> attList;//附件对象集合

	private String[] vIds;//选择ID数组

	private String  mp3Url ;


	public String getSexStr() {
		return sexStr;
	}

	public void setSexStr(String sexStr) {
		this.sexStr = sexStr;
	}

	public Long getPeopleId() {  //主键
		return peopleId;
	}
	public void setPeopleId(Long peopleId) { //主键
		this.peopleId = peopleId;
	}
	public String getName() {  //名字
		return name;
	}
	public void setName(String name) { //名字
		this.name = name;
	}
	public String getSex() {  //性别
		return sex;
	}
	public void setSex(String sex) { //性别
		this.sex = sex;
	}
	public String getAddress() {  //地址
		return address;
	}
	public void setAddress(String address) { //地址
		this.address = address;
	}
	public String getTel() {  //电话
		return tel;
	}
	public void setTel(String tel) { //电话
		this.tel = tel;
	}
	public String getPeopleType() {  
		return peopleType;
	}
	public void setPeopleType(String peopleType) { 
		this.peopleType = peopleType;
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

	public String[] getvIds() {
		return vIds;
	}

	public void setvIds(String[] vIds) {
		this.vIds = vIds;
	}

	public String getMp3Url() {
		return mp3Url;
	}

	public void setMp3Url(String mp3Url) {
		this.mp3Url = mp3Url;
	}
}