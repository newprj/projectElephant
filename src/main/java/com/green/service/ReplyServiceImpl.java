package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.ReplyMapper;
import com.green.vo.BoardReplyVO;
import com.green.vo.Criteria;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_=@Autowired)
	ReplyMapper mapper;

	@Override
	public List<BoardReplyVO> getReplysByBno(Long bno) {
		// TODO Auto-generated method stub
		return mapper.getReplysByBno(bno);
	}

	@Override
	public BoardReplyVO getReplyOne(Long rno) {
		// TODO Auto-generated method stub
		return mapper.getReplyOne(rno);
	}

	@Override
	public int registerReply(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.registerReply(vo);
	}

	@Override
	public int updateReply(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateReply(vo);
	}

	@Override
	public int deleteReply(Long rno) {
		// TODO Auto-generated method stub
		return mapper.deleteReply(rno);

	}


	@Override
	public List<BoardReplyVO> myReply(Criteria cri, String replyer) {
		// TODO Auto-generated method stub
		return mapper.myReply(cri, replyer);
	}

	@Override
	public int totalReply(Criteria cri, String replyer) {
		// TODO Auto-generated method stub
		return mapper.totalReply(cri, replyer);
	}

}
