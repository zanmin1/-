package cn.ffcs.dcl.mybatis.persistence.indexcontent;

import cn.ffcs.dcl.mybatis.domain.indexcontent.IndexContent;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 首页展示内容管理模块dao接口
 * @Author: xuewq
 * @Date: 12-13 15:07:25
 * @Copyright: 2021 福富软件
 */
public interface IndexContentMapper {
	
	/**
	 * 新增数据
	 * @param bo 首页展示内容管理业务对象
	 * @return 首页展示内容管理id
	 */
	public long insert(IndexContent bo);
	
	/**
	 * 修改数据
	 * @param bo 首页展示内容管理业务对象
	 * @return 修改的记录数
	 */
	public long update(IndexContent bo);
	
	/**
	 * 删除数据
	 * @param bo 首页展示内容管理业务对象
	 * @return 删除的记录数
	 */
	public long delete(IndexContent bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 模块内容数据列表
	 */
	public List<IndexContent> searchList(IndexContent params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 首页展示内容管理数据总数
	 */
	public long countList(IndexContent params);
	
	/**
	 * 根据业务id查询数据
	 * @param params 首页展示内容
	 * @return 首页展示内容管理业务对象
	 */
	public IndexContent searchByParam(IndexContent params);

	/**
	 * 获取唯一uuid
	 * @return 首页展示内容管理业务对象
	 */
	public String getUuid();
}