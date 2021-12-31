package cn.ffcs.dcl.restoilet.service;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.mybatis.domain.restoilet.ResToilet;
import cn.ffcs.dcl.mybatis.persistence.restoilet.ResToiletMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description: 公厕信息表模块服务实现
 * @Author: linguoxiong
 * @Date: 09-09 09:24:51
 * @Copyright: 2021 福富软件
 */
@Service("resToiletServiceImpl")
@Transactional
public class ResToiletServiceImpl implements IResToiletService {

	@Autowired
	private ResToiletMapper resToiletMapper; //注入公厕信息表模块dao

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;

	@Autowired
	private IBaseDictionaryService baseDictionaryService; //注入模块管理模块dao

	private static final String GC_WC_PIC_TYPE = "gcWcPicType";

	/**
	 * 新增数据
	 * @param bo 公厕信息表业务对象
	 * @return 公厕信息表id
	 */
	@Override
	public Long insert(ResToilet bo) {
		resToiletMapper.insert(bo);
		ResToilet r = null;
		if (bo.getResToiletId() != null && bo.getResToiletId() > 0){
			r = resToiletMapper.searchByIds(bo.getResToiletId());
		}else {
			return 0l;
		}
		if(bo.getAttachmentId() != null){
			attachmentByUUIDService.updateBizIdNullFilter(r.getUuid(), null, bo.getAttachmentId(), "001");
		//	boolean updateData = attachmentByUUIDService.updateBizId(r.getUuid(),GC_WC_PIC_TYPE,bo.getAttachmentId(),"001");
		}

		return bo.getResToiletId();
	}

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(ResToilet bo) {
		long result = resToiletMapper.update(bo);
		if (bo.getUuid() != null) {
			attachmentByUUIDService.deleteByBizId(bo.getUuid(), GC_WC_PIC_TYPE);
		}
		if (bo.getAttachmentId() != null) {
			boolean updateData = attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
		}

		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 公厕信息表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(ResToilet bo) {
		long result = resToiletMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 公厕信息表分页数据对象
	 */
	@Override
	public PaginationDto<ResToilet> searchList(ResToilet bo) {
		RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());
		List<ResToilet> list = resToiletMapper.searchList(bo, rowBounds);
		long count = resToiletMapper.countList(bo);
		if (list != null && list.size() > 0) {
			setLsitDict(list,bo);
		}
		PaginationDto<ResToilet> paginationDto = new PaginationDto<>(count,list);
		return paginationDto;
	}

	/**
	 * 根据业务id查询数据
	 * @param uuid 公厕信息表uuid
	 * @return 公厕信息表业务对象
	 */
	@Override
	public ResToilet searchById(String uuid) {
		ResToilet bo = resToiletMapper.searchById(uuid);
		if(bo!=null){
			setDict(bo);
	}
	return bo;
	}

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean updateEquip(ResToilet bo) {
		long result = resToiletMapper.updateEquip(bo);
		return result > 0;
	}

	/**
	 * 获取公厕编号
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public String searchWcMaxCode(ResToilet bo) {
		return resToiletMapper.searchWcMaxCode(bo);
	}

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象 Equip 修改时
	 * @return 是否修改成功
	 */
	@Override
	public boolean updateFromEquip(ResToilet bo) {
		long result = resToiletMapper.update(bo);
		return result > 0;
	}

	@Override
	public List<ResToilet> getResList(ResToilet bo) {
		List<ResToilet> list = resToiletMapper.searchList(bo);
		if (list != null && list.size() > 0) {
			setLsitDict(list,bo);
		}
		return list;
	}


	public void  setDict(ResToilet bo){
		// 数据字典 -
		List<BaseDataDict> isNotList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.IS_NOT, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> wctypelist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.GC_WC_TYPE, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> addrlist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.TOILET_ADDR, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> classList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.WC_CLASS, bo.getReOrgCode());

		// 数据字典 -
		List<BaseDataDict> timelist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.BUILD_TIME, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> exlist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DISPOSAL_EX_METHON, bo.getReOrgCode());
		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "isSupport", "isSupportTCN", isNotList);
		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "gcWcType", "gcWcTypeTCN", wctypelist);
		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "toiletAddr", "toiletAddrTCN", addrlist);
		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "wcClass", "wcClassTCN", classList);
		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "buildTime", "buildTimeTCN", timelist);
		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "disposalExMethon", "disposalExMethonTCN", exlist);


//		map.addAttribute("is_not", DictConstantValue.IS_NOT);
//		map.addAttribute("GC_WC_TYPE", DictConstantValue.GC_WC_TYPE);
//		map.addAttribute("TOILET_ADDR", DictConstantValue.TOILET_ADDR);
//		map.addAttribute("WC_CLASS", DictConstantValue.WC_CLASS);
//		map.addAttribute("IS_SUPPORT", DictConstantValue.IS_SUPPORT);
//		map.addAttribute("BUILD_TIME", DictConstantValue.BUILD_TIME);
//		map.addAttribute("DISPOSAL_EX_METHON", DictConstantValue.DISPOSAL_EX_METHON);
	}

	public void  setLsitDict(List<ResToilet> bo1,ResToilet bo){
		// 数据字典 -
		List<BaseDataDict> isNotList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.IS_NOT, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> wctypelist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.GC_WC_TYPE, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> addrlist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.TOILET_ADDR, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> classList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.WC_CLASS, bo.getReOrgCode());

		// 数据字典 -
		List<BaseDataDict> timelist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.BUILD_TIME, bo.getReOrgCode());
		// 数据字典 -
		List<BaseDataDict> exlist = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DISPOSAL_EX_METHON, bo.getReOrgCode());

	for (ResToilet res :bo1){
		// 数据字典 -
		DataDictHelper.setDictValueForField(res, "isSupport", "isSupportTCN", isNotList);
		// 数据字典 -
		DataDictHelper.setDictValueForField(res, "gcWcType", "gcWcTypeTCN", wctypelist);
		// 数据字典 -
		DataDictHelper.setDictValueForField(res, "toiletAddr", "toiletAddrTCN", addrlist);
		// 数据字典 -
		DataDictHelper.setDictValueForField(res, "wcClass", "wcClassTCN", classList);
		// 数据字典 -
		DataDictHelper.setDictValueForField(res, "buildTime", "buildTimeTCN", timelist);
		// 数据字典 -
		DataDictHelper.setDictValueForField(res, "disposalExMethon", "disposalExMethonTCN", exlist);

	}

	}


}