package cn.ffcs.dcl.homestaymanagement.service;

import java.util.ArrayList;
import java.util.List;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import cn.ffcs.dcl.mybatis.persistence.homestaymanagement.HomestayManagementMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 民宿管理模块服务实现
 * @Author: gonghf
 * @Date: 09-15 09:47:13
 * @Copyright: 2021 福富软件
 */
@Service("homestayManagementServiceImpl")
@Transactional
public class HomestayManagementServiceImpl implements IHomestayManagementService {

	@Autowired
	private HomestayManagementMapper homestayManagementMapper; //注入民宿管理模块dao

	@Autowired
	private IBaseDictionaryService baseDictionaryService;   // 数据字典。

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;   // 附件上传。

	/**
	 * 新增数据
	 * @param bo 民宿管理业务对象
	 * @return 民宿管理id
	 */
	@Override
	public Long insert(HomestayManagement bo) {
		// 获取唯一标识。
		bo.setUuid(homestayManagementMapper.getUuid());

		try {
			if (bo.getAttList() != null && bo.getAttList().size() > 0 && StringUtils.isEmpty(bo.getPicUrl())) {
				// 如果没有主图，则设置第一张图为封面
				for (AttachmentByUUID att : bo.getAttList()) {
					if(!StringUtils.isEmpty(att.getAttachmentType()) && att.getAttachmentType().equals(ConstantValue.DCL_HOMESTAY_PHOTO)) {
						bo.setPicUrl(att.getFilePath());
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		homestayManagementMapper.insert(bo);

		// 附件方法
		if (bo.getUuid() != null && bo.getAttachmentId() != null) {
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
		}

		return bo.getHomestayId();
	}

	/**
	 * 修改数据
	 * @param bo 民宿管理业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(HomestayManagement bo) {
		long result;

		// 只更新发布状态。
		if (!StringUtils.isEmpty(bo.getType())) {
			result = homestayManagementMapper.update(bo);
		} else {
			try {
				if (bo.getAttList() != null && bo.getAttList().size() > 0 && StringUtils.isEmpty(bo.getPicUrl())) {
					// 如果没有主图，则设置第一张图为封面
					for (AttachmentByUUID att : bo.getAttList()) {
						if (!StringUtils.isEmpty(att.getAttachmentType()) && att.getAttachmentType().equals(ConstantValue.DCL_HOMESTAY_PHOTO)) {
							bo.setPicUrl(att.getFilePath());
							break;
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			result = homestayManagementMapper.update(bo);

			// 附件方法
			attachmentByUUIDService.deleteByBizId(bo.getUuid(), ConstantValue.DCL_HOMESTAY_PHOTO);
			attachmentByUUIDService.deleteByBizId(bo.getUuid(), ConstantValue.DCL_HOMESTAY_VIDEO);
			if (bo.getUuid() != null && bo.getAttachmentId() != null) {
				attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
			}
		}

		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 民宿管理业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(HomestayManagement bo) {
		long result = homestayManagementMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 民宿管理分页数据对象
	 */
	@Override
	public PaginationDto<HomestayManagement> searchList(HomestayManagement bo) {
		RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());

		List<HomestayManagement> list = homestayManagementMapper.searchList(bo, rowBounds);
		long count = homestayManagementMapper.countList(bo);

		if (list != null && list.size() > 0) {
			// 数据字典 - 住宿标准。
			List<BaseDataDict> accommodationList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.ACCOMMODATION, bo.getOrgCode());
			// 数据字典 - 发布状态。
			List<BaseDataDict> issuStatusList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.ISSU_STATUS, bo.getOrgCode());

			for (HomestayManagement homestayManagement : list) {
				// 数据字典 - 住宿标准。
				DataDictHelper.setDictValueForField(homestayManagement, "accommodation", "accommodationName", accommodationList);
				// 数据字典 - 发布状态。
				DataDictHelper.setDictValueForField(homestayManagement, "issuStatus", "issuStatusName", issuStatusList);

				// 轮播图片
				try {
					// 设置第一张图为封面
					List<AttachmentByUUID> attList = attachmentByUUIDService.findByBizId(homestayManagement.getUuid(), ConstantValue.DCL_HOMESTAY_PHOTO);
					List<String> pathList = new ArrayList<>();

					for (AttachmentByUUID att : attList) {
						pathList.add(att.getFilePath());
					}
					homestayManagement.setImgList(pathList);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		PaginationDto<HomestayManagement> paginationDto = new PaginationDto<HomestayManagement>(count, list);

		return paginationDto;
	}

	/**
	 * 根据uuid查询数据
	 * @param uuid 民宿管理uuid
	 * @param orgCode 用户区域编码
	 * @return 民宿管理业务对象
	 */
	public HomestayManagement searchByUuid(String uuid, String orgCode) {
		HomestayManagement bo = homestayManagementMapper.searchByUuid(uuid);

		// 数据字典 - 住宿标准。
		List<BaseDataDict> accommodationList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.ACCOMMODATION, orgCode);
		DataDictHelper.setDictValueForField(bo, "accommodation", "accommodationName", accommodationList);
		// 数据字典 - 发布状态。
		List<BaseDataDict> issuStatusList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.ISSU_STATUS, orgCode);
		DataDictHelper.setDictValueForField(bo, "issuStatus", "issuStatusName", issuStatusList);

		return bo;
	}

	/**
	 * 根据id查询数据
	 * @param id 民宿管理id
	 * @return 民宿管理业务对象
	 */
	public HomestayManagement searchById(Long id) {
		HomestayManagement bo = homestayManagementMapper.searchById(id);
		return bo;
	}

}