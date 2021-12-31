package cn.ffcs.dcl.mybatis.domain.modularcontent;

import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 模块内容管理模块bo对象
 * @Author: xuewq
 * @Date: 09-24 09:53:07
 * @table: 表信息描述 T_DV_MODULAR_CONTENT 模块内容管理  模块内容管理  序列SEQ_DV_MODULAR_CONTENT
 * @Copyright: 2021 福富软件
 */
public class ModularContent extends PageBean<ModularContent> implements  Serializable {

  private static final long serialVersionUID = 1L;

	private Long modularId; //主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String modularUuId; //模块唯一标识 	VARCHAR2(32)
	private String name; //内容名称 	VARCHAR2(50)
	private String subtitleName; //副标题名称 	VARCHAR2(50)
	private String url; //链接地址 	VARCHAR2(1000)
	private Integer seq; //排序 	NUMBER(5)
	private String isEnable; //是否启用 	CHAR(1)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private List<String> uuIdList;   // uuId集合

	//  冗余字段

	private List<AttachmentByUUID> attList; //附件集合
	private String platform; //使用平台 	spt：省平台，xygj：小翼管家
	private String themeName;  //主题名称
	private String type;  // 模块类型
	private String modularName; //模块名称
	private String regionCode; //所属区域
	private String regionName; //所属区域名称
	private String isEnableName; //是否启用中文
	private String useType; //使用场景 1：首页，2：党建引领，3：乡村治理，4：乡村特色，5：村务政务，6：科技惠农
	private String useTypeName; //使用场景名称

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public List<AttachmentByUUID> getAttList() {
		return attList;
	}

	public void setAttList(List<AttachmentByUUID> attList) {
		this.attList = attList;
	}

	public String getUseType() {
		return useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	public String getUseTypeName() {
		return useTypeName;
	}

	public void setUseTypeName(String useTypeName) {
		this.useTypeName = useTypeName;
	}

	private Long[] attachmentId; //附件ID数组

	public Long[] getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Long[] attachmentId) {
		this.attachmentId = attachmentId;
	}

	private String themeUuId;  //主题名称

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getThemeUuId() {
		return themeUuId;
	}

	public void setThemeUuId(String themeUuId) {
		this.themeUuId = themeUuId;
	}

	public String getIsEnableName() {
		return isEnableName;
	}

	public void setIsEnableName(String isEnableName) {
		this.isEnableName = isEnableName;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public String getModularName() {
		return modularName;
	}

	public void setModularName(String modularName) {
		this.modularName = modularName;
	}

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

	public List<String> getUuIdList() {
		return uuIdList;
	}

	public void setUuIdList(List<String> uuIdList) {
		this.uuIdList = uuIdList;
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
	public String getModularUuId() {  //模块唯一标识
		return modularUuId;
	}
	public void setModularUuId(String modularUuId) { //模块唯一标识
		this.modularUuId = modularUuId;
	}
	public String getName() {  //内容名称
		return name;
	}
	public void setName(String name) { //内容名称
		this.name = name;
	}
	public String getSubtitleName() {  //副标题名称
		return subtitleName;
	}
	public void setSubtitleName(String subtitleName) { //副标题名称
		this.subtitleName = subtitleName;
	}
	public String getUrl() {  //链接地址
		return url;
	}
	public void setUrl(String url) { //链接地址
		this.url = url;
	}
	public Integer getSeq() {  //排序
		return seq;
	}
	public void setSeq(Integer seq) { //排序
		this.seq = seq;
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