package cn.ffcs.dcl.dvtheme.service;

import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.utils.PaginationDto;

import java.util.List;

/**
 * @Description: 主题模块服务
 * @Author: xuewq
 * @Date: 09-24 09:52:47
 * @Copyright: 2021 福富软件
 */
public interface IDvThemeService {

	/**
	 * 新增数据
	 * @param bo 主题业务对象
	 * @return 主题id
	 */
	public Long insert(DvTheme bo);

	/**
	 * 修改数据
	 * @param bo 主题业务对象
	 * @return 是否修改成功
	 */
	public boolean update(DvTheme bo);

	/**
	 * 删除数据
	 * @param bo 主题业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(DvTheme bo);


	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 主题管理分页数据对象
	 */
	public PaginationDto<DvTheme> searchList(DvTheme bo);

	/**
	 * 根据uuid查询数据
	 * @param uuid 主题管理uuid
	 * @return 主题管理业务对象
	 */
	public DvTheme searchByUuid(String uuid);

}