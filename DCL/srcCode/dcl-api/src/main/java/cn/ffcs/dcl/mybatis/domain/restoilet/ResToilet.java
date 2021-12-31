package cn.ffcs.dcl.mybatis.domain.restoilet;

import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 公厕信息表模块bo对象
 * @Author: linguoxiong
 * @Date: 09-09 18:04:15
 * @table: 表信息描述 T_RES_TOILET 公厕信息表
序列：SEQ_RG_TOILET
  公厕信息表
序列：SEQ_RG_TOILET
  序列SEQ_T_RES_TOILET
 * @Copyright: 2021 福富软件
 */
public class ResToilet extends PageBean<ResToilet> implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long resToiletId; //厕所ID 	NUMBER(20)
	private String uuid; //一般户逻辑主键 	VARCHAR2(32)
	private String wcCode; //公厕编号 	VARCHAR2(32)
	private String gcWcType; //公厕类型 	VARCHAR2(30)
	private String isSupport; //是否财政支持 	VARCHAR2(10)
	private String toiletAddr; //建设位置 	VARCHAR2(20)
	private String buildTime; //建造年份 	VARCHAR2(20)
	private String wcClass; //公厕种类（单选） 	VARCHAR2(20)
	private Double area; //使用面积（M2)（填写，单位为“平方米”） 	NUMBER(10,2)
	private Integer toiletItemNum; //蹲位（个）（填写，单位为“个”） 	NUMBER(3)
	private String disposalExMethon; //粪污处理方式（单选） 	VARCHAR2(20)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建人时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private String reOrgCode; //所属区域编码 	VARCHAR2(30)
	private String regionName; //所属区域名称 	VARCHAR2(200)
	private String orgCode; //组织编码 	VARCHAR2(24)
	private Long resToiletEquipId; //厕所ID 	NUMBER(20)
	private String guid; //临时唯一标识 	VARCHAR2(50)
	private String isActualValid; //是否实际有效 	VARCHAR2(1)

	private String gcWcTypeTCN; //公厕类型 	VARCHAR2(30)
	private String isSupportTCN; //是否财政支持 	VARCHAR2(10)
	private String toiletAddrTCN; //建设位置 	VARCHAR2(20)
	private String buildTimeTCN; //建造年份 	VARCHAR2(20)
	private String wcClassTCN; //公厕种类（单选） 	VARCHAR2(20)
	private String disposalExMethonTCN; //粪污处理方式（单选） 	VARCHAR2(20)

	private List<String> wcIds;

	private Long[] ids;
	private Long[] attachmentId;//附件ID数组
	private List<AttachmentByUUID> attList;//附件对象集合


	public Long getResToiletId() {  //厕所ID
		return resToiletId;
	}
	public void setResToiletId(Long resToiletId) { //厕所ID
		this.resToiletId = resToiletId;
	}
	public String getUuid() {  //一般户逻辑主键
		return uuid;
	}
	public void setUuid(String uuid) { //一般户逻辑主键
		this.uuid = uuid;
	}
	public String getWcCode() {  //公厕编号
		return wcCode;
	}
	public void setWcCode(String wcCode) { //公厕编号
		this.wcCode = wcCode;
	}
	public String getGcWcType() {  //公厕类型
		return gcWcType;
	}
	public void setGcWcType(String gcWcType) { //公厕类型
		this.gcWcType = gcWcType;
	}
	public String getIsSupport() {  //是否财政支持
		return isSupport;
	}
	public void setIsSupport(String isSupport) { //是否财政支持
		this.isSupport = isSupport;
	}
	public String getToiletAddr() {  //建设位置
		return toiletAddr;
	}
	public void setToiletAddr(String toiletAddr) { //建设位置
		this.toiletAddr = toiletAddr;
	}
	public String getBuildTime() {  //建造年份
		return buildTime;
	}
	public void setBuildTime(String buildTime) { //建造年份
		this.buildTime = buildTime;
	}
	public String getWcClass() {  //公厕种类（单选）
		return wcClass;
	}
	public void setWcClass(String wcClass) { //公厕种类（单选）
		this.wcClass = wcClass;
	}
	public Double getArea() {  //使用面积（M2)（填写，单位为“平方米”）
		return area;
	}
	public void setArea(Double area) { //使用面积（M2)（填写，单位为“平方米”）
		this.area = area;
	}
	public Integer getToiletItemNum() {  //蹲位（个）（填写，单位为“个”）
		return toiletItemNum;
	}
	public void setToiletItemNum(Integer toiletItemNum) { //蹲位（个）（填写，单位为“个”）
		this.toiletItemNum = toiletItemNum;
	}
	public String getDisposalExMethon() {  //粪污处理方式（单选）
		return disposalExMethon;
	}
	public void setDisposalExMethon(String disposalExMethon) { //粪污处理方式（单选）
		this.disposalExMethon = disposalExMethon;
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
	public String getReOrgCode() {  //所属区域编码
		return reOrgCode;
	}
	public void setReOrgCode(String reOrgCode) { //所属区域编码
		this.reOrgCode = reOrgCode;
	}
	public String getRegionName() {  //所属区域名称
		return regionName;
	}
	public void setRegionName(String regionName) { //所属区域名称
		this.regionName = regionName;
	}
	public String getOrgCode() {  //组织编码
		return orgCode;
	}
	public void setOrgCode(String orgCode) { //组织编码
		this.orgCode = orgCode;
	}

	public String getGcWcTypeTCN() {
		return gcWcTypeTCN;
	}

	public void setGcWcTypeTCN(String gcWcTypeTCN) {
		this.gcWcTypeTCN = gcWcTypeTCN;
	}

	public String getIsSupportTCN() {
		return isSupportTCN;
	}

	public void setIsSupportTCN(String isSupportTCN) {
		this.isSupportTCN = isSupportTCN;
	}

	public String getToiletAddrTCN() {
		return toiletAddrTCN;
	}

	public void setToiletAddrTCN(String toiletAddrTCN) {
		this.toiletAddrTCN = toiletAddrTCN;
	}

	public String getBuildTimeTCN() {
		return buildTimeTCN;
	}

	public void setBuildTimeTCN(String buildTimeTCN) {
		this.buildTimeTCN = buildTimeTCN;
	}

	public String getWcClassTCN() {
		return wcClassTCN;
	}

	public void setWcClassTCN(String wcClassTCN) {
		this.wcClassTCN = wcClassTCN;
	}

	public String getDisposalExMethonTCN() {
		return disposalExMethonTCN;
	}

	public void setDisposalExMethonTCN(String disposalExMethonTCN) {
		this.disposalExMethonTCN = disposalExMethonTCN;
	}

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
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

	public Long getResToiletEquipId() {
		return resToiletEquipId;
	}

	public void setResToiletEquipId(Long resToiletEquipId) {
		this.resToiletEquipId = resToiletEquipId;
	}

	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
	}

	public List<String> getWcIds() {
		return wcIds;
	}

	public void setWcIds(List<String> wcIds) {
		this.wcIds = wcIds;
	}

	public String getIsActualValid() {
		return isActualValid;
	}

	public void setIsActualValid(String isActualValid) {
		this.isActualValid = isActualValid;
	}
}