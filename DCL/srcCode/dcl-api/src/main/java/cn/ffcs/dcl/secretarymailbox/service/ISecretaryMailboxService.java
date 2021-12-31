package cn.ffcs.dcl.secretarymailbox.service;

import cn.ffcs.dcl.mybatis.domain.secretarymailbox.SecretaryMailbox;
import cn.ffcs.dcl.utils.PaginationDto;

/**
 * @Description: 书记信箱模块服务
 * @Author: gonghf
 * @Date: 09-27 09:33:58
 * @Copyright: 2021 福富软件
 */
public interface ISecretaryMailboxService {

	/**
	 * 新增数据
	 * @param bo 书记信箱业务对象
	 * @return 书记信箱id
	 */
	public Long insert(SecretaryMailbox bo);

	/**
	 * 删除数据
	 * @param bo 书记信箱业务对象
	 * @return 是否删除成功
	 */
	public boolean delete(SecretaryMailbox bo);

	/**
	 * 查询数据（分页）
	 * @param bo 查询参数
	 * @return 书记信箱分页数据对象
	 */
	public PaginationDto<SecretaryMailbox> searchList(SecretaryMailbox bo);
	
	/**
	 * 根据uuid查询数据
	 * @param uuid 书记信箱uuid
	 * @param regionCode 用户区域编码
	 * @return 书记信箱业务对象
	 */
	public SecretaryMailbox searchByUuid(String uuid, String regionCode);

}