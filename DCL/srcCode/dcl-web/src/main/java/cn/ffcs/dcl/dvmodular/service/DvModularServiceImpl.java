package cn.ffcs.dcl.dvmodular.service;

import java.util.List;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.mybatis.persistence.dvmodular.DvModularMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 模块管理模块服务实现
 * @Author: xuewq
 * @Date: 09-24 09:53:02
 * @Copyright: 2021 福富软件
 */
@Service("dvModularServiceImpl")
@Transactional
public class DvModularServiceImpl implements IDvModularService {

    @Autowired
    private DvModularMapper dvModularMapper; //注入模块管理模块dao

    @Autowired
    private IBaseDictionaryService baseDictionaryService; //注入模块管理模块dao

    /**
     * 新增数据
     *
     * @param bo 模块业务对象
     * @return 模块id
     */
    @Override
    public Long insert(DvModular bo) {
        return dvModularMapper.insert(bo);
    }

    /**
     * 修改数据
     *
     * @param bo 模块业务对象
     * @return 是否修改成功
     */
    @Override
    public boolean update(DvModular bo) {
        long update = dvModularMapper.update(bo);
        return update > 0;
    }

    /**
     * 删除数据
     *
     * @param bo 模块业务对象
     * @return 是否删除成功
     */
    @Override
    public boolean delete(DvModular bo) {
        long result = dvModularMapper.delete(bo);
        return result > 0;
    }

    /**
     * 查询数据（分页）
     *
     * @param bo 查询参数
     * @return 模块分页数据对象
     */
    @Override
    public PaginationDto<DvModular> searchList(DvModular bo) {
        RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());

        List<DvModular> list = dvModularMapper.searchList(bo, rowBounds);
        long count = dvModularMapper.countList(bo);

        if (list != null && list.size() > 0) {
            // 数据字典 - 模块类型
            List<BaseDataDict> modularTypeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DCL_MODULAR_TYPE, bo.getRegionCode());
            // 数据字典 - 是否启用
            List<BaseDataDict> isEnableList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, bo.getRegionCode());
            // 数据字典 - 使用场景
            List<BaseDataDict> useTypeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.USE_TYPE, bo.getRegionCode());
            for (DvModular dvModular : list) {
                // 数据字典 - 模块类型获取名称
                DataDictHelper.setDictValueForField(dvModular, "type", "typeName", modularTypeList);
                // 数据字典 - 是否启用获取名称
                DataDictHelper.setDictValueForField(dvModular, "isEnable", "isEnableName", isEnableList);
                // 数据字典 - 使用场景获取名称
                DataDictHelper.setDictValueForField(dvModular, "useType", "useTypeName", useTypeList);
            }
        }
        PaginationDto<DvModular> paginationDto = new PaginationDto<>(count,list);
        return paginationDto;
    }

    @Override
    public DvModular searchByUuid(String uuid) {
        DvModular bo = dvModularMapper.searchByUuid(uuid);
        //数据字典 - 模块类型
        List<BaseDataDict> modularTypeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DCL_MODULAR_TYPE, bo.getRegionCode());
        DataDictHelper.setDictValueForField(bo, "type", "typeName", modularTypeList);
        //数据字典 - 是否启用
        List<BaseDataDict> isEnableList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, bo.getRegionCode());
        DataDictHelper.setDictValueForField(bo, "isEnable", "isEnableName", isEnableList);
        //数据字典 - 使用场景
        List<BaseDataDict> useTypeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.USE_TYPE, bo.getRegionCode());
        DataDictHelper.setDictValueForField(bo, "useType", "useTypeName", useTypeList);
        return bo;
    }

}