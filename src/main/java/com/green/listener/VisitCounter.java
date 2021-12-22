package com.green.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.mapper.VisitMapper;
import com.green.service.GUserService;
import com.green.service.VisitService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebListener
public class VisitCounter implements HttpSessionListener{

	
	public static int count;
	
	public static int getCount() {
	    return count;
	}
	
	public void sessionCreated(HttpSessionEvent event) {
	    //세션이 만들어질 때 호출
	    HttpSession session = event.getSession(); //request에서 얻는 session과 동일한 객체
	    //session.setMaxInactiveInterval(60*20);
	    
	    count++;

	    session.getServletContext().log(session.getId() + " 세션생성 " + ", 접속자수 : " + count);
	}
	
	public void sessionDestroyed(HttpSessionEvent event) {
	    //세션이 소멸될 때 호출
	    count--;
	    if(count<0)
	        count=0;
	     
	    HttpSession session = event.getSession();
	    session.getServletContext().log(session.getId() + " 세션소멸 " + ", 접속자수 : " + count);
	}


}
