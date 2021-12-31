package cn.ffcs.dcl.mybatis.domain.villageproduct;

import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 一村一品模块bo对象
 * @Author: ZHENGYI
 * @Date: 09-16 14:57:48
 * @table: 表信息描述 T_DV_VILLAGE_PRODUCT 一村一品  一村一品  序列SEQ_DV_VILLAGE_PRODUCT
 * @Copyright: 2021 福富软件
 */
public class VillageProduct implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long villageProductId; //主键 	NUMBER(16)
    private String uuid; //UUID 	VARCHAR2(50)
    private String goodsName; //商品名称 	VARCHAR2(50)
    private String goodsType; //商品类型 	VARCHAR2(100)
    private String goodsTypeName;
    private Double marketPriceLow; //市场参考价最低 	NUMBER(15,2)
    private Double marketPriceHigh; //市场参考价最高 	NUMBER(15,2)
    private String goodsUnit; //商品单位 	VARCHAR2(100)
    private String goodsUnitName; //商品单位 	VARCHAR2(100)
    private String regionCode; //产地区域 	VARCHAR2(50)
    private String regionName; //产地区域名称 	VARCHAR2(200)
    private String address; //产地详细地址 	VARCHAR2(400)
    private String shelf; //是否上架 	VARCHAR2(100)
    private String operator; //联系人 	VARCHAR2(50)
    private String tel; //联系方式 	VARCHAR2(20)
    private String goodsUrl; //商品购买链接地址 	VARCHAR2(500)
    private String goodsDesc; //产品介绍 	CLOB
    private Date releaseTime; //发布时间 	DATE
    private Date issuTime; //上传时间 	DATE
    private String pulisher; //发布人 	VARCHAR2(100)
    private String issuOrgName; //发布机构名称 	VARCHAR2(100)
    private String issuStatus; //发布状态 	VARCHAR2(10)
    private String remark; //备注 	VARCHAR2(200)
    private String isValid; //是否有效 	CHAR(1)
    private Long creator; //创建人 	NUMBER(16)
    private Date createTime; //创建时间 	DATE
    private Long updator; //修改人 	NUMBER(16)
    private Date updateTime; //修改时间 	DATE
    private String picUrl;// 主图
    private List<String> picUrlList;

    private String newId; //UUID 	VARCHAR2(50)
    private Long storeId;//商家id

    private Long[] attachmentId;//附件ID数组
    private List<AttachmentByUUID> attList;//附件对象集合
    private String curShelfStatus;

    public Long getVillageProductId() {  //主键
        return villageProductId;
    }

    public void setVillageProductId(Long villageProductId) { //主键
        this.villageProductId = villageProductId;
    }

    public String getUuid() {  //UUID
        return uuid;
    }

    public void setUuid(String uuid) { //UUID
        this.uuid = uuid;
    }

    public String getGoodsName() {  //商品名称
        return goodsName;
    }

    public void setGoodsName(String goodsName) { //商品名称
        this.goodsName = goodsName;
    }

    public String getGoodsType() {  //商品类型
        return goodsType;
    }

    public void setGoodsType(String goodsType) { //商品类型
        this.goodsType = goodsType;
    }

    public Double getMarketPriceLow() {  //市场参考价最低
        return marketPriceLow;
    }

    public void setMarketPriceLow(Double marketPriceLow) { //市场参考价最低
        this.marketPriceLow = marketPriceLow;
    }

    public Double getMarketPriceHigh() {  //市场参考价最高
        return marketPriceHigh;
    }

    public void setMarketPriceHigh(Double marketPriceHigh) { //市场参考价最高
        this.marketPriceHigh = marketPriceHigh;
    }

    public String getGoodsUnit() {  //商品单位
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) { //商品单位
        this.goodsUnit = goodsUnit;
    }

    public String getRegionCode() {  //产地区域
        return regionCode;
    }

    public void setRegionCode(String regionCode) { //产地区域
        this.regionCode = regionCode;
    }

    public String getRegionName() {  //产地区域名称
        return regionName;
    }

    public void setRegionName(String regionName) { //产地区域名称
        this.regionName = regionName;
    }

    public String getAddress() {  //产地详细地址
        return address;
    }

    public void setAddress(String address) { //产地详细地址
        this.address = address;
    }

    public String getShelf() {  //是否上架
        return shelf;
    }

    public void setShelf(String shelf) { //是否上架
        this.shelf = shelf;
    }

    public String getOperator() {  //联系人
        return operator;
    }

    public void setOperator(String operator) { //联系人
        this.operator = operator;
    }

    public String getTel() {  //联系方式
        return tel;
    }

    public void setTel(String tel) { //联系方式
        this.tel = tel;
    }

    public String getGoodsUrl() {  //商品购买链接地址
        return goodsUrl;
    }

    public void setGoodsUrl(String goodsUrl) { //商品购买链接地址
        this.goodsUrl = goodsUrl;
    }

    public String getGoodsDesc() {  //产品介绍
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) { //产品介绍
        this.goodsDesc = goodsDesc;
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

    public String getGoodsTypeName() {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName) {
        this.goodsTypeName = goodsTypeName;
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

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getCurShelfStatus() {
        return curShelfStatus;
    }

    public void setCurShelfStatus(String curShelfStatus) {
        this.curShelfStatus = curShelfStatus;
    }

    public String getGoodsUnitName() {
        return goodsUnitName;
    }

    public void setGoodsUnitName(String goodsUnitName) {
        this.goodsUnitName = goodsUnitName;
    }

    public List<String> getPicUrlList() {
        return picUrlList;
    }

    public void setPicUrlList(List<String> picUrlList) {
        this.picUrlList = picUrlList;
    }

	public String getNewId() {
		return newId;
	}

	public void setNewId(String newId) {
		this.newId = newId;
	}

	public Long getStoreId() {
		return storeId;
	}

	public void setStoreId(Long storeId) {
		this.storeId = storeId;
	}
}