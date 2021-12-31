package cn.ffcs.dcl.villageproduct.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ffcs.common.utils.ConstantValue;
import cn.ffcs.dcl.mybatis.domain.villageproduct.VillageProduct;
import cn.ffcs.dcl.mybatis.persistence.villageproduct.VillageProductMapper;
import cn.ffcs.dcl.utils.PaginationDto;
import cn.ffcs.dcl.utils.StringUtils;
import cn.ffcs.file.mybatis.domain.attachment.AttachmentByUUID;
import cn.ffcs.file.service.IAttachmentByUUIDService;
import cn.ffcs.uam.bo.BaseDataDict;
import cn.ffcs.uam.bo.UserInfo;
import cn.ffcs.uam.service.IBaseDictionaryService;

/**
 * @Description: 一村一品模块服务实现
 * @Author: ZHENGYI
 * @Date: 09-16 14:57:48
 * @Copyright: 2021 福富软件
 */
@Service("villageProductServiceImpl")
@Transactional
public class VillageProductServiceImpl implements IVillageProductService {

    @Autowired
    private VillageProductMapper villageProductMapper; //注入一村一品模块dao
    @Autowired
    private IAttachmentByUUIDService attachmentByUUIDService;
    @Autowired
    private IBaseDictionaryService baseDictionaryService;

    public Date getSysdate() {
        return villageProductMapper.getSysdate();
    }

    public String getUuid() {
        return villageProductMapper.getUuid();
    }
    
    /**
     * 保存
     *
     * @param bo 一村一品业务对象
     */
    public boolean save(VillageProduct bo) {
        // 检查主图
        List<AttachmentByUUID> attList = bo.getAttList();
        if (attList != null && attList.size() > 0) {
            String picUrl = "";
            boolean hasSetMainPic = false;
            for (AttachmentByUUID file : attList) {
                if (StringUtils.isEmpty(file.getFilePath())) {
                    continue;
                }
                if (file.getFilePath().equals(bo.getPicUrl())) {
                    hasSetMainPic = true;// 已设置主图
                    break;
                } else {
                    String[] temp = file.getFilePath().split("\\.");
                    if (StringUtils.isEmpty(picUrl) &&
                            (".jpg,.png,.gif,.bmp,.jpeg".contains(temp[temp.length - 1])
                                    || ".JPG,.PNG,.GIF,.BMP,.JPEG".contains(temp[temp.length - 1]))
                    ) {// 按图片上传顺序取一张图
                        picUrl = file.getFilePath();
                    }
                }
            }
            if (!hasSetMainPic) {
                bo.setPicUrl(picUrl);
            }
        }
        boolean res;
        if (StringUtils.isEmpty(bo.getUuid())) {
            String uuid = villageProductMapper.getUuid();
            bo.setUuid(uuid);
            res = villageProductMapper.insert(bo) > 0;
        } else {
            res = villageProductMapper.update(bo) > 0;
            attachmentByUUIDService.deleteByBizId(bo.getUuid(), ConstantValue.DCL_VILLAGE_PRODUCT_IMAGE);
            attachmentByUUIDService.deleteByBizId(bo.getUuid(), ConstantValue.DCL_VILLAGE_PRODUCT_VIDEO);
        }
        Long[] fileIds = bo.getAttachmentId();
        if (res && fileIds != null) {
            attachmentByUUIDService.updateBizIdNullFilter(bo.getUuid(), null, fileIds, "001");
        }
        return res;
    }

	/**
	 * 新增数据
	 */
	@Override
	public Long insert(VillageProduct bo) {
        String uuid = villageProductMapper.getUuid();
        bo.setUuid(uuid);
		villageProductMapper.insert(bo);
		return bo.getVillageProductId();
	}

	@Override
	public Long insertNew(VillageProduct bo) {
		villageProductMapper.insert(bo);
		return bo.getVillageProductId();
	}
	
    /**
     * 更新
     *
     * @param bo 一村一品业务对象
     */
    public boolean update(VillageProduct bo) {
        return villageProductMapper.update(bo) > 0;
    }

    /**
     * 删除数据
     *
     * @param bo 一村一品业务对象
     * @return 是否删除成功
     */
    public boolean delete(VillageProduct bo) {
        return villageProductMapper.delete(bo) > 0;
    }

    /**
     * 查询数据（分页）
     *
     * @param params 查询参数
     * @return 一村一品分页数据对象
     */
    public PaginationDto<VillageProduct> searchList(int page, int rows, Map<String, Object> params) {
        RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
        List<VillageProduct> list = villageProductMapper.searchList(params, rowBounds);
        if (list != null && list.size() > 0) {
            String userOrgCode = (String) params.get("userOrgCode");

            List<BaseDataDict> dictList = baseDictionaryService.getDataDictTree(ConstantValue.DICT_VILLAGE_PRODUCT_TYPE, userOrgCode);
            Map<String, String> productType = new HashMap<>();
            if (dictList != null && dictList.size() > 0) {
                for (BaseDataDict dict : dictList) {
                    productType.put(dict.getDictGeneralCode(), dict.getDictName());
                }
            }

            List<BaseDataDict> unitList = baseDictionaryService.getDataDictTree(ConstantValue.DICT_VILLAGE_PRODUCT_UNIT, userOrgCode);
            Map<String, String> productUnit = new HashMap<>();
            if (unitList != null && unitList.size() > 0) {
                for (BaseDataDict dict : unitList) {
                    productUnit.put(dict.getDictGeneralCode(), dict.getDictName());
                }
            }
            for (VillageProduct item : list) {
                item.setGoodsUnitName(productUnit.get(item.getGoodsUnit()));
                item.setGoodsTypeName(productType.get(item.getGoodsType()));
            }
        }
        long count = villageProductMapper.countList(params);
        return (PaginationDto<VillageProduct>) new PaginationDto(0, "", count, list);
    }

	/**
	 * 根据业务id查询数据
	 */
	@Override
	public VillageProduct searchById(Map<String, Object> params) {
		VillageProduct bo = villageProductMapper.searchById(params);
		return bo;
	}
	
    /**
     * 根据业务id查询数据
     *
     * @param uuid 一村一品id
     * @return 一村一品业务对象
     */
    public VillageProduct searchByUuid(String uuid, UserInfo u) {
        VillageProduct bo = villageProductMapper.searchByUuid(uuid);
        if (bo != null) {
            bo.setGoodsUnitName(baseDictionaryService.changeCodeToName(ConstantValue.DICT_VILLAGE_PRODUCT_UNIT, bo.getGoodsUnit(), u.getOrgCode()));
            bo.setGoodsTypeName(baseDictionaryService.changeCodeToName(ConstantValue.DICT_VILLAGE_PRODUCT_TYPE, bo.getGoodsType(), u.getOrgCode()));

            // 轮播图
            List<AttachmentByUUID> attList = attachmentByUUIDService.findByBizId(bo.getUuid(), ConstantValue.DCL_VILLAGE_PRODUCT_IMAGE);
            List<String> pathList = new ArrayList<>();
            if (attList != null && attList.size() > 0) {
                for (AttachmentByUUID att : attList) {
                    pathList.add(att.getFilePath());
                }
            }
            bo.setPicUrlList(pathList);
        }
        return bo;
    }

}