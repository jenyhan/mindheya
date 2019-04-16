package com.my.map.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginId");
		
		String path = request.getRequestURI();
		
		int tabNum = 0;
		
		if(path.equals("/test/goMindmap")) {
			tabNum = 1;
		
		} else if(path.equals("/test/goScrap")) {
			tabNum = 2;
			
		} else if(path.equals("/test/goShare")) {
			tabNum = 3;
			
		}		
		
		
		if(userid == null) {
			response.sendRedirect(request.getContextPath() + "/login?tabNum=" + tabNum);
			tabNum = 0;
			return false;			
		}
		return true;
	}

}
