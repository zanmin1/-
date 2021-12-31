package cn.ffcs.dcl.mybatis.domain.villagegroup;

import cn.ffcs.dcl.utils.PageBean;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 村小组模块bo对象
 * @Author: liangxj
 * @Date: 12-22 10:45:25
 * @table: 表信息描述 T_DV_VILLAGE_GROUP 村小组  村小组  序列SEQ_DV_VILLAGE_GROUP
 * @Copyright: 2021 福富软件
 */
public class VillageGroup extends PageBean<VillageGroup> implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long villageGroupId; //主键 	NUMBER(16)
    private String uuid; //唯一标识 	VARCHAR2(50)
    private String name; //名称 	VARCHAR2(50)
    private String type; //类型 	VARCHAR2(100)
    private String job; //职务 	VARCHAR2(100)
    private String typeName; //村小组名称
    private String tel; //联系方式 	VARCHAR2(20)
    private String idNo; //身份证号 	VARCHAR2(30)
    private String regionCode; //区域 	VARCHAR2(50)
    private String regionName; //区域名称 	VARCHAR2(200)
    private Integer seq; //排序 	NUMBER(3)
    private String introduction; //人员介绍 	VARCHAR2(2000)
    private String remark; //备注 	VARCHAR2(200)
    private String isValid; //是否有效 	CHAR(1)
    private Long creator; //创建人 	NUMBER(16)
    private Date createTime; //创建时间 	DATE
    private Long updator; //修改人 	NUMBER(16)
    private Date updateTime; //修改时间 	DATE
    private String birthday;
    private String sex;
    private String sexCN;
    private Long attachmentId;
    private String image;

    public Long getVillageGroupId() {  //主键
        return villageGroupId;
    }

    public void setVillageGroupId(Long villageGroupId) { //主键
        this.villageGroupId = villageGroupId;
    }

    public String getUuid() {  //唯一标识
        return uuid;
    }

    public void setUuid(String uuid) { //唯一标识
        this.uuid = uuid;
    }

    public String getName() {  //名称
        return name;
    }

    public void setName(String name) { //名称
        this.name = name;
    }

    public String getType() {  //类型
        return type;
    }

    public void setType(String type) { //类型
        this.type = type;
    }

    public String getTel() {  //联系方式
        return tel;
    }

    public void setTel(String tel) { //联系方式
        this.tel = tel;
    }

    public String getIdNo() {  //身份证号
        return idNo;
    }

    public void setIdNo(String idNo) { //身份证号
        this.idNo = idNo;
    }

    public String getRegionCode() {  //区域
        return regionCode;
    }

    public void setRegionCode(String regionCode) { //区域
        this.regionCode = regionCode;
    }

    public String getRegionName() {  //区域名称
        return regionName;
    }

    public void setRegionName(String regionName) { //区域名称
        this.regionName = regionName;
    }

    public Integer getSeq() {  //排序
        return seq;
    }

    public void setSeq(Integer seq) { //排序
        this.seq = seq;
    }

    public String getIntroduction() {  //人员介绍
        return introduction;
    }

    public void setIntroduction(String introduction) { //人员介绍
        this.introduction = introduction;
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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSexCN() {
        return sexCN;
    }

    public void setSexCN(String sexCN) {
        this.sexCN = sexCN;
    }

    public Long getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Long attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}