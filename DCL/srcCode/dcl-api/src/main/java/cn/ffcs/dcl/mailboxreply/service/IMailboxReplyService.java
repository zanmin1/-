package cn.ffcs.dcl.mailboxreply.service;

import cn.ffcs.dcl.mybatis.domain.mailboxreply.MailboxReply;
import cn.ffcs.dcl.utils.PaginationDto;

/**
 * @Description: 书记信箱回复模块服务
 * @Author: gonghf
 * @Date: 09-27 09:34:11
 * @Copyright: 2021 福富软件
 */
public interface IMailboxReplyService {

	/**
	 * 新增数据
	 * @param bo 书记信箱回复业务对象
	 * @return 书记信箱回复id
	 */
	public Long insert(MailboxReply bo);

	/**
	 * 修改数据
	 * @param bo 书记信箱回复业务对象
	 * @return 是否修改成功
	 */
	public boolean update(MailboxReply bo);

	/**
	 * 删除数据
	 * @param bo 书记信箱回复业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(MailboxReply bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 书记信箱回复分页数据对象
	 */
	public PaginationDto<MailboxReply> searchList(MailboxReply bo);
	
	/**
	 * 根据uuid查询数据
	 * @param uuid 书记信箱回复uuid
	 * @return 书记信箱回复业务对象
	 */
	public MailboxReply searchByUuid(String uuid);

}