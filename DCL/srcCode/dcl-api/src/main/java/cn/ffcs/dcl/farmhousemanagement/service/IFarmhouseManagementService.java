package cn.ffcs.dcl.farmhousemanagement.service;

import cn.ffcs.dcl.mybatis.domain.farmhousemanagement.FarmhouseManagement;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;


/**
 * @Description: 农家乐管理模块服务
 * @Author: os.liwei
 * @Date: 09-15 09:07:22
 * @Copyright: 2021 福富软件
 */
public interface IFarmhouseManagementService {

	/**
	 * 新增数据
	 * @param bo 农家乐管理业务对象
	 * @return 农家乐管理id
	 */
	public Long insert(FarmhouseManagement bo) throws Exception;

	/**
	 * 修改数据
	 * @param bo 农家乐管理业务对象
	 * @return 是否修改成功
	 */
	public boolean update(FarmhouseManagement bo);

	/**
	 * 删除数据
	 * @param bo 农家乐管理业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(FarmhouseManagement bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 农家乐管理分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params);

	/**
	 * 根据业务id查询数据
	 * @param id 农家乐管理id
	 * @return 农家乐管理业务对象
	 */
	public FarmhouseManagement searchById(Long id);

	public boolean batchDelete(FarmhouseManagement bo);


	public FarmhouseManagement searchByUuId(String uuid);


	/**
	 * 查询数据（分页）app
	 * @param bo 查询参数
	 * @return 农家乐管理分页数据对象
	 */
	public EUDGPagination searchListToApp(int page, int rows, FarmhouseManagement bo);


}