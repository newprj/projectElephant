package com.green.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
import com.green.mapper.VisitMapper;
import com.green.vo.UserVO;
import com.green.vo.VisitCountDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class VisitServiceImpl implements VisitService {
	
	@Setter(onMethod_=@Autowired)
	private VisitMapper mapper;

	@Override
	public int insertVisitor() {
		// TODO Auto-generated method stub
		return mapper.insertVisitor();
	}

	@Override
	public int todayCnt() {
		// TODO Auto-generated method stub
		return mapper.todayCnt();
	}

	@Override
	public List<Integer>  weekCnt() {
		// TODO Auto-generated method stub
		return mapper.weekCnt();
	}

	

	
	
	
}
