package cn.ffcs.dcl.attractionsmanagement.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.dcl.mybatis.domain.resourcemanagement.ResourceManagement;
import cn.ffcs.dcl.mybatis.persistence.attractionsmanagement.AttractionsManagementMapper;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.gis.base.service.IResMarkerService;
import cn.ffcs.gis.mybatis.domain.base.ResMarker;
import cn.ffcs.shequ.zzgl.service.attachment.IAttachmentService;
import cn.ffcs.system.publicUtil.StringUtils;
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
 * @Description: 景点管理表模块服务实现
 * @Author: 王文杰
 * @Date: 09-13 11:02:34
 * @Copyright: 2021 福富软件
 */
@Service("attractionsManagementServiceImpl")
@Transactional
public class AttractionsManagementServiceImpl implements IAttractionsManagementService {

	@Autowired
	private AttractionsManagementMapper attractionsManagementMapper; //注入景点管理表模块dao
	@Autowired
	private IBaseDictionaryService baseDictionaryService;

	@Autowired
	private OrgEntityInfoOutService entityInfoOutService;

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;

	@Autowired
	private IResMarkerService resMarkerService;//gis地图接口
	/**
	 * 新增数据
	 * @param bo 景点管理表业务对象
	 * @return 景点管理表id
	 */
	@Override
	public Long insert(AttractionsManagement bo) {

		try{
			if(  bo.getAttList().size()>0&& StringUtils.isEmpty(bo.getPicUrl())){
				//第一张图设置封面
				for(AttachmentByUUID att:bo.getAttList()){
					if(!StringUtils.isEmpty(att.getAttachmentType())&&att.getAttachmentType() .equals(ConstantValue.DCL_ATTR_TITLLE)){
						bo.setPicUrl(att.getFilePath());
						break;
					}
				}
			}

		}catch (Exception e){
			e.printStackTrace();
		}

		attractionsManagementMapper.insert(bo);

		//地图标注方法
		AttractionsManagement newBo =  attractionsManagementMapper.searchById(bo.getAttractionsId());

		if(StringUtils.isNotEmpty(bo.getT_y()) && StringUtils.isNotEmpty(bo.getT_x())) {
			//当新增成功以后那么必须要调用新的地图保存接口
			ResMarker resMarker = new ResMarker();
			resMarker.setMarkerType(DictConstantValue.ATTR_MANAGE_MAP);
			resMarker.setUuuId(newBo.getUuid());
			resMarker.setMapType(ConstantValue.MAP_TYPE);
			resMarker.setCatalog(ConstantValue.CATA_LOG);
			resMarker.setX(bo.getT_x());//经度
			resMarker.setY(bo.getT_y());//纬度
			resMarkerService.saveOrUpdateResMarker(resMarker);
		}


		//附件方法
//		attachmentByUUIDService.deleteByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_TITLLE);
//		attachmentByUUIDService.deleteByBizId(bo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_VIDEO);
		if (bo.getAttractionsId() != null && bo.getAttachmentId() != null) {
			attachmentByUUIDService.updateBizIdNullFilter(bo.getAttractionsId().toString(), null, bo.getAttachmentId(), "001");
		}

		return bo.getAttractionsId();
	}

	/**
	 * 修改数据
	 * @param bo 景点管理表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(AttractionsManagement bo) {

		//仅仅更新发布状态
		if( !StringUtils.isEmpty(bo.getType())&&bo.getType().equals("issuStatus")){
			//更新
			long result = attractionsManagementMapper.update(bo);
			return result > 0;
		}

		//获取id
		AttractionsManagement  preBo = attractionsManagementMapper.searchByUUId(bo.getUuid());

		try{
			if(  bo.getAttList().size()>0&& StringUtils.isEmpty(bo.getPicUrl())){
				//第一张图设置封面
				for(AttachmentByUUID att:bo.getAttList()){
					if(!StringUtils.isEmpty(att.getAttachmentType())&&att.getAttachmentType() .equals(ConstantValue.DCL_ATTR_TITLLE)){
						bo.setPicUrl(att.getFilePath());
						break;
					}
				}
			}

		}catch (Exception e){
			e.printStackTrace();
		}

		long result = attractionsManagementMapper.update(bo);

		//地图标注方法
		if(StringUtils.isNotEmpty(bo.getT_y()) && StringUtils.isNotEmpty(bo.getT_x())) {
			//当新增成功以后那么必须要调用新的地图保存接口
			ResMarker resMarker = new ResMarker();
			resMarker.setMarkerType(DictConstantValue.ATTR_MANAGE_MAP);
			resMarker.setUuuId(bo.getUuid());
			resMarker.setMapType(ConstantValue.MAP_TYPE);
			resMarker.setCatalog(ConstantValue.CATA_LOG);
			resMarker.setX(bo.getT_x());
			resMarker.setY(bo.getT_y());
			resMarkerService.saveOrUpdateResMarker(resMarker);
		}

		//附件方法
		attachmentByUUIDService.deleteByBizId(preBo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_TITLLE);
		attachmentByUUIDService.deleteByBizId(preBo.getAttractionsId().toString(), ConstantValue.DCL_ATTR_VIDEO);

		if (preBo.getAttractionsId() != null && bo.getAttachmentId() != null) {
			attachmentByUUIDService.updateBizIdNullFilter(preBo.getAttractionsId().toString(), null, bo.getAttachmentId(), "001");
		}


		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 景点管理表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(AttractionsManagement bo) {
		long result = attractionsManagementMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param
	 * @return 景点管理表分页数据对象
	 */
	@Override
	public EUDGPagination searchList( AttractionsManagement bo,String code) {
		RowBounds rowBounds = new RowBounds((bo.getPage() - 1) * bo.getRows(), bo.getRows());
		List<AttractionsManagement> list = attractionsManagementMapper.searchList(bo, rowBounds);
		getDict(list,code);
		long count = attractionsManagementMapper.countList(bo);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 景点管理表id
	 * @return 景点管理表业务对象
	 */
	@Override
	public AttractionsManagement searchByUUId(String id) {
		AttractionsManagement bo = attractionsManagementMapper.searchByUUId(id);
		getDictOne(bo);
		return bo;
	}


	
//	@Override
//	public AttractionsManagement searchByUUIdMobile(String id) {
//		AttractionsManagement bo = attractionsManagementMapper.searchByUUId(id);
//	//	getDictOneMobile(bo);
//		return bo;
//	}



	@Override
	public AttractionsManagement searchById(Long id) {
		AttractionsManagement bo = attractionsManagementMapper.searchById(id);
		return bo;
	}



	//翻译
	public void getDict(List<AttractionsManagement> list,String code) {
		// 景点类型
		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_ATTR_TYPE, code);
		// 收费类型
		List<BaseDataDict> listDict1 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_PAY, code);


		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		Map<String, String> result2 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict1) {
			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		for (AttractionsManagement attractionsManagement : list) {

			attractionsManagement.setAttractionsTypeName(result1.get(attractionsManagement.getAttractionsType()));

			attractionsManagement.setChargeTypeName(result2.get(attractionsManagement.getChargeType()));
			//地域全路径
			OrgEntityInfoBO orgEntityInfoBO = entityInfoOutService.selectOrgEntityInfoByOrgCode(attractionsManagement.getOrgCode());
			//attractionsManagement
			attractionsManagement.setRegPath(orgEntityInfoBO.getOrgEntityPath());

		}

	}

	//翻译
	public void getDictOne(AttractionsManagement attractionsManagement) {
		// 景点类型
		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_ATTR_TYPE, attractionsManagement.getOrgCode());
		// 收费类型
		List<BaseDataDict> listDict1 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_PAY, attractionsManagement.getOrgCode());


		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		Map<String, String> result2 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict1) {
			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		attractionsManagement.setAttractionsTypeName(result1.get(attractionsManagement.getAttractionsType()));

		attractionsManagement.setChargeTypeName(result2.get(attractionsManagement.getChargeType()));

		OrgEntityInfoBO orgEntityInfoBO = entityInfoOutService.selectOrgEntityInfoByOrgCode(attractionsManagement.getOrgCode());
		//attractionsManagement
		attractionsManagement.setRegPath(orgEntityInfoBO.getOrgEntityPath());

	}


	//翻译
//	public void getDictOneMobile(AttractionsManagement attractionsManagement) {
//
//		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_ATTR_TYPE, attractionsManagement.getOrgCode());
//		List<BaseDataDict> listDict1 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_PAY, attractionsManagement.getOrgCode());
//
//
//		Map<String, String> result1 = new HashMap<>();
//		for (BaseDataDict baseDataDict : listDict) {
//			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
//		}
//
//		Map<String, String> result2 = new HashMap<>();
//		for (BaseDataDict baseDataDict : listDict1) {
//			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
//		}
//
//		attractionsManagement.setAttractionsTypeName(result1.get(attractionsManagement.getAttractionsType()));
//		attractionsManagement.setChargeTypeName(result2.get(attractionsManagement.getChargeType()));
//
//	}


}