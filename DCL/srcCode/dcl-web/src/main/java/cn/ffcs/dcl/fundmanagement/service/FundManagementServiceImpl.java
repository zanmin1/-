package cn.ffcs.dcl.fundmanagement.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.fundmanagement.FundManagement;
import cn.ffcs.dcl.mybatis.persistence.dvcontract.DvContractMapper;
import cn.ffcs.dcl.mybatis.persistence.fundmanagement.FundManagementMapper;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.ffcs.system.publicUtil.EUDGPagination;


/**
 * @Description: 资金管理表模块服务实现
 * @Author: 王文杰
 * @Date: 09-07 11:28:52
 * @Copyright: 2021 福富软件
 */
@Service("fundManagementServiceImpl")
@Transactional
public class FundManagementServiceImpl implements IFundManagementService {

	@Autowired
	private FundManagementMapper fundManagementMapper; //注入资金管理表模块dao
	@Autowired
	private DvContractMapper dvContractMapper; //注入合同管理模块dao
	@Autowired
	private IBaseDictionaryService baseDictionaryService;
	/**
	 * 新增数据
	 * @param bo 资金管理表业务对象
	 * @return 资金管理表id
	 */
	@Override
	public Long insert(FundManagement bo) {
		fundManagementMapper.insert(bo);
		return bo.getAssetId();
	}

	/**
	 * 修改数据
	 * @param bo 资金管理表业务对象
	 * @return 是否修改成功
	 */
	@Override
	public boolean update(FundManagement bo) {
		long result = fundManagementMapper.update(bo);
		return result > 0;
	}

	/**
	 * 删除数据
	 * @param bo 资金管理表业务对象
	 * @return 是否删除成功
	 */
	@Override
	public boolean delete(FundManagement bo) {
		long result = fundManagementMapper.delete(bo);
		return result > 0;
	}

	/**
	 * 查询数据（分页）
	 * @param params 查询参数
	 * @return 资金管理表分页数据对象
	 */
	@Override
	public EUDGPagination searchList(int page, int rows, FundManagement bo) {
		RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
		List<FundManagement> list = fundManagementMapper.searchList(bo, rowBounds);
		getDict(list);
		long count = fundManagementMapper.countList(bo);
		EUDGPagination pagination = new EUDGPagination(count, list);
		return pagination;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 资金管理表id
	 * @return 资金管理表业务对象
	 */
	@Override
	public FundManagement searchById(Long id) {
		FundManagement bo = fundManagementMapper.searchById(id);
		getDictOne(bo);
		return bo;
	}

	/**
	 * 根据业务id查询数据
	 * @param id 资金管理表uuid
	 * @return 资金管理表业务对象
	 */
	@Override
	public FundManagement searchByUUId(String id) {

		FundManagement bo = fundManagementMapper.searchByUUId(id);
		getDictOne(bo);
		return bo;
	}


	@Override
	public FundManagement sumData(Map<String, Object> params) {
		FundManagement bo = fundManagementMapper.sumData(params);
//		long count = dvContractMapper.countList(params);
		try{
			if(bo.getSumIncome()!=null){
				BigDecimal surplus = bo.getSumIncome().subtract(bo.getSumPay());
				bo.setSumSurplus(surplus);
			}else{
				bo.setSumSurplus(new BigDecimal(0));
			}
		}catch (Exception e){
			FundManagement newBo = new FundManagement();
			newBo.setSumSurplus(new BigDecimal(0));
			newBo.setSumIncome(new BigDecimal(0));
			newBo.setSumPay(new BigDecimal(0));
			return newBo;
		}

		return bo;
	}


	@Override
	public Map<String, Object> sumDataBanch(Map<String, Object> params) {
		Map<String, Object> res = new HashMap<>();
		params.put("regionCode",params.get("orgCode"));
		FundManagement bo = fundManagementMapper.sumData(params);
		long count = dvContractMapper.countList(params);
		res.put("contractCount",count);
		try{

				res.put("sumIncome",bo.getSumIncome());
				res.put("sumPay",bo.getSumPay());

		}catch (Exception e){
			res.put("sumIncome",0);
			res.put("sumPay",0);
		}

		return res;
	}

	//翻译
	public void getDict(List<FundManagement> list) {

		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_TYPE_P, null);
		List<BaseDataDict> listDict1= baseDictionaryService.getDataDictListOfSinglestage( DictConstantValue.DICT_TYPE_C_S,null);
		List<BaseDataDict> listDict2 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_TYPE_C_Z, null);

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		Map<String, String> result2 = new HashMap<>();

		for(BaseDataDict baseDataDict : listDict1){
			result2.put(baseDataDict.getDictGeneralCode(),baseDataDict.getDictName());
		}

		for (BaseDataDict baseDataDict : listDict2) {
			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		for (FundManagement fundManagement : list) {
			fundManagement.setTypePName(result1.get(fundManagement.getInAndExTypeP()));
			fundManagement.setTypeCName(result2.get(fundManagement.getInAndExTypeC()));
		}

	}

	//翻译
	public void getDictOne(FundManagement fundManagement) {


		List<BaseDataDict> listDict = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_TYPE_P, null);
		List<BaseDataDict> listDict1= baseDictionaryService.getDataDictListOfSinglestage( DictConstantValue.DICT_TYPE_C_S,null);
		List<BaseDataDict> listDict2 = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DICT_TYPE_C_Z, null);

		Map<String, String> result1 = new HashMap<>();
		for (BaseDataDict baseDataDict : listDict) {
			result1.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}

		Map<String, String> result2 = new HashMap<>();

		for(BaseDataDict baseDataDict : listDict1){
			result2.put(baseDataDict.getDictGeneralCode(),baseDataDict.getDictName());
		}

		for (BaseDataDict baseDataDict : listDict2) {
			result2.put(baseDataDict.getDictGeneralCode(), baseDataDict.getDictName());
		}


		fundManagement.setTypePName(result1.get(fundManagement.getInAndExTypeP()));
		fundManagement.setTypeCName(result2.get(fundManagement.getInAndExTypeC()));

	}
}