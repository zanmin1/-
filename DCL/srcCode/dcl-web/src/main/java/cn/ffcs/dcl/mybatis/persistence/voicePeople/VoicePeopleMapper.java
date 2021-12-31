package cn.ffcs.dcl.mybatis.persistence.voicePeople;


import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 语音人员表模块dao接口
 * @Author: 王文杰
 * @Date: 12-24 15:54:18
 * @Copyright: 2021 福富软件
 */
public interface VoicePeopleMapper {
	
	/**
	 * 新增数据
	 * @param bo 语音人员表业务对象
	 * @return 语音人员表id
	 */
	public long insert(VoicePeople bo);
	
	/**
	 * 修改数据
	 * @param bo 语音人员表业务对象
	 * @return 修改的记录数
	 */
	public long update(VoicePeople bo);
	
	/**
	 * 删除数据
	 * @param bo 语音人员表业务对象
	 * @return 删除的记录数
	 */
	public long delete(VoicePeople bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 语音人员表数据列表
	 */
	public List<VoicePeople> searchList(VoicePeople bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 语音人员表数据总数
	 */
	public long countList(VoicePeople bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 语音人员表id
	 * @return 语音人员表业务对象
	 */
	public VoicePeople searchById(Long id);

	/**
	 * 根据业务id查询数据
	 * @param id 语音人员表id
	 * @return 语音人员表业务对象
	 */
	public VoicePeople searchByUUId(String id);


	/**
	 * 根据业务id查询数据
	 * @param tel
	 * @return 语音人员表业务对象
	 */
	public VoicePeople searchByTel(String tel);


}