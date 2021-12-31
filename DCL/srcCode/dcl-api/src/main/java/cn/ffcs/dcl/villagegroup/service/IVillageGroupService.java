package cn.ffcs.dcl.villagegroup.service;

import cn.ffcs.dcl.mybatis.domain.villagegroup.VillageGroup;
import cn.ffcs.dcl.utils.PaginationDto;

import java.util.List;

/**
 * @Description: 村小组模块服务
 * @Author: liangxj
 * @Date: 12-22 10:45:25
 * @Copyright: 2021 福富软件
 */
public interface IVillageGroupService {

    String SEX_DICT_CODE = "A001074061";

    /**
     * 新增数据
     *
     * @param bo 村小组业务对象
     * @return 村小组id
     */
    Long insert(VillageGroup bo);

    /**
     * 修改数据
     *
     * @param bo 村小组业务对象
     * @return 是否修改成功
     */
    boolean update(VillageGroup bo);

    /**
     * 保存
     *
     * @param bo 村小组业务对象
     * @return 是否保存成功
     */
    String saveOrUpdate(VillageGroup bo);

    /**
     * 删除数据
     *
     * @param bo 村小组业务对象
     * @return 是否删除成功
     */
    boolean delete(VillageGroup bo);

    /**
     * 根据业务id查询数据
     *
     * @param id 村小组id
     * @return 村小组业务对象
     */
    VillageGroup searchByUuid(String id);

    /**
     * 查询数据（分页）
     *
     * @param bo 查询参数
     * @return 村小组分页数据对象
     */
    PaginationDto<VillageGroup> searchList(VillageGroup bo);

    /**
     * 查询数据
     *
     * @return 村小组数据对象
     */
    List<VillageGroup> searchListWithImage(VillageGroup bo);

}