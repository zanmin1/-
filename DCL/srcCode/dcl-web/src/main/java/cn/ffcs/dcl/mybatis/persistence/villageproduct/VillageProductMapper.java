package cn.ffcs.dcl.mybatis.persistence.villageproduct;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import cn.ffcs.dcl.mybatis.domain.villageproduct.VillageProduct;

/**
 * @Description: 一村一品模块dao接口
 * @Author: ZHENGYI
 * @Date: 09-16 14:57:48
 * @Copyright: 2021 福富软件
 */
public interface VillageProductMapper {

    String getUuid();

    Date getSysdate();

    /**
     * 新增数据
     *
     * @param bo 一村一品业务对象
     * @return 一村一品id
     */
    long insert(VillageProduct bo);

    /**
     * 修改数据
     *
     * @param bo 一村一品业务对象
     * @return 修改的记录数
     */
    long update(VillageProduct bo);

    /**
     * 删除数据
     *
     * @param bo 一村一品业务对象
     * @return 删除的记录数
     */
    long delete(VillageProduct bo);

    /**
     * 查询数据（分页）
     *
     * @param params    查询参数
     * @param rowBounds 分页对象
     * @return 一村一品数据列表
     */
    List<VillageProduct> searchList(Map<String, Object> params, RowBounds rowBounds);

    /**
     * 查询数据总数
     *
     * @param params 查询参数
     * @return 一村一品数据总数
     */
    long countList(Map<String, Object> params);

	/**
	 * 根据业务id查询数据
	 * @param id 商家信息id
	 * @return 商家信息业务对象
	 */
	public VillageProduct searchById(Map<String, Object> params);
	
    /**
     * 根据业务id查询数据
     *
     * @param uuid 一村一品id
     * @return 一村一品业务对象
     */
    VillageProduct searchByUuid(String uuid);

}