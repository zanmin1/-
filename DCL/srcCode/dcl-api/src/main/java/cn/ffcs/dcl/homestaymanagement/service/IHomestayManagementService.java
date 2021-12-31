package cn.ffcs.dcl.homestaymanagement.service;

import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import cn.ffcs.dcl.utils.PaginationDto;

/**
 * @Description: 民宿管理模块服务
 * @Author: gonghf
 * @Date: 09-15 09:47:13
 * @Copyright: 2021 福富软件
 */
public interface IHomestayManagementService {

	/**
	 * 新增数据
	 * @param bo 民宿管理业务对象
	 * @return 民宿管理id
	 */
	public Long insert(HomestayManagement bo);

	/**
	 * 修改数据
	 * @param bo 民宿管理业务对象
	 * @return 是否修改成功
	 */
	public boolean update(HomestayManagement bo);

	/**
	 * 删除数据
	 * @param bo 民宿管理业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(HomestayManagement bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 民宿管理分页数据对象
	 */
	public PaginationDto<HomestayManagement> searchList(HomestayManagement bo);
	
	/**
	 * 根据uuid查询数据
	 * @param uuid 民宿管理uuid
	 * @param orgCode 用户区域编码
	 * @return 民宿管理业务对象
	 */
	public HomestayManagement searchByUuid(String uuid, String orgCode);

	/**
	 * 根据id查询数据
	 * @param id 民宿管理id
	 * @return 民宿管理业务对象
	 */
	public HomestayManagement searchById(Long id);

}