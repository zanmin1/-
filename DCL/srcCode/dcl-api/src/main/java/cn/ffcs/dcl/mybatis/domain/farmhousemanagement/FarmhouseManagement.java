package cn.ffcs.dcl.mybatis.domain.farmhousemanagement;

import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 农家乐管理模块bo对象
 * @Author: os.liwei
 * @Date: 09-15 09:07:22
 * @table: 表信息描述 T_DV_FARMHOUSE_MANAGEMENT 农家乐管理  农家乐管理表  序列SEQ_DV_FARMHOUSE_MANAGEMENT
 * @Copyright: 2021 福富软件
 */
public class FarmhouseManagement extends PageBean<FarmhouseManagement> implements Serializable {
  private static final long serialVersionUID = 1L;
	private Long farmhouseId; //农家乐主键 	NUMBER(16)
	private String farmhouseName; //农家乐名称 	VARCHAR2(200)
	private String address; //地址 	VARCHAR2(200)
	private String perCapitaConsum; //人均消费 	VARCHAR2(200)
	private String operator; //经营人 	VARCHAR2(200)
	private String tel; //联系方式 	VARCHAR2(20)
	private String serviceDesc; //服务介绍 	VARCHAR2(500)
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



	//冗余字段
	private List<String> uuIdList;
	private Long[] attachmentId;//附件ID数组
	private List<AttachmentByUUID> attList;//附件对象集合

	private List<String> imgList;  //详情图片集合

	private String issuStatusStr; //发布状态 	VARCHAR2(10)
	private Double longitude;//经度（冗余地理坐标）
	private Double latitude;//纬度（冗余地理坐标）

	private Double x;//经度（冗余地理坐标）
	private Double y;//纬度（冗余地理坐标）

	private String releaseTimeStr; //发布时间 	DATE
	private String issuTimeStr; //上传时间 	DATE
	private String  regPath;  //全路径

	private String	picUrl ;//标题图片
	private String  img;  //

	private String  type;

	private String t_x;//经度（保存用）
	private String t_y;//纬度（保存用）

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getRegPath() {
		return regPath;
	}

	public void setRegPath(String regPath) {
		this.regPath = regPath;
	}


	public List<String> getImgList() {
		return imgList;
	}

	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}

	public Double getX() {
		return x;
	}

	public void setX(Double x) {
		this.x = x;
	}

	public Double getY() {
		return y;
	}

	public void setY(Double y) {
		this.y = y;
	}

	public String getReleaseTimeStr() {
		return releaseTimeStr;
	}

	public void setReleaseTimeStr(String releaseTimeStr) {
		this.releaseTimeStr = releaseTimeStr;
	}

	public String getIssuTimeStr() {
		return issuTimeStr;
	}

	public void setIssuTimeStr(String issuTimeStr) {
		this.issuTimeStr = issuTimeStr;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public String getIssuStatusStr() {
		return issuStatusStr;
	}

	public void setIssuStatusStr(String issuStatusStr) {
		this.issuStatusStr = issuStatusStr;
	}

	public List<String> getUuIdList() {
		return uuIdList;
	}

	public void setUuIdList(List<String> uuIdList) {
		this.uuIdList = uuIdList;
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

	public Long getFarmhouseId() {  //农家乐主键
		return farmhouseId;
	}
	public void setFarmhouseId(Long farmhouseId) { //农家乐主键
		this.farmhouseId = farmhouseId;
	}
	public String getFarmhouseName() {  //农家乐名称
		return farmhouseName;
	}
	public void setFarmhouseName(String farmhouseName) { //农家乐名称
		this.farmhouseName = farmhouseName;
	}
	public String getAddress() {  //地址
		return address;
	}
	public void setAddress(String address) { //地址
		this.address = address;
	}
	public String getPerCapitaConsum() {  //人均消费
		return perCapitaConsum;
	}
	public void setPerCapitaConsum(String perCapitaConsum) { //人均消费
		this.perCapitaConsum = perCapitaConsum;
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
	public String getServiceDesc() {  //服务介绍
		return serviceDesc;
	}
	public void setServiceDesc(String serviceDesc) { //服务介绍
		this.serviceDesc = serviceDesc;
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


}