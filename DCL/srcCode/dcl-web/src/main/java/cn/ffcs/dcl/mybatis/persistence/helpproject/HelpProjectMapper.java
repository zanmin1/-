package cn.ffcs.dcl.mybatis.persistence.helpproject;

import cn.ffcs.dcl.mybatis.domain.helpproject.HelpProject;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;

/**
 * @Description: 帮扶项目模块dao接口
 * @Author: zhengby
 * @Date: 10-19 17:05:50
 * @Copyright: 2021 福富软件
 */
public interface HelpProjectMapper {
	
	/**
	 * 新增数据
	 * @param bo 帮扶项目业务对象
	 * @return 帮扶项目id
	 */
	public long insert(HelpProject bo);
	
	/**
	 * 修改数据
	 * @param bo 帮扶项目业务对象
	 * @return 修改的记录数
	 */
	public long update(HelpProject bo);
	
	/**
	 * 删除数据
	 * @param bo 帮扶项目业务对象
	 * @return 删除的记录数
	 */
	public long delete(HelpProject bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 帮扶项目数据列表
	 */
	public List<HelpProject> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 帮扶项目数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 帮扶项目id
	 * @return 帮扶项目业务对象
	 */
	public HelpProject searchById(Long id);

	public HelpProject searchByUUId(String uuid);
}