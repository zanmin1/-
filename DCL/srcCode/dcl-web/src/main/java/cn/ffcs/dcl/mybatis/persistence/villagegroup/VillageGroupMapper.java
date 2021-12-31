package cn.ffcs.dcl.mybatis.persistence.villagegroup;

import cn.ffcs.dcl.mybatis.domain.villagegroup.VillageGroup;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * @Description: 村小组模块dao接口
 * @Author: liangxj
 * @Date: 12-22 10:45:25
 * @Copyright: 2021 福富软件
 */
public interface VillageGroupMapper {

    /**
     * 新增数据
     *
     * @param bo 村小组业务对象
     * @return 村小组id
     */
    long insert(VillageGroup bo);

    /**
     * 修改数据
     *
     * @param bo 村小组业务对象
     * @return 修改的记录数
     */
    long update(VillageGroup bo);

    /**
     * 删除数据
     *
     * @param bo 村小组业务对象
     * @return 删除的记录数
     */
    long delete(VillageGroup bo);

    /**
     * 查询数据总数
     *
     * @param params 查询参数
     * @return 村小组数据总数
     */
    long countList(Map<String, Object> params);

    /**
     * 根据业务id查询数据
     *
     * @param uuid 村小组id
     * @return 村小组业务对象
     */
    VillageGroup searchByUuid(String uuid);

    /**
     * 根据业务id查询数据
     *
     * @param id 村小组id
     * @return 村小组业务对象
     */
    VillageGroup searchById(Long id);

    /**
     * 查询数据（分页）
     *
     * @param rowBounds 分页对象
     * @return 村小组数据列表
     */
    List<VillageGroup> searchList(VillageGroup bo, RowBounds rowBounds);

    /**
     * 查询数据
     *
     * @param bo 查询参数
     * @return 村小组数据列表
     */
    List<VillageGroup> searchList(VillageGroup bo);

    /**
     * 查询数据总数
     *
     * @return 村小组数据总数
     */
    long countList(VillageGroup bo);

    /**
     * 查询数据
     *
     * @param bo 查询参数
     * @return 村小组数据列表
     */
    List<VillageGroup> searchListWithImage(VillageGroup bo);
}