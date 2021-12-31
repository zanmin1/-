package cn.ffcs.dcl.utils;

import java.io.Serializable;
import java.util.List;

/**
 * LayUI Table 分页对象
*/
public class PaginationDto<T> implements Serializable {

    /**接口状态*/
    private Integer code = 0;
    /**提示文本*/
    private String msg;
    /**数据长度*/
    private Long count;
    /**数据列表*/
    private List<T> data;

    private final int SUCCESS_CODE = 0;
    public PaginationDto() {
        super();
    }
    public PaginationDto(Long count, List<T> data) {
        super();
        this.code = SUCCESS_CODE;
        this.count = count;
        this.data = data;
    }
    public PaginationDto(Integer code, String msg, Long count, List<T> data) {
        super();
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }
    public Integer getCode() {
        return code;
    }
    public void setCode(Integer code) {
        this.code = code;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public Long getCount() {
        return count;
    }
    public void setCount(Long count) {
        this.count = count;
    }
    public List<T> getData() {
        return data;
    }
    public void setData(List<T> data) {
        this.data = data;
    }
}