package cn.ffcs.dcl.indexcontent.service;

import cn.ffcs.dcl.mybatis.domain.indexcontent.IndexContent;
import cn.ffcs.dcl.utils.PaginationDto;

/**
 * @Description: 首页展示内容管理模块服务
 * @Author: xuewq
 * @Date: 12-13 15:07:25
 * @Copyright: 2021 福富软件
 */
public interface IIndexContentService {
	//大屏展示附件
	public static final String  DCL_IndexContent_PHOTO = "DCL_IndexContent_PHOTO";

	/**
	 * 新增数据
	 * @param bo 首页展示内容管理业务对象
	 * @return 首页展示内容管理id
	 */
	public Long insert(IndexContent bo);

	/**
	 * 修改数据
	 * @param bo 首页展示内容管理业务对象
	 * @return 是否修改成功
	 */
	public boolean update(IndexContent bo);

	/**
	 * 删除数据
	 * @param bo 首页展示内容管理业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(IndexContent bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 首页展示内容管理分页数据对象
	 */
	PaginationDto<IndexContent> searchList(IndexContent bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 首页展示内容管理id
	 * @return 首页展示内容管理业务对象
	 */
	public IndexContent searchById(String id);

	public IndexContent searchByParam(IndexContent bo);


}