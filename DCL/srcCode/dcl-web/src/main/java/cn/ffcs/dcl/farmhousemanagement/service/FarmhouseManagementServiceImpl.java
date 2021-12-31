package cn.ffcs.dcl.farmhousemanagement.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.dcl.mybatis.persistence.farmhousemanagement.FarmhouseManagementMapper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
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
 * @Description: 农家乐管理模块服务实现
 * @Author: os.liwei
 * @Date: 09-15 09:07:22
 * @Copyright: 2021 福富软件
 */
@Service("farmhouseManagementServiceImpl")
@Transactional
public class FarmhouseManagementServiceImpl implements IFarmhouseManagementService {

	@Autowired
	private FarmhouseManagementMapper farmhouseManagementMapper; //注入农家乐管理模块dao
	@Autowired
	private IBaseDictionaryService baseDictionaryService;

	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;

	@Autowired
	private OrgEntityInfoOutService entityInfoOutService;

	/**
	 * 新增数据
	 * @param bo 农家乐管理业务对象
	 * @return 农家乐管理id
	 */
	@Override
	public Long insert(FarmhouseManagement bo) {
		try{
			if( bo.getAttList()!=null && bo.getAttList().size()>0&& StringUtils.isEmpty(bo.getPicUrl())){
				//第一张图设置封面
				for(AttachmentByUUID att:bo.getAttList()){
					if(att.getAttachmentType() .equals(ConstantValue.ATTA_FAR_HOUSE_MANAGE)){
						bo.setPicUrl(att.getFilePath());
						break;
					}
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}


	Long id =	farmhouseManagementMapper.insert(bo);
		if(id>0){
			FarmhouseManagement farmhouseManagement = farmhouseManagementMapper.searchById(bo.getFarmhouseId());
			bo.setUuid(farmhouseManagement.getUuid());
		}
		//附件上传的
		attachmentByUUIDService.deleteByBizId(bo.getUuid(),ConstantValue.ATTA_FAR_HOUSE_MANAGE); //图片
		attachmentByUUIDService.deleteByBizId(bo.getUuid(),ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);//视频
		if(bo.getAttachmentId() != null && bo.getAttachmentId().length>0){
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(),null,bo.getAttachmentId(), "001");
		}
		return bo.getFarmhouseId();
	}

	/**
	 * 修改数据
	 * @param bo 农家乐管理业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(FarmhouseManagement bo) {

		//仅仅更新发布状态
		if( !StringUtils.isEmpty(bo.getType())&&bo.getType().equals("issuStatus")){
			//更新
			long result = farmhouseManagementMapper.update(bo);
			return result > 0;
		}

		try{
			if(bo.getAttList()!=null &&  bo.getAttList().size()>0&& StringUtils.isEmpty(bo.getPicUrl())){
				//第一张图设置封面
				for(AttachmentByUUID att:bo.getAttList()){
					if(att.getAttachmentType() .equals(ConstantValue.ATTA_FAR_HOUSE_MANAGE)){
						bo.setPicUrl(att.getFilePath());
						break;
					}
				}
			}else if(bo.getAttList()==null && bo.getAttList().size()==0){
				bo.setPicUrl("");
			}
		}catch (Exception e){
			e.printStackTrace();
		}


		long result = farmhouseManagementMapper.update(bo);
		//附件上传的
		attachmentByUUIDService.deleteByBizId(bo.getUuid(),ConstantValue.ATTA_FAR_HOUSE_MANAGE); //图片
		attachmentByUUIDService.deleteByBizId(bo.getUuid(),ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);//视频
		if(bo.getAttachmentId() != null && bo.getAttachmentId().length>0){
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(),null,bo.getAttachmentId(), "001");

		}
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 农家乐管理业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(FarmhouseManagement bo) {
		long result = farmhouseManagementMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 农家乐管理分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<FarmhouseManagement> list = farmhouseManagementMapper.searchList(params, rowBounds);
		long count = farmhouseManagementMapper.countList(params);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.ISSU_STATUS);//岗位属性
		for (FarmhouseManagement  farmhouseManagement:list ){
			farmhouseManagement.setIssuStatusStr(issuStatusDicMap.get(farmhouseManagement.getIssuStatus()));
			OrgEntityInfoBO orgEntityInfoBO = entityInfoOutService.selectOrgEntityInfoByOrgCode(farmhouseManagement.getOrgCode());
			farmhouseManagement.setRegPath(orgEntityInfoBO.getOrgEntityPath());

			//轮播图片
			/*try{
				//第一张图设置封面
				List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(farmhouseManagement.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE);
				if(attList !=null && attList.size()>0){
					farmhouseManagement.setPicUrl(attList.get(0).getFilePath());
				}
			}catch (Exception e){
				e.printStackTrace();
			}*/
		}
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 农家乐管理id
	 * @return 农家乐管理业务对象
	 */
	@Override
	public FarmhouseManagement searchById(Long id) {
		FarmhouseManagement bo = farmhouseManagementMapper.searchById(id);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.ISSU_STATUS);//岗位属性
		bo.setIssuStatusStr(issuStatusDicMap.get(bo.getIssuStatus()));
		return bo;
	}

	@Override
	public FarmhouseManagement searchByUuId(String uuId) {
		FarmhouseManagement bo = farmhouseManagementMapper.searchByUuId(uuId);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.ISSU_STATUS);//岗位属性
		if(bo!=null){
			bo.setIssuStatusStr(issuStatusDicMap.get(bo.getIssuStatus()));
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
			if(bo.getReleaseTime()!=null){
				bo.setReleaseTimeStr(simpleDateFormat.format(bo.getReleaseTime()));
			}
			if(bo.getIssuTime()!=null){
				bo.setIssuTimeStr(simpleDateFormat.format(bo.getIssuTime()));
			}
			//轮播图片
			try{
				//第一张图设置封面
				List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE);
				List<AttachmentByUUID>	 attListVideo=	attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);
				List<String> pathList =new ArrayList<>();
                if(attList!=null && attList.size()>0){
					for(AttachmentByUUID att:attList){
						pathList.add(att.getFilePath());
					}
					bo.setImgList(pathList);
				}

				if (attListVideo!=null && attListVideo.size()>0){
					for(AttachmentByUUID att:attListVideo){
						pathList.add(att.getFilePath());
					}
					bo.setImgList(pathList);
				}

			}catch (Exception e){
				e.printStackTrace();
			}
		}

		return bo;
	}

	/**
	 * 批量删除数据
	 * @param bo 项目招租管理业务对象
	 * @return 是否删除成功
	 */
	public boolean batchDelete(FarmhouseManagement bo) {
		long result = farmhouseManagementMapper.batchDelete(bo);
		return result > 0;
	}

	private Map<String,String> getDictMap(String c){
		List<BaseDataDict> list= baseDictionaryService.getDataDictListOfSinglestage(c,null);
		Map<String,String> result = new HashMap<>();
		for(BaseDataDict baseDataDict : list){
			result.put(baseDataDict.getDictGeneralCode(),baseDataDict.getDictName());
		}
		return result;
	}

	/**
	 * 查询数据（分页）app
	 * @param bo 查询参数
	 * @return 农家乐管理分页数据对象
	 */
	@Override
	public EUDGPagination searchListToApp(int page, int rows, FarmhouseManagement bo) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<FarmhouseManagement> list = farmhouseManagementMapper.searchList(bo, rowBounds);
		long count = farmhouseManagementMapper.countList(bo);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.ISSU_STATUS);//岗位属性
		for (FarmhouseManagement  farmhouseManagement:list ){
			farmhouseManagement.setIssuStatusStr(issuStatusDicMap.get(farmhouseManagement.getIssuStatus()));
			OrgEntityInfoBO orgEntityInfoBO = entityInfoOutService.selectOrgEntityInfoByOrgCode(farmhouseManagement.getOrgCode());
			farmhouseManagement.setRegPath(orgEntityInfoBO.getOrgEntityPath());

			//轮播图片
			try{
				//第一张图设置封面
				List<AttachmentByUUID>	 attList=	attachmentByUUIDService.findByBizId(farmhouseManagement.getUuid(), ConstantValue.ATTA_FAR_HOUSE_MANAGE);
				if(attList !=null && attList.size()>0){
					farmhouseManagement.setPicUrl(attList.get(0).getFilePath());
				}
			}catch (Exception e){
				e.printStackTrace();
			}
		}

		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

}