package cn.ffcs.dcl.mybatis.domain.dvcontract;

import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.dcl.utils.DateUtils;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * @Description: 合同管理模块bo对象
 * @Author: ZHENGYI
 * @Date: 09-07 11:20:18
 * @table: 表信息描述 T_DV_CONTRACT 合同管理  合同管理  序列SEQ_DV_CONTRACT
 * @Copyright: 2021 福富软件
 */
public class DvContract implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long contractId; //主键ID 	NUMBER(16)
    private String uuid; //唯一标识 	VARCHAR2(32)
    private String contractName; //合同名称 	VARCHAR2(100)
    private Double contractAmt; //合同金额（元） 	NUMBER(15,2)
    private String partyA; //甲方名称 	VARCHAR2(100)
    private String partyB; //乙方名称 	VARCHAR2(100)
    private String desc; //合同摘要 	VARCHAR2(2000)
    private String paymentMethod; //合同款项交纳方式 	VARCHAR2(500)

    private Date startTime; //开始日期 	DATE

    private String startTimeStr;
    private Date endTime; //结束日期 	DATE
    private String endTimeStr;
    private String timeLimit; //期限 	NUMBER(3)
    private String regionCode; //所属区域 	VARCHAR2(32)
    private String regionName; //所属区域名称 	VARCHAR2(100)
    private String isValid; //数据状态 	CHAR(1)
    private Long creator; //创建人 	NUMBER(16)
    private Date createTime; //创建时间 	DATE
    private Long updator; //更新人 	NUMBER(16)
    private Date updateTime; //更新时间 	DATE
    private String remark; //备注 	VARCHAR2(500)
    private Long[] attachmentId;//附件ID数组
    private List<AttachmentByUUID> attList;//附件对象集合

    public Long getContractId() {  //主键ID
        return contractId;
    }

    public void setContractId(Long contractId) { //主键ID
        this.contractId = contractId;
    }

    public String getUuid() {  //唯一标识
        return uuid;
    }

    public void setUuid(String uuid) { //唯一标识
        this.uuid = uuid;
    }

    public String getContractName() {  //合同名称
        return contractName;
    }

    public void setContractName(String contractName) { //合同名称
        this.contractName = contractName;
    }

    public Double getContractAmt() {  //合同金额（元）
        return contractAmt;
    }

    public void setContractAmt(Double contractAmt) { //合同金额（元）
        this.contractAmt = contractAmt;
    }

    public String getPartyA() {  //甲方名称
        return partyA;
    }

    public void setPartyA(String partyA) { //甲方名称
        this.partyA = partyA;
    }

    public String getPartyB() {  //乙方名称
        return partyB;
    }

    public void setPartyB(String partyB) { //乙方名称
        this.partyB = partyB;
    }

    public String getDesc() {  //合同摘要
        return desc;
    }

    public void setDesc(String desc) { //合同摘要
        this.desc = desc;
    }

    public String getPaymentMethod() {  //合同款项交纳方式
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) { //合同款项交纳方式
        this.paymentMethod = paymentMethod;
    }

    public Date getStartTime() {  //开始日期
        if (startTimeStr != null && !"".equals(startTimeStr.trim())) {
            try {
                startTime = DateUtils.convertStringToDate(startTimeStr, "yyyy-MM-dd");
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return startTime;
    }

    public void setStartTime(Date startTime) { //开始日期
        this.startTime = startTime;
    }

    public Date getEndTime() {  //结束日期
        if (endTimeStr != null && !"".equals(endTimeStr.trim())) {
            try {
                endTime = DateUtils.convertStringToDate(endTimeStr, "yyyy-MM-dd");
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return endTime;
    }

    public void setEndTime(Date endTime) { //结束日期
        this.endTime = endTime;
    }

    public String getTimeLimit() {  //期限
        return timeLimit;
    }

    public void setTimeLimit(String timeLimit) { //期限
        this.timeLimit = timeLimit;
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

    public String getIsValid() {  //数据状态
        return isValid;
    }

    public void setIsValid(String isValid) { //数据状态
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

    public Long getUpdator() {  //更新人
        return updator;
    }

    public void setUpdator(Long updator) { //更新人
        this.updator = updator;
    }

    public Date getUpdateTime() {  //更新时间
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) { //更新时间
        this.updateTime = updateTime;
    }

    public String getRemark() {  //备注
        return remark;
    }

    public void setRemark(String remark) { //备注
        this.remark = remark;
    }

    public String getStartTimeStr() {
        if (startTime != null) {
            startTimeStr = DateUtils.formatDate(startTime, "yyyy-MM-dd");
        }
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public String getEndTimeStr() {
        if (endTime != null) {
            endTimeStr = DateUtils.formatDate(endTime, "yyyy-MM-dd");
        }
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
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
}