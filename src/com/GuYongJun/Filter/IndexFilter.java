package com.GuYongJun.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




public class IndexFilter implements Filter {

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest requset, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		requset.getRequestDispatcher("/index.action").forward(requset, response);	
	}

	@Override
	public void init(FilterConfig filterconfig) throws ServletException {
		
		System.out.println("首页请求到达IndexFilter");
	}

	
}
