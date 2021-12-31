package cn.ffcs.dcl.base.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import cn.ffcs.dcl.base.export.ExpStruc;
import cn.ffcs.dcl.base.export.IExporter;
import cn.ffcs.dcl.base.export.ITransfer;
import cn.ffcs.dcl.utils.SpringContextUtil;
import cn.ffcs.uam.bo.UserInfo;

@Service(value = "expTransfer")
public class ExpTransfer implements ITransfer {

	@Override
	public ExpStruc getExpStruc(String beanId, String ctlType, UserInfo userInfo, Map<String, Object> pmMap)
			throws Exception {
		Object obj = SpringContextUtil.getBean(beanId);
		if (obj instanceof IExporter) {
			IExporter exporter = (IExporter) obj;
			ExpStruc expStruc = exporter.getExpStruc(ctlType, userInfo, pmMap);
			return expStruc;
		} else {
			throw new Exception("该实例【" + obj.getClass().getName() + "】未实现导出接口【IExporter】！");
		}
	}

}
