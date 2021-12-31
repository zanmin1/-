package cn.ffcs.dcl.assetmanagement.service;

import cn.ffcs.dcl.mybatis.domain.assetmanagement.AssetManagement;
import cn.ffcs.system.publicUtil.EUDGPagination;

import java.util.List;
import java.util.Map;


/**
 * @Description: 资产管理表模块服务
 * @Author: 王文杰
 * @Date: 09-08 19:32:57
 * @Copyright: 2021 福富软件
 */
public interface IAssetManagementService {

	/**
	 * 新增数据
	 * @param bo 资产管理表业务对象
	 * @return 资产管理表id
	 */
	public Long insert(AssetManagement bo);

	/**
	 * 修改数据
	 * @param bo 资产管理表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(AssetManagement bo);

	/**
	 * 删除数据
	 * @param bo 资产管理表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(AssetManagement bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 资产管理表分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, AssetManagement bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 资产管理表id
	 * @return 资产管理表业务对象
	 */
	public AssetManagement searchById(String id);


	/**
	 * 类型分组列表
	 * @param
	 * @return
	 */
	public List<Map<String ,Object>> searchListType(Map<String ,Object> param);

}