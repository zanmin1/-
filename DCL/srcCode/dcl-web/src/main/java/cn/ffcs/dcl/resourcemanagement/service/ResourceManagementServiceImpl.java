package cn.ffcs.dcl.resourcemanagement.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.resourcemanagement.ResourceManagement;
import cn.ffcs.dcl.mybatis.persistence.resourcemanagement.ResourceManagementMapper;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**
 * @Description: 资源管理表模块服务实现
 * @Author: 王文杰
 * @Date: 09-09 15:04:53
 * @Copyright: 2021 福富软件
 */
@Service("resourceManagementServiceImpl")
@Transactional
public class ResourceManagementServiceImpl implements IResourceManagementService {

	@Autowired
	private ResourceManagementMapper resourceManagementMapper; //注入资源管理表模块dao
	@Autowired
	private IBaseDictionaryService baseDictionaryService;

	/**
	 * 新增数据
	 * @param bo 资源管理表业务对象
	 * @return 资源管理表id
	 */
	@Override
	public Long insert(ResourceManagement bo) {
		resourceManagementMapper.insert(bo);
		return bo.getResourceId();
	}


	/**
	 * 修改数据
	 * @param bo 资源管理表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(ResourceManagement bo) {
		long result = resourceManagementMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 资源管理表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(ResourceManagement bo) {
		long result = resourceManagementMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 资源管理表分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, ResourceManagement bo) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<ResourceManagement> list = resourceManagementMapper.searchList(bo, rowBounds);
		getDict(list, bo.getOrgCode());
		long count = resourceManagementMapper.countList(bo);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}



	/**
	 * 根据业务id查询数据
	 * @param id 资源管理表id
	 * @return 资源管理表业务对象
	 */
	@Override
	public ResourceManagement searchById(String id) {
		ResourceManagement bo = resourceManagementMapper.searchByUUId(id);
		getDictOne(bo,bo.getOrgCode());
		return bo;
	}

	@Override
	public List<Map<String, Object>> searchListType(Map<String, Object> param) {

		List<Map<String, Object>> res = new ArrayList<>();

		try {
			res =resourceManagementMapper.searchListType(param);
		}catch (Exception e){
			return res;
		}


		//翻译
		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_RESOURCE, param.get("orgCode").toString());

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
	public void getDict(List<ResourceManagement> list,String code) {

		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_RESOURCE, code);

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		for (ResourceManagement resourceManagement : list) {
			resourceManagement.setTypeName(result1.get(resourceManagement.getResourceType()));

		}

	}

	//翻译
	public void getDictOne(ResourceManagement resourceManagement,String code) {

		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_RESOURCE, code);

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}
		resourceManagement.setTypeName(result1.get(resourceManagement.getResourceType()));
	}


}