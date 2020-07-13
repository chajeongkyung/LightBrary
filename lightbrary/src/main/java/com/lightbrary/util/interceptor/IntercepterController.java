package com.lightbrary.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lightbrary.member.model.MemberDto;

public class IntercepterController extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		if(handler instanceof HandlerMethod == false) {
			return true;
		}
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		
		if(auth == null) {
			return true;
		}
		
		HttpSession session = request.getSession();
		if( session == null ) {
			// 로그인 화면으로 이동
			response.sendRedirect(request.getContextPath() + "/login.do");
			return false;
		}
		
		MemberDto member = (MemberDto)session.getAttribute("member");
		if ( member == null ) {
			response.sendRedirect(request.getContextPath() + "/login.do");
			return false;
		}
		
		String role = auth.role().toString();
		if( "ADMIN".equals(role) ) {
			if( member.getGradeCode() != 0) {
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}
		
		return true;
	}
}
