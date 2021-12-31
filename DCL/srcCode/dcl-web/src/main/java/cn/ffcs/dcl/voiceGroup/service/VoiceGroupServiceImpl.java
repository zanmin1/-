package cn.ffcs.dcl.voiceGroup.service;

import java.util.List;
import java.util.Map;

import cn.ffcs.dcl.mybatis.domain.voiceGroup.VoiceGroup;
import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import cn.ffcs.dcl.mybatis.persistence.voiceGroup.VoiceGroupMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**
 * @Description: 语音群组表模块服务实现
 * @Author: 王文杰
 * @Date: 12-27 16:41:33
 * @Copyright: 2021 福富软件
 */
@Service("voiceGroupServiceImpl")
@Transactional
public class VoiceGroupServiceImpl implements IVoiceGroupService {

	@Autowired
	private VoiceGroupMapper voiceGroupMapper; //注入语音群组表模块dao

	/**
	 * 新增数据
	 * @param bo 语音群组表业务对象
	 * @return 语音群组表id
	 */
	@Override
	public Long insert(VoiceGroup bo) {
		voiceGroupMapper.insert(bo);
		return bo.getGroupId();
	}

	/**
	 * 修改数据
	 * @param bo 语音群组表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(VoiceGroup bo) {
		long result = voiceGroupMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 语音群组表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(VoiceGroup bo) {
		long result = voiceGroupMapper.delete(bo);
		return result > 0;
	}

	/**
	 * @return 语音群组表分页数据对象
	 */
	@Override
	public EUDGPagination searchList(VoiceGroup bo) {
		RowBounds rowBounds = new RowBounds(0, 100);
		List<VoiceGroup> list = voiceGroupMapper.searchList(bo, rowBounds);
		long count = voiceGroupMapper.countList(bo);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 语音群组表id
	 * @return 语音群组表业务对象
	 */
	@Override
	public VoiceGroup searchById(Long id) {
		VoiceGroup bo = voiceGroupMapper.searchById(id);
		return bo;
	}



	@Override
	public VoiceGroup searchByuuId(String id) {
		VoiceGroup bo = voiceGroupMapper.searchByUUId(id);
		return bo;
	}
}