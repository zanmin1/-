package cn.ffcs.dcl.mybatis.persistence.restoilet;

import cn.ffcs.dcl.mybatis.domain.restoilet.ResToilet;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Description: 公厕信息表模块dao接口
 * @Author: linguoxiong
 * @Date: 09-09 09:24:51
 * @Copyright: 2021 福富软件
 */
public interface ResToiletMapper {
	
	/**
	 * 新增数据
	 * @param bo 公厕信息表业务对象
	 * @return 公厕信息表id
	 */
	public long insert(ResToilet bo);
	
	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象
	 * @return 修改的记录数
	 */
	public long update(ResToilet bo);
	
	/**
	 * 删除数据
	 * @param bo 公厕信息表业务对象
	 * @return 删除的记录数
	 */
	public long delete(ResToilet bo);
	
	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @param rowBounds 分页对象
	 * @return 公厕信息表数据列表
	 */
	public List<ResToilet> searchList(ResToilet bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param bo 查询参数
	 * @return 公厕信息表数据总数
	 */
	public long countList(ResToilet bo);
	
	/**
	 * 根据业务id查询数据
	 * @param uuid 公厕信息表id
	 * @return 公厕信息表业务对象
	 */
	public ResToilet searchById(String uuid);

	/**
	 * 查询数据
	 * @param bo 查询参数
	 * @return 公厕信息表业务对象
	 */
	public List<ResToilet> searchList(ResToilet bo);

	/**
	 * 修改数据
	 * @param bo 公厕信息表业务对象
	 * @return 修改的记录数
	 */
	public long updateEquip(ResToilet bo);

	/**
	 * 获取公厕编号
	 * @param bo 公厕信息表业务对象
	 * @return 是否修改成功
	 */
	public String searchWcMaxCode(ResToilet bo);

	/**
	 * 根据业务id查询数据
	 * @param id 公厕信息表id
	 * @return 公厕信息表业务对象
	 */
	public ResToilet searchByIds(Long id);

}