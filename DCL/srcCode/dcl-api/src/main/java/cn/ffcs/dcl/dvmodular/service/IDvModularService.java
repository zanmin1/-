package cn.ffcs.dcl.dvmodular.service;

import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;

/**
 * @Description: 模块管理模块服务
 * @Author: xuewq
 * @Date: 09-24 09:53:02
 * @Copyright: 2021 福富软件
 */
public interface IDvModularService {

	/**
	 * 新增数据
	 * @param bo 模块业务对象
	 * @return 模块id
	 */
	public Long insert(DvModular bo);

	/**
	 * 修改数据
	 * @param bo 模块业务对象
	 * @return 是否修改成功
	 */
	public boolean update(DvModular bo);

	/**
	 * 删除数据
	 * @param bo 模块业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(DvModular bo);


	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 模块管理分页数据对象
	 */
	public PaginationDto<DvModular> searchList(DvModular bo);

	/**
	 * 根据uuid查询数据
	 * @param uuid 模块管理uuid
	 * @return 模块管理业务对象
	 */
	public DvModular searchByUuid(String uuid);

}