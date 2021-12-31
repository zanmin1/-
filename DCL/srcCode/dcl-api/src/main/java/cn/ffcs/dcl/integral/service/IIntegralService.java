package cn.ffcs.dcl.integral.service;

/**
 * @Description: 积分模块服务
 * @Author: gonghf
 * @Date: 11-18 10:26:40
 * @Copyright: 2021 福富软件
 */
public interface IIntegralService {

	/**
	 * 添加积分
	 * @param bizId 业务id
	 * @param dictCode 字典编码
	 * @param reason 活动事由
	 * @param userId 用户id
	 * @param orgCode 地域编码
	 */
	public boolean addPoints(Long bizId, String dictCode, String reason, Long userId, String orgCode);

}