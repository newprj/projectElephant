package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AhthInterceptor extends HandlerInterceptorAdapter{
	
	
private void saveDestination(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		String query= req.getQueryString();
		
		if(query == null || query.contentEquals("null")) {
			query = "";
		}else {
			query ="?" + query;
		}
		
		if(req.getMethod().contentEquals("GET")) {
			log.info(" ... " + uri + query);
			req.getSession().setAttribute("dest", uri + query);
			
		}
	}
	
	
	@Override
	public boolean preHandle( HttpServletRequest request, 
				HttpServletResponse response, Object Handler) throws Exception{
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null ) {
			response.sendRedirect("/user/login");
			saveDestination(request);
			log.info(" 로그인 안한 사용자");
			return false;
		}
		
		return true;
	}
}
