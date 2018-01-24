/**   
 * @类路径: com.zy.util
 * @描述: TODO
 * @作者：zy
 * @时间：2016-9-27 下午8:42:45
 * @小组：A2小组  
 */
package com.zy.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zy.Consts;


/**
 * <p>LoginFilter.java</p>
 * <p>类功能描述：</p>
 * @类作者：zy
 * @创建时间：2016-9-27 下午8:42:45
 * @小组：A2小组
 */
/**
 * @author 权限拦截器
 */
public class LoginFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		// 不过滤的uri
		String[] notFilter = new String[] { "login.do", "regist.do",".html",".css",".jpg",".png",".js","admin.do" };

		// 请求的uri
		String uri = request.getRequestURI();

		// uri中包含background时才进行过滤
			// 是否过滤
			boolean doFilter = true;
			for (String s : notFilter) {
				if (uri.contains(s)) {
					// 如果uri中包含不过滤的uri，则不进行过滤
					doFilter = false;
					break;
				}
			}
			if (doFilter) {
				// 执行过滤
				// 从session中获取登录者实体
				Object obj = request.getSession().getAttribute(Consts.SESSIONUSER);
				if (null == obj) {
					// 如果session中不存在登录者实体，则弹出框提示重新登录
					// 设置request和response的字符集，防止乱码
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					String loginPage = "http://localhost:8080/shop/view/index.html";
					StringBuilder builder = new StringBuilder();
					builder.append("<script type=\"text/javascript\">");
					builder.append("alert('登录过期，请重新 !');");
					builder.append("window.top.location.href='");
					builder.append(loginPage);
					builder.append("';");
					builder.append("</script>");
					out.print(builder.toString());
				} else {
					// 如果session中存在登录者实体，则继续
					filterChain.doFilter(request, response);
				}
			} else {
				// 如果不执行过滤，则继续
				filterChain.doFilter(request, response);
			}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
