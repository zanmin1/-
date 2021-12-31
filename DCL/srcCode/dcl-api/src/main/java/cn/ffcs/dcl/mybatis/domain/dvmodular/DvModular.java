package cn.ffcs.dcl.mybatis.domain.dvmodular;

import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PageBean;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 模块管理模块bo对象
 * @Author: xuewq
 * @Date: 09-24 09:53:02
 * @table: 表信息描述 T_DV_MODULAR 模块管理  模块管理  序列SEQ_DV_MODULAR
 * @Copyright: 2021 福富软件
 */
public class DvModular extends PageBean<DvModular> implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long modularId; //主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String themeUuId; //主题唯一标识 	VARCHAR2(32)
	private String name; //模块名称 	VARCHAR2(50)
	private String type; //模块类型 	VARCHAR2(50)
	private Integer seq; //排序 	NUMBER(5)
	private String useType; //使用场景 	VARCHAR2(50) 1：首页，2：党建引领，3：乡村治理，4：乡村特色，5：村务政务，6：科技惠农

	private String isEnable; //是否启用 	CHAR(1)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE


//  冗余字段
	private String themeName;  //主题名称
	private String regionCode; //所属区域
	private String regionName; //所属区域名称
	private String typeName; // 模块类型名称
	private String isEnableName; //是否启用中文
	private String useTypeName; //使用场景名称
	private List<ModularContent> modularContents; // ModularContent集合

	public List<ModularContent> getModularContents() {
		return modularContents;
	}

	public void setModularContents(List<ModularContent> modularContents) {
		this.modularContents = modularContents;
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

	public String getIsEnableName() {
		return isEnableName;
	}

	public void setIsEnableName(String isEnableName) {
		this.isEnableName = isEnableName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
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

	private List<String> uuIdList;   // uuId集合。

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
	public String getThemeUuId() {  //主题唯一标识
		return themeUuId;
	}
	public void setThemeUuId(String themeUuId) { //主题唯一标识
		this.themeUuId = themeUuId;
	}
	public String getName() {  //模块名称
		return name;
	}
	public void setName(String name) { //模块名称
		this.name = name;
	}
	public String getType() {  //模块类型
		return type;
	}
	public void setType(String type) { //模块类型
		this.type = type;
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