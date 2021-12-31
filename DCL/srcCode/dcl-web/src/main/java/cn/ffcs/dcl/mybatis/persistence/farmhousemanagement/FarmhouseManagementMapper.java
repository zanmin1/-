package cn.ffcs.dcl.mybatis.persistence.farmhousemanagement;

import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 农家乐管理模块dao接口
 * @Author: os.liwei
 * @Date: 09-15 09:07:22
 * @Copyright: 2021 福富软件
 */
public interface FarmhouseManagementMapper {
	
	/**
	 * 新增数据
	 * @param bo 农家乐管理业务对象
	 * @return 农家乐管理id
	 */
	public long insert(FarmhouseManagement bo);
	
	/**
	 * 修改数据
	 * @param bo 农家乐管理业务对象
	 * @return 修改的记录数
	 */
	public long update(FarmhouseManagement bo);
	
	/**
	 * 删除数据
	 * @param bo 农家乐管理业务对象
	 * @return 删除的记录数
	 */
	public long delete(FarmhouseManagement bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 农家乐管理数据列表
	 */
	public List<FarmhouseManagement> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 农家乐管理数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 农家乐管理id
	 * @return 农家乐管理业务对象
	 */
	public FarmhouseManagement searchById(Long id);

	public long batchDelete(FarmhouseManagement bo);


	public FarmhouseManagement searchByUuId(String uuId);


	/**
	 * 查询数据（分页）app
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 农家乐管理数据列表
	 */
	public List<FarmhouseManagement> searchList(FarmhouseManagement bo, RowBounds rowBounds);

	/**
	 * 查询数据总数 app
	 * @param bo 查询参数
	 * @return 农家乐管理数据总数
	 */
	public long countList(FarmhouseManagement bo);

}