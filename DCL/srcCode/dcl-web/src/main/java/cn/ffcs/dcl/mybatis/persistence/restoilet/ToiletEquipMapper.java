package cn.ffcs.dcl.mybatis.persistence.restoilet;

import cn.ffcs.dcl.mybatis.domain.restoilet.ToiletEquip;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Description: 公厕配备信息表模块dao接口
 * @Author: linguoxiong
 * @Date: 09-09 18:03:54
 * @Copyright: 2021 福富软件
 */
public interface ToiletEquipMapper {
	
	/**
	 * 新增数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 公厕配备信息表id
	 */
	public long insert(ToiletEquip bo);
	
	/**
	 * 修改数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 修改的记录数
	 */
	public long update(ToiletEquip bo);
	
	/**
	 * 删除数据
	 * @param bo 公厕配备信息表业务对象
	 * @return 删除的记录数
	 */
	public long delete(ToiletEquip bo);
	
	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 公厕配备信息表数据列表
	 */
	public List<ToiletEquip> searchList(ToiletEquip bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param bo 查询参数
	 * @return 公厕配备信息表数据总数
	 */
	public long countList(ToiletEquip bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 公厕配备信息表id
	 * @return 公厕配备信息表业务对象
	 */
	public ToiletEquip searchById(String id);

	/**
	 * 查询数据
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 公厕配备信息表数据列表
	 */
	public List<ToiletEquip> searchList(ToiletEquip bo);

	/**
	 * 根据业务id查询数据
	 * @param id 公厕配备信息表id
	 * @return 公厕配备信息表业务对象
	 */
	public ToiletEquip searchByIdGetId(String id);

}