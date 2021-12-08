package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.StudyMapper;
import com.green.vo.StudyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService{
	
	@Setter(onMethod_=@Autowired)
	private StudyMapper mapper;

	@Override
	public StudyVO allList() {
		log.info("2) 서비스에서 스터디그룹 리스트"); 
		return mapper.studySelect();
	}

	

}
