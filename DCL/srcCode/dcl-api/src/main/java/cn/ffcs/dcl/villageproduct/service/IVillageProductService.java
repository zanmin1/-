package cn.ffcs.dcl.villageproduct.service;

import cn.ffcs.dcl.mybatis.domain.villageproduct.OrderInfo;
import cn.ffcs.dcl.mybatis.domain.villageproduct.VillageProduct;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.uam.bo.UserInfo;

import java.util.Date;
import java.util.Map;

/**
 * @Description: 一村一品模块服务
 * @Author: ZHENGYI
 * @Date: 09-16 14:57:48
 * @Copyright: 2021 福富软件
 */
public interface IVillageProductService {
    Date getSysdate();

    /**
     * 保存
     *
     * @param bo 一村一品业务对象
     */
    boolean save(VillageProduct bo);
    
	/**
	 * 新增数据
	 */
    public Long insert(VillageProduct bo);
    
    /**
     * 更新
     *
     * @param bo 一村一品业务对象
     */
    boolean update(VillageProduct bo);

    /**
     * 删除数据
     *
     * @param bo 一村一品业务对象
     * @return 是否删除成功
     */
    boolean delete(VillageProduct bo);

    /**
     * 查询数据（分页）
     *
     * @param params 查询参数
     * @return 一村一品分页数据对象
     */
    PaginationDto<VillageProduct> searchList(int page, int rows, Map<String, Object> params);

    /**
     * 根据业务id查询数据
     */
	public VillageProduct searchById(Map<String, Object> params);
	
    /**
     * 根据业务id查询数据
     *
     * @param uuid 一村一品id
     * @return 一村一品业务对象
     */
    VillageProduct searchByUuid(String uuid, UserInfo u);

	/**
	 * 新增数据
	 */
	public Long insertNew(VillageProduct bo);
	
    String getUuid();
}