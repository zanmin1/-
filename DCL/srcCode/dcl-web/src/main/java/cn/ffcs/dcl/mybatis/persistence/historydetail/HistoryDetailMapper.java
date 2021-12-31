package cn.ffcs.dcl.mybatis.persistence.historydetail;

import cn.ffcs.dcl.mybatis.domain.historydetail.HistoryDetail;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 历史推送详情模块dao接口
 * @Author: niguolong
 * @Date: 12-21 19:58:58
 * @Copyright: 2021 福富软件
 */
public interface HistoryDetailMapper {
	
	/**
	 * 新增数据
	 * @param bo 历史推送详情业务对象
	 * @return 历史推送详情id
	 */
	public long insert(HistoryDetail bo);
	
	/**
	 * 修改数据
	 * @param bo 历史推送详情业务对象
	 * @return 修改的记录数
	 */
	public long update(HistoryDetail bo);
	
	/**
	 * 删除数据
	 * @param bo 历史推送详情业务对象
	 * @return 删除的记录数
	 */
	public long delete(HistoryDetail bo);

//
	public long deleteByParentId(HistoryDetail bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 历史推送详情数据列表
	 */
	public List<HistoryDetail> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 历史推送详情数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 历史推送详情id
	 * @return 历史推送详情业务对象
	 */
	public HistoryDetail searchById(String id);

}