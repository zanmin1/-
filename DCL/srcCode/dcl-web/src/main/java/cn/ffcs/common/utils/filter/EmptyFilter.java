/**
 * 
 */
package cn.ffcs.common.utils.filter;

/**
 * 空的实现
 * @author Administrator
 *
 */
public class EmptyFilter extends AbstractStringFilter {

	public String doFilter(String source) {
		return source;
	}

}
