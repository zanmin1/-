package cn.ffcs.dcl.historydetail.service;

import cn.ffcs.dcl.mybatis.domain.historydetail.HistoryDetail;
import cn.ffcs.dcl.utils.PaginationDto;

import java.util.Map;

/**
 * @Description: 历史推送详情模块服务
 * @Author: niguolong
 * @Date: 12-21 19:58:58
 * @Copyright: 2021 福富软件
 */
public interface HistoryDetailService {

	/**
	 * 新增数据
	 * @param bo 历史推送详情业务对象
	 * @return 历史推送详情id
	 */
	public String insert(HistoryDetail bo);

	/**
	 * 修改数据
	 * @param bo 历史推送详情业务对象
	 * @return 是否修改成功
	 */
	public boolean update(HistoryDetail bo);

	/**
	 * 删除数据
	 * @param bo 历史推送详情业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(HistoryDetail bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 历史推送详情分页数据对象
	 */
	public PaginationDto<HistoryDetail> searchList(int page, int rows, Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 历史推送详情id
	 * @return 历史推送详情业务对象
	 */
	public HistoryDetail searchById(String id);

}