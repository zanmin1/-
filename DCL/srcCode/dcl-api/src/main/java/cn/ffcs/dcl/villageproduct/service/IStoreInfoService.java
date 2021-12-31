package cn.ffcs.dcl.villageproduct.service;

import java.util.Map;

import cn.ffcs.dcl.mybatis.domain.villageproduct.StoreInfo;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 商家信息模块服务
 * @Author: 张志杰
 * @Date: 12-20 20:01:16
 * @Copyright: 2021 福富软件
 */
public interface IStoreInfoService {

	/**
	 * 新增数据
	 * @param bo 商家信息业务对象
	 * @return 商家信息id
	 */
	public Long insert(StoreInfo bo);

	/**
	 * 修改数据
	 * @param bo 商家信息业务对象
	 * @return 是否修改成功
	 */
	public boolean update(StoreInfo bo);

	/**
	 * 删除数据
	 * @param bo 商家信息业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(StoreInfo bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 商家信息分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 商家信息id
	 * @return 商家信息业务对象
	 */
	public StoreInfo searchById(Map<String, Object> params);

}