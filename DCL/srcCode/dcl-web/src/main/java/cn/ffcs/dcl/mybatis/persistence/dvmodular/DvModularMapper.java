package cn.ffcs.dcl.mybatis.persistence.dvmodular;

import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import org.apache.ibatis.session.RowBounds;
import java.util.List;

/**
 * @Description: 模块管理模块dao接口
 * @Author: xuewq
 * @Date: 09-24 09:53:02
 * @Copyright: 2021 福富软件
 */
public interface DvModularMapper {

	/**
	 * 新增数据
	 * @param bo 模块业务对象
	 * @return 模块id
	 */
	public long insert(DvModular bo);

	/**
	 * 修改数据
	 * @param bo 模块业务对象
	 * @return 修改的记录数
	 */
	public long update(DvModular bo);

	/**
	 * 删除数据
	 * @param bo 模块业务对象
	 * @return 删除的记录数
	 */
	public long delete(DvModular bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 模块数据列表
	 */
	public List<DvModular> searchList(DvModular params, RowBounds rowBounds);

	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 模块数据总数
	 */
	public long countList(DvModular params);

	/**
	 * 根据业务id查询数据
	 * @param uuid 模块uuid
	 * @return 模块业务对象
	 */
	public DvModular searchByUuid(String uuid);

	/**
	 * 获取唯一标识
	 * @return uuId 模块唯一标识
	 */
	public String getUuid();

	/**
	 * 批量删除数据
	 * @param bo 项目招租管理业务对象
	 * @return 是否删除成功
	 */
	public long batchDelete(DvModular bo);


	/**
	 * 根据条件查询数据
	 * @param bo 查询参数
	 * @return 项目招租管理数据对象
	 */
	public List<DvModular> searchByParam(DvModular bo);

}