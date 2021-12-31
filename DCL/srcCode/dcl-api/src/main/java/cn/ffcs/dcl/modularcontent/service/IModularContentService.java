package cn.ffcs.dcl.modularcontent.service;

import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.utils.PaginationDto;

import java.util.List;

/**
 * @Description: 模块内容管理模块服务
 * @Author: xuewq
 * @Date: 09-24 09:53:07
 * @Copyright: 2021 福富软件
 */
public interface IModularContentService {

	/**
	 * 新增数据
	 * @param bo 模块内容业务对象
	 * @return 模块内容id
	 */
	public Long insert(ModularContent bo);

	/**
	 * 修改数据
	 * @param bo 模块内容业务对象
	 * @return 是否修改成功
	 */
	public boolean update(ModularContent bo);

	/**
	 * 删除数据
	 * @param bo 模块内容业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(ModularContent bo);


	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 模块内容管理分页数据对象
	 */
	public PaginationDto<ModularContent> searchList(ModularContent bo);

	/**
	 * 根据uuid查询数据
	 * @param uuid 模块内容管理uuid
	 * @return 模块内容管理业务对象
	 */
	public ModularContent searchByUuid(String uuid);

	/**
	 * 通过regionCode和使用场景useType和模块类型type获取列表中所有可用的模块内容信息
	 *
	 * @param regionCode 地区编码
	 * @param useType    使用场景
	 * @param type       模块类型
	 * @return 主题对象
	 */
	public DvTheme searchListForAPP(String regionCode, String useType,String type);

	/**
	 * 通过regionCode和使用场景useType、模块类型type
	 * 和使用平台platform获取列表中所有可用的模块内容信息
	 *
	 * @param regionCode 地区编码
	 * @param useType    使用场景
	 * @param type       模块类型
	 * @param platform   使用平台
	 * @return 主题对象
	 */
	public DvTheme searchContents(String regionCode, String useType,String type,String platform);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 模块内容管理分页数据对象
	 */
	public PaginationDto<ModularContent> searchListByconvenient(ModularContent bo);
}