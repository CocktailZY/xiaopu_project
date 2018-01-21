package com.zy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zy.model.Users;

public class LoginFilter implements Filter {

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse res = (HttpServletResponse) arg1;
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String url = req.getRequestURL().toString();
		if(url.contains("login.action") || url.contains("login.jsp")){
			arg2.doFilter(arg0, arg1);
		}else{
			Users user = (Users) req.getSession().getAttribute("login_user");
			if(user!=null){
				arg2.doFilter(arg0, arg1);
			}else{
				res.sendRedirect(req.getContextPath()+"/login.jsp");
			}
		}
	}

	public void destroy() {
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

}
