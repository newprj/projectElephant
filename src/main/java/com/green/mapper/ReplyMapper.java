package com.green.mapper;

import java.util.List;

import com.green.vo.BoardReplyVO;

public interface ReplyMapper {
	
	public List<BoardReplyVO> getReplysByBno(Long bno);
	public BoardReplyVO getReplyOne(Long rno);
	public int registerReply(BoardReplyVO vo);
	public int updateReply(BoardReplyVO vo);
	public int deleteReply(Long rno);

}
