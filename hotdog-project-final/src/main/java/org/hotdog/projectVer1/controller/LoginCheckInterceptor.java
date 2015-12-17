package org.hotdog.projectVer1.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("interceptor 실행~~~");
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("loginVo") == null){
			response.sendRedirect("home.do");
			return false;
		}
		return true;
	}
	
}
