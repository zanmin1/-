package cn.ffcs.dcl.mybatis.persistence.homestaymanagement;

import cn.ffcs.dcl.mybatis.domain.homestaymanagement.HomestayManagement;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Description: 民宿管理模块dao接口
 * @Author: gonghf
 * @Date: 09-15 09:47:13
 * @Copyright: 2021 福富软件
 */
public interface HomestayManagementMapper {
	
	/**
	 * 新增数据
	 * @param bo 民宿管理业务对象
	 * @return 民宿管理id
	 */
	public long insert(HomestayManagement bo);
	
	/**
	 * 修改数据
	 * @param bo 民宿管理业务对象
	 * @return 修改的记录数
	 */
	public long update(HomestayManagement bo);
	
	/**
	 * 删除数据
	 * @param bo 民宿管理业务对象
	 * @return 删除的记录数
	 */
	public long delete(HomestayManagement bo);
	
	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 民宿管理数据列表
	 */
	public List<HomestayManagement> searchList(HomestayManagement bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param bo 查询参数
	 * @return 民宿管理数据总数
	 */
	public long countList(HomestayManagement bo);

	/**
	 * 根据uuid查询数据
	 * @param uuid 民宿管理uuid
	 * @return 民宿管理业务对象
	 */
	public HomestayManagement searchByUuid(String uuid);

	/**
	 * 根据id查询数据
	 * @param id 民宿管理id
	 * @return 民宿管理业务对象
	 */
	public HomestayManagement searchById(Long id);

	/**
	 * 获取唯一标识
	 * @return uuId 民宿管理唯一标识
	 */
	public String getUuid();

}