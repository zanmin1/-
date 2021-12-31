package cn.ffcs.dcl.mybatis.domain.historybroadcastpush;

import cn.ffcs.dcl.utils.PageBean;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Description: 历史播报推送模块bo对象
 * @Author: sunwb
 * @Date: 12-22 09:53:30
 * @table: 表信息描述 T_HISTORY_BROADCASTPUSH 历史播报推送    序列SEQ_T_HISTORY_BROADCASTPUSH
 * @Copyright: 2021 福富软件
 */
public class HistoryBroadcastpush extends PageBean<HistoryBroadcastpush> implements Serializable {

  private static final long serialVersionUID = 1L;

	private String pushId; //推送主键 	VARCHAR2(32)
	private Long serial; //序号 	NUMBER(9)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	private Date sendtime; //发送时间 	DATE
	private String type; //人员类型 	VARCHAR2(20)
	private String sendpeople; //发送人 	VARCHAR2(200)
	private String recipient; //收信人 	VARCHAR2(200)
	private String reciveType; //接受类型 	VARCHAR2(20)
	private String isValid; //数据有效性 	VARCHAR2(1)
	private String regionCode; //所属区域 	VARCHAR2(50)
	private String regionName; //所属区域名称 	VARCHAR2(200),
	private Long creator; //创建人ID 	NUMBER(9)
	private String creatorName; //创建人姓名 	VARCHAR2(100)
	private Date createTime; //创建时间 	DATE
	private Long updator; //修改人ID 	NUMBER(9)
	private String updatorName; //修改人姓名 	VARCHAR2(100)
	private Date updateTime; //修改时间 	DATE
	private String detailId; //详情id 	VARCHAR2(32)
	private String sessionId; //推送方任务标识ID
	private String failNum; //推送失败的号码

	private String url;
	private String total;  //发送总数
	private  String  received ;  // 接收成功数
	private String linkMan; //发件人 	VARCHAR2(100)

	private String peopleIds;

	private List<String> delList; //批量删除集合

	public List<String> getDelList() {
		return delList;
	}

	public void setDelList(List<String> delList) {
		this.delList = delList;
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
	public String getPushId() {  //推送主键
		return pushId;
	}
	public void setPushId(String pushId) { //推送主键
		this.pushId = pushId;
	}
	public Long getSerial() {
		return serial;
	}
	public void setSerial(Long serial) {
		this.serial = serial;
	}
	public Date getSendtime() {  //发送时间
		return sendtime;
	}
	public void setSendtime(Date sendtime) { //发送时间
		this.sendtime = sendtime;
	}
	public String getType() {  //人员类型
		return type;
	}
	public void setType(String type) { //人员类型
		this.type = type;
	}
	public String getSendpeople() {  //发送人
		return sendpeople;
	}
	public void setSendpeople(String sendpeople) { //发送人
		this.sendpeople = sendpeople;
	}
	public String getRecipient() {  //收信人
		return recipient;
	}
	public void setRecipient(String recipient) { //收信人
		this.recipient = recipient;
	}
	public String getReciveType() {  //接受类型
		return reciveType;
	}
	public void setReciveType(String reciveType) { //接受类型
		this.reciveType = reciveType;
	}
	public String getIsValid() {  //数据有效性
		return isValid;
	}
	public void setIsValid(String isValid) { //数据有效性
		this.isValid = isValid;
	}
	public Long getCreator() {  //创建人ID
		return creator;
	}
	public void setCreator(Long creator) { //创建人ID
		this.creator = creator;
	}
	public String getCreatorName() {  //创建人姓名
		return creatorName;
	}
	public void setCreatorName(String creatorName) { //创建人姓名
		this.creatorName = creatorName;
	}
	public Date getCreateTime() {  //创建时间
		return createTime;
	}
	public void setCreateTime(Date createTime) { //创建时间
		this.createTime = createTime;
	}
	public Long getUpdator() {  //修改人ID
		return updator;
	}
	public void setUpdator(Long updator) { //修改人ID
		this.updator = updator;
	}
	public String getUpdatorName() {  //修改人姓名
		return updatorName;
	}
	public void setUpdatorName(String updatorName) { //修改人姓名
		this.updatorName = updatorName;
	}
	public Date getUpdateTime() {  //修改时间
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) { //修改时间
		this.updateTime = updateTime;
	}
	public String getDetailId() {  //详情id
		return detailId;
	}
	public void setDetailId(String detailId) { //详情id
		this.detailId = detailId;
	}

	public String getPeopleIds() {
		return peopleIds;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setPeopleIds(String peopleIds) {
		this.peopleIds = peopleIds;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getReceived() {
		return received;
	}

	public void setReceived(String received) {
		this.received = received;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getFailNum() {
		return failNum;
	}

	public void setFailNum(String failNum) {
		this.failNum = failNum;
	}
}