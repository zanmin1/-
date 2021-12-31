package cn.ffcs.dcl.mybatis.domain.homestaymanagement;

import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 民宿管理模块bo对象
 * @Author: gonghf
 * @Date: 09-15 09:47:13
 * @table: 表信息描述 T_DV_HOMESTAY_MANAGEMENT2 民宿管理  民宿管理表  序列SEQ_T_DV_HOMESTAY_MANAGEMENT2
 * @Copyright: 2021 福富软件
 */
public class HomestayManagement extends PageBean<HomestayManagement> implements Serializable {

  	private static final long serialVersionUID = 1L;

	private Long homestayId; //民宿主键 	NUMBER(16)
	private String homestayName; //民宿名称 	VARCHAR2(200)
	private String address; //地址 	VARCHAR2(200)
	private String accommodation; //住宿标准 	VARCHAR2(200)
	private String operator; //经营人 	VARCHAR2(200)
	private String tel; //联系方式 	VARCHAR2(20)
	private String homestayDesc; //民宿介绍 	CLOB
	private Date releaseTime; //发布时间 	DATE
	private Date issuTime; //上传时间 	DATE
	private String pulisher; //发布人 	VARCHAR2(100)
	private String issuOrgName; //发布机构名称 	VARCHAR2(100)
	private String issuStatus; //发布状态 	VARCHAR2(10)
	private String orgCode; //所属行政村编码 	VARCHAR2(50)
	private String uuid; //UUID 	VARCHAR2(50)
	private String orgName; //所属行政村名称 	VARCHAR2(100)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private String picUrl; //民宿主图url 	VARCHAR2(100)

	private String accommodationName; //住宿标准名称
	private String issuStatusName; //发布状态名称
	private String newGisX; //经度（地理坐标 转换百度坐标系存数据库）
	private String newGisY; //纬度（地理坐标 转换百度坐标系存数据库）
	private Long[] attachmentId; //附件ID数组
	private List<AttachmentByUUID> attList; //附件对象集合
	private List<String> imgList; //详情图片集合
	private String fileType; //详情附件类型
	private String type; //判断是否是列表的发布操作

	private List<String> uuidList;

	public Long getHomestayId() {  //民宿主键
		return homestayId;
	}
	public void setHomestayId(Long homestayId) { //民宿主键
		this.homestayId = homestayId;
	}
	public String getHomestayName() {  //民宿名称
		return homestayName;
	}
	public void setHomestayName(String homestayName) { //民宿名称
		this.homestayName = homestayName;
	}
	public String getAddress() {  //地址
		return address;
	}
	public void setAddress(String address) { //地址
		this.address = address;
	}
	public String getAccommodation() {  //住宿标准
		return accommodation;
	}
	public void setAccommodation(String accommodation) { //住宿标准
		this.accommodation = accommodation;
	}
	public String getOperator() {  //经营人
		return operator;
	}
	public void setOperator(String operator) { //经营人
		this.operator = operator;
	}
	public String getTel() {  //联系方式
		return tel;
	}
	public void setTel(String tel) { //联系方式
		this.tel = tel;
	}
	public String getHomestayDesc() {  //民宿介绍
		return homestayDesc;
	}
	public void setHomestayDesc(String homestayDesc) { //民宿介绍
		this.homestayDesc = homestayDesc;
	}
	public Date getReleaseTime() {  //发布时间
		return releaseTime;
	}
	public void setReleaseTime(Date releaseTime) { //发布时间
		this.releaseTime = releaseTime;
	}
	public Date getIssuTime() {  //上传时间
		return issuTime;
	}
	public void setIssuTime(Date issuTime) { //上传时间
		this.issuTime = issuTime;
	}
	public String getPulisher() {  //发布人
		return pulisher;
	}
	public void setPulisher(String pulisher) { //发布人
		this.pulisher = pulisher;
	}
	public String getIssuOrgName() {  //发布机构名称
		return issuOrgName;
	}
	public void setIssuOrgName(String issuOrgName) { //发布机构名称
		this.issuOrgName = issuOrgName;
	}
	public String getIssuStatus() {  //发布状态
		return issuStatus;
	}
	public void setIssuStatus(String issuStatus) { //发布状态
		this.issuStatus = issuStatus;
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
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getAccommodationName() {
		return accommodationName;
	}
	public void setAccommodationName(String accommodationName) {
		this.accommodationName = accommodationName;
	}
	public String getIssuStatusName() {
		return issuStatusName;
	}
	public void setIssuStatusName(String issuStatusName) {
		this.issuStatusName = issuStatusName;
	}
	public String getNewGisX() {
		return newGisX;
	}
	public void setNewGisX(String newGisX) {
		this.newGisX = newGisX;
	}
	public String getNewGisY() {
		return newGisY;
	}
	public void setNewGisY(String newGisY) {
		this.newGisY = newGisY;
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
	public List<String> getImgList() {
		return imgList;
	}
	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<String> getUuidList() {
		return uuidList;
	}
	public void setUuidList(List<String> uuidList) {
		this.uuidList = uuidList;
	}

}