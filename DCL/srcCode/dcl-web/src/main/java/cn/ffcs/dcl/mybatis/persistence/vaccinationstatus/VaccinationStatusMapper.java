package cn.ffcs.dcl.mybatis.persistence.vaccinationstatus;

import cn.ffcs.dcl.mybatis.domain.vaccinationstatus.VaccinationStatus;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import java.util.List;
import java.util.Map;

/**
 * @Description: 疫苗接种情况模块dao接口
 * @Author: luchch
 * @Date: 12-14 15:08:31
 * @Copyright: 2021 福富软件
 */
public interface VaccinationStatusMapper {
	
	/**
	 * 新增数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 疫苗接种情况id
	 */
	public long insert(VaccinationStatus bo);
	
	/**
	 * 修改数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 修改的记录数
	 */
	public long update(VaccinationStatus bo);
	
	/**
	 * 删除数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 删除的记录数
	 */
	public long delete(VaccinationStatus bo);

	/**
	 * 删除数据
	 * @return 删除的记录数
	 */
	public long deleteAll(@Param("updator") Long updator, @Param("regionCode") String regionCode);
	
	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @param rowBounds 分页对象
	 * @return 疫苗接种情况数据列表
	 */
	public List<VaccinationStatus> searchList(Map<String, Object> params, RowBounds rowBounds);
	
	/**
	 * 查询数据总数
	 * @param params 查询参数
	 * @return 疫苗接种情况数据总数
	 */
	public long countList(Map<String, Object> params);
	
	/**
	 * 根据业务id查询数据
	 * @param id 疫苗接种情况id
	 * @return 疫苗接种情况业务对象
	 */
	public VaccinationStatus searchById(String id);

}