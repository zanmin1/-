package cn.ffcs.dcl.villageproduct.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ffcs.dcl.mybatis.domain.villageproduct.OrderInfo;
import cn.ffcs.dcl.mybatis.persistence.villageproduct.OrderInfoMapper;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 订单信息模块服务实现
 * @Author: 张志杰
 * @Date: 12-20 20:00:51
 * @Copyright: 2021 福富软件
 */
@Service("orderInfoServiceImpl")
@Transactional
public class OrderInfoServiceImpl implements IOrderInfoService {

	@Autowired
	private OrderInfoMapper orderInfoMapper; //注入订单信息模块dao

	/**
	 * 新增数据
	 * @param bo 订单信息业务对象
	 * @return 订单信息id
	 */
	@Override
	public Long insert(OrderInfo bo) {
		orderInfoMapper.insert(bo);
		return bo.getOrderId();
	}

	/**
	 * 修改数据
	 * @param bo 订单信息业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(OrderInfo bo) {
		long result = orderInfoMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 订单信息业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(OrderInfo bo) {
		long result = orderInfoMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 订单信息分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<OrderInfo> list = orderInfoMapper.searchList(params, rowBounds);
		long count = orderInfoMapper.countList(params);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 订单信息id
	 * @return 订单信息业务对象
	 */
	@Override
	public OrderInfo searchById(Map<String, Object> params) {
		OrderInfo bo = orderInfoMapper.searchById(params);
		return bo;
	}

}