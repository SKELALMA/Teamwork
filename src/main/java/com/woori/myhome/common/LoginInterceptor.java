package com.woori.myhome.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//서블릿으로 부터 중간에 가로채서 세션에 있는 로그온 정보에 따라서 분기를 결정할 클래스
//HandlerInterceptorAdapter 를 상속받아야만 한다 
public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println("*******************");
		System.out.println(" Login Interceptor ");
		System.out.println("*******************");
		
		//true 를 리턴하면 하던거 마저하고 
		//false 를 반환하면 원래 요청을 막는다. 
		//모든 url요청이 오면 이 인터셉터의 preHandler가 호출된다. 
		//로그인이 되어 있으면  true 반환하면 원래 가던길울 간다. 
		//로그인이 안되어 있으면 false 를 반환해서 길을 막고, 로그온 페이지로 이동한다
		//만들어만 놓고 servlet-context.xml에서 이 파일울 적용하도록 설정을 해야 한다 
		Object userid=session.getAttribute("userid");
		if(userid!=null) //이미 로그온이 되어 있는 상태이다
			return true;
		
		//로그온이 안되어 있는 상태라면 
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false; 
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	//함수 두개를 오버라이딩 
	//ctrl-space 
	//마우스 오른쪽 - souce - override 
	
}
