package cn.ffcs.dcl.villagegroup.service;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.common.utils.DictConstantValue;
import cn.ffcs.dcl.mybatis.domain.villagegroup.VillageGroup;
import cn.ffcs.dcl.mybatis.persistence.villagegroup.VillageGroupMapper;
import cn.ffcs.dcl.utils.DataDictHelper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.service.IBaseDictionaryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @Description: 村小组模块服务实现
 * @Author: liangxj
 * @Date: 12-22 10:45:25
 * @Copyright: 2021 福富软件
 */
@Service("villageGroupServiceImpl")
@Transactional
public class VillageGroupServiceImpl implements IVillageGroupService {

    @Autowired
    private VillageGroupMapper villageGroupMapper; //注入村小组模块dao
    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;
    @Autowired
    private IBaseDictionaryService baseDictionaryService;

    /**
     * 新增数据
     *
     * @param bo 村小组业务对象
     * @return 村小组id
     */
    public Long insert(VillageGroup bo) {
        villageGroupMapper.insert(bo);
        return bo.getVillageGroupId();
    }

    /**
     * 修改数据
     *
     * @param bo 村小组业务对象
     * @return 是否修改成功
     */
    public boolean update(VillageGroup bo) {
        long result = villageGroupMapper.update(bo);
        return result > 0;
    }

    /**
     * 保存
     *
     * @param bo 村小组业务对象
     * @return 是否保存成功
     */
    public String saveOrUpdate(VillageGroup bo) {
        String uuid = "";
        if (StringUtils.isEmpty(bo.getUuid())) {
            villageGroupMapper.insert(bo);
            if (bo.getVillageGroupId() > 0) {
                uuid = villageGroupMapper.searchById(bo.getVillageGroupId()).getUuid();
            }
        } else {
            if (villageGroupMapper.update(bo) > 0) {
                uuid = bo.getUuid();
            }
        }
        if (!StringUtils.isEmpty(uuid) && bo.getAttachmentId() != null) {
            attachmentByUUIDService.deleteByBizId(uuid, ConstantValue.DCL_VILLAGE_GROUP_IMAGE);
            attachmentByUUIDService.updateBizIdNullFilter(uuid, ConstantValue.DCL_VILLAGE_GROUP_IMAGE, new Long[]{bo.getAttachmentId()}, "001");
        }
        return uuid;
    }


    /**
     * 删除数据
     *
     * @param bo 村小组业务对象
     * @return 是否删除成功
     */
    public boolean delete(VillageGroup bo) {
        long result = villageGroupMapper.delete(bo);
        return result > 0;
    }

    /**
     * 根据业务id查询数据
     *
     * @param id 村小组id
     * @return 村小组业务对象
     */
    public VillageGroup searchByUuid(String id) {
        VillageGroup bo = villageGroupMapper.searchByUuid(id);
        if (bo != null) {
            if (!bo.getType().isEmpty()) {
                bo.setTypeName(baseDictionaryService.changeCodeToName(DictConstantValue.DCL_VILLAGE_GROUP_TYPE, bo.getType(), bo.getRegionCode()));
            }
            if (!bo.getSex().isEmpty()) {
                bo.setSexCN(baseDictionaryService.changeCodeToName(SEX_DICT_CODE, bo.getSex(), bo.getRegionCode()));
            }
        }
        return bo;
    }

    /**
     * 查询数据（分页）
     *
     * @param bo 查询参数
     * @return 分页数据对象
     */
    public PaginationDto<VillageGroup> searchList(VillageGroup bo) {
        RowBounds rowBounds = new RowBounds((bo.getCurrentPage() - 1) * bo.getPageSize(), bo.getPageSize());
        List<VillageGroup> list = villageGroupMapper.searchList(bo, rowBounds);
        long count = villageGroupMapper.countList(bo);

        if (list != null && list.size() > 0) {
            // 数据字典 - 村小组
            Map<String, String> dict = DataDictHelper.getDictMap(DictConstantValue.DCL_VILLAGE_GROUP_TYPE, bo.getRegionCode());
            for (VillageGroup villageGroup : list) {
                villageGroup.setTypeName(dict.get(villageGroup.getType()));
            }
        }
        return new PaginationDto<>(count, list);
    }

    /**
     * 查询数据
     *
     * @param bo 查询参数
     * @return 村小组分页数据对象
     */
    public List<VillageGroup> searchListWithImage(VillageGroup bo) {
        return villageGroupMapper.searchListWithImage(bo);
    }
}