package cn.ffcs.dcl.mybatis.persistence.resourcemanagement;

import cn.ffcs.dcl.mybatis.domain.resourcemanagement.ResourceManagement;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;


/**
 * @Description: 资源管理表模块dao接口
 * @Author: 王文杰
 * @Date: 09-09 15:04:53
 * @Copyright: 2021 福富软件
 */
public interface ResourceManagementMapper {
	
	/**
	 * 新增数据
	 * @param bo 资源管理表业务对象
	 * @return 资源管理表id
	 */
	public long insert(ResourceManagement bo);


	/**
	 * 修改数据
	 * @param bo 资源管理表业务对象
	 * @return 修改的记录数
	 */
	public long update(ResourceManagement bo);
	
	/**
	 * 删除数据
	 * @param bo 资源管理表业务对象
	 * @return 删除的记录数
	 */
	public long delete(ResourceManagement bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 资源管理表数据列表
	 */
	public List<ResourceManagement> searchList(ResourceManagement bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 资源管理表数据总数
	 */
	public long countList(ResourceManagement bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 资源管理表id
	 * @return 资源管理表业务对象
	 */
	public ResourceManagement searchById(Long id);

	/**
	 * 根据业务id查询数据
	 * @param id 资源管理表id
	 * @return 资源管理表业务对象
	 */
	public ResourceManagement searchByUUId(String id);

	/**
	 * 类型分组列表
	 * @param
	 * @return
	 */
	public List<Map<String ,Object>> searchListType(Map<String ,Object> param);
}