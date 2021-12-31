package cn.ffcs.dcl.restoilet.service;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.mybatis.domain.restoilet.ResToilet;
import cn.ffcs.dcl.mybatis.domain.restoilet.ToiletEquip;
import cn.ffcs.dcl.mybatis.persistence.restoilet.ToiletEquipMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description: 公厕配备信息表模块服务实现
 * @Author: linguoxiong
 * @Date: 09-09 18:03:54
 * @Copyright: 2021 福富软件
 */
@Service("toiletEquipServiceImpl")
@Transactional
public class ToiletEquipServiceImpl implements IToiletEquipService {

	@Autowired
	private ToiletEquipMapper toiletEquipMapper; //注入公厕配备信息表模块dao

	@Autowired
	private IBaseDictionaryService baseDictionaryService; //注入模块管理模块dao

	/**
	 * 新增数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 公厕配备信息表id
	 */
	@Override
	public Long insert(ToiletEquip bo) {
		ToiletEquip bos = new ToiletEquip();
		bos.setReOrgCode(bo.getReOrgCode());
		List<ToiletEquip> list = toiletEquipMapper.searchList(bos);
		if (list != null && list.size() > 0){
			return 0l;
		}else {
			toiletEquipMapper.insert(bo);
		}
		return bo.getResToiletEquipId();
	}

	/**
	 * 修改数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(ToiletEquip bo) {
		long result = toiletEquipMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(ToiletEquip bo) {
		long result = toiletEquipMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 公厕配备信息表分页数据对象
	 */
	@Override
	public PaginationDto<ToiletEquip> searchList(ToiletEquip bo) {
		RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());
		List<ToiletEquip> list = toiletEquipMapper.searchList(bo, rowBounds);
		if (list != null && list.size() > 0) {
			setLsitDict(list,bo);
		}
		long count = toiletEquipMapper.countList(bo);
		PaginationDto<ToiletEquip> paginationDto = new PaginationDto<>(count,list);
		return paginationDto;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 公厕配备信息表id
	 * @return 公厕配备信息表业务对象
	 */
	@Override
	public ToiletEquip searchById(String id) {
		ToiletEquip bo = toiletEquipMapper.searchById(id);

		setDict(bo);

	return bo;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 公厕配备信息表id
	 * @return 公厕配备信息表业务对象
	 */
	@Override
	public ToiletEquip searchByIdGetId(String id) {

		ToiletEquip bo = toiletEquipMapper.searchByIdGetId(id);

	return bo;
	}


	public void  setDict(ToiletEquip bo){
		// 数据字典 -
		List<BaseDataDict> isNotList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.IS_NOT, bo.getReOrgCode());

		// 数据字典 -
		DataDictHelper.setDictValueForField(bo, "isProfessTeam", "isProfessTeamCN", isNotList);
		DataDictHelper.setDictValueForField(bo, "isFunds", "isFundsCN", isNotList);

	}

	public void  setLsitDict(List<ToiletEquip> bo1,ToiletEquip bo){
		// 数据字典 -
		List<BaseDataDict> isNotList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.IS_NOT, bo.getReOrgCode());

		for (ToiletEquip res :bo1){
			// 数据字典 -
			DataDictHelper.setDictValueForField(res, "isProfessTeam", "isProfessTeamCN", isNotList);
			DataDictHelper.setDictValueForField(res, "isFunds", "isFundsCN", isNotList);

		}

	}

}