package cn.ffcs.dcl.indexcontent.service;

import java.util.List;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.indexcontent.IndexContent;
import cn.ffcs.dcl.mybatis.persistence.indexcontent.IndexContentMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.apache.jute.Index;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description: 首页展示内容管理模块服务实现
 * @Author: xuewq
 * @Date: 12-13 15:07:25
 * @Copyright: 2021 福富软件
 */
@Service("indexContentServiceImpl")
@Transactional
public class IndexContentServiceImpl implements IIndexContentService {

    @Autowired
    private IndexContentMapper indexContentMapper; //注入首页展示内容管理模块dao

    @Autowired
    private IBaseDictionaryService baseDictionaryService; //注入字典管理模块Service

    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;   // 注入附件上传模块Service

    /**
     * 新增数据
     *
     * @param bo 首页展示内容管理业务对象
     * @return 首页展示内容管理id
     */
    @Override
    public Long insert(IndexContent bo) {
        // 获取唯一标识。编号唯一
        IndexContent indexContent = new IndexContent();
        indexContent.setCode(bo.getCode());
        indexContent.setRegionCode(bo.getRegionCode());
        IndexContent newBo = indexContentMapper.searchByParam(indexContent);
        bo.setUuid(indexContentMapper.getUuid());

        if (null != newBo) {
            return null;
        }
        // 存储附件
        if(bo.getAttachmentId() != null){
            attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
        }
        indexContentMapper.insert(bo);
        return bo.getModularId();
    }

    /**
     * 修改数据
     *
     * @param bo 首页展示内容管理业务对象
     * @return 是否修改成功
     */
    @Override
    public boolean update(IndexContent bo) {
        long result = indexContentMapper.update(bo);
        //附件上传的
        attachmentByUUIDService.deleteByBizId(bo.getUuid(), DCL_IndexContent_PHOTO); //图片
        if (bo.getAttachmentId() != null && bo.getAttachmentId().length > 0) {
            attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, bo.getAttachmentId(), "001");
        }
        return result > 0;
    }

    /**
     * 删除数据
     *
     * @param bo 首页展示内容管理业务对象
     * @return 是否删除成功
     */
    @Override
    public boolean delete(IndexContent bo) {
        long result = indexContentMapper.delete(bo);
        return result > 0;
    }

    /**
     * 查询数据（分页）
     *
     * @param bo 查询参数
     * @return 数据对象
     */
    @Override
    public PaginationDto<IndexContent> searchList(IndexContent bo) {
        RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());

        List<IndexContent> list = indexContentMapper.searchList(bo, rowBounds);
        long count = indexContentMapper.countList(bo);

        if (list != null && list.size() > 0) {
            // 数据字典 - 是否启用
            List<BaseDataDict> typeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DIS_TYPE, null);
            for (IndexContent indexContent : list) {
                // 数据字典 - 是否启用符号转名称
                DataDictHelper.setDictValueForField(indexContent, "type", "typeName", typeList);
            }
        }
        PaginationDto<IndexContent> paginationDto = new PaginationDto<>(count, list);
        return paginationDto;
    }

    /**
     * 根据业务id查询数据
     *
     * @param id 首页展示内容管理id
     * @return 首页展示内容管理业务对象
     */
    @Override
    public IndexContent searchById(String id) {
        IndexContent bo = new IndexContent();
        bo.setUuid(id);
        bo = indexContentMapper.searchByParam(bo);
        // 数据字典 - 是否启用
        List<BaseDataDict> typeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DIS_TYPE, null);

        if (bo != null) {
            // 数据字典 - 展示类型符号转名称
            DataDictHelper.setDictValueForField(bo, "type", "typeName", typeList);

            List<AttachmentByUUID> attList = attachmentByUUIDService.findByBizId(bo.getUuid(), DCL_IndexContent_PHOTO);
            bo.setAttList(attList);
        }
        return bo;
    }

    /**
     * 根据业务id查询数据
     *
     * @param bo 首页展示内容管理id
     * @return 首页展示内容管理业务对象
     */
    @Override
    public IndexContent searchByParam(IndexContent bo) {
        bo = indexContentMapper.searchByParam(bo);
        // 数据字典 - 是否启用
        List<BaseDataDict> typeList = baseDictionaryService.getDataDictListOfSinglestage(DictConstantValue.DIS_TYPE, null);

        if (bo != null) {
            // 数据字典 - 展示类型符号转名称
            DataDictHelper.setDictValueForField(bo, "type", "typeName", typeList);

            List<AttachmentByUUID> attList = attachmentByUUIDService.findByBizId(bo.getUuid(), DCL_IndexContent_PHOTO);
            bo.setAttList(attList);
        }

        return bo;
    }


}