package cn.ffcs.dcl.attractionsmanagement.service;

import cn.ffcs.dcl.mybatis.domain.attractionsmanagement.AttractionsManagement;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;

/**
 * @Description: 景点管理表模块服务
 * @Author: 王文杰
 * @Date: 09-13 11:02:34
 * @Copyright: 2021 福富软件
 */
public interface IAttractionsManagementService {

	/**
	 * 新增数据
	 * @param bo 景点管理表业务对象
	 * @return 景点管理表id
	 */
	public Long insert(AttractionsManagement bo);

	/**
	 * 修改数据
	 * @param bo 景点管理表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(AttractionsManagement bo);

	/**
	 * 删除数据
	 * @param bo 景点管理表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(AttractionsManagement bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 景点管理表分页数据对象
	 */
	public EUDGPagination searchList( AttractionsManagement bo,String code);
	
	/**
	 * 根据业务id查询数据
	 * @param id 景点管理表id
	 * @return 景点管理表业务对象
	 */
	public AttractionsManagement searchById(Long id);


	/**
	 * 根据业务id查询数据
	 * @param id 景点管理表id
	 * @return 景点管理表业务对象
	 */
	public AttractionsManagement searchByUUId(String id);

	/**
	 * 根据业务id查询数据  手机端用
	 * @param id 景点管理表id
	 * @return 景点管理表业务对象
	 */
//	public AttractionsManagement searchByUUIdMobile(String id);


}