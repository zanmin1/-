package cn.ffcs.dcl.mybatis.persistence.dvtheme;

import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import java.util.List;

/**
 * @Description: 主题模块dao接口
 * @Author: xuewq
 * @Date: 09-24 09:52:47
 * @Copyright: 2021 福富软件
 */
public interface DvThemeMapper {
	
	/**
	 * 新增数据
	 * @param bo 主题业务对象
	 * @return 主题id
	 */
	public long insert(DvTheme bo);
	
	/**
	 * 修改数据
	 * @param bo 主题业务对象
	 * @return 修改的记录数
	 */
	public long update(DvTheme bo);
	
	/**
	 * 删除数据
	 * @param bo 主题业务对象
	 * @return 删除的记录数
	 */
	public long delete(DvTheme bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 主题数据列表
	 */
	public List<DvTheme> searchList(DvTheme params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 主题数据总数
	 */
	public long countList(DvTheme params);

	/**
	 * 根据业务id查询数据
	 * @param uuid 主题uuid
	 * @return 主题业务对象
	 */
	public DvTheme searchByUuid(String uuid);

	/**
	 * 获取唯一标识
	 * @return uuId 主题唯一标识
	 */
	public String getUuid();

	/**
	 * 批量删除数据
	 * @param bo 项目招租管理业务对象
	 * @return 是否删除成功
	 */
	public long batchDelete(DvTheme bo);


	/**
	 * 根据条件查询数据
	 * @param bo 查询参数
	 * @return 项目招租管理数据对象
	 */
	public List<DvTheme> searchByParam(DvTheme bo);

	/**
	 * 给办事分类查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 主题数据列表
	 */
	public List<DvTheme> searchListByBsfl(DvTheme params, RowBounds rowBounds);

	public long countListByBsfl(DvTheme params);
}