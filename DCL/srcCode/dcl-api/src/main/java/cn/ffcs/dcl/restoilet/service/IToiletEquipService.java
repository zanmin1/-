package cn.ffcs.dcl.restoilet.service;

import cn.ffcs.dcl.mybatis.domain.restoilet.ToiletEquip;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;

import java.util.List;

/**
 * @Description: 公厕配备信息表模块服务
 * @Author: linguoxiong
 * @Date: 09-09 18:03:54
 * @Copyright: 2021 福富软件
 */
public interface IToiletEquipService {

	/**
	 * 新增数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 公厕配备信息表id
	 */
	public Long insert(ToiletEquip bo);

	/**
	 * 修改数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(ToiletEquip bo);

	/**
	 * 删除数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(ToiletEquip bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 公厕配备信息表分页数据对象
	 */
	public PaginationDto<ToiletEquip> searchList(ToiletEquip bo);
	
	/**
	 * 根据业务id查询数据
	 * @param uuid 公厕配备信息表id
	 * @return 公厕配备信息表业务对象
	 */
	public ToiletEquip searchById(String uuid);

	/**
	 * 根据业务id查询数据
	 * @param uuid 公厕配备信息表id
	 * @return 公厕配备信息表业务对象
	 */
	public ToiletEquip searchByIdGetId(String id);

}