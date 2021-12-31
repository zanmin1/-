package cn.ffcs.dcl.mybatis.persistence.attractionsmanagement;

import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;


/**
 * @Description: 景点管理表模块dao接口
 * @Author: 王文杰
 * @Date: 09-13 11:02:34
 * @Copyright: 2021 福富软件
 */
public interface AttractionsManagementMapper {



	/**
	 * 新增数据
	 * @param bo 景点管理表业务对象
	 * @return 景点管理表id
	 */
	public long insert(AttractionsManagement bo);

	/**
	 * 修改数据
	 * @param bo 景点管理表业务对象
	 * @return 修改的记录数
	 */
	public long update(AttractionsManagement bo);

	/**
	 * 删除数据
	 * @param bo 景点管理表业务对象
	 * @return 删除的记录数
	 */
	public long delete(AttractionsManagement bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 景点管理表数据列表
	 */
	public List<AttractionsManagement> searchList(AttractionsManagement bo, RowBounds rowBounds);

	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 景点管理表数据总数
	 */
	public long countList(AttractionsManagement bo);

	/**
	 * 根据业务id查询数据
	 * @param id 景点管理表id
	 * @return 景点管理表业务对象
	 */
	public AttractionsManagement searchById(Long id);
	/**
	 * 根据业务id查询数据
	 * @param id 景点管理表id
	 * @return 景点管理表业务对象
	 */
	public AttractionsManagement searchByUUId(String id);

}