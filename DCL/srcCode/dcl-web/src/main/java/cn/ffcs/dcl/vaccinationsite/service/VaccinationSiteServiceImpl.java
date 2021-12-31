package cn.ffcs.dcl.vaccinationsite.service;

import java.util.List;
import java.util.Map;

import cn.ffcs.dcl.mybatis.domain.vaccinationsite.VaccinationSite;
import cn.ffcs.dcl.mybatis.persistence.vaccinationsite.VaccinationSiteMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;

/**
 * @Description: 疫苗接种点模块服务实现
 * @Author: luchch
 * @Date: 12-14 15:09:21
 * @Copyright: 2021 福富软件
 */
@Service("vaccinationSiteServiceImpl")
@Transactional
public class VaccinationSiteServiceImpl implements IVaccinationSiteService {

	@Autowired
	private VaccinationSiteMapper vaccinationSiteMapper; //注入疫苗接种点模块dao

	/**
	 * 新增数据
	 * @param bo 疫苗接种点业务对象
	 * @return 疫苗接种点id
	 */
	@Override
	public Long insert(VaccinationSite bo) {
		vaccinationSiteMapper.insert(bo);
		return bo.getVaccinationsiteId();
	}

	/**
	 * 修改数据
	 * @param bo 疫苗接种点业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(VaccinationSite bo) {
		long result = vaccinationSiteMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 疫苗接种点业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(VaccinationSite bo) {
		long result = vaccinationSiteMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 疫苗接种点分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<VaccinationSite> list = vaccinationSiteMapper.searchList(params, rowBounds);
		long count = vaccinationSiteMapper.countList(params);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 疫苗接种点id
	 * @return 疫苗接种点业务对象
	 */
	@Override
	public VaccinationSite searchById(String id) {
		VaccinationSite bo = vaccinationSiteMapper.searchById(id);
		return bo;
	}

}