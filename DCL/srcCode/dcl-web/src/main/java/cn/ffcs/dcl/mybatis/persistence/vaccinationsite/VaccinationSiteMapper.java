package cn.ffcs.dcl.mybatis.persistence.vaccinationsite;

import cn.ffcs.dcl.mybatis.domain.vaccinationsite.VaccinationSite;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 疫苗接种点模块dao接口
 * @Author: luchch
 * @Date: 12-14 15:09:21
 * @Copyright: 2021 福富软件
 */
public interface VaccinationSiteMapper {
	
	/**
	 * 新增数据
	 * @param bo 疫苗接种点业务对象
	 * @return 疫苗接种点id
	 */
	public long insert(VaccinationSite bo);
	
	/**
	 * 修改数据
	 * @param bo 疫苗接种点业务对象
	 * @return 修改的记录数
	 */
	public long update(VaccinationSite bo);
	
	/**
	 * 删除数据
	 * @param bo 疫苗接种点业务对象
	 * @return 删除的记录数
	 */
	public long delete(VaccinationSite bo);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 疫苗接种点数据列表
	 */
	public List<VaccinationSite> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 疫苗接种点数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 疫苗接种点id
	 * @return 疫苗接种点业务对象
	 */
	public VaccinationSite searchById(String id);

}