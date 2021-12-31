package cn.ffcs.dcl.historybroadcastpush.service;

import cn.ffcs.dcl.mybatis.domain.historybroadcastpush.HistoryBroadcastpush;
import cn.ffcs.dcl.utils.PaginationDto;

import java.util.Map;


/**
 * @Description: 历史播报推送模块服务
 * @Author: sunwb
 * @Date: 12-22 09:53:30
 * @Copyright: 2021 福富软件
 */
public interface IHistoryBroadcastpushService {

	/**
	 * 新增数据
	 * @param bo 历史播报推送业务对象
	 * @return 历史播报推送id
	 */
	public String insert(HistoryBroadcastpush bo);

	/**
	 * 修改数据
	 * @param bo 历史播报推送业务对象
	 * @return 是否修改成功
	 */
	public boolean update(HistoryBroadcastpush bo);

	/**
	 * 删除数据
	 * @param bo 历史播报推送业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(HistoryBroadcastpush bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 历史播报推送分页数据对象
	 */
	public PaginationDto<HistoryBroadcastpush> searchList(int page, int rows, Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 历史播报推送id
	 * @return 历史播报推送业务对象
	 */
	public HistoryBroadcastpush searchById(Long id);

}