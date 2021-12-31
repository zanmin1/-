package cn.ffcs.dcl.voiceGroup.service;

import cn.ffcs.dcl.mybatis.domain.voiceGroup.VoiceGroup;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;

/**
 * @Description: 语音群组表模块服务
 * @Author: 王文杰
 * @Date: 12-27 16:41:33
 * @Copyright: 2021 福富软件
 */
public interface IVoiceGroupService {

	/**
	 * 新增数据
	 * @param bo 语音群组表业务对象
	 * @return 语音群组表id
	 */
	public Long insert(VoiceGroup bo);

	/**
	 * 修改数据
	 * @param bo 语音群组表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(VoiceGroup bo);

	/**
	 * 删除数据
	 * @param bo 语音群组表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(VoiceGroup bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 语音群组表分页数据对象
	 */
	public EUDGPagination searchList(VoiceGroup bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 语音群组表id
	 * @return 语音群组表业务对象
	 */
	public VoiceGroup searchById(Long id);

	/**
	 * 根据业务id查询数据
	 * @param id 语音群组表id
	 * @return 语音群组表业务对象
	 */
	public VoiceGroup searchByuuId(String id);

}