package cn.ffcs.dcl.helpproject;

import cn.ffcs.dcl.mybatis.domain.helpproject.HelpProject;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;

/**
 * @Description: 帮扶项目模块服务
 * @Author: zhengby
 * @Date: 10-19 17:05:50
 * @Copyright: 2021 福富软件
 */
public interface IHelpProjectService {

	/**
	 * 新增数据
	 * @param bo 帮扶项目业务对象
	 * @return 帮扶项目id
	 */
	public Long insert(HelpProject bo);

	/**
	 * 修改数据
	 * @param bo 帮扶项目业务对象
	 * @return 是否修改成功
	 */
	public boolean update(HelpProject bo);

	/**
	 * 删除数据
	 * @param bo 帮扶项目业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(HelpProject bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 帮扶项目分页数据对象
	 */
	public PaginationDto<HelpProject> searchList(int page, int rows, Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 帮扶项目id
	 * @return 帮扶项目业务对象
	 */
	public HelpProject searchById(Long id);

	/**
	 * 根据业务uuid查询数据
	 * @param id 帮扶项目id
	 * @return 帮扶项目业务对象
	 */
	public HelpProject searchByUUId(String id);
}