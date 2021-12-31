package cn.ffcs.dcl.mybatis.domain.secretarymailbox;

import cn.ffcs.dcl.utils.PageBean;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 书记信箱模块bo对象
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @table: 表信息描述 T_DV_SECRETARY_MAILBOX 书记信箱  书记信箱，功能：用户在微信公众号上填写诉求，由书记在后台进行回复，包含子表书记信箱回复  序列SEQ_DV_SECRETARY_MAILBOX
 * @Copyright: 2021 福富软件
 */
public class SecretaryMailbox extends PageBean<SecretaryMailbox> implements Serializable {

  	private static final long serialVersionUID = 1L;

	private Long secretaryMailboxId; //主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String claimantId; //诉求人ID 	VARCHAR2(80)
	private String claimant; //诉求人 	VARCHAR2(50)
	private String appealNumber; //诉求编号 	VARCHAR2(50)
	private String appealTitle; //诉求标题 	VARCHAR2(100)
	private String appealContent; //诉求内容 	CLOB
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	private Date appealTime; //诉求时间 	DATE
	private String tel; //联系电话 	VARCHAR2(20)
	private String regionCode; //所属区域 	VARCHAR2(50)
	private String regionName; //所属区域名称 	VARCHAR2(100)
	private String visible; //是否全员可见 	CHAR(1)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE

	private String reply; //回复意见 	VARCHAR2(2000)
	private String replyStatus;   // 回复状态。
	private String replyStatusName;   // 回复状态名称。
    private String replyVisible;   // 回复表是否可见。
	private String replyVisibleName;   // 回复表是否全员可见名称。
	private String replyUuid;   // 回复表唯一标识。

	private String appViewType;   // app端查看类型。
	private String appealStartTime;   // 诉求开始时间。
	private String appealEndTime;   // 诉求结束时间。

    private Long[] attachmentId; // 附件ID数组

    public Long getSecretaryMailboxId() {  //主键
		return secretaryMailboxId;
	}
	public void setSecretaryMailboxId(Long secretaryMailboxId) { //主键
		this.secretaryMailboxId = secretaryMailboxId;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public String getClaimantId() {  //诉求人ID
		return claimantId;
	}
	public void setClaimantId(String claimantId) { //诉求人ID
		this.claimantId = claimantId;
	}
	public String getClaimant() {  //诉求人
		return claimant;
	}
	public void setClaimant(String claimant) { //诉求人
		this.claimant = claimant;
	}
	public String getAppealNumber() {  //诉求编号
		return appealNumber;
	}
	public void setAppealNumber(String appealNumber) { //诉求编号
		this.appealNumber = appealNumber;
	}
	public String getAppealTitle() {  //诉求标题
		return appealTitle;
	}
	public void setAppealTitle(String appealTitle) { //诉求标题
		this.appealTitle = appealTitle;
	}
	public String getAppealContent() {  //诉求内容
		return appealContent;
	}
	public void setAppealContent(String appealContent) { //诉求内容
		this.appealContent = appealContent;
	}
	public Date getAppealTime() {  //诉求时间
		return appealTime;
	}
	public void setAppealTime(Date appealTime) { //诉求时间
		this.appealTime = appealTime;
	}
	public String getTel() {  //联系电话
		return tel;
	}
	public void setTel(String tel) { //联系电话
		this.tel = tel;
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
	public String getVisible() {  //是否全员可见
		return visible;
	}
	public void setVisible(String visible) { //是否全员可见
		this.visible = visible;
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

	public String getReply() {  //回复意见
		return reply;
	}
	public void setReply(String reply) { //回复意见
		this.reply = reply;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	public String getReplyStatusName() {
		return replyStatusName;
	}
	public void setReplyStatusName(String replyStatusName) {
		this.replyStatusName = replyStatusName;
	}
    public String getReplyVisible() {
        return replyVisible;
    }
    public void setReplyVisible(String replyVisible) {
        this.replyVisible = replyVisible;
    }
    public String getReplyVisibleName() {
		return replyVisibleName;
	}
	public void setReplyVisibleName(String replyVisibleName) {
		this.replyVisibleName = replyVisibleName;
	}
	public String getReplyUuid() {
		return replyUuid;
	}
	public void setReplyUuid(String replyUuid) {
		this.replyUuid = replyUuid;
	}
	public String getAppViewType() {
		return appViewType;
	}
	public void setAppViewType(String appViewType) {
		this.appViewType = appViewType;
	}
	public String getAppealStartTime() {
		return appealStartTime;
	}
	public void setAppealStartTime(String appealStartTime) {
		this.appealStartTime = appealStartTime;
	}
	public String getAppealEndTime() {
		return appealEndTime;
	}
	public void setAppealEndTime(String appealEndTime) {
		this.appealEndTime = appealEndTime;
	}
	public Long[] getAttachmentId() {
        return attachmentId;
    }
    public void setAttachmentId(Long[] attachmentId) {
        this.attachmentId = attachmentId;
    }

}