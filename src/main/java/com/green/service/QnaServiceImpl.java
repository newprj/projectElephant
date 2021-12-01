package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.QnaMapper;
import com.green.vo.QnaVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService{

	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	@Override
	public List<QnaVO> list() {
		log.info("2) 서비스에서 리스트 가져오기 ");
		return mapper.listqna();
	}

	@Override
	public String test(Long qno) {
		log.info("2) 서비스에서 test 가져오기 ");
		return mapper.test(qno);
	}

	@Override
	public int insertQna(QnaVO vo) {
		log.info("2) 서비스에서 test 가져오기 ");
		return mapper.insertQna(vo);
	}
}
