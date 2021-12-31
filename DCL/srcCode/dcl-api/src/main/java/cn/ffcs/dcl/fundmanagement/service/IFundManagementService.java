package cn.ffcs.dcl.fundmanagement.service;

import cn.ffcs.dcl.mybatis.domain.fundmanagement.FundManagement;
import cn.ffcs.system.publicUtil.EUDGPagination;

import java.util.Map;

/**
 * @Description: 资金管理表模块服务
 * @Author: 王文杰
 * @Date: 09-07 11:28:52
 * @Copyright: 2021 福富软件
 */
public interface IFundManagementService {

	/**
	 * 新增数据
	 * @param bo 资金管理表业务对象
	 * @return 资金管理表id
	 */
	public Long insert(FundManagement bo);

	/**
	 * 修改数据
	 * @param bo 资金管理表业务对象
	 * @return 是否修改成功
	 */
	public boolean update(FundManagement bo);

	/**
	 * 删除数据
	 * @param bo 资金管理表业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(FundManagement bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 资金管理表分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, FundManagement bo);
	
	/**
	 * 根据业务id查询数据
	 * @param id 资金管理表id
	 * @return 资金管理表业务对象
	 */
	public FundManagement searchById(Long id);

	/**
	 * 根据业务id查询数据
	 * @param id 资金管理表id
	 * @return 资金管理表业务对象
	 */
	public FundManagement searchByUUId(String id);


	/**
	 * 根据业务id查询数据
	 * @param
	 * @return 统计总支出 总收入 结余
	 */
	public FundManagement sumData(Map<String, Object> params);



	/**
	 * 根据业务id查询数据
	 * @param
	 * @return 统计总支出 总收入  合同总数 看板用
	 */
	public Map<String,Object> sumDataBanch(Map<String, Object> params);


}