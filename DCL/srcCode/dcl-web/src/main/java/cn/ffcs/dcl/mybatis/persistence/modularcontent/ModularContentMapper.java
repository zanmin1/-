package cn.ffcs.dcl.mybatis.persistence.modularcontent;

import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;

/**
 * @Description: 模块内容管理模块dao接口
 * @Author: xuewq
 * @Date: 09-24 09:53:07
 * @Copyright: 2021 福富软件
 */
public interface ModularContentMapper {
	
	/**
	 * 新增数据
	 * @param bo 模块内容管理业务对象
	 * @return 模块内容管理id
	 */
	public long insert(ModularContent bo);
	
	/**
	 * 修改数据
	 * @param bo 模块内容管理业务对象
	 * @return 修改的记录数
	 */
	public long update(ModularContent bo);
	
	/**
	 * 删除数据
	 * @param bo 模块内容管理业务对象
	 * @return 删除的记录数
	 */
	public long delete(ModularContent bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 模块内容数据列表
	 */
	public List<ModularContent> searchList(ModularContent params, RowBounds rowBounds);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 模块内容数据列表
	 */
	public List<ModularContent> searchListByconvenient(ModularContent params, RowBounds rowBounds);

	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 模块内容数据总数
	 */
	public long countListByconvenient(ModularContent params);

	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 模块内容数据总数
	 */
	public long countList(ModularContent params);

	/**
	 * 根据业务id查询数据
	 * @param uuid 模块内容uuid
	 * @return 模块内容业务对象
	 */
	public ModularContent searchByUuid(String uuid);

	/**
	 * 获取唯一标识
	 * @return uuId 模块内容唯一标识
	 */
	public String getUuid();

	/**
	 * 批量删除数据
	 * @param bo 模块内容管理业务对象
	 * @return 是否删除成功
	 */
	public long batchDelete(ModularContent bo);


	/**
	 * 根据条件查询数据
	 * @param bo 查询参数
	 * @return 模块内容管理数据对象
	 */
	public List<ModularContent> searchByParam(ModularContent bo);


	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 模块内容数据列表
	 */
	public DvTheme searchListForAPP(ModularContent bo);
}