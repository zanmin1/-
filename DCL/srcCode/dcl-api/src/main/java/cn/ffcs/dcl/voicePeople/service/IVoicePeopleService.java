package cn.ffcs.dcl.voicePeople.service;

import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;


/**
 * @Description: 语音人员表模块服务
 * @Author: 王文杰
 * @Date: 12-24 15:54:18
 * @Copyright: 2021 福富软件
 */
public interface IVoicePeopleService {

	/**
	 * 新增数据
	 * @param bo 语音人员表业务对象
	 * @return 语音人员表id
	 */
	public Long insert(VoicePeople bo);

	/**
	 * 修改数据
	 * @param bo 语音人员表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(VoicePeople bo);

	/**
	 * 删除数据
	 * @param bo 语音人员表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(VoicePeople bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 语音人员表分页数据对象
	 */
	public EUDGPagination searchList( VoicePeople bo,String code);
	
	/**
	 * 根据业务id查询数据
	 * @param id 语音人员表id
	 * @return 语音人员表业务对象
	 */
	public VoicePeople searchById(Long id);


	/**
	 * 根据业务uuid查询数据
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