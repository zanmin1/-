package cn.ffcs.dcl.mailboxreply.service;

import java.util.ArrayList;
import java.util.List;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.mybatis.domain.mailboxreply.MailboxReply;
import cn.ffcs.dcl.mybatis.persistence.mailboxreply.MailboxReplyMapper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 书记信箱回复模块服务实现
 * @Author: gonghf
 * @Date: 09-27 09:34:11
 * @Copyright: 2021 福富软件
 */
@Service("mailboxReplyServiceImpl")
@Transactional
public class MailboxReplyServiceImpl implements IMailboxReplyService {

	@Autowired
	private MailboxReplyMapper mailboxReplyMapper; //注入书记信箱回复模块dao

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;   // 附件上传。

	/**
	 * 新增数据
	 * @param bo 书记信箱回复业务对象
	 * @return 书记信箱回复id
	 */
	@Override
	public Long insert(MailboxReply bo) {
		// 获取uuid。
		bo.setUuid(mailboxReplyMapper.getUuid());

		mailboxReplyMapper.insert(bo);

		// 附件。
		if (bo.getAttachmentId() != null && bo.getAttachmentId().length > 0) {
			// 去除留言附件，防止新增回复附件时，出现根据attachmentId覆盖uuid的情况。
			int length = 0;   // 回复附件数组长度。
			List<AttachmentByUUID> tempAttList = new ArrayList<>();   // 回复附件临时集合。

			// 获取回复附件长度、集合。
			for (AttachmentByUUID attachment : bo.getAttList()) {
				if (attachment.getAttachmentType().equals(ConstantValue.MAILBOX_REPLY_FILE)) {
					length++;
					tempAttList.add(attachment);
				}
			}

			if (length > 0) {
				Long[] tempIdList = new Long[length];

				for (int i = 0; i < tempIdList.length; i++) {
					tempIdList[i] = tempAttList.get(i).getAttachmentId();
				}

				attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, tempIdList);
			}
		}

		return bo.getMailboxReplyId();
	}

	/**
	 * 修改数据
	 * @param bo 书记信箱回复业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(MailboxReply bo) {
		long result = mailboxReplyMapper.update(bo);

		// 附件。
		attachmentByUUIDService.deleteByBizId(bo.getUuid(), ConstantValue.MAILBOX_REPLY_FILE);
		if (bo.getAttachmentId() != null && bo.getAttachmentId().length > 0) {
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
		}

		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 书记信箱回复业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(MailboxReply bo) {
		long result = mailboxReplyMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 书记信箱回复分页数据对象
	 */
	public PaginationDto<MailboxReply> searchList(MailboxReply bo) {
		RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());

		List<MailboxReply> list = mailboxReplyMapper.searchList(bo, rowBounds);
		long count = mailboxReplyMapper.countList(bo);

		PaginationDto<MailboxReply> paginationDto = new PaginationDto<MailboxReply>(count, list);

		return paginationDto;
	}

	/**
	 * 根据uuid查询数据
	 * @param uuid 书记信箱回复uuid
	 * @return 书记信箱回复业务对象
	 */
	public MailboxReply searchByUuid(String uuid) {
		MailboxReply bo = mailboxReplyMapper.searchByUuid(uuid);
		return bo;
	}

}