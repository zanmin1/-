package cn.ffcs.dcl.mybatis.persistence.dvcontract;

import cn.ffcs.dcl.mybatis.domain.dvcontract.DvContract;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 合同管理模块dao接口
 * @Author: ZHENGYI
 * @Date: 09-07 11:20:18
 * @Copyright: 2021 福富软件
 */
public interface DvContractMapper {

    /**
     * 新增数据
     *
     * @param bo 合同管理业务对象
     * @return 合同管理id
     */
    long insert(DvContract bo);

    String getUuid();

    /**
     * 修改数据
     *
     * @param bo 合同管理业务对象
     * @return 修改的记录数
     */
    long update(DvContract bo);

    /**
     * 删除数据
     *
     * @param bo 合同管理业务对象
     * @return 删除的记录数
     */
    long delete(DvContract bo);

    /**
     * 查询数据（分页）
     *
     * @param params    查询参数
     * @param rowBounds 分页对象
     * @return 合同管理数据列表
     */
    List<DvContract> searchList(Map<String, Object> params, RowBounds rowBounds);

    /**
     * 查询数据总数
     *
     * @param params 查询参数
     * @return 合同管理数据总数
     */
    long countList(Map<String, Object> params);

    /**
     * 根据业务id查询数据
     *
     * @param id 合同管理id
     * @return 合同管理业务对象
     */
    DvContract searchByUuid(String id);

}