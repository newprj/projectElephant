package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.StudyMapper;
import com.green.vo.StudyVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService{
	
	@Setter(onMethod_=@Autowired)
	private StudyMapper mapper;

	@Override
	public List<StudyVO> allList() {
		log.info("2) 서비스에서 스터디그룹 리스트"); 
		return mapper.studySelect();
	}

	@Override
	public int insert(StudyVO vo) {
		log.info("2) 서비스에서 스터디그룹 insert"); 
		return mapper.studyInsert(vo);
	}

	

}
