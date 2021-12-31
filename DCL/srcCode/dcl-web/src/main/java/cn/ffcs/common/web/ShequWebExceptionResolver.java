/**
 * 
 */
package cn.ffcs.common.web;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 社区web异常处理类
 * @author guohh
 *
 */
public class ShequWebExceptionResolver implements HandlerExceptionResolver {

	private static final Logger LOGGER = LoggerFactory.getLogger(ShequWebExceptionResolver.class);
	
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		Map<String, Object> map = new HashMap<String, Object>();
		StringPrintWriter strintPrintWriter = new StringPrintWriter();
		ex.printStackTrace(strintPrintWriter); 
		LOGGER.error("",ex);
		System.err.println(ex);
		map.put("errorMsg", strintPrintWriter.getString());
		return new ModelAndView("error.ftl", map);
	}

	class StringPrintWriter extends PrintWriter {

		public StringPrintWriter() {
			super(new StringWriter());
		}

		public StringPrintWriter(int initialSize) {
			super(new StringWriter(initialSize));
		}

		public String getString() {
			flush();
			return ((StringWriter) this.out).toString();
		}

		
		public String toString() {
			return getString();
		}
	}
}
