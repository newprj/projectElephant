package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.green.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception {
		System.out.println( " pre handell... ");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null? (String) dest : "/group/");
		}else {
			session.removeAttribute("dest");
		}
		return true;

	
	}
	
	@Override
	public void postHandle( HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView mv )throws Exception{

		log.info(" post...." );
		HttpSession session = request.getSession();
		Object userVO = session.getAttribute("user");
		if(userVO !=null) {
			UserVO user = (UserVO) userVO;
			if(user.getUser_id().equals("admin")) {
				response.sendRedirect("/mypage/admin");
			}else {
				log.info(" login success ");
				Object dest = session.getAttribute("dest");
				response.sendRedirect(dest != null? (String) dest : "/group/");
			}
			
		}
		
	}

	
	
}
