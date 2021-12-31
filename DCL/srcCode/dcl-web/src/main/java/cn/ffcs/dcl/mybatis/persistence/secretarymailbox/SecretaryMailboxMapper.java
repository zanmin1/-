package cn.ffcs.dcl.mybatis.persistence.secretarymailbox;

import cn.ffcs.dcl.mybatis.domain.secretarymailbox.SecretaryMailbox;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Description: 书记信箱模块dao接口
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */
public interface SecretaryMailboxMapper {
	
	/**
	 * 新增数据
	 * @param bo 书记信箱业务对象
	 * @return 书记信箱id
	 */
	public long insert(SecretaryMailbox bo);
	
	/**
	 * 删除数据
	 * @param bo 书记信箱业务对象
	 * @return 删除的记录数
	 */
	public long delete(SecretaryMailbox bo);
	
	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 书记信箱数据列表
	 */
	public List<SecretaryMailbox> searchList(SecretaryMailbox bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param bo 查询参数
	 * @return 书记信箱数据总数
	 */
	public long countList(SecretaryMailbox bo);

	/**
	 * 根据uuid查询数据
	 * @param uuid 书记信箱uuid
	 * @return 书记信箱业务对象
	 */
	public SecretaryMailbox searchByUuid(String uuid);

	/**
	 * 获取uuid
	 * @return uuId 书记信箱uuid
	 */
	public String getUuid();

}