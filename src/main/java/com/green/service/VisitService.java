package com.green.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.green.vo.UserVO;
import com.green.vo.VisitCountDTO;

public interface VisitService {
	public int insertVisitor();
	public int todayCnt();
	public int totalCnt();
	
}
