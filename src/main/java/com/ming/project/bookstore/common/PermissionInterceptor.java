package com.ming.project.bookstore.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest req
			, HttpServletResponse resp
			, Object handler) throws Exception {

		HttpSession session = req.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		String uri = req.getRequestURI();
		
		if (userId != null) { // 로그인 되어 있는 경우
			
			if (uri.startsWith("/user")) {
				resp.sendRedirect("/shop/main/view");
				return false;
			}
		} else {	// 로그인 되어 있지 않은 경우
			
			if (uri.startsWith("/shop")) {
				resp.sendRedirect("/user/signin/view");
				return false;
			}
		}
				
		return true;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest req
			, HttpServletResponse resp
			, Object handler
			, ModelAndView modelAndView) {
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest req
			, HttpServletResponse resp
			, Object handler
			, Exception ex) {
	}
}
