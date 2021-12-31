package cn.ffcs.dcl.utils;

import java.io.Serializable;

public class ResultObj implements Serializable,Cloneable {
	private static final long serialVersionUID = 6159559600632892290L;
	private boolean success;
	private String tipMsg;
	private Object data;

	private static ResultObj resultObj;

	static{
        resultObj = new ResultObj(false);
    }

    @Override
    protected ResultObj clone() {
	    try{
            return (ResultObj)super.clone();
        }catch (CloneNotSupportedException e){
            e.printStackTrace();
        }
	    return new ResultObj(false);
    }

	/**
	 * 默认返回成功
	 */
	public ResultObj(boolean success) {
		this.success = success;
		this.tipMsg = success?"操作成功":"操作失败";
		this.data = null;
	}
	
	public ResultObj(String tipMsg, Object data) {
		this.success = true;
		this.tipMsg = tipMsg;
		this.data = data;
	}
	
	public ResultObj(boolean success, String tipMsg, Object data) {
		this.success = success;
		this.tipMsg = tipMsg;
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getTipMsg() {
		return tipMsg;
	}

	public void setTipMsg(String tipMsg) {
		this.tipMsg = tipMsg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public static ResultObj getInstance(){
	    return resultObj.clone();
    }
    public static ResultObj getInstance(boolean success){
        ResultObj obj = getInstance();
        obj.setSuccess(success);
        return obj;
    }
    public static ResultObj getInstance(boolean success, String tipMsg){
        ResultObj obj = getInstance(success);
        obj.setTipMsg(tipMsg);
        return obj;
    }
    public static ResultObj getInstance(boolean success, String tipMsg, Object data){
        ResultObj obj = getInstance(success,tipMsg);
        obj.setData(data);
        return obj;
    }
}