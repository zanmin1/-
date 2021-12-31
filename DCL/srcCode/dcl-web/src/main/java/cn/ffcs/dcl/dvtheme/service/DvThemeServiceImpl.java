package cn.ffcs.dcl.dvtheme.service;

import java.util.List;

import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.persistence.dvtheme.DvThemeMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 主题模块服务实现
 * @Author: xuewq
 * @Date: 09-24 09:52:47
 * @Copyright: 2021 福富软件
 */
@Service("dvThemeServiceImpl")
@Transactional
public class DvThemeServiceImpl implements IDvThemeService {

    @Autowired
    private DvThemeMapper dvThemeMapper; //注入主题模块dao

    @Autowired
    private IBaseDictionaryService baseDictionaryService; //注入模块管理模块dao

    /**
     * 新增数据
     *
     * @param bo 主题业务对象
     * @return 主题id
     */
    @Override
    public Long insert(DvTheme bo) {
        //		查询是否有重复区域
        DvTheme dvTheme = new DvTheme();
        dvTheme.setIsValid("1");
        dvTheme.setRegionName(bo.getRegionName());
        dvTheme.setPlatform(bo.getPlatform());
        List<DvTheme> list = dvThemeMapper.searchByParam(dvTheme);
        if (list != null && list.size() > 0) {
            return null;
        }
        return dvThemeMapper.insert(bo);
    }

    /**
     * 修改数据
     *
     * @param bo 主题业务对象
     * @return 是否修改成功
     */
    @Override
    public boolean update(DvTheme bo) {
//		查询是否有重复区域
        DvTheme dvTheme = new DvTheme();
        dvTheme.setIsValid("1");
        dvTheme.setRegionName(bo.getRegionName());
        dvTheme.setPlatform(bo.getPlatform());
        List<DvTheme> list = dvThemeMapper.searchByParam(dvTheme);
        if (list != null && list.size() > 0) {
            if (list.size() == 1) {
                if (!list.get(0).getUuid().equals(bo.getUuid())) {
                    return false;
                }
            }
            if (list.size() > 1) {
                return false;
            }
        }
        long update = dvThemeMapper.update(bo);
        return update > 0;
    }

    /**
     * 删除数据
     *
     * @param bo 主题业务对象
     * @return 是否删除成功
     */
    @Override
    public boolean delete(DvTheme bo) {
        long result = dvThemeMapper.delete(bo);
        return result > 0;
    }

    /**
     * 查询数据（分页）
     *
     * @param bo 查询参数
     * @return 主题分页数据对象
     */
    @Override
    public PaginationDto<DvTheme> searchList(DvTheme bo) {
        RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());
        List<DvTheme> list;
        long count;
        if (StringUtils.isEmpty(bo.getRemark())) {
            list = dvThemeMapper.searchList(bo, rowBounds);
            count = dvThemeMapper.countList(bo);
        } else {
            list = dvThemeMapper.searchListByBsfl(bo, rowBounds);
            count = dvThemeMapper.countListByBsfl(bo);
        }


        if (list != null && list.size() > 0) {
            // 数据字典 - 使用平台
            List<BaseDataDict> platformList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DCL_PLATFORM_TYPE, bo.getRegionCode());
            for (DvTheme dvTheme : list) {
                // 数据字典 - 模块类型获取名称
                DataDictHelper.setDictValueForField(dvTheme, "platform", "platformName", platformList);
            }
        }


        PaginationDto<DvTheme> paginationDto = new PaginationDto<>(count, list);

        return paginationDto;
    }

    @Override
    public DvTheme searchByUuid(String uuid) {
        DvTheme bo = dvThemeMapper.searchByUuid(uuid);
        return bo;
    }


}