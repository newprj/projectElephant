package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.QnaMapper;
import com.green.mapper.ReplyMapper;
import com.green.vo.QnaVO;
import com.green.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService{

	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper replyMapper;
	
	@Override
	public List<QnaVO> list() {
		log.info("2) 서비스에서 리스트 가져오기 ");
		return mapper.listqna();
	}

	@Override
	public int insertQna(QnaVO vo) {
		log.info("2) 서비스에서 insert 하기 ");
		return mapper.insertQna(vo);
	}

	@Override
	public QnaVO get(Long qno) {
		log.info("2) 서비스에서 1개 get ");
		return mapper.get(qno);
	}

	@Override
	public int register(ReplyVO vo) {
		log.info("2) 서비스에서 reply insert ");
		return replyMapper.register(vo);
	}

	@Override
	public List<ReplyVO> replyList() {
		log.info("2) 서비스에서 reply 모든 list ");
		return replyMapper.replyList();
	}
}
