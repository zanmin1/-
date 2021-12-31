package cn.ffcs.dcl.mybatis.persistence.historybroadcastpush;

import cn.ffcs.dcl.mybatis.domain.historybroadcastpush.HistoryBroadcastpush;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;


/**
 * @Description: 历史播报推送模块dao接口
 * @Author: sunwb
 * @Date: 12-22 09:53:30
 * @Copyright: 2021 福富软件
 */
public interface HistoryBroadcastpushMapper {
	
	/**
	 * 新增数据
	 * @param bo 历史播报推送业务对象
	 * @return 历史播报推送id
	 */
	public long insert(HistoryBroadcastpush bo);
	
	/**
	 * 修改数据
	 * @param bo 历史播报推送业务对象
	 * @return 修改的记录数
	 */
	public long update(HistoryBroadcastpush bo);
	
	/**
	 * 删除数据
	 * @param bo 历史播报推送业务对象
	 * @return 删除的记录数
	 */
	public long delete(HistoryBroadcastpush bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 历史播报推送数据列表
	 */
	public List<HistoryBroadcastpush> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 历史播报推送数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 历史播报推送id
	 * @return 历史播报推送业务对象
	 */
	public HistoryBroadcastpush searchById(Long id);

}