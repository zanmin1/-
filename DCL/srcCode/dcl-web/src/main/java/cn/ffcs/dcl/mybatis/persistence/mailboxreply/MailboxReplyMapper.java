package cn.ffcs.dcl.mybatis.persistence.mailboxreply;

import cn.ffcs.dcl.mybatis.domain.mailboxreply.MailboxReply;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Description: 书记信箱回复模块dao接口
 * @Author: gonghf
 * @Date: 09-27 09:34:11
 * @Copyright: 2021 福富软件
 */
public interface MailboxReplyMapper {
	
	/**
	 * 新增数据
	 * @param bo 书记信箱回复业务对象
	 * @return 书记信箱回复id
	 */
	public long insert(MailboxReply bo);
	
	/**
	 * 修改数据
	 * @param bo 书记信箱回复业务对象
	 * @return 修改的记录数
	 */
	public long update(MailboxReply bo);
	
	/**
	 * 删除数据
	 * @param bo 书记信箱回复业务对象
	 * @return 删除的记录数
	 */
	public long delete(MailboxReply bo);
	
	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 书记信箱回复数据列表
	 */
	public List<MailboxReply> searchList(MailboxReply bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param bo 查询参数
	 * @return 书记信箱回复数据总数
	 */
	public long countList(MailboxReply bo);

	/**
	 * 根据uuid查询数据
	 * @param uuid 书记信箱回复uuid
	 * @return 书记信箱回复业务对象
	 */
	public MailboxReply searchByUuid(String uuid);

	/**
	 * 获取uuid
	 * @return uuId 书记信箱回复uuid
	 */
	public String getUuid();

}