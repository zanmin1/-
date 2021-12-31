package cn.ffcs.dcl.integral.service;

import cn.ffcs.oa.entity.interalrule.IdRecord;
import cn.ffcs.oa.service.interalrule.IntegralRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

/**
 * @Description: 积分模块服务实现
 * @Author: gonghf
 * @Date: 11-18 10:32:44
 * @Copyright: 2021 福富软件
 */
@Service("integralServiceImpl")
@Transactional
public class IntegralServiceImpl implements IIntegralService {

	@Autowired
	private IntegralRuleService integralRule;   // 积分接口。

	/**
	 * 添加积分
	 * @param bizId 业务id
	 * @param dictCode 字典编码
	 * @param reason 活动事由
	 * @param userId 用户id
	 * @param orgCode 地域编码
	 */
	public boolean addPoints(Long bizId, String dictCode, String reason, Long userId, String orgCode) {
		// 积分信息
		IdRecord idRecord = new IdRecord();

		idRecord.setBizId(bizId);
		idRecord.setSubmodularCode(dictCode);
		idRecord.setInteralReason(reason);
		idRecord.setPartyMemberId(userId);
		idRecord.setCreator(userId);
		idRecord.setOrgCode(orgCode);

		idRecord.setTableType("ZONE_USER_INTEGRAL");   //用户类型 公众用户
		idRecord.setRuleType("01");   // 规则类型 01 加分

		boolean result = false;
		try {
			System.out.println("添加积分：");
			System.out.println("bizId：" + bizId + "，dictCode：" + dictCode + "，reason：" + reason + "，userId：" + userId + "，orgCode：" + orgCode);
			result = integralRule.rewardPointsV2(idRecord, new HashMap<>());
			System.out.println(reason + " 添加积分结果：" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}