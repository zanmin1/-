package cn.ffcs.dcl.mybatis.persistence.fundmanagement;

import cn.ffcs.dcl.mybatis.domain.fundmanagement.FundManagement;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;


/**
 * @Description: 资金管理表模块dao接口
 * @Author: 王文杰
 * @Date: 09-07 11:28:52
 * @Copyright: 2021 福富软件
 */
public interface FundManagementMapper {
	
	/**
	 * 新增数据
	 * @param bo 资金管理表业务对象
	 * @return 资金管理表id
	 */
	public long insert(FundManagement bo);
	
	/**
	 * 修改数据
	 * @param bo 资金管理表业务对象
	 * @return 修改的记录数
	 */
	public long update(FundManagement bo);
	
	/**
	 * 删除数据
	 * @param bo 资金管理表业务对象
	 * @return 删除的记录数
	 */
	public long delete(FundManagement bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 资金管理表数据列表
	 */
	public List<FundManagement> searchList(FundManagement bo, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 资金管理表数据总数
	 */
	public long countList(FundManagement bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 资金管理表id
	 * @return 资金管理表业务对象
	 */
	public FundManagement searchById(Long id);


	/**
	 * 根据业务id查询数据
	 * @param id 资金管理表uuid
	 * @return 资金管理表业务对象
	 */
	public FundManagement searchByUUId(String id);

	/**
	 * 根据业务id查询数据
	 * @param
	 * @return 统计总支出 总收入
	 */
	public FundManagement sumData(Map<String, Object> params);

}