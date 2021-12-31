package cn.ffcs.dcl.mybatis.domain.attractionsmanagement;

import cn.ffcs.dcl.mybatis.domain.base.Page;
import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Description: 景点管理表模块bo对象
 * @Author: 王文杰
 * @Date: 09-13 11:02:34
 * @table: 表信息描述 T_DV_ATTRACTIONS_MANAGEMENT 景点管理表  景点管理表  序列SEQ_T_DV_ATTRACTIONS_MANAGEMENT
 * @Copyright: 2021 福富软件
 */
public class AttractionsManagement extends Page implements Serializable {

  private static final long serialVersionUID = 1L;

	private String type; //发布修改变量
	private Long attractionsId; //景点主键 	NUMBER(16)
	private String attractionsName; //景点名称 	VARCHAR2(100)
	private String attractionsType; //景点类型 	VARCHAR2(3)
	private String attractionsTypeName; //景点类型 名称	VARCHAR2(3)
	private String chargeType; //收费类型 	VARCHAR2(3)
	private String chargeTypeName; //收费类型  名称	VARCHAR2(3)
	private String attractionsDesc; //景点介绍 	VARCHAR2(500)
	private String issuTime; //发布时间 	DATE
	private String uploadTime; //上传时间 	DATE
	private String issuPerson; //发布人 	VARCHAR2(100)
	private String issuOrgName; //发布机构名称 	VARCHAR2(100)
	private String issuStatus; //发布状态 	VARCHAR2(3)
	private String orgCode; //所属行政村编码 	VARCHAR2(50)
	private String uuid; //UUID 	VARCHAR2(50)
	private String orgName; //所属行政村名称 	VARCHAR2(100)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE

	private String  attractionsTime; //开放时间

	private String  regPath;  //全路径

	private String address;  //地址

	private String  img;  //  标题图片 弃用

	private String	picUrl ;//标题图片

	private Long[] attachmentId;//附件ID数组
	private List<AttachmentByUUID> attList;//附件对象集合

	private String x;//经度（地理坐标 转换百度坐标系存数据库）
	private String y;//纬度（地理坐标 转换百度坐标系存数据库）


	private String t_x;//经度（保存用）
	private String t_y;//纬度（保存用）



	private List<String> imgList;  //详情图片集合

	public Long[] getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Long[] attachmentId) {
		this.attachmentId = attachmentId;
	}

	public List<AttachmentByUUID> getAttList() {
		return attList;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public List<String> getImgList() {
		return imgList;
	}

	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public void setAttList(List<AttachmentByUUID> attList) {
		this.attList = attList;
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

	public String getRegPath() {
		return regPath;
	}

	public void setRegPath(String regPath) {
		this.regPath = regPath;
	}

	public String getImg() {
		return img;
	}

	public String getAddress() {
		return address;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Long getAttractionsId() {  //景点主键
		return attractionsId;
	}
	public void setAttractionsId(Long attractionsId) { //景点主键
		this.attractionsId = attractionsId;
	}
	public String getAttractionsName() {  //景点名称
		return attractionsName;
	}
	public void setAttractionsName(String attractionsName) { //景点名称
		this.attractionsName = attractionsName;
	}
	public String getAttractionsType() {  //景点类型
		return attractionsType;
	}
	public void setAttractionsType(String attractionsType) { //景点类型
		this.attractionsType = attractionsType;
	}
	public String getChargeType() {  //收费类型
		return chargeType;
	}
	public void setChargeType(String chargeType) { //收费类型
		this.chargeType = chargeType;
	}
	public String getAttractionsDesc() {  //景点介绍
		return attractionsDesc;
	}
	public void setAttractionsDesc(String attractionsDesc) { //景点介绍
		this.attractionsDesc = attractionsDesc;
	}

	public String getAttractionsTypeName() {
		return attractionsTypeName;
	}

	public void setAttractionsTypeName(String attractionsTypeName) {
		this.attractionsTypeName = attractionsTypeName;
	}

	public String getChargeTypeName() {
		return chargeTypeName;
	}

	public void setChargeTypeName(String chargeTypeName) {
		this.chargeTypeName = chargeTypeName;
	}

	public String getIssuTime() {
		return issuTime;
	}

	public void setIssuTime(String issuTime) {
		this.issuTime = issuTime;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getIssuPerson() {  //发布人
		return issuPerson;
	}
	public void setIssuPerson(String issuPerson) { //发布人
		this.issuPerson = issuPerson;
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

	public String getAttractionsTime() {
		return attractionsTime;
	}

	public void setAttractionsTime(String attractionsTime) {
		this.attractionsTime = attractionsTime;
	}
}