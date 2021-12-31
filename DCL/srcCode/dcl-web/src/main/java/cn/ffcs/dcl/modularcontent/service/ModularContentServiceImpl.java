package cn.ffcs.dcl.modularcontent.service;

import java.util.List;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.dvmodular.DvModular;
import cn.ffcs.dcl.mybatis.domain.dvtheme.DvTheme;
import cn.ffcs.dcl.mybatis.domain.modularcontent.ModularContent;
import cn.ffcs.dcl.mybatis.persistence.modularcontent.ModularContentMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 模块内容管理模块服务实现
 * @Author: xuewq
 * @Date: 09-24 09:53:07
 * @Copyright: 2021 福富软件
 */
@Service("modularContentServiceImpl")
@Transactional
public class ModularContentServiceImpl implements IModularContentService {

    @Autowired
    private ModularContentMapper modularContentMapper; //注入模块内容管理模块dao

    @Autowired
    private IBaseDictionaryService baseDictionaryService; //注入字典管理模块dao

    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;   // 附件上传。

    /**
     * 新增数据
     *
     * @param bo 主题业务对象
     * @return 主题id
     */
    @Override
    public Long insert(ModularContent bo) {
        // 获取唯一标识。
        bo.setUuid(modularContentMapper.getUuid());

        // 存储附件
        if (bo.getUuid() != null && bo.getAttachmentId() != null) {
            attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
        }
        return modularContentMapper.insert(bo);
    }

    /**
     * 修改数据
     *
     * @param bo 主题业务对象
     * @return 是否修改成功
     */
    @Override
    public boolean update(ModularContent bo) {
        long update = modularContentMapper.update(bo);
        //附件上传的
        attachmentByUUIDService.deleteByBizId(bo.getUuid(), ConstantValue.DCL_ModularContent_PHOTO); //图片
        if (bo.getAttachmentId() != null && bo.getAttachmentId().length > 0) {
            attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
        }
        return update > 0;
    }

    /**
     * 删除数据
     *
     * @param bo 主题业务对象
     * @return 是否删除成功
     */
    @Override
    public boolean delete(ModularContent bo) {
        long result = modularContentMapper.delete(bo);
        return result > 0;
    }

    /**
     * 查询数据（分页）
     *
     * @param bo 查询参数
     * @return 主题分页数据对象
     */
    @Override
    public PaginationDto<ModularContent> searchList(ModularContent bo) {
        RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());

        List<ModularContent> list = modularContentMapper.searchList(bo, rowBounds);
        long count = modularContentMapper.countList(bo);

        if (list != null && list.size() > 0) {
            // 数据字典 - 是否启用
            List<BaseDataDict> isEnableList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, bo.getRegionCode());
            for (ModularContent modularContent : list) {
                // 数据字典 - 是否启用符号转名称
                DataDictHelper.setDictValueForField(modularContent, "isEnable", "isEnableName", isEnableList);
            }
        }
        PaginationDto<ModularContent> paginationDto = new PaginationDto<>(count,list);
        return paginationDto;
    }

    @Override
    public ModularContent searchByUuid(String uuid) {
        ModularContent bo = modularContentMapper.searchByUuid(uuid);
        // 数据字典 - 是否启用
        List<BaseDataDict> isEnableList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, bo.getRegionCode());
        // 数据字典 - 是否启用符号转名称
        DataDictHelper.setDictValueForField(bo, "isEnable", "isEnableName", isEnableList);
        return bo;
    }

    /**
     * 通过regionCode和使用场景useType和模块类型type获取列表中所有可用的模块内容信息
     *
     * @param regionCode 地区编码
     * @param useType    使用场景
     * @param type       模块类型
     * @return 主题对象
     */
    @Override
    public DvTheme searchListForAPP(String regionCode, String useType, String type) {
        ModularContent modularContent = new ModularContent();
        if (regionCode!=null && regionCode.length() > 2) {
            regionCode = regionCode.substring(0, 2);
        }
        modularContent.setRegionCode(regionCode);
        modularContent.setUseType(useType);
        modularContent.setType(type);
        modularContent.setPlatform("xygj");
        DvTheme dvTheme = modularContentMapper.searchListForAPP(modularContent);
        if(dvTheme != null){
            //根据uuid和type填入附件集合
            for (DvModular dvModular : dvTheme.getDvModulars()) {
                for (ModularContent content : dvModular.getModularContents()) {
                    List<AttachmentByUUID> AttList = attachmentByUUIDService.findByBizId(content.getUuid(), ConstantValue.DCL_ModularContent_PHOTO);
                    content.setAttList(AttList);
                }
            }
        }

        return dvTheme;
    }

    /**
     * 通过regionCode和使用场景useType、模块类型type
     * 和使用平台platform获取列表中所有可用的模块内容信息
     *
     * @param regionCode 地区编码
     * @param useType    使用场景
     * @param type       模块类型
     * @param platform   使用平台
     * @return 主题对象
     */
    @Override
    public DvTheme searchContents(String regionCode, String useType, String type,String platform) {
        ModularContent modularContent = new ModularContent();
        if (regionCode!=null && regionCode.length() > 2) {
            regionCode = regionCode.substring(0, 2);
        }
        modularContent.setRegionCode(regionCode);
        modularContent.setUseType(useType);
        modularContent.setType(type);
        modularContent.setPlatform(platform);
        DvTheme dvTheme = modularContentMapper.searchListForAPP(modularContent);
        if(dvTheme != null){
            //根据uuid和type填入附件集合
            for (DvModular dvModular : dvTheme.getDvModulars()) {
                for (ModularContent content : dvModular.getModularContents()) {
                    List<AttachmentByUUID> AttList = attachmentByUUIDService.findByBizId(content.getUuid(), ConstantValue.DCL_ModularContent_PHOTO);
                    content.setAttList(AttList);
                }
            }
        }
        return dvTheme;
    }

    @Override
    public PaginationDto<ModularContent> searchListByconvenient(ModularContent bo) {
        RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());
        List<ModularContent> list = modularContentMapper.searchListByconvenient(bo, rowBounds);
        long count = modularContentMapper.countListByconvenient(bo);
        if (list != null && list.size() > 0) {
            // 数据字典 - 是否启用
            List<BaseDataDict> isEnableList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.VISIBLE, bo.getRegionCode());
            for (ModularContent modularContent : list) {
                // 数据字典 - 是否启用符号转名称
                DataDictHelper.setDictValueForField(modularContent, "isEnable", "isEnableName", isEnableList);
                List<AttachmentByUUID> AttList = attachmentByUUIDService.findByBizId(modularContent.getUuid(), ConstantValue.DCL_ModularContent_PHOTO);
                modularContent.setAttList(AttList);
            }
        }
        PaginationDto<ModularContent> paginationDto = new PaginationDto<>(count,list);
        return paginationDto;
    }

}