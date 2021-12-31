package cn.ffcs.dcl.mybatis.persistence.villageproduct;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import cn.ffcs.dcl.mybatis.domain.villageproduct.StoreInfo;

/**
 * @Description: 商家信息模块dao接口
 * @Author: 张志杰
 * @Date: 12-20 20:01:16
 * @Copyright: 2021 福富软件
 */
public interface StoreInfoMapper {
	
	/**
	 * 新增数据
	 * @param bo 商家信息业务对象
	 * @return 商家信息id
	 */
	public long insert(StoreInfo bo);
	
	/**
	 * 修改数据
	 * @param bo 商家信息业务对象
	 * @return 修改的记录数
	 */
	public long update(StoreInfo bo);
	
	/**
	 * 删除数据
	 * @param bo 商家信息业务对象
	 * @return 删除的记录数
	 */
	public long delete(StoreInfo bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 商家信息数据列表
	 */
	public List<StoreInfo> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 商家信息数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 商家信息id
	 * @return 商家信息业务对象
	 */
	public StoreInfo searchById(Map<String, Object> params);

}