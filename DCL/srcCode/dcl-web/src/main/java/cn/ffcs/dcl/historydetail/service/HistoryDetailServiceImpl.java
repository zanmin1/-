package cn.ffcs.dcl.historydetail.service;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.fundmanagement.FundManagement;
import cn.ffcs.dcl.mybatis.domain.historydetail.HistoryDetail;
import cn.ffcs.dcl.mybatis.persistence.historydetail.HistoryDetailMapper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Description: 历史推送详情模块服务实现
 * @Author: niguolong
 * @Date: 12-21 19:58:58
 * @Copyright: 2021 福富软件
 */
@Service("historyDetailServiceImpl")
@Transactional
public class HistoryDetailServiceImpl implements HistoryDetailService {

	@Autowired
	private HistoryDetailMapper historyDetailMapper; //注入历史推送详情模块dao
	@Autowired
	private IBaseDictionaryService baseDictionaryService;
	/**
	 * 新增数据
	 * @param bo 历史推送详情业务对象
	 * @return 历史推送详情id
	 */
	@Override
	public String insert(HistoryDetail bo) {
		historyDetailMapper.insert(bo);
		return bo.getDetailId();
	}

	/**
	 * 修改数据
	 * @param bo 历史推送详情业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(HistoryDetail bo) {
		long result = historyDetailMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 历史推送详情业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(HistoryDetail bo) {
		long result = historyDetailMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 历史推送详情分页数据对象
	 */
	@Override
	public PaginationDto<HistoryDetail> searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<HistoryDetail> list = historyDetailMapper.searchList(params, rowBounds);
		long count = historyDetailMapper.countList(params);
		PaginationDto pagination = new PaginationDto(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 历史推送详情id
	 * @return 历史推送详情业务对象
	 */
	@Override
	public HistoryDetail searchById(String id) {
		HistoryDetail bo = historyDetailMapper.searchById(id);
		return bo;
	}


}