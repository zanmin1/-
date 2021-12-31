package cn.ffcs.dcl.mybatis.domain.historydetail;

import cn.ffcs.dcl.mybatis.domain.base.Page;
import cn.ffcs.dcl.utils.PageBean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 历史推送详情模块bo对象
 * @Author: niguolong
 * @Date: 12-21 19:58:58
 * @table: 表信息描述 T_HISTORY_DETAIL 历史推送详情    序列SEQ_T_HISTORY_DETAIL
 * @Copyright: 2021 福富软件
 */
public class HistoryDetail extends Page implements Serializable {

  private static final long serialVersionUID = 1L;

	private String detailId; //推送详情主键 	VARCHAR2(32)
	private String peopleId;  //被推送人id;
	private String name; //姓名 	NUMBER(100)
	private String idcard; //身份证号 	VARCHAR2(18)
	private String sex; //性别 	VARCHAR2(20)
	private String party; //所属党支部 	VARCHAR2(200)
	private String type; //人员类型 	VARCHAR2(20)
	private Long phone; //手机号 	NUMBER(11)
	private String nation; //民族 	VARCHAR2(20)
	private String orgcode; //地域 	VARCHAR2(20)
	private String regionCode; //所属区域 	VARCHAR2(50)
	private String regionName; //所属区域名称 	VARCHAR2(200)
	private String addr; //地址 	VARCHAR2(200)
	private String status; //推送状态 	VARCHAR2(20)
	private String isValid; //数据有效性 	VARCHAR2(1)
	private Long creator; //创建人ID 	NUMBER(9)
	private String creatorName; //创建人姓名 	VARCHAR2(100)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人ID 	NUMBER(9)
	private String updatorName; //修改人姓名 	VARCHAR2(100)


	private List<String> delList; //批量删除集合



	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	private Date updateTime; //修改时间 	DATE
	private String parentId; //推送详情父节点主键 	VARCHAR2(32)
	private String pushId;
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

	public String getDetailId() {  //推送详情主键
		return detailId;
	}
	public void setDetailId(String detailId) { //推送详情主键
		this.detailId = detailId;
	}

	public String getName() { return name;}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdcard() {  //身份证号
		return idcard;
	}
	public void setIdcard(String idcard) { //身份证号
		this.idcard = idcard;
	}
	public String getSex() {  //性别
		return sex;
	}
	public void setSex(String sex) { //性别
		this.sex = sex;
	}
	public String getParty() {  //所属党支部
		return party;
	}
	public void setParty(String party) { //所属党支部
		this.party = party;
	}
	public String getType() {  //人员类型
		return type;
	}
	public void setType(String type) { //人员类型
		this.type = type;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	public String getNation() {  //民族
		return nation;
	}
	public void setNation(String nation) { //民族
		this.nation = nation;
	}
	public String getOrgcode() {  //地域
		return orgcode;
	}
	public void setOrgcode(String orgcode) { //地域
		this.orgcode = orgcode;
	}
	public String getAddr() {  //地址
		return addr;
	}
	public void setAddr(String addr) { //地址
		this.addr = addr;
	}
	public String getStatus() {  //推送状态
		return status;
	}
	public void setStatus(String status) { //推送状态
		this.status = status;
	}
	public String getIsValid() {  //数据有效性
		return isValid;
	}
	public void setIsValid(String isValid) { //数据有效性
		this.isValid = isValid;
	}
	public Long getCreator() {  //创建人ID
		return creator;
	}
	public void setCreator(Long creator) { //创建人ID
		this.creator = creator;
	}
	public String getCreatorName() {  //创建人姓名
		return creatorName;
	}
	public void setCreatorName(String creatorName) { //创建人姓名
		this.creatorName = creatorName;
	}
	public Date getCreateTime() {  //创建时间
		return createTime;
	}
	public void setCreateTime(Date createTime) { //创建时间
		this.createTime = createTime;
	}
	public Long getUpdator() {  //修改人ID
		return updator;
	}
	public void setUpdator(Long updator) { //修改人ID
		this.updator = updator;
	}
	public String getUpdatorName() {  //修改人姓名
		return updatorName;
	}
	public void setUpdatorName(String updatorName) { //修改人姓名
		this.updatorName = updatorName;
	}
	public Date getUpdateTime() {  //修改时间
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) { //修改时间
		this.updateTime = updateTime;
	}

	public String getPeopleId() {
		return peopleId;
	}

	public void setPeopleId(String peopleId) {
		this.peopleId = peopleId;
	}
	public List<String> getDelList() {
		return delList;
	}

	public void setDelList(List<String> delList) {
		this.delList = delList;
	}

	public String getPushId() {
		return pushId;
	}

	public void setPushId(String pushId) {
		this.pushId = pushId;
	}
}