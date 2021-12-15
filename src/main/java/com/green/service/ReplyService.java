package com.green.service;

import java.util.List;

import com.green.vo.BoardReplyVO;

public interface ReplyService {
	
	public List<BoardReplyVO> getReplysByBno(Long bno);
	public BoardReplyVO getReplyOne(Long rno);
	public int registerReply(BoardReplyVO vo);
	public int updateReply(BoardReplyVO vo);
	public int deleteReply(Long rno);

	public List<BoardReplyVO> myReply(String replyer);
}
