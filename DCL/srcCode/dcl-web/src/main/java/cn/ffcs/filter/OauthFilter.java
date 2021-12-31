package cn.ffcs.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * 对接第三方认证过滤
 *
 * @Author Create by zheng on 2021-09-26 17:45
 */
public class OauthFilter implements Filter {

    public OauthFilter() {
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
    }

    /**
     * OauthFilter过滤器只做拦截操作，不做任何业务对接处理，cn.ffcs.dcl.oauth.controller.OauthController处理具体对接内容
     *
     * @Author Create by zheng on 2021-09-30 16:32
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // todo 这里设置通用参数
        chain.doFilter(request, response);
    }
}
