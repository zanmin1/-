package cn.ffcs.dcl.mybatis.domain.dvtheme;

import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PageBean;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 主题模块bo对象
 * @Author: xuewq
 * @Date: 09-24 09:52:47
 * @table: 表信息描述 T_DV_THEME 主题  主题  序列SEQ_DV_THEME
 * @Copyright: 2021 福富软件
 */
public class DvTheme extends PageBean<DvTheme> implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long themeId; //主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String name; //主题名称 	VARCHAR2(50)
	private String platform; //使用平台 	VARCHAR2(50)
	private String platformName; //使用平台名称
	private String regionCode; //所属区域 	VARCHAR2(50)
	private String regionName; //所属区域名称 	VARCHAR2(200)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE
	private List<String> uuIdList;   // uuId集合

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getPlatformName() {
		return platformName;
	}

	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	private List<DvModular> dvModulars; // DvModular集合

	public List<DvModular> getDvModulars() {
		return dvModulars;
	}

	public void setDvModulars(List<DvModular> dvModulars) {
		this.dvModulars = dvModulars;
	}

	public List<String> getUuIdList() {
		return uuIdList;
	}

	public void setUuIdList(List<String> uuIdList) {
		this.uuIdList = uuIdList;
	}

	public Long getThemeId() {  //主键
		return themeId;
	}
	public void setThemeId(Long themeId) { //主键
		this.themeId = themeId;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public String getName() {  //主题名称
		return name;
	}
	public void setName(String name) { //主题名称
		this.name = name;
	}
	public String getRegionCode() {  //所属区域
		return regionCode;
	}
	public void setRegionCode(String regionCode) { //所属区域
		this.regionCode = regionCode;
	}
	public String getRegionName() {  //所属区域名称
		return regionName;
	}
	public void setRegionName(String regionName) { //所属区域名称
		this.regionName = regionName;
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