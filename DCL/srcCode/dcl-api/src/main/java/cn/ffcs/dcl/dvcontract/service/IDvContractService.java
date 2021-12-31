package cn.ffcs.dcl.dvcontract.service;

import cn.ffcs.dcl.mybatis.domain.dvcontract.DvContract;
import cn.ffcs.system.publicUtil.EUDGPagination;

import java.util.Map;

/**
 * @Description: 合同管理模块服务
 * @Author: ZHENGYI
 * @Date: 09-07 11:20:18
 * @Copyright: 2021 福富软件
 */
public interface IDvContractService {

    /**
     * 新增数据
     *
     * @param bo 合同管理业务对象
     * @return 合同管理id
     */
    Long insert(DvContract bo);

    /**
     * 修改数据
     *
     * @param bo 合同管理业务对象
     * @return 是否修改成功
     */
    boolean update(DvContract bo);

    /**
     * 删除数据
     *
     * @param bo 合同管理业务对象
     * @return 是否删除成功
     */
    boolean delete(DvContract bo);

    /**
     * 查询数据（分页）
     *
     * @param params 查询参数
     * @return 合同管理分页数据对象
     */
    EUDGPagination searchList(int page, int rows, Map<String, Object> params);

    /**
     * 根据业务id查询数据
     *
     * @param id 合同管理id
     * @return 合同管理业务对象
     */
    DvContract searchByUuid(String id);

}