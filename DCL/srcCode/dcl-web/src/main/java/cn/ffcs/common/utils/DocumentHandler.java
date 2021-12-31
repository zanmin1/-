package cn.ffcs.common.utils;



import java.io.StringWriter;
import java.util.Map;

import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class DocumentHandler {

	private Configuration configuration = null;

	public DocumentHandler() {
		FreeMarkerConfigurer freemarkerConfig = SpringContextUtil.getApplicationContext().getBean(FreeMarkerConfigurer.class);
		configuration = freemarkerConfig.getConfiguration();
	}

	public StringBuffer getTemplateHtml(String templateName, Map<String, Object> dataMap) throws Exception {
		// dataMap 要填入模本的数据文件
		// 设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
		// 这里我们的模板是放在template包下面
		Template t = null;
		StringWriter writer = null;
		try {
			// test.ftl为要装载的模板
			t = configuration.getTemplate(templateName);
			writer = new StringWriter(5 * 1024);
			t.process(dataMap, writer);
			return writer.getBuffer();
		} finally {
			writer.close();
		}
	}
}
