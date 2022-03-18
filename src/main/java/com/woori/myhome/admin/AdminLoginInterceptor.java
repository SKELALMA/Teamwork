package com.woori.myhome.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		System.out.println("*******************");
		System.out.println(" Admin Login Interceptor ");
		System.out.println("*******************");
		
		Object userid=session.getAttribute("userid");

		System.out.println("userid : "+(String)userid);
		
		if(userid!=null) //이미 로그온이 되어 있는 상태이다
			return true;
		
		
		//로그온이 안되어 있는 상태라면 
		response.sendRedirect(request.getContextPath()+"/admin?status=login");
		return false; 
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("userid");
		String level = (String)session.getAttribute("level");
		
		if(userid == null) {
			
			response.sendRedirect(request.getContextPath()+"/admin?status='login'");
		}
			
		if(level.equals("1")) {
			
			response.sendRedirect(request.getContextPath()+"/admin?status=forbid");
		}
		
	}

}
