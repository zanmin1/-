package cn.ffcs.dcl.dvcontract.service;

import cn.ffcs.cookie.service.CacheService;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.dcl.mybatis.domain.dvcontract.DvContract;
import cn.ffcs.dcl.mybatis.persistence.dvcontract.DvContractMapper;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.system.publicUtil.EUDGPagination;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @Description: 合同管理模块服务实现
 * @Author: ZHENGYI
 * @Date: 09-07 11:20:18
 * @Copyright: 2021 福富软件
 */
@Service("dvContractServiceImpl")
@Transactional
public class DvContractServiceImpl implements IDvContractService {

    @Autowired
    private DvContractMapper dvContractMapper; //注入合同管理模块dao
    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;
    @Autowired
    private CacheService cacheService;

    /**
     * 新增数据
     *
     * @param bo 合同管理业务对象
     * @return 合同管理id
     */
    public Long insert(DvContract bo) {
        String regionName = bo.getRegionName();
        if (!StringUtils.isEmpty(regionName)) {
            Map<String, String> cacheMap = cacheService.getBuildScopeSettingMap();
            String firstValue = cacheMap.get("firstValue");

            if (!regionName.equals(firstValue)) {
                regionName = regionName.replaceAll(firstValue, "");
            } else {
                String secondValue = cacheMap.get("secondValue");
                regionName = regionName.replaceAll(firstValue, secondValue);
            }
            bo.setRegionName(regionName);
        }

        bo.setUuid(dvContractMapper.getUuid());
        Long[] fileIds = bo.getAttachmentId();
        if (dvContractMapper.insert(bo) > 0 && fileIds != null) {
            attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, fileIds);
        }
        return bo.getContractId();
    }

    /**
     * 修改数据
     *
     * @param bo 合同管理业务对象
     * @return 是否修改成功
     */
    public boolean update(DvContract bo) {

        if (dvContractMapper.update(bo) > 0) {
            attachmentByUUIDService.deleteByBizId(bo.getUuid(), "DCL_ATTACHMENT_CONTRACT");

            Long[] fileIds = bo.getAttachmentId();
            if (fileIds != null) {
                attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, fileIds, "001");
            }
            return true;
        }
        return false;
    }

    /**
     * 删除数据
     *
     * @param bo 合同管理业务对象
     * @return 是否删除成功
     */
    public boolean delete(DvContract bo) {
        return dvContractMapper.delete(bo) > 0;
    }

    /**
     * 查询数据（分页）
     *
     * @param params 查询参数
     * @return 合同管理分页数据对象
     */
    public EUDGPagination searchList(int page, int rows, Map<String, Object> params) {
        RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
        List<DvContract> list = dvContractMapper.searchList(params, rowBounds);
        long count = dvContractMapper.countList(params);
        return new EUDGPagination(count, list);
    }

    /**
     * 根据业务id查询数据
     *
     * @param id 合同管理id
     * @return 合同管理业务对象
     */
    public DvContract searchByUuid(String id) {
        return dvContractMapper.searchByUuid(id);
    }

}