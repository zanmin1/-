package cn.ffcs.dcl.villageproduct.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ffcs.dcl.mybatis.domain.villageproduct.StoreInfo;
import cn.ffcs.dcl.mybatis.persistence.villageproduct.StoreInfoMapper;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 商家信息模块服务实现
 * @Author: 张志杰
 * @Date: 12-20 20:01:16
 * @Copyright: 2021 福富软件
 */
@Service("storeInfoServiceImpl")
@Transactional
public class StoreInfoServiceImpl implements IStoreInfoService {

	@Autowired
	private StoreInfoMapper storeInfoMapper; //注入商家信息模块dao

	/**
	 * 新增数据
	 * @param bo 商家信息业务对象
	 * @return 商家信息id
	 */
	@Override
	public Long insert(StoreInfo bo) {
		storeInfoMapper.insert(bo);
		return bo.getStoreId();
	}

	/**
	 * 修改数据
	 * @param bo 商家信息业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(StoreInfo bo) {
		long result = storeInfoMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 商家信息业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(StoreInfo bo) {
		long result = storeInfoMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 商家信息分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<StoreInfo> list = storeInfoMapper.searchList(params, rowBounds);
		long count = storeInfoMapper.countList(params);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 商家信息id
	 * @return 商家信息业务对象
	 */
	@Override
	public StoreInfo searchById(Map<String, Object> params) {
		StoreInfo bo = storeInfoMapper.searchById(params);
		return bo;
	}

}