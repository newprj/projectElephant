package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.QnaMapper;
import com.green.mapper.QnaReplyMapper;
import com.green.vo.QnaVO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService{

	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private QnaReplyMapper replyMapper;
	
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
	public int register(QnaReplyVO vo) {
		log.info("2) 서비스에서 reply insert ");
		return replyMapper.register(vo);
	}

	@Override
	public List<QnaReplyVO> replyList(Long qno) {
		log.info("2) 서비스에서 reply 목록 ");
		return replyMapper.replyList(qno);
	}

	@Override
	public int update(QnaVO vo) {
		log.info("2) 서비스에서 qna 수정");
		return mapper.update(vo);
	}

	@Override
	public int deleteByQno(Long qno) {
		log.info("2) 서비스에서 qna 삭제");
		return mapper.deleteByQno(qno);
		
	}

	@Override
	public int replyDelete(Long rno) {
		log.info("2) 서비스에서 reply 삭제");
		return replyMapper.replyDelete(rno);
	}

	@Override
	public int replyUpdate(QnaReplyVO vo) {
		log.info("2) 서비스에서 reply 수정");
		return replyMapper.replyUpdate(vo);
	}


	
}
