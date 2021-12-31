package cn.ffcs.dcl.vaccinationstatus.service;

import cn.ffcs.dcl.mybatis.domain.vaccinationstatus.VaccinationStatus;
import cn.ffcs.system.publicUtil.EUDGPagination;
import java.util.Map;

/**
 * @Description: 疫苗接种情况模块服务
 * @Author: luchch
 * @Date: 12-14 15:08:31
 * @Copyright: 2021 福富软件
 */
public interface IVaccinationStatusService {

	/**
	 * 新增数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 疫苗接种情况id
	 */
	public Long insert(VaccinationStatus bo);

	/**
	 * 修改数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 是否修改成功
	 */
	public boolean update(VaccinationStatus bo);

	/**
	 * 删除数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(VaccinationStatus bo);

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 疫苗接种情况分页数据对象
	 */
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params);

	Long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 疫苗接种情况id
	 * @return 疫苗接种情况业务对象
	 */
	public VaccinationStatus searchById(String id);

}