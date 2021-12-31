package cn.ffcs.dcl.mybatis.domain.villageproduct;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 订单信息模块bo对象
 * @Author: 张志杰
 * @Date: 12-20 20:00:51
 * @table: 表信息描述 T_ORDER_INFO 订单信息  订单信息  序列SEQ_T_ORDER_INFO
 * @Copyright: 2021 福富软件
 */
public class OrderInfo implements Serializable {

  private static final long serialVersionUID = 1L;

	private Long orderId; //订单ID 	NUMBER(16)
	private String outerCode; //订单OUTID 	VARCHAR2(100)
	private String payStatus; //支付状态 	VARCHAR2(50)
	private String payAmount; //支付总金额 	VARCHAR2(100)
	private Date payTime; //支付时间 	VARCHAR2(30)
	private String ukProductId; //商品ID 	VARCHAR2(100)
	private String ukProductName; //商品名称 	VARCHAR2(100)
	private String productGoods; //商品信息 	VARCHAR2(2000)
	private String isValid; //是否有效 	CHAR(1)
	private Long creator; //创建人 	NUMBER(9)
	private Date createTime; //创建时间 	TIMESTAMP
	private Long updator; //更新人 	NUMBER(9)
	private Date updateTime; //更新时间 	TIMESTAMP
    private String action;//操作类型
    private String timeStamp;//时间戳
    private String auth;//校验
    private String appID;//平台ID


	public Long getOrderId() {  //订单ID
		return orderId;
	}
	public void setOrderId(Long orderId) { //订单ID
		this.orderId = orderId;
	}
	public String getOuterCode() {  //订单OUTID
		return outerCode;
	}
	public void setOuterCode(String outerCode) { //订单OUTID
		this.outerCode = outerCode;
	}
	public String getPayStatus() {  //支付状态
		return payStatus;
	}
	public void setPayStatus(String payStatus) { //支付状态
		this.payStatus = payStatus;
	}
	public String getPayAmount() {  //支付总金额
		return payAmount;
	}
	public void setPayAmount(String payAmount) { //支付总金额
		this.payAmount = payAmount;
	}
	public String getUkProductId() {  //商品ID
		return ukProductId;
	}
	public void setUkProductId(String ukProductId) { //商品ID
		this.ukProductId = ukProductId;
	}
	public String getUkProductName() {  //商品名称
		return ukProductName;
	}
	public void setUkProductName(String ukProductName) { //商品名称
		this.ukProductName = ukProductName;
	}
	public String getProductGoods() {  //商品信息
		return productGoods;
	}
	public void setProductGoods(String productGoods) { //商品信息
		this.productGoods = productGoods;
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
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getAppID() {
		return appID;
	}
	public void setAppID(String appID) {
		this.appID = appID;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}


}