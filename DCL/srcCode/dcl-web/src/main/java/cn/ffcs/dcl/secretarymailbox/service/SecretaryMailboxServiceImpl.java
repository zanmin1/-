package cn.ffcs.dcl.secretarymailbox.service;

import java.util.List;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.secretarymailbox.SecretaryMailbox;
import cn.ffcs.dcl.mybatis.persistence.secretarymailbox.SecretaryMailboxMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 书记信箱模块服务实现
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */
@Service("secretaryMailboxServiceImpl")
@Transactional
public class SecretaryMailboxServiceImpl implements ISecretaryMailboxService {

	@Autowired
	private SecretaryMailboxMapper secretaryMailboxMapper; //注入书记信箱模块dao

	@Autowired
	private IBaseDictionaryService baseDictionaryService;   // 数据字典。

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;   // 附件上传。

	/**
	 * 新增数据
	 * @param bo 书记信箱业务对象
	 * @return 书记信箱id
	 */
	@Override
	public Long insert(SecretaryMailbox bo) {
		// 获取uuid。
		bo.setUuid(secretaryMailboxMapper.getUuid());

		secretaryMailboxMapper.insert(bo);

		// 附件。
		if (bo.getAttachmentId() != null && bo.getAttachmentId().length > 0) {
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId());
		}

		return bo.getSecretaryMailboxId();
	}

	/**
	 * 删除数据
	 * @param bo 书记信箱业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(SecretaryMailbox bo) {
		long result = secretaryMailboxMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 书记信箱分页数据对象
	 */
	public PaginationDto<SecretaryMailbox> searchList(SecretaryMailbox bo) {
		RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());

		List<SecretaryMailbox> list = secretaryMailboxMapper.searchList(bo, rowBounds);
		long count = secretaryMailboxMapper.countList(bo);

		if (list != null && list.size() > 0) {
			// 数据字典 - 是否公开。
			List<BaseDataDict> visibleList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, bo.getRegionCode());

			for (SecretaryMailbox secretaryMailbox : list) {
				if (!StringUtils.isEmpty(secretaryMailbox.getReply())) {
					// 回复状态。
					secretaryMailbox.setReplyStatus("1");
					secretaryMailbox.setReplyStatusName("已回复");

					// 数据字典 - 是否公开。
					DataDictHelper.setDictValueForField(secretaryMailbox, "replyVisible", "replyVisibleName", visibleList);
				} else {
					// 回复状态。
					secretaryMailbox.setReplyStatus("2");
					secretaryMailbox.setReplyStatusName("未回复");

					// 是否公开。
					secretaryMailbox.setReplyVisible("0");
					secretaryMailbox.setReplyVisibleName("否");
				}
			}
		}

		PaginationDto<SecretaryMailbox> paginationDto = new PaginationDto<SecretaryMailbox>(count, list);

		return paginationDto;
	}

	/**
	 * 根据uuid查询数据
	 * @param uuid 书记信箱uuid
	 * @param regionCode 用户区域编码
	 * @return 书记信箱业务对象
	 */
	public SecretaryMailbox searchByUuid(String uuid, String regionCode) {
		SecretaryMailbox bo = secretaryMailboxMapper.searchByUuid(uuid);

		if (bo != null) {
			// 是否公开。
			if (!StringUtils.isEmpty(bo.getReply())) {
				List<BaseDataDict> visibleList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, regionCode);
				DataDictHelper.setDictValueForField(bo, "replyVisible", "replyVisibleName", visibleList);
			} else {
				bo.setReplyVisible("0");
				bo.setReplyVisibleName("否");
			}
		}

		return bo;
	}

}