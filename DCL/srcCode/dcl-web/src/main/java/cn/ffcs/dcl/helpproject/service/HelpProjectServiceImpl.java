package cn.ffcs.dcl.helpproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.helpproject.IHelpProjectService;
import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.dcl.mybatis.domain.helpproject.HelpProject;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.mybatis.persistence.helpproject.HelpProjectMapper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 帮扶项目模块服务实现
 * @Author: zhengby
 * @Date: 10-19 17:05:51
 * @Copyright: 2021 福富软件
 */
@Service("helpProjectServiceImpl")
@Transactional
public class HelpProjectServiceImpl implements IHelpProjectService {

	@Autowired
	private HelpProjectMapper helpProjectMapper; //注入帮扶项目模块dao
	@Autowired
	private IAttachmentByUUIDService attachmentByUUIDService;
	@Autowired
	private IBaseDictionaryService baseDictionaryService;
	/**
	 * 新增数据
	 * @param bo 帮扶项目业务对象
	 * @return 帮扶项目id
	 */
	@Override
	public Long insert(HelpProject bo) {
		helpProjectMapper.insert(bo);
		HelpProject bo1 = helpProjectMapper.searchById(bo.getHelpProjectId());
		bo.setUuId(bo1.getUuId());
		//附件上传的
		attachmentByUUIDService.deleteByBizId(bo.getUuId(), ConstantValue.ATTA_FAR_HOUSE_MANAGE); //图片
		attachmentByUUIDService.deleteByBizId(bo.getUuId(),ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);//视频
		if(bo.getAttachmentId() != null && bo.getAttachmentId().length>0){
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuId(),null,bo.getAttachmentId(), "001");
		}
		return bo.getHelpProjectId();
	}

	/**
	 * 修改数据
	 * @param bo 帮扶项目业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(HelpProject bo) {
		long result = helpProjectMapper.update(bo);
		//附件上传的
		attachmentByUUIDService.deleteByBizId(bo.getUuId(), ConstantValue.ATTA_FAR_HOUSE_MANAGE); //图片
		attachmentByUUIDService.deleteByBizId(bo.getUuId(),ConstantValue.ATTA_FAR_HOUSE_MANAGE_VIDEO);//视频
		if(bo.getAttachmentId() != null && bo.getAttachmentId().length>0){
			attachmentByUUIDService.updateBizIdNullFilter(bo.getUuId(),null,bo.getAttachmentId(), "001");
		}
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 帮扶项目业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(HelpProject bo) {
		long result = helpProjectMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 帮扶项目分页数据对象
	 */
	@Override
	public PaginationDto<HelpProject> searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<HelpProject> list = helpProjectMapper.searchList(params, rowBounds);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.HELP_PROJECT);//项目类型
		for (HelpProject helpProject:list ) {
			helpProject.setProjectTypeStr(issuStatusDicMap.get(helpProject.getProjectType()));
		}
		long count = helpProjectMapper.countList(params);
		PaginationDto<HelpProject> paginationDto = new PaginationDto<HelpProject>();
		paginationDto.setCount(count);
		paginationDto.setData(list);
		return paginationDto;
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
	 * 根据业务id查询数据
	 * @param id 帮扶项目id
	 * @return 帮扶项目业务对象
	 */
	@Override
	public HelpProject searchById(Long id) {
		HelpProject bo = helpProjectMapper.searchById(id);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.HELP_PROJECT);//项目类型
		bo.setProjectTypeStr(issuStatusDicMap.get(bo.getProjectType()));
		return bo;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 帮扶项目id
	 * @return 帮扶项目业务对象
	 */
	@Override
	public HelpProject searchByUUId(String uuid) {
		HelpProject bo = helpProjectMapper.searchByUUId(uuid);
		Map<String,String> issuStatusDicMap = getDictMap(DictConstantValue.HELP_PROJECT);//项目类型
		bo.setProjectTypeStr(issuStatusDicMap.get(bo.getProjectType()));
		return bo;
	}

}