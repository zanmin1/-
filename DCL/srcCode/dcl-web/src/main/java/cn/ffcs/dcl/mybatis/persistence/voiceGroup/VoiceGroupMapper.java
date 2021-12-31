package cn.ffcs.dcl.mybatis.persistence.voiceGroup;

import cn.ffcs.dcl.mybatis.domain.voiceGroup.VoiceGroup;
import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;

/**
 * @Description: 语音群组表模块dao接口
 * @Author: 王文杰
 * @Date: 12-27 16:41:33
 * @Copyright: 2021 福富软件
 */
public interface VoiceGroupMapper {
	
	/**
	 * 新增数据
	 * @param bo 语音群组表业务对象
	 * @return 语音群组表id
	 */
	public long insert(VoiceGroup bo);
	
	/**
	 * 修改数据
	 * @param bo 语音群组表业务对象
	 * @return 修改的记录数
	 */
	public long update(VoiceGroup bo);
	
	/**
	 * 删除数据
	 * @param bo 语音群组表业务对象
	 * @return 删除的记录数
	 */
	public long delete(VoiceGroup bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 语音群组表数据列表
	 */
	public List<VoiceGroup> searchList(VoiceGroup params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 语音群组表数据总数
	 */
	public long countList(VoiceGroup params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 语音群组表id
	 * @return 语音群组表业务对象
	 */
	public VoiceGroup searchById(Long id);

	/**
	 * 根据业务id查询数据
	 * @param id 语音人员表id
	 * @return 语音人员表业务对象
	 */
	public VoiceGroup searchByUUId(String id);

}