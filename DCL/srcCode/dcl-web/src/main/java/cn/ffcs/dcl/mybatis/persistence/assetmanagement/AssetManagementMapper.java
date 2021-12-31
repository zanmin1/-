package cn.ffcs.dcl.mybatis.persistence.assetmanagement;

import cn.ffcs.dcl.mybatis.domain.assetmanagement.AssetManagement;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;

/**
 * @Description: 资产管理表模块dao接口
 * @Author: 王文杰
 * @Date: 09-08 19:32:57
 * @Copyright: 2021 福富软件
 */
public interface AssetManagementMapper {
	
	/**
	 * 新增数据
	 * @param bo 资产管理表业务对象
	 * @return 资产管理表id
	 */
	public long insert(AssetManagement bo);
	
	/**
	 * 修改数据
	 * @param bo 资产管理表业务对象
	 * @return 修改的记录数
	 */
	public long update(AssetManagement bo);
	
	/**
	 * 删除数据
	 * @param bo 资产管理表业务对象
	 * @return 删除的记录数
	 */
	public long delete(AssetManagement bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 资产管理表数据列表
	 */
	public List<AssetManagement> searchList(AssetManagement bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 资产管理表数据总数
	 */
	public long countList(AssetManagement bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 资产管理表id
	 * @return 资产管理表业务对象
	 */
	public AssetManagement searchById(String id);

	/**
	 * 根据业务id查询数据
	 * @param id 资产管理表id
	 * @return 资产管理表业务对象
	 */
	public AssetManagement searchByUUId(String id);


	/**
	 * 类型分组列表
	 * @param
	 * @return
	 */
	public List<Map<String ,Object>> searchListType(Map<String ,Object> param);
}