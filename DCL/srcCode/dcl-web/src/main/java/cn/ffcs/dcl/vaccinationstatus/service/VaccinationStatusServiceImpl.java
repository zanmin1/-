package cn.ffcs.dcl.vaccinationstatus.service;

import java.util.List;
import java.util.Map;

import cn.ffcs.dcl.mybatis.domain.vaccinationstatus.VaccinationStatus;
import cn.ffcs.dcl.mybatis.persistence.vaccinationstatus.VaccinationStatusMapper;
import cn.ffcs.system.publicUtil.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 疫苗接种情况模块服务实现
 * @Author: luchch
 * @Date: 12-14 15:08:31
 * @Copyright: 2021 福富软件
 */
@Service("vaccinationStatusServiceImpl")
@Transactional
public class VaccinationStatusServiceImpl implements IVaccinationStatusService {

	@Autowired
	private VaccinationStatusMapper vaccinationStatusMapper; //注入疫苗接种情况模块dao

	/**
	 * 新增数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 疫苗接种情况id
	 */
	@Override
	public Long insert(VaccinationStatus bo) {
		// 清除已有记录
		vaccinationStatusMapper.deleteAll(bo.getCreator(), bo.getRegionCode());
		vaccinationStatusMapper.insert(bo);
		return bo.getVaccinationstatusId();
	}

	/**
	 * 修改数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(VaccinationStatus bo) {
		long result = vaccinationStatusMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 疫苗接种情况业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(VaccinationStatus bo) {
		long result = vaccinationStatusMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 疫苗接种情况分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<VaccinationStatus> list = vaccinationStatusMapper.searchList(params, rowBounds);
		long count = vaccinationStatusMapper.countList(params);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	@Override
	public Long countList(Map<String, Object> params) {
		return vaccinationStatusMapper.countList(params);
	}

	/**
	 * 根据业务id查询数据
	 * @param id 疫苗接种情况id
	 * @return 疫苗接种情况业务对象
	 */
	@Override
	public VaccinationStatus searchById(String id) {
		VaccinationStatus bo = vaccinationStatusMapper.searchById(id);
		return bo;
	}

}