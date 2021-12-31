package cn.ffcs.dcl.vaccinationsite.service;

import cn.ffcs.dcl.mybatis.domain.vaccinationsite.VaccinationSite;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;

/**
 * @Description: 疫苗接种点模块服务
 * @Author: luchch
 * @Date: 12-14 15:09:21
 * @Copyright: 2021 福富软件
 */
public interface IVaccinationSiteService {

	/**
	 * 新增数据
	 * @param bo 疫苗接种点业务对象
	 * @return 疫苗接种点id
	 */
	public Long insert(VaccinationSite bo);

	/**
	 * 修改数据
	 * @param bo 疫苗接种点业务对象
	 * @return 是否修改成功
	 */
	public boolean update(VaccinationSite bo);

	/**
	 * 删除数据
	 * @param bo 疫苗接种点业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(VaccinationSite bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 疫苗接种点分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 疫苗接种点id
	 * @return 疫苗接种点业务对象
	 */
	public VaccinationSite searchById(String id);

}