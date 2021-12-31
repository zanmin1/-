package cn.ffcs.dcl.assetmanagement.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.assetmanagement.AssetManagement;
import cn.ffcs.dcl.mybatis.persistence.assetmanagement.AssetManagementMapper;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**
 * @Description: 资产管理表模块服务实现
 * @Author: 王文杰
 * @Date: 09-08 19:32:58
 * @Copyright: 2021 福富软件
 */
@Service("assetManagementServiceImpl")
@Transactional
public class AssetManagementServiceImpl implements IAssetManagementService {

	@Autowired
	private AssetManagementMapper assetManagementMapper; //注入资产管理表模块dao

	@Autowired
	private IBaseDictionaryService baseDictionaryService;
	/**
	 * 新增数据
	 * @param bo 资产管理表业务对象
	 * @return 资产管理表id
	 */
	@Override
	public Long insert(AssetManagement bo) {
		assetManagementMapper.insert(bo);
		return bo.getAssetId();
	}

	/**
	 * 修改数据
	 * @param bo 资产管理表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(AssetManagement bo) {
		long result = assetManagementMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 资产管理表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(AssetManagement bo) {
		long result = assetManagementMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param
	 * @return 资产管理表分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, AssetManagement bo) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<AssetManagement> list = assetManagementMapper.searchList(bo, rowBounds);
		getDict(list,bo.getOrgCode());
		long count = assetManagementMapper.countList(bo);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 资产管理表id
	 * @return 资产管理表业务对象
	 */
	@Override
	public AssetManagement searchById(String id) {
		AssetManagement bo = assetManagementMapper.searchByUUId(id);
		getDictOne(bo,bo.getOrgCode());
		return bo;
	}



	@Override
	public List<Map<String, Object>> searchListType(Map<String, Object> param) {

		List<Map<String, Object>> res = new ArrayList<>();

		try {
			res =assetManagementMapper.searchListType(param);
		}catch (Exception e){
			return res;
		}
		//翻译
		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_ASSET_TYPE, param.get("orgCode").toString());

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		for (Map<String, Object> map : res) {
			map.put( "typeName",result1.get(map.get("type")));
		}
		return res;

	}


	//翻译
	public void getDict(List<AssetManagement> list,String code) {

		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_ASSET_TYPE, code);
		List<BaseDataDict> listDict1= baseDictionaryService.getDataDictListOfSinglestage( DictConstantValue.DICT_USAGE,code);

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		Map<String, String> result2 = new HashMap<>();
		for(BaseDataDict baseDataDict : listDict1){
			result2.put(baseDataDict.getDictGeneralCode(),baseDataDict.getDictName());
		}

		for (AssetManagement assetManagement : list) {
			assetManagement.setTypeName(result1.get(assetManagement.getAssetType()));
			assetManagement.setUsageName(result2.get(assetManagement.getUsage()));
		}

	}

	//翻译
	public void getDictOne(AssetManagement assetManagement,String code) {


		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_ASSET_TYPE, code);
		List<BaseDataDict> listDict1= baseDictionaryService.getDataDictListOfSinglestage( DictConstantValue.DICT_USAGE,code);


		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		Map<String, String> result2 = new HashMap<>();
		for(BaseDataDict baseDataDict : listDict1){
			result2.put(baseDataDict.getDictGeneralCode(),baseDataDict.getDictName());
		}

		assetManagement.setTypeName(result1.get(assetManagement.getAssetType()));
		assetManagement.setUsageName(result2.get(assetManagement.getUsage()));
	}

}