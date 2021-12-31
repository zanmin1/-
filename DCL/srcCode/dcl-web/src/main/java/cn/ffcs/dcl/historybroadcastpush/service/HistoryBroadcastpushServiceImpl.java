package cn.ffcs.dcl.historybroadcastpush.service;

import java.util.List;
import java.util.Map;

import cn.ffcs.dcl.mybatis.domain.historybroadcastpush.HistoryBroadcastpush;
import cn.ffcs.dcl.mybatis.domain.historydetail.HistoryDetail;
import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import cn.ffcs.dcl.mybatis.persistence.historybroadcastpush.HistoryBroadcastpushMapper;
import cn.ffcs.dcl.mybatis.persistence.historydetail.HistoryDetailMapper;
import cn.ffcs.dcl.mybatis.persistence.voicePeople.VoicePeopleMapper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.voicePeople.service.IVoicePeopleService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 历史播报推送模块服务实现
 * @Author: sunwb
 * @Date: 12-22 09:53:30
 * @Copyright: 2021 福富软件
 */
@Service("historyBroadcastpushServiceImpl")
@Transactional
public class HistoryBroadcastpushServiceImpl implements IHistoryBroadcastpushService {

	@Autowired
	private HistoryBroadcastpushMapper historyBroadcastpushMapper; //注入历史播报推送模块dao

	@Autowired
	private IVoicePeopleService voicePeopleService; //注入语音人员表模块服务

	@Autowired
	private HistoryDetailMapper historyDetailMapper; //注入历史推送详情模块dao
	/**
	 * 新增数据
	 * @param bo 历史播报推送业务对象
	 * @return 历史播报推送id
	 */
	@Override
	public String insert(HistoryBroadcastpush bo) {
		historyBroadcastpushMapper.insert(bo);
		String[] peoUuids =null;

		try {
			peoUuids = bo.getPeopleIds().split(",");

		}catch (Exception e){
			e.printStackTrace();
		}

		if(peoUuids!=null&&peoUuids.length>0){

			for(  String uuid:  peoUuids){
				//插入子表
				VoicePeople voicePeople	=	voicePeopleService.searchByUUId(uuid);

				HistoryDetail  historyDetail =new HistoryDetail();
				historyDetail.setPeopleId(uuid);
				historyDetail.setName(voicePeople.getName());
				historyDetail.setAddr(voicePeople.getAddress());
				historyDetail.setSex(voicePeople.getSexStr());
				historyDetail.setPhone(Long.parseLong(voicePeople.getTel()));
				if(bo.getFailNum().indexOf(voicePeople.getTel())>0) {
					historyDetail.setStatus("0");
				}else {
					historyDetail.setStatus("1");
				}
				historyDetail.setParentId(bo.getPushId());
				historyDetailMapper.insert(historyDetail);
			}

		}


		return bo.getPushId();
	}

	/**
	 * 修改数据
	 * @param bo 历史播报推送业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(HistoryBroadcastpush bo) {
		long result = historyBroadcastpushMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 历史播报推送业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(HistoryBroadcastpush bo) {
		long result = historyBroadcastpushMapper.delete(bo);

		if (result>0){
			List<String> ids =bo.getDelList();
			for (String id:ids) {
				HistoryDetail  historyDetail =new HistoryDetail();
				historyDetail.setParentId(id);
				historyDetail.setUpdator(bo.getUpdator());

				historyDetailMapper.deleteByParentId(historyDetail);
			}
		}
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 历史播报推送分页数据对象
	 */
	@Override
	public PaginationDto<HistoryBroadcastpush> searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<HistoryBroadcastpush> list = historyBroadcastpushMapper.searchList(params, rowBounds);
		long count = historyBroadcastpushMapper.countList(params);
		PaginationDto pagination = new PaginationDto(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 历史播报推送id
	 * @return 历史播报推送业务对象
	 */
	@Override
	public HistoryBroadcastpush searchById(Long id) {
		HistoryBroadcastpush bo = historyBroadcastpushMapper.searchById(id);
		return bo;
	}

}