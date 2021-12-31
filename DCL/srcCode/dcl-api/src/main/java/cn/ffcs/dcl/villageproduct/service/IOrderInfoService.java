package cn.ffcs.dcl.villageproduct.service;

import java.util.Map;

import cn.ffcs.dcl.mybatis.domain.villageproduct.OrderInfo;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 订单信息模块服务
 * @Author: 张志杰
 * @Date: 12-20 20:00:51
 * @Copyright: 2021 福富软件
 */
public interface IOrderInfoService {

	/**
	 * 新增数据
	 * @param bo 订单信息业务对象
	 * @return 订单信息id
	 */
	public Long insert(OrderInfo bo);

	/**
	 * 修改数据
	 * @param bo 订单信息业务对象
	 * @return 是否修改成功
	 */
	public boolean update(OrderInfo bo);

	/**
	 * 删除数据
	 * @param bo 订单信息业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(OrderInfo bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 订单信息分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 订单信息id
	 * @return 订单信息业务对象
	 */
	public OrderInfo searchById(Map<String, Object> params);

}