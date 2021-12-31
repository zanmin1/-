package cn.ffcs.dcl.restoilet.service;

import cn.ffcs.dcl.mybatis.domain.restoilet.ResToilet;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.system.publicUtil.EUDGPagination;

import java.util.List;

/**
 * @Description: 公厕信息表模块服务
 * @Author: linguoxiong
 * @Date: 09-09 09:24:51
 * @Copyright: 2021 福富软件
 */
public interface IResToiletService {

	/**
	 * 新增数据
	 * @param bo 公厕信息表业务对象
	 * @return 公厕信息表id
	 */
	public Long insert(ResToilet bo);

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(ResToilet bo);

	/**
	 * 删除数据
	 * @param bo 公厕信息表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(ResToilet bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 公厕信息表分页数据对象
	 */
	public PaginationDto<ResToilet> searchList(ResToilet bo);
	
	/**
	 * 根据业务id查询数据
	 * @param uuid 公厕信息表uuid
	 * @return 公厕信息表业务对象
	 */
	public ResToilet searchById(String uuid);

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	public boolean updateEquip(ResToilet bo);

	/**
	 * 获取公厕编号
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	public String searchWcMaxCode(ResToilet bo);

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象 Equip 修改时
	 * @return 是否修改成功
	 */
	public boolean updateFromEquip(ResToilet bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 公厕信息表分页数据对象
	 */
	public List<ResToilet> getResList(ResToilet bo);

}