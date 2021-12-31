package cn.ffcs.dcl.mybatis.domain.mailboxreply;

import cn.ffcs.dcl.utils.PageBean;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 书记信箱回复模块bo对象
 * @Author: gonghf
 * @Date: 09-27 09:34:11
 * @table: 表信息描述 T_DV_MAILBOX_REPLY 书记信箱回复  书记信箱回复  序列SEQ_DV_MAILBOX_REPLY
 * @Copyright: 2021 福富软件
 */
public class MailboxReply extends PageBean<MailboxReply> implements Serializable {

  	private static final long serialVersionUID = 1L;

	private Long mailboxReplyId; //主键 	NUMBER(16)
	private String uuid; //UUID 	VARCHAR2(50)
	private String mailboxUuid; //书记信箱唯一标识 	VARCHAR2(50)
	private String replyId; //回复人ID 	VARCHAR2(80)
	private String replyName; //回复人 	VARCHAR2(50)
	private String reply; //回复意见 	VARCHAR2(2000)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
	private Date replyTime; //回复时间 	DATE
	private String visible; //是否全员可见 	CHAR(1)
	private String remark; //备注 	VARCHAR2(200)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(16)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人 	NUMBER(16)
	private Date updateTime; //修改时间 	DATE

	private String regionCode; //所属区域 	VARCHAR2(50)

	private Long[] attachmentId; // 附件ID数组
	private List<AttachmentByUUID> attList; //附件对象集合

	public Long getMailboxReplyId() {  //主键
		return mailboxReplyId;
	}
	public void setMailboxReplyId(Long mailboxReplyId) { //主键
		this.mailboxReplyId = mailboxReplyId;
	}
	public String getUuid() {  //UUID
		return uuid;
	}
	public void setUuid(String uuid) { //UUID
		this.uuid = uuid;
	}
	public String getMailboxUuid() {  //书记信箱唯一标识
		return mailboxUuid;
	}
	public void setMailboxUuid(String mailboxUuid) { //书记信箱唯一标识
		this.mailboxUuid = mailboxUuid;
	}
	public String getReplyId() {  //回复人ID
		return replyId;
	}
	public void setReplyId(String replyId) { //回复人ID
		this.replyId = replyId;
	}
	public String getReplyName() {  //回复人
		return replyName;
	}
	public void setReplyName(String replyName) { //回复人
		this.replyName = replyName;
	}
	public String getReply() {  //回复意见
		return reply;
	}
	public void setReply(String reply) { //回复意见
		this.reply = reply;
	}
	public Date getReplyTime() {  //回复时间
		return replyTime;
	}
	public void setReplyTime(Date replyTime) { //回复时间
		this.replyTime = replyTime;
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

	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
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