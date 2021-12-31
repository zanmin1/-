package cn.ffcs.dcl.voicePeople.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.voicePeople.VoicePeople;
import cn.ffcs.dcl.mybatis.persistence.voicePeople.VoicePeopleMapper;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.bo.OrgEntityInfoBO;
import cn.ffcs.uam.service.IBaseDictionaryService;
import cn.ffcs.uam.service.OrgEntityInfoOutService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**
 * @Description: 语音人员表模块服务实现
 * @Author: 王文杰
 * @Date: 12-24 15:54:19
 * @Copyright: 2021 福富软件
 */
@Service("voicePeopleServiceImpl")
@Transactional
public class VoicePeopleServiceImpl implements IVoicePeopleService {

	@Autowired
	private VoicePeopleMapper voicePeopleMapper; //注入语音人员表模块dao
	@Autowired
	private IBaseDictionaryService baseDictionaryService;

	@Autowired
	private OrgEntityInfoOutService entityInfoOutService;

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;
	/**
	 * 新增数据
	 * @param bo 语音人员表业务对象
	 * @return 语音人员表id
	 */
	@Override
	public Long insert(VoicePeople bo) {

//		VoicePeople res =   voicePeopleMapper.searchByTel(bo.getTel());

//		if(res!=null){
//			return -2L;
//		}

		voicePeopleMapper.insert(bo);

		return bo.getPeopleId();
	}

	/**
	 * 修改数据
	 * @param bo 语音人员表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(VoicePeople bo) {
		long result = voicePeopleMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 语音人员表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(VoicePeople bo) {
		long result = voicePeopleMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 语音人员表分页数据对象
	 */
	@Override
	public EUDGPagination searchList( VoicePeople bo,String code) {
		RowBounds rowBounds = new RowBounds((bo.getPage() - 1) * bo.getRows(), bo.getRows());
		List<VoicePeople> list = voicePeopleMapper.searchList(bo, rowBounds);
		long count = voicePeopleMapper.countList(bo);

		getDict(list,code);

		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 语音人员表id
	 * @return 语音人员表业务对象
	 */
	@Override
	public VoicePeople searchById(Long id) {
		VoicePeople bo = voicePeopleMapper.searchById(id);
		return bo;
	}

	@Override
	public VoicePeople searchByUUId(String id) {
		VoicePeople bo = voicePeopleMapper.searchByUUId(id);
		getDictOne(bo);
		return bo;
	}

	@Override
	public VoicePeople searchByTel(String tel) {
		VoicePeople bo = voicePeopleMapper.searchByTel(tel);
		return bo;
	}

	//翻译
	public void getDict(List<VoicePeople> list, String code) {
		// 性别
		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_SEX, code);
//		// 收费类型
//		List<BaseDataDict> listDict1 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_PAY, code);
//

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

//		Map<String, String> result2 = new HashMap<>();
//		for (BaseDataDict baseDataDict : listDict1) {
//			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
//		}

		for (VoicePeople vp : list) {

			vp.setSexStr(result1.get(vp.getSex()));

		}

	}

	//翻译
	public void getDictOne(VoicePeople bo) {
		//性别
		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_SEX, bo.getOrgCode());
		// 收费类型
//		List<BaseDataDict> listDict1 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_PAY, bo.getOrgCode());

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}


//		Map<String, String> result2 = new HashMap<>();
//		for (BaseDataDict baseDataDict : listDict1) {
//			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
//		}


		bo.setSexStr(result1.get(bo.getSex()));
	}

}